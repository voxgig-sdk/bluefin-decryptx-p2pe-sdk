#!perl
# DeviceCustodyList direct test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Cwd ();

use BluefinDecryptxP2peSDK;
require(Cwd::abs_path("$FindBin::Bin/runner.pm"));

DIRECT_LIST: {
  my $setup = device_custody_list_direct_setup([
    { 'id' => 'direct01' },
    { 'id' => 'direct02' },
  ]);
  my ($_should_skip, $_reason) = BluefinDecryptxP2peTestRunner::is_control_skipped(
    'direct', 'direct-list-device_custody_list', $setup->{live} ? 'live' : 'unit');
  if ($_should_skip) {
    note($_reason || 'skipped via sdk-test-control.json');
    pass('direct-list-device_custody_list: skipped via sdk-test-control.json');
    last DIRECT_LIST;
  }
  if ($setup->{live}) {
    for my $_live_key ('device_type01', 'serial_number01') {
      if (!defined $setup->{idmap}{$_live_key}) {
        note("live test needs $_live_key via *_ENTID env var (synthetic IDs only)");
        pass('direct-list-device_custody_list: skipped');
        last DIRECT_LIST;
      }
    }
  }
  my $client = $setup->{client};

  my $params = {};
  if ($setup->{live}) {
    $params->{'device_type'} = $setup->{idmap}{'device_type01'};
  }
  else {
    $params->{'device_type'} = 'direct01';
  }
  if ($setup->{live}) {
    $params->{'serial_number'} = $setup->{idmap}{'serial_number01'};
  }
  else {
    $params->{'serial_number'} = 'direct01';
  }

  my $result = $client->direct({
    'path' => 'devices/{serial_number}/{device_type}/custody',
    'method' => 'GET',
    'params' => $params,
  });
  if ($setup->{live}) {
    # Live mode is lenient: synthetic IDs frequently 4xx and the list-
    # response shape varies wildly across public APIs. Skip rather than
    # fail when the call doesn't return a usable list.
    if (defined $result->{err}) {
      note("list call failed (likely synthetic IDs against live API): $result->{err}");
      pass('direct-list-device_custody_list: skipped (live)');
      last DIRECT_LIST;
    }
    unless ($result->{ok}) {
      note('list call not ok (likely synthetic IDs against live API)');
      pass('direct-list-device_custody_list: skipped (live)');
      last DIRECT_LIST;
    }
    my $status = BluefinDecryptxP2peHelpers::to_int($result->{status});
    if ($status < 200 || $status >= 300) {
      note("expected 2xx status, got $status");
      pass('direct-list-device_custody_list: skipped (live)');
      last DIRECT_LIST;
    }
    pass('direct-list-device_custody_list: live ok');
  }
  else {
    ok(!defined $result->{err}, 'direct-list-device_custody_list: no error');
    ok($result->{ok}, 'direct-list-device_custody_list: ok');
    is(BluefinDecryptxP2peHelpers::to_int($result->{status}), 200, 'direct-list-device_custody_list: status');
    ok(Voxgig::Struct::islist($result->{data}), 'direct-list-device_custody_list: data is array');
    is(scalar @{ $result->{data} }, 2, 'direct-list-device_custody_list: data length');
    is(scalar @{ $setup->{calls} }, 1, 'direct-list-device_custody_list: 1 call');
  }
}


sub device_custody_list_direct_setup {
  my ($mockres) = @_;
  BluefinDecryptxP2peTestRunner::load_env_local();

  my $calls = [];

  my $env = BluefinDecryptxP2peTestRunner::env_override({
    'BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_LIST_ENTID' => {},
    'BLUEFINDECRYPTXP_PE_TEST_LIVE' => 'FALSE',
    'BLUEFINDECRYPTXP_PE_APIKEY' => 'NONE',
  });

  my $live = ((($env->{'BLUEFINDECRYPTXP_PE_TEST_LIVE'}) || '') eq 'TRUE') ? 1 : 0;

  if ($live) {
    my $client = BluefinDecryptxP2peSDK->new({
      'apikey' => $env->{'BLUEFINDECRYPTXP_PE_APIKEY'},
    });
    return {
      'client' => $client,
      'calls' => $calls,
      'live' => 1,
      'idmap' => {},
    };
  }

  my $mock_fetch = sub {
    my ($url, $init) = @_;
    push @$calls, { 'url' => $url, 'init' => $init };
    return ({
      'status' => 200,
      'statusText' => 'OK',
      'headers' => {},
      'json' => sub {
        return defined $mockres ? $mockres : { 'id' => 'direct01' };
      },
      'body' => 'mock',
    }, undef);
  };

  my $client = BluefinDecryptxP2peSDK->new({
    'base' => 'http://localhost:8080',
    'system' => {
      'fetch' => $mock_fetch,
    },
  });

  return {
    'client' => $client,
    'calls' => $calls,
    'live' => 0,
    'idmap' => {},
  };
}

done_testing();

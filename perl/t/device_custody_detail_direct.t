#!perl
# DeviceCustodyDetail direct test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Cwd ();

use BluefinDecryptxP2peSDK;
require(Cwd::abs_path("$FindBin::Bin/runner.pm"));

DIRECT_LOAD: {
  my $setup = device_custody_detail_direct_setup({ 'id' => 'direct01' });
  my ($_should_skip, $_reason) = BluefinDecryptxP2peTestRunner::is_control_skipped(
    'direct', 'direct-load-device_custody_detail', $setup->{live} ? 'live' : 'unit');
  if ($_should_skip) {
    note($_reason || 'skipped via sdk-test-control.json');
    pass('direct-load-device_custody_detail: skipped via sdk-test-control.json');
    last DIRECT_LOAD;
  }
  if ($setup->{live}) {
    note('live direct-load needs real ID - set *_ENTID env var with real IDs to run');
    pass('direct-load-device_custody_detail: skipped (live)');
    last DIRECT_LOAD;
  }
  my $client = $setup->{client};

  my $params = {};
  my $query = {};
  unless ($setup->{live}) {
    $params->{'device_type'} = 'direct01';
    $params->{'id'} = 'direct02';
    $params->{'serial_number'} = 'direct03';
  }

  my $result = $client->direct({
    'path' => 'devices/{serial_number}/{device_type}/custody/{id}',
    'method' => 'GET',
    'params' => $params,
    'query' => $query,
  });
  if ($setup->{live}) {
    # Live mode is lenient: synthetic IDs frequently 4xx. Skip rather
    # than fail when the load endpoint isn't reachable with the IDs
    # we can construct from setup idmap.
    if (defined $result->{err}) {
      note("load call failed (likely synthetic IDs against live API): $result->{err}");
      pass('direct-load-device_custody_detail: skipped (live)');
      last DIRECT_LOAD;
    }
    unless ($result->{ok}) {
      note('load call not ok (likely synthetic IDs against live API)');
      pass('direct-load-device_custody_detail: skipped (live)');
      last DIRECT_LOAD;
    }
    my $status = BluefinDecryptxP2peHelpers::to_int($result->{status});
    if ($status < 200 || $status >= 300) {
      note("expected 2xx status, got $status");
      pass('direct-load-device_custody_detail: skipped (live)');
      last DIRECT_LOAD;
    }
    pass('direct-load-device_custody_detail: live ok');
  }
  else {
    ok(!defined $result->{err}, 'direct-load-device_custody_detail: no error');
    ok($result->{ok}, 'direct-load-device_custody_detail: ok');
    is(BluefinDecryptxP2peHelpers::to_int($result->{status}), 200, 'direct-load-device_custody_detail: status');
    ok(defined $result->{data}, 'direct-load-device_custody_detail: data');
    if (Voxgig::Struct::ismap($result->{data})) {
      is($result->{data}{id}, 'direct01', 'direct-load-device_custody_detail: id');
    }
    is(scalar @{ $setup->{calls} }, 1, 'direct-load-device_custody_detail: 1 call');
  }
}


sub device_custody_detail_direct_setup {
  my ($mockres) = @_;
  BluefinDecryptxP2peTestRunner::load_env_local();

  my $calls = [];

  my $env = BluefinDecryptxP2peTestRunner::env_override({
    'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID' => {},
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE' => 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY' => 'NONE',
  });

  my $live = ((($env->{'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'}) || '') eq 'TRUE') ? 1 : 0;

  if ($live) {
    my $client = BluefinDecryptxP2peSDK->new({
      'apikey' => $env->{'BLUEFIN_DECRYPTX_P2PE_APIKEY'},
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

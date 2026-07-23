#!perl
# Partner direct test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Cwd ();

use BluefinDecryptxP2peSDK;
require(Cwd::abs_path("$FindBin::Bin/runner.pm"));

DIRECT_LIST: {
  my $setup = partner_direct_setup([
    { 'id' => 'direct01' },
    { 'id' => 'direct02' },
  ]);
  my ($_should_skip, $_reason) = BluefinDecryptxP2peTestRunner::is_control_skipped(
    'direct', 'direct-list-partner', $setup->{live} ? 'live' : 'unit');
  if ($_should_skip) {
    note($_reason || 'skipped via sdk-test-control.json');
    pass('direct-list-partner: skipped via sdk-test-control.json');
    last DIRECT_LIST;
  }
  my $client = $setup->{client};

  my $result = $client->direct({
    'path' => 'partners',
    'method' => 'GET',
    'params' => {},
  });
  if ($setup->{live}) {
    # Live mode is lenient: synthetic IDs frequently 4xx and the list-
    # response shape varies wildly across public APIs. Skip rather than
    # fail when the call doesn't return a usable list.
    if (defined $result->{err}) {
      note("list call failed (likely synthetic IDs against live API): $result->{err}");
      pass('direct-list-partner: skipped (live)');
      last DIRECT_LIST;
    }
    unless ($result->{ok}) {
      note('list call not ok (likely synthetic IDs against live API)');
      pass('direct-list-partner: skipped (live)');
      last DIRECT_LIST;
    }
    my $status = BluefinDecryptxP2peHelpers::to_int($result->{status});
    if ($status < 200 || $status >= 300) {
      note("expected 2xx status, got $status");
      pass('direct-list-partner: skipped (live)');
      last DIRECT_LIST;
    }
    pass('direct-list-partner: live ok');
  }
  else {
    ok(!defined $result->{err}, 'direct-list-partner: no error');
    ok($result->{ok}, 'direct-list-partner: ok');
    is(BluefinDecryptxP2peHelpers::to_int($result->{status}), 200, 'direct-list-partner: status');
    ok(Voxgig::Struct::islist($result->{data}), 'direct-list-partner: data is array');
    is(scalar @{ $result->{data} }, 2, 'direct-list-partner: data length');
    is(scalar @{ $setup->{calls} }, 1, 'direct-list-partner: 1 call');
  }
}

DIRECT_LOAD: {
  my $setup = partner_direct_setup({ 'id' => 'direct01' });
  my ($_should_skip, $_reason) = BluefinDecryptxP2peTestRunner::is_control_skipped(
    'direct', 'direct-load-partner', $setup->{live} ? 'live' : 'unit');
  if ($_should_skip) {
    note($_reason || 'skipped via sdk-test-control.json');
    pass('direct-load-partner: skipped via sdk-test-control.json');
    last DIRECT_LOAD;
  }
  if ($setup->{live}) {
    note('live direct-load needs real ID - set *_ENTID env var with real IDs to run');
    pass('direct-load-partner: skipped (live)');
    last DIRECT_LOAD;
  }
  my $client = $setup->{client};

  my $params = {};
  my $query = {};
  unless ($setup->{live}) {
    $params->{'id'} = 'direct01';
  }

  my $result = $client->direct({
    'path' => 'partners/{id}',
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
      pass('direct-load-partner: skipped (live)');
      last DIRECT_LOAD;
    }
    unless ($result->{ok}) {
      note('load call not ok (likely synthetic IDs against live API)');
      pass('direct-load-partner: skipped (live)');
      last DIRECT_LOAD;
    }
    my $status = BluefinDecryptxP2peHelpers::to_int($result->{status});
    if ($status < 200 || $status >= 300) {
      note("expected 2xx status, got $status");
      pass('direct-load-partner: skipped (live)');
      last DIRECT_LOAD;
    }
    pass('direct-load-partner: live ok');
  }
  else {
    ok(!defined $result->{err}, 'direct-load-partner: no error');
    ok($result->{ok}, 'direct-load-partner: ok');
    is(BluefinDecryptxP2peHelpers::to_int($result->{status}), 200, 'direct-load-partner: status');
    ok(defined $result->{data}, 'direct-load-partner: data');
    if (Voxgig::Struct::ismap($result->{data})) {
      is($result->{data}{id}, 'direct01', 'direct-load-partner: id');
    }
    is(scalar @{ $setup->{calls} }, 1, 'direct-load-partner: 1 call');
  }
}


sub partner_direct_setup {
  my ($mockres) = @_;
  BluefinDecryptxP2peTestRunner::load_env_local();

  my $calls = [];

  my $env = BluefinDecryptxP2peTestRunner::env_override({
    'BLUEFINDECRYPTXP_PE_TEST_PARTNER_ENTID' => {},
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

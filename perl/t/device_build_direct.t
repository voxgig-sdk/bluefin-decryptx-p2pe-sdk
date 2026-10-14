#!perl
# DeviceBuild direct test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Cwd ();

use BluefinDecryptxP2peSDK;
require(Cwd::abs_path("$FindBin::Bin/runner.pm"));

# main.kit.test.live.strict is true (the default is true): a live
# request that fails, or a live test missing an input it needs,
# fails the test.
# An account with no record for a test to read skips it either way.
use constant LIVE_STRICT => 1;

sub live_ok {
  my ($result) = @_;
  my $status = BluefinDecryptxP2peHelpers::to_int($result->{status});
  return !defined $result->{err} && $result->{ok} && $status >= 200 && $status < 300;
}

DIRECT_LIST: {
  my $setup = device_build_direct_setup([
    { 'id' => 'direct01' },
    { 'id' => 'direct02' },
  ]);
  my ($_should_skip, $_reason) = BluefinDecryptxP2peTestRunner::is_control_skipped(
    'direct', 'direct-list-device_build', $setup->{live} ? 'live' : 'unit');
  if ($_should_skip) {
    note($_reason || 'skipped via sdk-test-control.json');
    pass('direct-list-device_build: skipped via sdk-test-control.json');
    last DIRECT_LIST;
  }
  my $client = $setup->{client};

  my $params = {};

  my $result = $client->direct({
    'path' => 'deviceBuilds',
    'method' => 'GET',
    'params' => $params,
  });
  if ($setup->{live}) {
    if (!live_ok($result)) {
      BluefinDecryptxP2peTestRunner::live_miss(LIVE_STRICT, 'direct-list-device_build', 'Live list failed: ' . BluefinDecryptxP2peTestRunner::live_describe($result));
      last DIRECT_LIST;
    }
    if (!defined BluefinDecryptxP2peTestRunner::live_list($result->{data})) {
      BluefinDecryptxP2peTestRunner::live_miss(LIVE_STRICT, 'direct-list-device_build', 'Live list returned no list: ' . BluefinDecryptxP2peTestRunner::live_describe($result));
      last DIRECT_LIST;
    }
    pass('direct-list-device_build: live ok');
  }
  else {
    ok(!defined $result->{err}, 'direct-list-device_build: no error');
    ok($result->{ok}, 'direct-list-device_build: ok');
    is(BluefinDecryptxP2peHelpers::to_int($result->{status}), 200, 'direct-list-device_build: status');
    ok(Voxgig::Struct::islist($result->{data}), 'direct-list-device_build: data is array');
    is(scalar @{ $result->{data} }, 2, 'direct-list-device_build: data length');
    is(scalar @{ $setup->{calls} }, 1, 'direct-list-device_build: 1 call');
  }
}

DIRECT_LOAD: {
  my $setup = device_build_direct_setup({ 'id' => 'direct01' });
  my ($_should_skip, $_reason) = BluefinDecryptxP2peTestRunner::is_control_skipped(
    'direct', 'direct-load-device_build', $setup->{live} ? 'live' : 'unit');
  if ($_should_skip) {
    note($_reason || 'skipped via sdk-test-control.json');
    pass('direct-load-device_build: skipped via sdk-test-control.json');
    last DIRECT_LOAD;
  }
  my $client = $setup->{client};

  my $params = {};
  my $query = {};
  if ($setup->{live}) {
    my $list_result = $client->direct({
      'path' => 'deviceBuilds',
      'method' => 'GET',
      'params' => {},
    });
    if (!live_ok($list_result)) {
      BluefinDecryptxP2peTestRunner::live_miss(LIVE_STRICT, 'direct-load-device_build', 'Live list discovery failed: ' . BluefinDecryptxP2peTestRunner::live_describe($list_result));
      last DIRECT_LOAD;
    }
    my $records = BluefinDecryptxP2peTestRunner::live_list($list_result->{data});
    if (!defined $records) {
      BluefinDecryptxP2peTestRunner::live_miss(LIVE_STRICT, 'direct-load-device_build', 'Live list discovery returned no list: ' . BluefinDecryptxP2peTestRunner::live_describe($list_result));
      last DIRECT_LOAD;
    }
    if (!@$records) {
      BluefinDecryptxP2peTestRunner::live_empty('direct-load-device_build', 'The account has no device_build record to load');
      last DIRECT_LOAD;
    }
    my $first = ref $records->[0] eq 'HASH' ? $records->[0] : {};
    my $found = $first->{'id'} // $first->{'id'};
    if (!defined $found) {
      BluefinDecryptxP2peTestRunner::live_miss(LIVE_STRICT, 'direct-load-device_build', 'Live load blocked: discovery returned no usable identity');
      last DIRECT_LOAD;
    }
    $params->{'id'} = $found;
  }
  else {
    $params->{'id'} = 'direct01';
  }

  my $result = $client->direct({
    'path' => 'deviceBuilds/{id}',
    'method' => 'GET',
    'params' => $params,
    'query' => $query,
  });
  if ($setup->{live}) {
    if (!live_ok($result)) {
      BluefinDecryptxP2peTestRunner::live_miss(LIVE_STRICT, 'direct-load-device_build', 'Live load failed: ' . BluefinDecryptxP2peTestRunner::live_describe($result));
      last DIRECT_LOAD;
    }
    if (!defined $result->{data}) {
      BluefinDecryptxP2peTestRunner::live_miss(LIVE_STRICT, 'direct-load-device_build', 'Live load returned no data: ' . BluefinDecryptxP2peTestRunner::live_describe($result));
      last DIRECT_LOAD;
    }
    pass('direct-load-device_build: live ok');
  }
  else {
    ok(!defined $result->{err}, 'direct-load-device_build: no error');
    ok($result->{ok}, 'direct-load-device_build: ok');
    is(BluefinDecryptxP2peHelpers::to_int($result->{status}), 200, 'direct-load-device_build: status');
    ok(defined $result->{data}, 'direct-load-device_build: data');
    if (Voxgig::Struct::ismap($result->{data})) {
      is($result->{data}{id}, 'direct01', 'direct-load-device_build: id');
    }
    is(scalar @{ $setup->{calls} }, 1, 'direct-load-device_build: 1 call');
  }
}


sub device_build_direct_setup {
  my ($mockres) = @_;
  BluefinDecryptxP2peTestRunner::load_env_local();

  my $calls = [];

  my $env = BluefinDecryptxP2peTestRunner::env_override({
    'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_BUILD_ENTID' => {},
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE' => 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY' => '',
  });

  my $live = ((($env->{'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'}) || '') eq 'TRUE') ? 1 : 0;

  if ($live) {
    # live_client_options() FIRST so the generated fields below win:
    # sdk-test-control.json's test.client.options adds to the live client,
    # it does not redirect it (a later key wins in a Perl hash literal).
    my $client = BluefinDecryptxP2peSDK->new({
      %{ BluefinDecryptxP2peTestRunner::live_client_options() },
      'apikey' => $env->{'BLUEFIN_DECRYPTX_P2PE_APIKEY'},
    });
    my $idmap = $env->{'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_BUILD_ENTID'};
    return {
      'client' => $client,
      'calls' => $calls,
      'live' => 1,
      'idmap' => ref $idmap eq 'HASH' ? $idmap : {},
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

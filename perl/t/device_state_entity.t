#!perl
# DeviceState entity test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Cwd ();

use BluefinDecryptxP2peSDK;
require(Cwd::abs_path("$FindBin::Bin/runner.pm"));

{
  my $testsdk = BluefinDecryptxP2peSDK->test(undef, undef);
  my $ent = $testsdk->DeviceState(undef);
  ok(defined $ent, 'device_state: create instance');
}

BASIC_FLOW: {
  my $setup = device_state_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op (('list')) {
    my ($_should_skip, $_reason) = BluefinDecryptxP2peTestRunner::is_control_skipped(
      'entityOp', "device_state." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('device_state: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  # The basic flow consumes synthetic IDs from the fixture. In live mode
  # without an *_ENTID env override, those IDs hit the live API and 4xx.
  if ($setup->{synthetic_only}) {
    note('live entity test uses synthetic IDs from fixture - set BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_STATE_ENTID JSON to run live');
    pass('device_state: basic flow skipped (synthetic IDs only)');
    last BASIC_FLOW;
  }
  my $client = $setup->{client};
  my %V;

  # Bootstrap entity data from existing test data.
  $V{device_state_ref01_data_raw} = Voxgig::Struct::items(BluefinDecryptxP2peHelpers::to_map(
    BluefinDecryptxP2peHelpers::gpath($setup->{data}, 'existing.device_state')));
  $V{device_state_ref01_data} = undef;
  if (@{ $V{device_state_ref01_data_raw} || [] }) {
    $V{device_state_ref01_data} = BluefinDecryptxP2peHelpers::to_map($V{device_state_ref01_data_raw}[0][1]);
  }

  # LIST
  $V{device_state_ref01_ent} = $client->DeviceState(undef);
  $V{device_state_ref01_match} = {};

  $V{device_state_ref01_list_result} = $V{device_state_ref01_ent}->list($V{device_state_ref01_match}, undef);
  ok(Voxgig::Struct::islist($V{device_state_ref01_list_result}), 'device_state list: is array');

}

sub device_state_basic_setup {
  my ($extra) = @_;
  BluefinDecryptxP2peTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/device_state/DeviceStateTestData.json");
  my $entity_data = do {
    open my $fh, '<:raw', $entity_data_file or die "Cannot open $entity_data_file: $!";
    local $/;
    Voxgig::Struct::parse_json(<$fh>);
  };

  my $options = {};
  $options->{entity} = $entity_data->{existing};

  my $client = BluefinDecryptxP2peSDK->test($options, $extra);

  # Generate idmap via transform.
  my $idmap = Voxgig::Struct::transform(
    ['device_state01', 'device_state02', 'device_state03'],
    {
      '`$PACK`' => ['', {
        '`$KEY`' => '`$COPY`',
        '`$VAL`' => ['`$FORMAT`', 'upper', '`$COPY`'],
      }],
    }
  );

  # Detect ENTID env override before env_override consumes it. When live
  # mode is on without a real override, the basic test runs against
  # synthetic IDs from the fixture and 4xx's. Surface this so the test can
  # skip.
  my $entid_env_raw = $ENV{'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_STATE_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinDecryptxP2peTestRunner::env_override({
    'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_STATE_ENTID' => $idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE' => 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN' => 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY' => 'NONE',
  });

  my $idmap_resolved = BluefinDecryptxP2peHelpers::to_map($env->{'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_STATE_ENTID'});
  if (!defined $idmap_resolved) {
    $idmap_resolved = BluefinDecryptxP2peHelpers::to_map($idmap);
  }

  if ((($env->{'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'}) || '') eq 'TRUE') {
    my $merged_opts = Voxgig::Struct::merge([
      {
        'apikey' => $env->{'BLUEFIN_DECRYPTX_P2PE_APIKEY'},
      },
      (Voxgig::Struct::ismap($extra) ? $extra : {}),
    ]);
    $client = BluefinDecryptxP2peSDK->new(BluefinDecryptxP2peHelpers::to_map($merged_opts));
  }

  my $live = ((($env->{'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'}) || '') eq 'TRUE') ? 1 : 0;
  return {
    'client' => $client,
    'data' => $entity_data,
    'idmap' => $idmap_resolved,
    'env' => $env,
    'explain' => ((($env->{'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN'}) || '') eq 'TRUE') ? 1 : 0,
    'live' => $live,
    'synthetic_only' => ($live && !$idmap_overridden) ? 1 : 0,
    'now' => BluefinDecryptxP2peHelpers::now_ms(),
  };
}

done_testing();

#!perl
# Device entity test

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
  my $ent = $testsdk->Device(undef);
  ok(defined $ent, 'device: create instance');
}

BASIC_FLOW: {
  my $setup = device_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op (('create', 'list', 'load')) {
    my ($_should_skip, $_reason) = BluefinDecryptxP2peTestRunner::is_control_skipped(
      'entityOp', "device." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('device: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  # The basic flow consumes synthetic IDs from the fixture. In live mode
  # without an *_ENTID env override, those IDs hit the live API and 4xx.
  if ($setup->{synthetic_only}) {
    note('live entity test uses synthetic IDs from fixture - set BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_ENTID JSON to run live');
    pass('device: basic flow skipped (synthetic IDs only)');
    last BASIC_FLOW;
  }
  my $client = $setup->{client};
  my %V;

  # CREATE
  $V{device_ref01_ent} = $client->Device(undef);
  $V{device_ref01_data} = BluefinDecryptxP2peHelpers::to_map(BluefinDecryptxP2peHelpers::gp(
    BluefinDecryptxP2peHelpers::gpath($setup->{data}, 'new.device'), 'device_ref01'));
  $V{device_ref01_data}{'serial_number'} = $setup->{idmap}{'serial_number01'};

  $V{device_ref01_data_result} = $V{device_ref01_ent}->create($V{device_ref01_data}, undef);
  $V{device_ref01_data} = BluefinDecryptxP2peHelpers::to_map(ref($V{device_ref01_data_result}) && $V{device_ref01_data_result}->can('data_get') ? $V{device_ref01_data_result}->data_get : $V{device_ref01_data_result});
  ok(defined $V{device_ref01_data}, 'device create: data');
  ok(defined $V{device_ref01_data}{id}, 'device create: id');

  # LIST
  $V{device_ref01_match} = {};

  $V{device_ref01_list_result} = $V{device_ref01_ent}->list($V{device_ref01_match}, undef);
  ok(Voxgig::Struct::islist($V{device_ref01_list_result}), 'device list: is array');

  $V{found_item} = Voxgig::Struct::select(
    BluefinDecryptxP2peTestRunner::entity_list_to_data($V{device_ref01_list_result}),
    { 'id' => $V{device_ref01_data}{id} });
  ok(!Voxgig::Struct::isempty($V{found_item}), 'device list: item exists');

  # LOAD
  $V{device_ref01_match_dt0} = {
    'id' => $V{device_ref01_data}{id},
  };
  $V{device_ref01_data_dt0_loaded} = $V{device_ref01_ent}->load($V{device_ref01_match_dt0}, undef);
  $V{device_ref01_data_dt0_load_result} = BluefinDecryptxP2peHelpers::to_map(ref($V{device_ref01_data_dt0_loaded}) && $V{device_ref01_data_dt0_loaded}->can('data_get') ? $V{device_ref01_data_dt0_loaded}->data_get : $V{device_ref01_data_dt0_loaded});
  ok(defined $V{device_ref01_data_dt0_load_result}, 'device load: data');
  is($V{device_ref01_data_dt0_load_result}{id}, $V{device_ref01_data}{id}, 'device load: id');

}

sub device_basic_setup {
  my ($extra) = @_;
  BluefinDecryptxP2peTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/device/DeviceTestData.json");
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
    ['device01', 'device02', 'device03', 'serial_number01'],
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
  my $entid_env_raw = $ENV{'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinDecryptxP2peTestRunner::env_override({
    'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_ENTID' => $idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE' => 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN' => 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY' => 'NONE',
  });

  my $idmap_resolved = BluefinDecryptxP2peHelpers::to_map($env->{'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_ENTID'});
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

#!perl
# DeviceRkiActivateResult entity test

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
  my $ent = $testsdk->DeviceRkiActivateResult(undef);
  ok(defined $ent, 'device_rki_activate_result: create instance');
}

BASIC_FLOW: {
  my $setup = device_rki_activate_result_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op ('create') {
    my ($_should_skip, $_reason) = BluefinDecryptxP2peTestRunner::is_control_skipped(
      'entityOp', "device_rki_activate_result." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('device_rki_activate_result: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  # The basic flow consumes synthetic IDs from the fixture. In live mode
  # without an *_ENTID env override, those IDs hit the live API and 4xx.
  if ($setup->{synthetic_only}) {
    note('live entity test uses synthetic IDs from fixture - set BLUEFINDECRYPTXP_PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID JSON to run live');
    pass('device_rki_activate_result: basic flow skipped (synthetic IDs only)');
    last BASIC_FLOW;
  }
  my $client = $setup->{client};
  my %V;

  # CREATE
  $V{device_rki_activate_result_ref01_ent} = $client->DeviceRkiActivateResult(undef);
  $V{device_rki_activate_result_ref01_data} = BluefinDecryptxP2peHelpers::to_map(BluefinDecryptxP2peHelpers::gp(
    BluefinDecryptxP2peHelpers::gpath($setup->{data}, 'new.device_rki_activate_result'), 'device_rki_activate_result_ref01'));

  $V{device_rki_activate_result_ref01_data_result} = $V{device_rki_activate_result_ref01_ent}->create($V{device_rki_activate_result_ref01_data}, undef);
  $V{device_rki_activate_result_ref01_data} = BluefinDecryptxP2peHelpers::to_map($V{device_rki_activate_result_ref01_data_result});
  ok(defined $V{device_rki_activate_result_ref01_data}, 'device_rki_activate_result create: data');

}

sub device_rki_activate_result_basic_setup {
  my ($extra) = @_;
  BluefinDecryptxP2peTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/device_rki_activate_result/DeviceRkiActivateResultTestData.json");
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
    ['device_rki_activate_result01', 'device_rki_activate_result02', 'device_rki_activate_result03'],
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
  my $entid_env_raw = $ENV{'BLUEFINDECRYPTXP_PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinDecryptxP2peTestRunner::env_override({
    'BLUEFINDECRYPTXP_PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID' => $idmap,
    'BLUEFINDECRYPTXP_PE_TEST_LIVE' => 'FALSE',
    'BLUEFINDECRYPTXP_PE_TEST_EXPLAIN' => 'FALSE',
    'BLUEFINDECRYPTXP_PE_APIKEY' => 'NONE',
  });

  my $idmap_resolved = BluefinDecryptxP2peHelpers::to_map($env->{'BLUEFINDECRYPTXP_PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID'});
  if (!defined $idmap_resolved) {
    $idmap_resolved = BluefinDecryptxP2peHelpers::to_map($idmap);
  }

  if ((($env->{'BLUEFINDECRYPTXP_PE_TEST_LIVE'}) || '') eq 'TRUE') {
    my $merged_opts = Voxgig::Struct::merge([
      {
        'apikey' => $env->{'BLUEFINDECRYPTXP_PE_APIKEY'},
      },
      (Voxgig::Struct::ismap($extra) ? $extra : {}),
    ]);
    $client = BluefinDecryptxP2peSDK->new(BluefinDecryptxP2peHelpers::to_map($merged_opts));
  }

  my $live = ((($env->{'BLUEFINDECRYPTXP_PE_TEST_LIVE'}) || '') eq 'TRUE') ? 1 : 0;
  return {
    'client' => $client,
    'data' => $entity_data,
    'idmap' => $idmap_resolved,
    'env' => $env,
    'explain' => ((($env->{'BLUEFINDECRYPTXP_PE_TEST_EXPLAIN'}) || '') eq 'TRUE') ? 1 : 0,
    'live' => $live,
    'synthetic_only' => ($live && !$idmap_overridden) ? 1 : 0,
    'now' => BluefinDecryptxP2peHelpers::now_ms(),
  };
}

done_testing();

#!perl
# DeviceCustodyListItem entity test

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

{
  my $testsdk = BluefinDecryptxP2peSDK->test(undef, undef);
  my $ent = $testsdk->DeviceCustodyListItem(undef);
  ok(defined $ent, 'device_custody_list_item: create instance');
}

SKIP: {
  skip('feature not present in this SDK: validate', 1)
    unless BluefinDecryptxP2peConfig::shared_config()->{feature}{validate};
  my $client = BluefinDecryptxP2peSDK->test(undef, { feature => { validate => { active => 1 } } });
  my $err = eval { $client->DeviceCustodyListItem(undef)->list({ 'device_type' => 1, 'serial_number' => 'x' }, undef); undef } // $@;
  is(ref $err ? $err->{code} : undef, 'validate_failed',
    'device_custody_list_item: an invalid request fails with validate_failed');
}

BASIC_FLOW: {
  my $setup = device_custody_list_item_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op (('list')) {
    my ($_should_skip, $_reason) = BluefinDecryptxP2peTestRunner::is_control_skipped(
      'entityOp', "device_custody_list_item." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('device_custody_list_item: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  if ($setup->{live}) {
    my @missing = grep { $setup->{synthetic_only} || !defined $setup->{idmap}{$_} } ('device_type01', 'serial_number01');
    if (@missing) {
      BluefinDecryptxP2peTestRunner::live_miss(LIVE_STRICT, 'device_custody_list_item: basic flow', 'Live entity test blocked: needs ' . join(', ', @missing) . ' via BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_LIST_ITEM_ENTID');
      last BASIC_FLOW;
    }
  }
  my $client = $setup->{client};
  my %V;

  # Bootstrap entity data from existing test data.
  $V{device_custody_list_item_ref01_data_raw} = Voxgig::Struct::items(BluefinDecryptxP2peHelpers::to_map(
    BluefinDecryptxP2peHelpers::gpath($setup->{data}, 'existing.device_custody_list_item')));
  $V{device_custody_list_item_ref01_data} = undef;
  if (@{ $V{device_custody_list_item_ref01_data_raw} || [] }) {
    $V{device_custody_list_item_ref01_data} = BluefinDecryptxP2peHelpers::to_map($V{device_custody_list_item_ref01_data_raw}[0][1]);
  }

  # LIST
  $V{device_custody_list_item_ref01_ent} = $client->DeviceCustodyListItem(undef);
  $V{device_custody_list_item_ref01_match} = {
    'device_type' => $setup->{idmap}{'device_type01'},
    'serial_number' => $setup->{idmap}{'serial_number01'},
  };

  $V{device_custody_list_item_ref01_list_result} = $V{device_custody_list_item_ref01_ent}->list($V{device_custody_list_item_ref01_match}, undef);
  ok(Voxgig::Struct::islist($V{device_custody_list_item_ref01_list_result}), 'device_custody_list_item list: is array');

}

sub device_custody_list_item_basic_setup {
  my ($extra) = @_;
  BluefinDecryptxP2peTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/device_custody_list_item/DeviceCustodyListItemTestData.json");
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
    ['device_custody_list_item01', 'device_custody_list_item02', 'device_custody_list_item03', 'device01', 'device02', 'device03', 'device_type01', 'serial_number01'],
    {
      '`$PACK`' => ['', {
        '`$KEY`' => '`$COPY`',
        '`$VAL`' => ['`$FORMAT`', 'upper', '`$COPY`'],
      }],
    }
  );

  # Whether *_ENTID supplied the idmap, read before env_override consumes
  # it: without it, the ids a live flow binds are the fixture's synthetic ones.
  my $entid_env_raw = $ENV{'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_LIST_ITEM_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinDecryptxP2peTestRunner::env_override({
    'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_LIST_ITEM_ENTID' => $idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE' => 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN' => 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY' => '',
  });

  my $idmap_resolved = BluefinDecryptxP2peHelpers::to_map($env->{'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_LIST_ITEM_ENTID'});
  if (!defined $idmap_resolved) {
    $idmap_resolved = BluefinDecryptxP2peHelpers::to_map($idmap);
  }

  if ((($env->{'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'}) || '') eq 'TRUE') {
    my $merged_opts = Voxgig::Struct::merge([
      # FIRST, so the generated fields below win: sdk-test-control.json's
      # test.client.options adds to the live client, it does not redirect it.
      BluefinDecryptxP2peTestRunner::live_client_options(),
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

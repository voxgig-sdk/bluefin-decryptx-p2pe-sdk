#!perl
# Client entity test

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
  my $ent = $testsdk->Client(undef);
  ok(defined $ent, 'client: create instance');
}

BASIC_FLOW: {
  my $setup = client_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op ('create', 'list', 'load', 'remove') {
    my ($_should_skip, $_reason) = BluefinDecryptxP2peTestRunner::is_control_skipped(
      'entityOp', "client." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('client: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  # The basic flow consumes synthetic IDs from the fixture. In live mode
  # without an *_ENTID env override, those IDs hit the live API and 4xx.
  if ($setup->{synthetic_only}) {
    note('live entity test uses synthetic IDs from fixture - set BLUEFINDECRYPTXP_PE_TEST_CLIENT_ENTID JSON to run live');
    pass('client: basic flow skipped (synthetic IDs only)');
    last BASIC_FLOW;
  }
  my $client = $setup->{client};
  my %V;

  # CREATE
  $V{client_ref01_ent} = $client->Client(undef);
  $V{client_ref01_data} = BluefinDecryptxP2peHelpers::to_map(BluefinDecryptxP2peHelpers::gp(
    BluefinDecryptxP2peHelpers::gpath($setup->{data}, 'new.client'), 'client_ref01'));

  $V{client_ref01_data_result} = $V{client_ref01_ent}->create($V{client_ref01_data}, undef);
  $V{client_ref01_data} = BluefinDecryptxP2peHelpers::to_map($V{client_ref01_data_result});
  ok(defined $V{client_ref01_data}, 'client create: data');
  ok(defined $V{client_ref01_data}{id}, 'client create: id');

  # LIST
  $V{client_ref01_match} = {};

  $V{client_ref01_list_result} = $V{client_ref01_ent}->list($V{client_ref01_match}, undef);
  ok(Voxgig::Struct::islist($V{client_ref01_list_result}), 'client list: is array');

  $V{found_item} = Voxgig::Struct::select(
    BluefinDecryptxP2peTestRunner::entity_list_to_data($V{client_ref01_list_result}),
    { 'id' => $V{client_ref01_data}{id} });
  ok(!Voxgig::Struct::isempty($V{found_item}), 'client list: item exists');

  # LOAD
  $V{client_ref01_match_dt0} = {
    'id' => $V{client_ref01_data}{id},
  };
  $V{client_ref01_data_dt0_loaded} = $V{client_ref01_ent}->load($V{client_ref01_match_dt0}, undef);
  $V{client_ref01_data_dt0_load_result} = BluefinDecryptxP2peHelpers::to_map($V{client_ref01_data_dt0_loaded});
  ok(defined $V{client_ref01_data_dt0_load_result}, 'client load: data');
  is($V{client_ref01_data_dt0_load_result}{id}, $V{client_ref01_data}{id}, 'client load: id');

  # REMOVE
  $V{client_ref01_match_rm0} = {
    'id' => $V{client_ref01_data}{id},
  };
  $V{client_ref01_ent}->remove($V{client_ref01_match_rm0}, undef);
  pass('client remove: completed');

  # LIST
  $V{client_ref01_match_rt0} = {};

  $V{client_ref01_list_rt0_result} = $V{client_ref01_ent}->list($V{client_ref01_match_rt0}, undef);
  ok(Voxgig::Struct::islist($V{client_ref01_list_rt0_result}), 'client list: is array');

  $V{not_found_item} = Voxgig::Struct::select(
    BluefinDecryptxP2peTestRunner::entity_list_to_data($V{client_ref01_list_rt0_result}),
    { 'id' => $V{client_ref01_data}{id} });
  ok(Voxgig::Struct::isempty($V{not_found_item}), 'client list: item not exists');

}

sub client_basic_setup {
  my ($extra) = @_;
  BluefinDecryptxP2peTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/client/ClientTestData.json");
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
    ['client01', 'client02', 'client03'],
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
  my $entid_env_raw = $ENV{'BLUEFINDECRYPTXP_PE_TEST_CLIENT_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinDecryptxP2peTestRunner::env_override({
    'BLUEFINDECRYPTXP_PE_TEST_CLIENT_ENTID' => $idmap,
    'BLUEFINDECRYPTXP_PE_TEST_LIVE' => 'FALSE',
    'BLUEFINDECRYPTXP_PE_TEST_EXPLAIN' => 'FALSE',
    'BLUEFINDECRYPTXP_PE_APIKEY' => 'NONE',
  });

  my $idmap_resolved = BluefinDecryptxP2peHelpers::to_map($env->{'BLUEFINDECRYPTXP_PE_TEST_CLIENT_ENTID'});
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

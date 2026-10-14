#!perl
# Location entity test

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
  my $ent = $testsdk->Location(undef);
  ok(defined $ent, 'location: create instance');
}

{
  package BluefinDecryptxP2peEntityTestLocationFailHook;
  our @ISA = ('BluefinDecryptxP2peBaseFeature');

  sub new {
    my ($class) = @_;
    my $self = BluefinDecryptxP2peBaseFeature::new($class);
    $self->{name} = 'failhook';
    $self->{unexpected} = 0;
    return $self;
  }

  sub init { }
  sub PreSpec { die "location hook failed\n" }
  sub PreUnexpected { $_[0]->{unexpected}++; return }
}

{
  my $offline = { net => { offline => 1 } };
  my $died = !eval {
    my $next = BluefinDecryptxP2peSDK->test($offline, undef)->Location(undef)->stream('list', undef, undef);
    1 while defined $next->();
    1;
  };
  like($died ? "$@" : '', qr/offline/, 'location: a failed stream raises');

  ok(eval {
    my $next = BluefinDecryptxP2peSDK->test($offline, undef)->Location(undef)
      ->stream('list', undef, { ctrl => { throw => 0 } });
    1 while defined $next->();
    1;
  }, 'location: under throw false a failed stream ends');

  if (BluefinDecryptxP2peConfig::shared_config()->{feature}{rbac}) {
    my $denied = BluefinDecryptxP2peSDK->test(undef, { feature => { rbac => { active => 1, deny => 1 } } });
    my $denyerr = eval {
      my $next = $denied->Location(undef)->stream('list', undef, undef);
      1 while defined $next->();
      undef;
    } // $@;
    is(ref $denyerr ? $denyerr->{code} : undef, 'rbac_denied',
      'location: a denied stream raises');
  }
}

{
  my $explain = {};
  my $ctrl = { explain => $explain };
  my $next = BluefinDecryptxP2peSDK->test(undef, undef)->Location(undef)
    ->stream('list', undef, { ctrl => $ctrl });
  1 while defined $next->();
  is_deeply([sort keys %$ctrl], ['explain'], 'location: the stream leaves the caller ctrl');
  ok($explain == $ctrl->{explain} && 0 < keys %$explain,
    'location: the caller explain record is filled');
}

{
  my $hook = BluefinDecryptxP2peEntityTestLocationFailHook->new;
  my $client = BluefinDecryptxP2peSDK->new({ feature => { test => { active => 1 } }, extend => [$hook] });

  my $err = eval { $client->Location(undef)->list(undef, undef); undef } // $@;
  like("$err", qr/hook failed/, 'location: a dying hook fails the operation');
  ok(0 < $hook->{unexpected}, 'location: PreUnexpected fired');

  my $fired = $hook->{unexpected};
  my $out = eval { $client->Location(undef)->list(undef, { throw => 0 }) };
  ok(!$@ && !defined $out, 'location: under throw false the call returns undef');
  ok($fired < $hook->{unexpected}, 'location: PreUnexpected fired under throw false');
}

{
  my $seed = { entity => { 'location' => { l1 => { id => 'l1' }, l2 => { id => 'l2' } } } };
  my $items = BluefinDecryptxP2peSDK->test($seed, undef)->Location(undef)->list(undef, undef);
  # list resolves to one entity per record; data_get reads the record.
  is(scalar(@$items), 2, 'location: list answers each seeded record');
  my $entities = grep {
    Scalar::Util::blessed($_) && $_->can('data_get') && Voxgig::Struct::ismap($_->data_get)
  } @$items;
  is($entities, 2, 'location: each listed item is an entity carrying its record');
}

SKIP: {
  skip('feature not present in this SDK: validate', 1)
    unless BluefinDecryptxP2peConfig::shared_config()->{feature}{validate};
  my $client = BluefinDecryptxP2peSDK->test(undef, { feature => { validate => { active => 1 } } });
  my $err = eval { $client->Location(undef)->list({ 'client' => 1 }, undef); undef } // $@;
  is(ref $err ? $err->{code} : undef, 'validate_failed',
    'location: an invalid request fails with validate_failed');
}

BASIC_FLOW: {
  my $setup = location_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op (('create', 'list', 'load', 'remove')) {
    my ($_should_skip, $_reason) = BluefinDecryptxP2peTestRunner::is_control_skipped(
      'entityOp', "location." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('location: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  my $client = $setup->{client};
  my %V;

  # CREATE
  $V{location_ref01_ent} = $client->Location(undef);
  $V{location_ref01_data} = BluefinDecryptxP2peHelpers::to_map(BluefinDecryptxP2peHelpers::gp(
    BluefinDecryptxP2peHelpers::gpath($setup->{data}, 'new.location'), 'location_ref01'));

  $V{location_ref01_data_result} = $V{location_ref01_ent}->create($V{location_ref01_data}, undef);
  $V{location_ref01_data} = BluefinDecryptxP2peHelpers::to_map(ref($V{location_ref01_data_result}) && $V{location_ref01_data_result}->can('data_get') ? $V{location_ref01_data_result}->data_get : $V{location_ref01_data_result});
  ok(defined $V{location_ref01_data}, 'location create: data');
  ok(defined $V{location_ref01_data}{id}, 'location create: id');

  # LIST
  $V{location_ref01_match} = {};

  $V{location_ref01_list_result} = $V{location_ref01_ent}->list($V{location_ref01_match}, undef);
  ok(Voxgig::Struct::islist($V{location_ref01_list_result}), 'location list: is array');

  $V{found_item} = Voxgig::Struct::select(
    BluefinDecryptxP2peTestRunner::entity_list_to_data($V{location_ref01_list_result}),
    { 'id' => $V{location_ref01_data}{id} });
  ok(!Voxgig::Struct::isempty($V{found_item}), 'location list: item exists');

  # LOAD
  $V{location_ref01_match_dt0} = {
    'id' => $V{location_ref01_data}{id},
  };
  $V{location_ref01_data_dt0_loaded} = $V{location_ref01_ent}->load($V{location_ref01_match_dt0}, undef);
  $V{location_ref01_data_dt0_load_result} = BluefinDecryptxP2peHelpers::to_map(ref($V{location_ref01_data_dt0_loaded}) && $V{location_ref01_data_dt0_loaded}->can('data_get') ? $V{location_ref01_data_dt0_loaded}->data_get : $V{location_ref01_data_dt0_loaded});
  ok(defined $V{location_ref01_data_dt0_load_result}, 'location load: data');
  is($V{location_ref01_data_dt0_load_result}{id}, $V{location_ref01_data}{id}, 'location load: id');

  # REMOVE
  $V{location_ref01_match_rm0} = {
    'id' => $V{location_ref01_data}{id},
  };
  $V{location_ref01_ent}->remove($V{location_ref01_match_rm0}, undef);
  pass('location remove: completed');

  # LIST
  $V{location_ref01_match_rt0} = {};

  $V{location_ref01_list_rt0_result} = $V{location_ref01_ent}->list($V{location_ref01_match_rt0}, undef);
  ok(Voxgig::Struct::islist($V{location_ref01_list_rt0_result}), 'location list: is array');

  $V{not_found_item} = Voxgig::Struct::select(
    BluefinDecryptxP2peTestRunner::entity_list_to_data($V{location_ref01_list_rt0_result}),
    { 'id' => $V{location_ref01_data}{id} });
  ok(Voxgig::Struct::isempty($V{not_found_item}), 'location list: item not exists');

}

sub location_basic_setup {
  my ($extra) = @_;
  BluefinDecryptxP2peTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/location/LocationTestData.json");
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
    ['location01', 'location02', 'location03'],
    {
      '`$PACK`' => ['', {
        '`$KEY`' => '`$COPY`',
        '`$VAL`' => ['`$FORMAT`', 'upper', '`$COPY`'],
      }],
    }
  );

  # Whether *_ENTID supplied the idmap, read before env_override consumes
  # it: without it, the ids a live flow binds are the fixture's synthetic ones.
  my $entid_env_raw = $ENV{'BLUEFIN_DECRYPTX_P2PE_TEST_LOCATION_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinDecryptxP2peTestRunner::env_override({
    'BLUEFIN_DECRYPTX_P2PE_TEST_LOCATION_ENTID' => $idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE' => 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN' => 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY' => '',
  });

  my $idmap_resolved = BluefinDecryptxP2peHelpers::to_map($env->{'BLUEFIN_DECRYPTX_P2PE_TEST_LOCATION_ENTID'});
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

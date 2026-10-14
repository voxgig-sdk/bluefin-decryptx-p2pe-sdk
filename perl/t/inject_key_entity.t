#!perl
# InjectKey entity test

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
  my $ent = $testsdk->InjectKey(undef);
  ok(defined $ent, 'inject_key: create instance');
}

{
  package BluefinDecryptxP2peEntityTestInjectKeyFailHook;
  our @ISA = ('BluefinDecryptxP2peBaseFeature');

  sub new {
    my ($class) = @_;
    my $self = BluefinDecryptxP2peBaseFeature::new($class);
    $self->{name} = 'failhook';
    $self->{unexpected} = 0;
    return $self;
  }

  sub init { }
  sub PreSpec { die "inject_key hook failed\n" }
  sub PreUnexpected { $_[0]->{unexpected}++; return }
}

{
  my $offline = { net => { offline => 1 } };
  my $died = !eval {
    my $next = BluefinDecryptxP2peSDK->test($offline, undef)->InjectKey(undef)->stream('list', undef, undef);
    1 while defined $next->();
    1;
  };
  like($died ? "$@" : '', qr/offline/, 'inject_key: a failed stream raises');

  ok(eval {
    my $next = BluefinDecryptxP2peSDK->test($offline, undef)->InjectKey(undef)
      ->stream('list', undef, { ctrl => { throw => 0 } });
    1 while defined $next->();
    1;
  }, 'inject_key: under throw false a failed stream ends');

  if (BluefinDecryptxP2peConfig::shared_config()->{feature}{rbac}) {
    my $denied = BluefinDecryptxP2peSDK->test(undef, { feature => { rbac => { active => 1, deny => 1 } } });
    my $denyerr = eval {
      my $next = $denied->InjectKey(undef)->stream('list', undef, undef);
      1 while defined $next->();
      undef;
    } // $@;
    is(ref $denyerr ? $denyerr->{code} : undef, 'rbac_denied',
      'inject_key: a denied stream raises');
  }
}

{
  my $explain = {};
  my $ctrl = { explain => $explain };
  my $next = BluefinDecryptxP2peSDK->test(undef, undef)->InjectKey(undef)
    ->stream('list', undef, { ctrl => $ctrl });
  1 while defined $next->();
  is_deeply([sort keys %$ctrl], ['explain'], 'inject_key: the stream leaves the caller ctrl');
  ok($explain == $ctrl->{explain} && 0 < keys %$explain,
    'inject_key: the caller explain record is filled');
}

{
  my $hook = BluefinDecryptxP2peEntityTestInjectKeyFailHook->new;
  my $client = BluefinDecryptxP2peSDK->new({ feature => { test => { active => 1 } }, extend => [$hook] });

  my $err = eval { $client->InjectKey(undef)->list(undef, undef); undef } // $@;
  like("$err", qr/hook failed/, 'inject_key: a dying hook fails the operation');
  ok(0 < $hook->{unexpected}, 'inject_key: PreUnexpected fired');

  my $fired = $hook->{unexpected};
  my $out = eval { $client->InjectKey(undef)->list(undef, { throw => 0 }) };
  ok(!$@ && !defined $out, 'inject_key: under throw false the call returns undef');
  ok($fired < $hook->{unexpected}, 'inject_key: PreUnexpected fired under throw false');
}

{
  my $seed = { entity => { 'inject_key' => { l1 => { id => 'l1' }, l2 => { id => 'l2' } } } };
  my $items = BluefinDecryptxP2peSDK->test($seed, undef)->InjectKey(undef)->list(undef, undef);
  # list resolves to one entity per record; data_get reads the record.
  is(scalar(@$items), 2, 'inject_key: list answers each seeded record');
  my $entities = grep {
    Scalar::Util::blessed($_) && $_->can('data_get') && Voxgig::Struct::ismap($_->data_get)
  } @$items;
  is($entities, 2, 'inject_key: each listed item is an entity carrying its record');
}

SKIP: {
  skip('feature not present in this SDK: validate', 1)
    unless BluefinDecryptxP2peConfig::shared_config()->{feature}{validate};
  my $client = BluefinDecryptxP2peSDK->test(undef, { feature => { validate => { active => 1 } } });
  my $err = eval { $client->InjectKey(undef)->list({ 'created' => 1 }, undef); undef } // $@;
  is(ref $err ? $err->{code} : undef, 'validate_failed',
    'inject_key: an invalid request fails with validate_failed');
}

BASIC_FLOW: {
  my $setup = inject_key_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op (('list', 'load')) {
    my ($_should_skip, $_reason) = BluefinDecryptxP2peTestRunner::is_control_skipped(
      'entityOp', "inject_key." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('inject_key: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  my $client = $setup->{client};
  if ($setup->{live}) {
    BluefinDecryptxP2peTestRunner::live_existing($setup, LIVE_STRICT, 'inject_key: basic flow', 'inject_key',
      sub { $client->InjectKey(undef)->list({}, undef) }) or last BASIC_FLOW;
  }
  my %V;

  # Bootstrap entity data from existing test data.
  $V{inject_key_ref01_data_raw} = Voxgig::Struct::items(BluefinDecryptxP2peHelpers::to_map(
    BluefinDecryptxP2peHelpers::gpath($setup->{data}, 'existing.inject_key')));
  $V{inject_key_ref01_data} = undef;
  if (@{ $V{inject_key_ref01_data_raw} || [] }) {
    $V{inject_key_ref01_data} = BluefinDecryptxP2peHelpers::to_map($V{inject_key_ref01_data_raw}[0][1]);
  }

  # LIST
  $V{inject_key_ref01_ent} = $client->InjectKey(undef);
  $V{inject_key_ref01_match} = {};

  $V{inject_key_ref01_list_result} = $V{inject_key_ref01_ent}->list($V{inject_key_ref01_match}, undef);
  ok(Voxgig::Struct::islist($V{inject_key_ref01_list_result}), 'inject_key list: is array');

  # LOAD
  $V{inject_key_ref01_match_dt0} = {
    'id' => $V{inject_key_ref01_data}{id},
  };
  $V{inject_key_ref01_data_dt0_loaded} = $V{inject_key_ref01_ent}->load($V{inject_key_ref01_match_dt0}, undef);
  $V{inject_key_ref01_data_dt0_load_result} = BluefinDecryptxP2peHelpers::to_map(ref($V{inject_key_ref01_data_dt0_loaded}) && $V{inject_key_ref01_data_dt0_loaded}->can('data_get') ? $V{inject_key_ref01_data_dt0_loaded}->data_get : $V{inject_key_ref01_data_dt0_loaded});
  ok(defined $V{inject_key_ref01_data_dt0_load_result}, 'inject_key load: data');
  is($V{inject_key_ref01_data_dt0_load_result}{id}, $V{inject_key_ref01_data}{id}, 'inject_key load: id');

}

sub inject_key_basic_setup {
  my ($extra) = @_;
  BluefinDecryptxP2peTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/inject_key/InjectKeyTestData.json");
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
    ['inject_key01', 'inject_key02', 'inject_key03'],
    {
      '`$PACK`' => ['', {
        '`$KEY`' => '`$COPY`',
        '`$VAL`' => ['`$FORMAT`', 'upper', '`$COPY`'],
      }],
    }
  );

  # Whether *_ENTID supplied the idmap, read before env_override consumes
  # it: without it, the ids a live flow binds are the fixture's synthetic ones.
  my $entid_env_raw = $ENV{'BLUEFIN_DECRYPTX_P2PE_TEST_INJECT_KEY_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinDecryptxP2peTestRunner::env_override({
    'BLUEFIN_DECRYPTX_P2PE_TEST_INJECT_KEY_ENTID' => $idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE' => 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN' => 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY' => '',
  });

  my $idmap_resolved = BluefinDecryptxP2peHelpers::to_map($env->{'BLUEFIN_DECRYPTX_P2PE_TEST_INJECT_KEY_ENTID'});
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

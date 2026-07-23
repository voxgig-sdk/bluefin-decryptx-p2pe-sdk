# BluefinDecryptxP2pe SDK

use strict;
use warnings;

use File::Basename ();
use Cwd ();
use Scalar::Util ();

package BluefinDecryptxP2peSDK;

our $VERSION = '0.0.1';

our $DIR;
BEGIN { $DIR = File::Basename::dirname(Cwd::abs_path(__FILE__)) }

require(Cwd::abs_path("$DIR/Voxgig/Struct.pm"));
require(Cwd::abs_path("$DIR/../core/helpers.pm"));
require(Cwd::abs_path("$DIR/../core/utility_type.pm"));
require(Cwd::abs_path("$DIR/../core/spec.pm"));
require(Cwd::abs_path("$DIR/../core/error.pm"));

# Load utility registration
require(Cwd::abs_path("$DIR/../utility/register.pm"));

# Load config and features
require(Cwd::abs_path("$DIR/../config.pm"));
require(Cwd::abs_path("$DIR/../feature/base_feature.pm"));
require(Cwd::abs_path("$DIR/../features.pm"));

sub new {
  my ($class, $options) = @_;
  $options = {} unless defined $options;

  my $self = bless {
    mode => 'live',
    features => [],
    options => undef,
  }, $class;

  my $utility = BluefinDecryptxP2peUtility->new;
  $self->{_utility} = $utility;

  my $config = BluefinDecryptxP2peConfig::make_config();

  $self->{_rootctx} = $utility->{make_context}->({
    'client' => $self,
    'utility' => $utility,
    'config' => $config,
    'options' => $options,
    'shared' => {},
  }, undef);

  $self->{options} = $utility->{make_options}->($self->{_rootctx});

  if (BluefinDecryptxP2peHelpers::is_true(
    BluefinDecryptxP2peHelpers::gpath($self->{options}, 'feature.test.active'))) {
    $self->{mode} = 'test';
  }

  $self->{_rootctx}{options} = $self->{options};

  # Add features in the resolved order (make_options records an explicit
  # array order, else defaults to test-first). Ordering matters: the `test`
  # feature installs the base mock transport and the transport features
  # (retry/cache/netsim/proxy/ratelimit) wrap whatever is current, so `test`
  # must be added before them to sit at the base of the wrapper chain.
  my $feature_opts = BluefinDecryptxP2peHelpers::to_map(
    BluefinDecryptxP2peHelpers::gp($self->{options}, 'feature')) || {};
  my $featureorder = BluefinDecryptxP2peHelpers::gpath(
    $self->{options}, '__derived__.featureorder');
  $featureorder = [] unless Voxgig::Struct::islist($featureorder);
  for my $fname (@$featureorder) {
    my $fopts = BluefinDecryptxP2peHelpers::to_map($feature_opts->{$fname});
    if ($fopts && BluefinDecryptxP2peHelpers::is_true($fopts->{active})) {
      $utility->{feature_add}->($self->{_rootctx},
        BluefinDecryptxP2peFeatures::make_feature($fname));
    }
  }

  # Add extension features.
  my $extend = BluefinDecryptxP2peHelpers::gp($self->{options}, 'extend');
  if (Voxgig::Struct::islist($extend)) {
    for my $f (@$extend) {
      if (Scalar::Util::blessed($f) && $f->can('get_name')) {
        $utility->{feature_add}->($self->{_rootctx}, $f);
      }
    }
  }

  # Initialize features.
  for my $f (@{ $self->{features} }) {
    $utility->{feature_init}->($self->{_rootctx}, $f);
  }

  $utility->{feature_hook}->($self->{_rootctx}, 'PostConstruct');

  return $self;
}

sub options_map {
  my ($self) = @_;
  my $out = Voxgig::Struct::clone($self->{options});
  return Voxgig::Struct::ismap($out) ? $out : {};
}

sub get_utility {
  my ($self) = @_;
  return BluefinDecryptxP2peUtility->copy($self->{_utility});
}

sub get_root_ctx {
  my ($self) = @_;
  return $self->{_rootctx};
}

sub prepare {
  my ($self, $fetchargs) = @_;
  my $utility = $self->{_utility};
  $fetchargs = {} unless defined $fetchargs;

  my $ctrl = BluefinDecryptxP2peHelpers::to_map(
    BluefinDecryptxP2peHelpers::gp($fetchargs, 'ctrl')) || {};

  my $ctx = $utility->{make_context}->({
    'opname' => 'prepare',
    'ctrl' => $ctrl,
  }, $self->{_rootctx});

  my $opts = $self->{options};
  my $path = BluefinDecryptxP2peHelpers::gp($fetchargs, 'path');
  $path = '' unless defined $path && !ref $path;
  my $method_val = BluefinDecryptxP2peHelpers::gp($fetchargs, 'method');
  $method_val = 'GET' unless defined $method_val && !ref $method_val;
  my $params = BluefinDecryptxP2peHelpers::to_map(
    BluefinDecryptxP2peHelpers::gp($fetchargs, 'params')) || {};
  my $query = BluefinDecryptxP2peHelpers::to_map(
    BluefinDecryptxP2peHelpers::gp($fetchargs, 'query')) || {};
  my $headers = $utility->{prepare_headers}->($ctx);

  my $base = BluefinDecryptxP2peHelpers::gp($opts, 'base');
  $base = '' unless defined $base && !ref $base;
  my $prefix = BluefinDecryptxP2peHelpers::gp($opts, 'prefix');
  $prefix = '' unless defined $prefix && !ref $prefix;
  my $suffix = BluefinDecryptxP2peHelpers::gp($opts, 'suffix');
  $suffix = '' unless defined $suffix && !ref $suffix;

  $ctx->{spec} = BluefinDecryptxP2peSpec->new({
    'base' => $base, 'prefix' => $prefix, 'suffix' => $suffix,
    'path' => $path, 'method' => $method_val,
    'params' => $params, 'query' => $query, 'headers' => $headers,
    'body' => BluefinDecryptxP2peHelpers::gp($fetchargs, 'body'),
    'step' => 'start',
  });

  # Merge user-provided headers.
  my $uh = BluefinDecryptxP2peHelpers::gp($fetchargs, 'headers');
  if (Voxgig::Struct::ismap($uh)) {
    $ctx->{spec}{headers}{$_} = $uh->{$_} for keys %$uh;
  }

  my (undef, $err) = $utility->{prepare_auth}->($ctx);
  die $err if $err;

  # make_fetch_def returns a (fetchdef, err) tuple; destructure it and
  # return just the fetchdef hashref (dying on error) so callers -
  # including direct(), which indexes fetchdef->{url} - receive a hashref,
  # mirroring the ts/py/rb prepare().
  my ($fetchdef, $fd_err) = $utility->{make_fetch_def}->($ctx);
  die $fd_err if $fd_err;

  return $fetchdef;
}

sub direct {
  my ($self, $fetchargs) = @_;
  my $utility = $self->{_utility};

  # direct() is the raw-HTTP escape hatch: it always returns a result hash
  # ({ ok => ..., ... }) and never dies. prepare() dies on error, so trap
  # that and surface it in the hash.
  my $fetchdef = eval { $self->prepare($fetchargs) };
  if (my $prep_err = $@) {
    return { 'ok' => 0, 'err' => $prep_err };
  }

  $fetchargs = {} unless defined $fetchargs;
  my $ctrl = BluefinDecryptxP2peHelpers::to_map(
    BluefinDecryptxP2peHelpers::gp($fetchargs, 'ctrl')) || {};

  my $ctx = $utility->{make_context}->({
    'opname' => 'direct',
    'ctrl' => $ctrl,
  }, $self->{_rootctx});

  my $url = defined $fetchdef->{url} ? $fetchdef->{url} : '';
  my ($fetched, $fetch_err) = $utility->{fetcher}->($ctx, $url, $fetchdef);

  return { 'ok' => 0, 'err' => $fetch_err } if $fetch_err;

  if (!defined $fetched) {
    return {
      'ok' => 0,
      'err' => $ctx->make_error('direct_no_response', 'response: undefined'),
    };
  }

  if (Voxgig::Struct::ismap($fetched)) {
    my $status = BluefinDecryptxP2peHelpers::to_int(
      BluefinDecryptxP2peHelpers::gp($fetched, 'status'));
    my $headers = BluefinDecryptxP2peHelpers::gp($fetched, 'headers') || {};

    # No-body responses (204, 304) and explicit zero content-length must
    # skip JSON parsing - calling json() on an empty body errors.
    my $content_length = Voxgig::Struct::ismap($headers)
      ? $headers->{'content-length'} : undef;
    my $no_body = (204 == $status || 304 == $status
      || (defined $content_length && '0' eq "$content_length")) ? 1 : 0;

    my $json_data;
    unless ($no_body) {
      my $jf = BluefinDecryptxP2peHelpers::gp($fetched, 'json');
      if (ref $jf eq 'CODE') {
        # Non-JSON body - leave data undef, keep status/headers.
        $json_data = eval { $jf->() };
      }
    }

    return {
      'ok' => ($status >= 200 && $status < 300) ? 1 : 0,
      'status' => $status,
      'headers' => $headers,
      'data' => $json_data,
    };
  }

  return {
    'ok' => 0,
    'err' => $ctx->make_error('direct_invalid', 'invalid response type'),
  };
}


# Canonical facade: $client->Attestation->list / ->load({ 'id' => ... })
sub Attestation {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/attestation_entity.pm"));
  return AttestationEntity->new($self, $data);
}


# Canonical facade: $client->Client->list / ->load({ 'id' => ... })
sub Client {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/client_entity.pm"));
  return ClientEntity->new($self, $data);
}


# Canonical facade: $client->CreateResult->list / ->load({ 'id' => ... })
sub CreateResult {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/create_result_entity.pm"));
  return CreateResultEntity->new($self, $data);
}


# Canonical facade: $client->Decryption->list / ->load({ 'id' => ... })
sub Decryption {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/decryption_entity.pm"));
  return DecryptionEntity->new($self, $data);
}


# Canonical facade: $client->Device->list / ->load({ 'id' => ... })
sub Device {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/device_entity.pm"));
  return DeviceEntity->new($self, $data);
}


# Canonical facade: $client->DeviceBuild->list / ->load({ 'id' => ... })
sub DeviceBuild {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/device_build_entity.pm"));
  return DeviceBuildEntity->new($self, $data);
}


# Canonical facade: $client->DeviceCustodyDetail->list / ->load({ 'id' => ... })
sub DeviceCustodyDetail {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/device_custody_detail_entity.pm"));
  return DeviceCustodyDetailEntity->new($self, $data);
}


# Canonical facade: $client->DeviceCustodyList->list / ->load({ 'id' => ... })
sub DeviceCustodyList {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/device_custody_list_entity.pm"));
  return DeviceCustodyListEntity->new($self, $data);
}


# Canonical facade: $client->DeviceList->list / ->load({ 'id' => ... })
sub DeviceList {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/device_list_entity.pm"));
  return DeviceListEntity->new($self, $data);
}


# Canonical facade: $client->DeviceReceiveResult->list / ->load({ 'id' => ... })
sub DeviceReceiveResult {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/device_receive_result_entity.pm"));
  return DeviceReceiveResultEntity->new($self, $data);
}


# Canonical facade: $client->DeviceRkiActivateResult->list / ->load({ 'id' => ... })
sub DeviceRkiActivateResult {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/device_rki_activate_result_entity.pm"));
  return DeviceRkiActivateResultEntity->new($self, $data);
}


# Canonical facade: $client->DeviceState->list / ->load({ 'id' => ... })
sub DeviceState {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/device_state_entity.pm"));
  return DeviceStateEntity->new($self, $data);
}


# Canonical facade: $client->DeviceType->list / ->load({ 'id' => ... })
sub DeviceType {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/device_type_entity.pm"));
  return DeviceTypeEntity->new($self, $data);
}


# Canonical facade: $client->InjectKey->list / ->load({ 'id' => ... })
sub InjectKey {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/inject_key_entity.pm"));
  return InjectKeyEntity->new($self, $data);
}


# Canonical facade: $client->Kif->list / ->load({ 'id' => ... })
sub Kif {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/kif_entity.pm"));
  return KifEntity->new($self, $data);
}


# Canonical facade: $client->Location->list / ->load({ 'id' => ... })
sub Location {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/location_entity.pm"));
  return LocationEntity->new($self, $data);
}


# Canonical facade: $client->Partner->list / ->load({ 'id' => ... })
sub Partner {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/partner_entity.pm"));
  return PartnerEntity->new($self, $data);
}


# Canonical facade: $client->Shipment->list / ->load({ 'id' => ... })
sub Shipment {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/shipment_entity.pm"));
  return ShipmentEntity->new($self, $data);
}


# Canonical facade: $client->Success->list / ->load({ 'id' => ... })
sub Success {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/success_entity.pm"));
  return SuccessEntity->new($self, $data);
}


# Canonical facade: $client->Transaction->list / ->load({ 'id' => ... })
sub Transaction {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/transaction_entity.pm"));
  return TransactionEntity->new($self, $data);
}


# Canonical facade: $client->UpdateResult->list / ->load({ 'id' => ... })
sub UpdateResult {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/update_result_entity.pm"));
  return UpdateResultEntity->new($self, $data);
}


# Canonical facade: $client->User->list / ->load({ 'id' => ... })
sub User {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/user_entity.pm"));
  return UserEntity->new($self, $data);
}



sub test {
  my ($class, $testopts, $sdkopts) = @_;
  $sdkopts = {} unless defined $sdkopts;
  $sdkopts = Voxgig::Struct::clone($sdkopts);
  $sdkopts = {} unless Voxgig::Struct::ismap($sdkopts);

  $testopts = {} unless defined $testopts;
  $testopts = Voxgig::Struct::clone($testopts);
  $testopts = {} unless Voxgig::Struct::ismap($testopts);
  $testopts->{active} = Voxgig::Struct::JTRUE();

  Voxgig::Struct::setpath($sdkopts, 'feature.test', $testopts);

  my $sdk = $class->new($sdkopts);
  $sdk->{mode} = 'test';
  return $sdk;
}

1;

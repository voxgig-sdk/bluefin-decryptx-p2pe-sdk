# BluefinDecryptxP2pe SDK utility: transform_request

use strict;
use warnings;

use File::Basename ();
use Cwd ();

my $__dir;
BEGIN { $__dir = File::Basename::dirname(Cwd::abs_path(__FILE__)) }
require(Cwd::abs_path("$__dir/../lib/Voxgig/Struct.pm"));
require(Cwd::abs_path("$__dir/../core/helpers.pm"));
require(Cwd::abs_path("$__dir/param.pm"));

package BluefinDecryptxP2peUtilities;

our %REGISTRY;

# `$action` selects the point (see make_point); it is never an API field, so
# the body is a copy without it. The caller's hash is left untouched.
my $omit = sub {
  my ($reqdata, @names) = @_;
  return $reqdata unless 'HASH' eq ref $reqdata && grep { exists $reqdata->{$_} } @names;
  my %body = %$reqdata;
  delete @body{@names};
  return \%body;
};

my $strip_action = sub { $omit->($_[0], '$action') };

my $field_arg = sub {
  my ($ctx, $name) = @_;
  for my $kind (qw(header cookie query)) {
    my $defs = $ctx->{point} ? BluefinDecryptxP2peHelpers::gpath($ctx->{point}, "args.$kind") : undef;
    next unless Voxgig::Struct::islist($defs);
    for my $ad (@$defs) {
      my $n = BluefinDecryptxP2peHelpers::gp($ad, 'name');
      return 1 if defined $n && !ref $n && $n eq $name &&
        BluefinDecryptxP2peHelpers::rb_truthy(BluefinDecryptxP2peHelpers::gp($ad, 'field'));
    }
  }
  return 0;
};

# A header, cookie or query argument travels where prepare_headers or
# prepare_query sends it, so the body is built from the request data without
# it, unless the point marks it as a field the body keeps.
my $routed_arg_names = sub {
  my ($ctx) = @_;
  return grep { !$field_arg->($ctx, $_) } map { $_->[0] } BluefinDecryptxP2peUtilities::call_args($ctx, 'header'),
    BluefinDecryptxP2peUtilities::call_args($ctx, 'cookie'), BluefinDecryptxP2peUtilities::call_args($ctx, 'query');
};

$REGISTRY{transform_request} = sub {
  my ($ctx) = @_;
  my $spec = $ctx->{spec};
  my $point = $ctx->{point};
  $spec->{step} = 'reqform' if $spec;
  my $data = $omit->($ctx->{reqdata}, $routed_arg_names->($ctx));
  my $transform = BluefinDecryptxP2peHelpers::to_map(BluefinDecryptxP2peHelpers::gp($point, 'transform'));
  return $strip_action->($data) unless $transform;
  my $reqform = BluefinDecryptxP2peHelpers::gp($transform, 'req');
  return $strip_action->($data) unless BluefinDecryptxP2peHelpers::rb_truthy($reqform);
  return $strip_action->(Voxgig::Struct::transform({ 'reqdata' => $data }, $reqform));
};

1;

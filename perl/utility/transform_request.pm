# BluefinDecryptxP2pe SDK utility: transform_request

use strict;
use warnings;

use File::Basename ();
use Cwd ();

my $__dir;
BEGIN { $__dir = File::Basename::dirname(Cwd::abs_path(__FILE__)) }
require(Cwd::abs_path("$__dir/../lib/Voxgig/Struct.pm"));
require(Cwd::abs_path("$__dir/../core/helpers.pm"));

package BluefinDecryptxP2peUtilities;

our %REGISTRY;

# `$action` selects the point (see make_point); it is never an API field, so
# the body is a copy without it. The caller's hash is left untouched.
my $strip_action = sub {
  my ($reqdata) = @_;
  return $reqdata unless 'HASH' eq ref $reqdata && exists $reqdata->{'$action'};
  my %body = %$reqdata;
  delete $body{'$action'};
  return \%body;
};

$REGISTRY{transform_request} = sub {
  my ($ctx) = @_;
  my $spec = $ctx->{spec};
  my $point = $ctx->{point};
  $spec->{step} = 'reqform' if $spec;
  my $transform = BluefinDecryptxP2peHelpers::to_map(BluefinDecryptxP2peHelpers::gp($point, 'transform'));
  return $strip_action->($ctx->{reqdata}) unless $transform;
  my $reqform = BluefinDecryptxP2peHelpers::gp($transform, 'req');
  return $strip_action->($ctx->{reqdata}) unless BluefinDecryptxP2peHelpers::rb_truthy($reqform);
  return $strip_action->(Voxgig::Struct::transform({ 'reqdata' => $ctx->{reqdata} }, $reqform));
};

1;

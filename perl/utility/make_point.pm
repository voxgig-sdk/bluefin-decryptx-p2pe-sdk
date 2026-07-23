# BluefinDecryptxP2pe SDK utility: make_point

use strict;
use warnings;

use File::Basename ();
use Cwd ();
use Scalar::Util ();

my $__dir;
BEGIN { $__dir = File::Basename::dirname(Cwd::abs_path(__FILE__)) }
require(Cwd::abs_path("$__dir/../lib/Voxgig/Struct.pm"));
require(Cwd::abs_path("$__dir/../core/helpers.pm"));
require(Cwd::abs_path("$__dir/../core/error.pm"));

package BluefinDecryptxP2peUtilities;

our %REGISTRY;

$REGISTRY{make_point} = sub {
  my ($ctx) = @_;

  if ($ctx->{out}{point}) {
    my $preset = $ctx->{out}{point};
    # A feature may short-circuit endpoint resolution by placing an error
    # in ctx.out.point (e.g. an rbac denial): surface it as the error
    # tuple slot so the operation fails before any network use.
    return (undef, $preset)
      if Scalar::Util::blessed($preset) && $preset->isa('BluefinDecryptxP2peError');
    $ctx->{point} = $preset;
    return ($ctx->{point}, undef);
  }

  my $op = $ctx->{op};
  my $options = $ctx->{options};

  my $allow_op = BluefinDecryptxP2peHelpers::gpath($options, 'allow.op');
  $allow_op = '' unless defined $allow_op && !ref $allow_op;
  if (index($allow_op, $op->{name}) < 0) {
    return (undef, $ctx->make_error('point_op_allow',
      "Operation \"$op->{name}\" not allowed by SDK option allow.op value: \"$allow_op\""));
  }

  if (!@{ $op->{points} }) {
    return (undef, $ctx->make_error('point_no_points',
      "Operation \"$op->{name}\" has no endpoint definitions."));
  }

  if (1 == @{ $op->{points} }) {
    $ctx->{point} = $op->{points}[0];
  }
  else {
    my $reqselector = ('data' eq $op->{input}) ? $ctx->{reqdata} : $ctx->{reqmatch};
    my $selector = ('data' eq $op->{input}) ? $ctx->{data} : $ctx->{match};

    my $point;
    for my $p (@{ $op->{points} }) {
      $point = $p;
      my $select_def = BluefinDecryptxP2peHelpers::to_map(BluefinDecryptxP2peHelpers::gp($p, 'select'));
      my $found = 1;

      if ($selector && $select_def) {
        my $exist = BluefinDecryptxP2peHelpers::gp($select_def, 'exist');
        if (Voxgig::Struct::islist($exist)) {
          for my $ek (@$exist) {
            my $rv = BluefinDecryptxP2peHelpers::gp($reqselector, "$ek");
            my $sv = BluefinDecryptxP2peHelpers::gp($selector, "$ek");
            if (!defined $rv && !defined $sv) {
              $found = 0;
              last;
            }
          }
        }
      }

      if ($found) {
        my $req_action = BluefinDecryptxP2peHelpers::gp($reqselector, '$action');
        my $select_action = BluefinDecryptxP2peHelpers::gp($select_def, '$action');
        $found = 0 unless BluefinDecryptxP2peHelpers::eqv($req_action, $select_action);
      }

      last if $found;
    }

    if ($reqselector) {
      my $req_action = BluefinDecryptxP2peHelpers::gp($reqselector, '$action');
      if (defined $req_action && $point) {
        my $point_select = BluefinDecryptxP2peHelpers::to_map(BluefinDecryptxP2peHelpers::gp($point, 'select'));
        my $point_action = BluefinDecryptxP2peHelpers::gp($point_select, '$action');
        unless (BluefinDecryptxP2peHelpers::eqv($req_action, $point_action)) {
          return (undef, $ctx->make_error('point_action_invalid',
            "Operation \"$op->{name}\" action \""
            . Voxgig::Struct::stringify($req_action) . "\" is not valid."));
        }
      }
    }

    $ctx->{point} = $point;
  }

  return ($ctx->{point}, undef);
};

1;

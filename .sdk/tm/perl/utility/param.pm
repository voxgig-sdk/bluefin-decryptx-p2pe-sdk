# BluefinDecryptxP2pe SDK utility: param

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

$REGISTRY{param} = sub {
  my ($ctx, $paramdef) = @_;
  my $point = $ctx->{point};
  my $spec = $ctx->{spec};
  my $match_val = $ctx->{match};
  my $reqmatch = $ctx->{reqmatch};
  my $data = $ctx->{data};
  my $reqdata = $ctx->{reqdata};

  my $pt = Voxgig::Struct::typify($paramdef);
  my $key;
  if (($pt & Voxgig::Struct::T_string()) > 0) {
    $key = $paramdef;
  }
  else {
    my $k = BluefinDecryptxP2peHelpers::gp($paramdef, 'name');
    $key = (defined $k && !ref $k) ? $k : '';
  }

  my $akey = '';
  if ($point) {
    my $alias_map = BluefinDecryptxP2peHelpers::to_map(BluefinDecryptxP2peHelpers::gp($point, 'alias'));
    if ($alias_map) {
      my $ak = BluefinDecryptxP2peHelpers::gp($alias_map, $key);
      $akey = $ak if defined $ak && !ref $ak;
    }
  }

  my $val = BluefinDecryptxP2peHelpers::gp($reqmatch, $key);
  $val = BluefinDecryptxP2peHelpers::gp($match_val, $key) if !defined $val;

  if (!defined $val && '' ne $akey) {
    $spec->{alias}{$akey} = $key if $spec;
    $val = BluefinDecryptxP2peHelpers::gp($reqmatch, $akey);
  }

  $val = BluefinDecryptxP2peHelpers::gp($reqdata, $key) if !defined $val;
  $val = BluefinDecryptxP2peHelpers::gp($data, $key) if !defined $val;

  if (!defined $val && '' ne $akey) {
    $val = BluefinDecryptxP2peHelpers::gp($reqdata, $akey);
    $val = BluefinDecryptxP2peHelpers::gp($data, $akey) if !defined $val;
  }

  return $val;
};

1;

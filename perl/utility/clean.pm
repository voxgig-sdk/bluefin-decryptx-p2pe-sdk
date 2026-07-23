# BluefinDecryptxP2pe SDK utility: clean

use strict;
use warnings;

package BluefinDecryptxP2peUtilities;

our %REGISTRY;

$REGISTRY{clean} = sub {
  my ($ctx, $val) = @_;
  return $val;
};

1;

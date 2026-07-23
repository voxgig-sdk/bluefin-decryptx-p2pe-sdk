# BluefinDecryptxP2pe SDK utility: prepare_body

use strict;
use warnings;

package BluefinDecryptxP2peUtilities;

our %REGISTRY;

$REGISTRY{prepare_body} = sub {
  my ($ctx) = @_;
  return ('data' eq $ctx->{op}{input})
    ? $ctx->{utility}{transform_request}->($ctx)
    : undef;
};

1;

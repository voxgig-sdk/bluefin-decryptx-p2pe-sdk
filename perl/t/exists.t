#!perl
# BluefinDecryptxP2pe SDK exists test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";

use BluefinDecryptxP2peSDK;

my $testsdk = BluefinDecryptxP2peSDK->test(undef, undef);
ok(defined $testsdk, 'create test sdk');

done_testing();

# BluefinDecryptxP2pe SDK feature factory

use strict;
use warnings;

use File::Basename ();
use Cwd ();

my $__dir;
BEGIN { $__dir = File::Basename::dirname(Cwd::abs_path(__FILE__)) }
require(Cwd::abs_path("$__dir/feature/base_feature.pm"));
require(Cwd::abs_path("$__dir/feature/audit_feature.pm"));
require(Cwd::abs_path("$__dir/feature/clienttrack_feature.pm"));
require(Cwd::abs_path("$__dir/feature/idempotency_feature.pm"));
require(Cwd::abs_path("$__dir/feature/log_feature.pm"));
require(Cwd::abs_path("$__dir/feature/metrics_feature.pm"));
require(Cwd::abs_path("$__dir/feature/paging_feature.pm"));
require(Cwd::abs_path("$__dir/feature/ratelimit_feature.pm"));
require(Cwd::abs_path("$__dir/feature/retry_feature.pm"));
require(Cwd::abs_path("$__dir/feature/telemetry_feature.pm"));
require(Cwd::abs_path("$__dir/feature/test_feature.pm"));
require(Cwd::abs_path("$__dir/feature/timeout_feature.pm"));

package BluefinDecryptxP2peFeatures;

sub make_feature {
  my ($name) = @_;
  $name = '' unless defined $name;
  return BluefinDecryptxP2peBaseFeature->new if 'base' eq $name;
  return BluefinDecryptxP2peAuditFeature->new if 'audit' eq $name;
  return BluefinDecryptxP2peClienttrackFeature->new if 'clienttrack' eq $name;
  return BluefinDecryptxP2peIdempotencyFeature->new if 'idempotency' eq $name;
  return BluefinDecryptxP2peLogFeature->new if 'log' eq $name;
  return BluefinDecryptxP2peMetricsFeature->new if 'metrics' eq $name;
  return BluefinDecryptxP2pePagingFeature->new if 'paging' eq $name;
  return BluefinDecryptxP2peRatelimitFeature->new if 'ratelimit' eq $name;
  return BluefinDecryptxP2peRetryFeature->new if 'retry' eq $name;
  return BluefinDecryptxP2peTelemetryFeature->new if 'telemetry' eq $name;
  return BluefinDecryptxP2peTestFeature->new if 'test' eq $name;
  return BluefinDecryptxP2peTimeoutFeature->new if 'timeout' eq $name;
  return BluefinDecryptxP2peBaseFeature->new;
}

1;

# BluefinDecryptxP2pe SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/audit_feature'
require_relative 'feature/clienttrack_feature'
require_relative 'feature/idempotency_feature'
require_relative 'feature/log_feature'
require_relative 'feature/metrics_feature'
require_relative 'feature/paging_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/telemetry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module BluefinDecryptxP2peFeatures
  def self.make_feature(name)
    case name
    when "base"
      BluefinDecryptxP2peBaseFeature.new
    when "audit"
      BluefinDecryptxP2peAuditFeature.new
    when "clienttrack"
      BluefinDecryptxP2peClienttrackFeature.new
    when "idempotency"
      BluefinDecryptxP2peIdempotencyFeature.new
    when "log"
      BluefinDecryptxP2peLogFeature.new
    when "metrics"
      BluefinDecryptxP2peMetricsFeature.new
    when "paging"
      BluefinDecryptxP2pePagingFeature.new
    when "ratelimit"
      BluefinDecryptxP2peRatelimitFeature.new
    when "retry"
      BluefinDecryptxP2peRetryFeature.new
    when "telemetry"
      BluefinDecryptxP2peTelemetryFeature.new
    when "test"
      BluefinDecryptxP2peTestFeature.new
    when "timeout"
      BluefinDecryptxP2peTimeoutFeature.new
    else
      BluefinDecryptxP2peBaseFeature.new
    end
  end
end

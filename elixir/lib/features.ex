# BluefinDecryptxP2pe SDK feature factory

defmodule BluefinDecryptxP2pe.Features do
  def make_feature(name) do
    case name do
      "audit" -> BluefinDecryptxP2pe.Feature.Audit.new()
      "clienttrack" -> BluefinDecryptxP2pe.Feature.Clienttrack.new()
      "idempotency" -> BluefinDecryptxP2pe.Feature.Idempotency.new()
      "log" -> BluefinDecryptxP2pe.Feature.Log.new()
      "metrics" -> BluefinDecryptxP2pe.Feature.Metrics.new()
      "paging" -> BluefinDecryptxP2pe.Feature.Paging.new()
      "ratelimit" -> BluefinDecryptxP2pe.Feature.Ratelimit.new()
      "retry" -> BluefinDecryptxP2pe.Feature.Retry.new()
      "telemetry" -> BluefinDecryptxP2pe.Feature.Telemetry.new()
      "test" -> BluefinDecryptxP2pe.Feature.Test.new()
      "timeout" -> BluefinDecryptxP2pe.Feature.Timeout.new()
      _ -> BluefinDecryptxP2pe.Feature.new()
    end
  end
end

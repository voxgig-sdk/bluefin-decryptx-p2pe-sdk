# BluefinDecryptxP2pe SDK feature factory

from bluefindecryptxp2pe_sdk.feature.base_feature import BluefinDecryptxP2peBaseFeature
from bluefindecryptxp2pe_sdk.feature.audit_feature import BluefinDecryptxP2peAuditFeature
from bluefindecryptxp2pe_sdk.feature.clienttrack_feature import BluefinDecryptxP2peClienttrackFeature
from bluefindecryptxp2pe_sdk.feature.idempotency_feature import BluefinDecryptxP2peIdempotencyFeature
from bluefindecryptxp2pe_sdk.feature.log_feature import BluefinDecryptxP2peLogFeature
from bluefindecryptxp2pe_sdk.feature.metrics_feature import BluefinDecryptxP2peMetricsFeature
from bluefindecryptxp2pe_sdk.feature.paging_feature import BluefinDecryptxP2pePagingFeature
from bluefindecryptxp2pe_sdk.feature.ratelimit_feature import BluefinDecryptxP2peRatelimitFeature
from bluefindecryptxp2pe_sdk.feature.retry_feature import BluefinDecryptxP2peRetryFeature
from bluefindecryptxp2pe_sdk.feature.telemetry_feature import BluefinDecryptxP2peTelemetryFeature
from bluefindecryptxp2pe_sdk.feature.test_feature import BluefinDecryptxP2peTestFeature
from bluefindecryptxp2pe_sdk.feature.timeout_feature import BluefinDecryptxP2peTimeoutFeature


_FEATURES = {
    "base": lambda: BluefinDecryptxP2peBaseFeature(),
    "audit": lambda: BluefinDecryptxP2peAuditFeature(),
    "clienttrack": lambda: BluefinDecryptxP2peClienttrackFeature(),
    "idempotency": lambda: BluefinDecryptxP2peIdempotencyFeature(),
    "log": lambda: BluefinDecryptxP2peLogFeature(),
    "metrics": lambda: BluefinDecryptxP2peMetricsFeature(),
    "paging": lambda: BluefinDecryptxP2pePagingFeature(),
    "ratelimit": lambda: BluefinDecryptxP2peRatelimitFeature(),
    "retry": lambda: BluefinDecryptxP2peRetryFeature(),
    "telemetry": lambda: BluefinDecryptxP2peTelemetryFeature(),
    "test": lambda: BluefinDecryptxP2peTestFeature(),
    "timeout": lambda: BluefinDecryptxP2peTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES

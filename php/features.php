<?php
declare(strict_types=1);

// BluefinDecryptxP2pe SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/AuditFeature.php';
require_once __DIR__ . '/feature/ClienttrackFeature.php';
require_once __DIR__ . '/feature/IdempotencyFeature.php';
require_once __DIR__ . '/feature/LogFeature.php';
require_once __DIR__ . '/feature/MetricsFeature.php';
require_once __DIR__ . '/feature/PagingFeature.php';
require_once __DIR__ . '/feature/RatelimitFeature.php';
require_once __DIR__ . '/feature/RetryFeature.php';
require_once __DIR__ . '/feature/TelemetryFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';
require_once __DIR__ . '/feature/TimeoutFeature.php';


class BluefinDecryptxP2peFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new BluefinDecryptxP2peBaseFeature();
            case "audit":
                return new BluefinDecryptxP2peAuditFeature();
            case "clienttrack":
                return new BluefinDecryptxP2peClienttrackFeature();
            case "idempotency":
                return new BluefinDecryptxP2peIdempotencyFeature();
            case "log":
                return new BluefinDecryptxP2peLogFeature();
            case "metrics":
                return new BluefinDecryptxP2peMetricsFeature();
            case "paging":
                return new BluefinDecryptxP2pePagingFeature();
            case "ratelimit":
                return new BluefinDecryptxP2peRatelimitFeature();
            case "retry":
                return new BluefinDecryptxP2peRetryFeature();
            case "telemetry":
                return new BluefinDecryptxP2peTelemetryFeature();
            case "test":
                return new BluefinDecryptxP2peTestFeature();
            case "timeout":
                return new BluefinDecryptxP2peTimeoutFeature();
            default:
                return new BluefinDecryptxP2peBaseFeature();
        }
    }

    /**
     * Does a generated feature class back this name? False for a name only
     * an options extend instance can supply (the station adopt path) - the
     * constructor uses this to skip make_feature for such names instead of
     * adding a stray BaseFeature.
     */
    public static function has_feature(string $name): bool
    {
        switch ($name) {
            case "base":
            case "audit":
            case "clienttrack":
            case "idempotency":
            case "log":
            case "metrics":
            case "paging":
            case "ratelimit":
            case "retry":
            case "telemetry":
            case "test":
            case "timeout":
                return true;
            default:
                return false;
        }
    }
}

<?php
declare(strict_types=1);

// Decryption entity test

require_once __DIR__ . '/../bluefindecryptxp2pe_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class DecryptionEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = BluefinDecryptxP2peSDK::test(null, null);
        $ent = $testsdk->Decryption(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = decryption_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["create"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "decryption." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_DECRYPTION_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // CREATE
        $decryption_ref01_ent = $client->Decryption(null);
        $decryption_ref01_data = Helpers::to_map(Vs::getprop(
            Vs::getpath($setup["data"], "new.decryption"), "decryption_ref01"));

        $decryption_ref01_data_result = $decryption_ref01_ent->create($decryption_ref01_data, null);
        $decryption_ref01_data = Helpers::to_map($decryption_ref01_data_result);
        $this->assertNotNull($decryption_ref01_data);

    }
}

function decryption_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/decryption/DecryptionTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = BluefinDecryptxP2peSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["decryption01", "decryption02", "decryption03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("BLUEFINDECRYPTXP_PE_TEST_DECRYPTION_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "BLUEFINDECRYPTXP_PE_TEST_DECRYPTION_ENTID" => $idmap,
        "BLUEFINDECRYPTXP_PE_TEST_LIVE" => "FALSE",
        "BLUEFINDECRYPTXP_PE_TEST_EXPLAIN" => "FALSE",
        "BLUEFINDECRYPTXP_PE_APIKEY" => "NONE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["BLUEFINDECRYPTXP_PE_TEST_DECRYPTION_ENTID"]);
    if ($idmap_resolved === null) {
        $idmap_resolved = Helpers::to_map($idmap);
    }

    if ($env["BLUEFINDECRYPTXP_PE_TEST_LIVE"] === "TRUE") {
        $merged_opts = Vs::merge([
            [
                "apikey" => $env["BLUEFINDECRYPTXP_PE_APIKEY"],
            ],
            $extra ?? [],
        ]);
        $client = new BluefinDecryptxP2peSDK(Helpers::to_map($merged_opts));
    }

    $live = $env["BLUEFINDECRYPTXP_PE_TEST_LIVE"] === "TRUE";
    return [
        "client" => $client,
        "data" => $entity_data,
        "idmap" => $idmap_resolved,
        "env" => $env,
        "explain" => $env["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"] === "TRUE",
        "live" => $live,
        "synthetic_only" => $live && !$idmap_overridden,
        "now" => (int)(microtime(true) * 1000),
    ];
}

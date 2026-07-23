<?php
declare(strict_types=1);

// Attestation entity test

require_once __DIR__ . '/../bluefindecryptxp2pe_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class AttestationEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = BluefinDecryptxP2peSDK::test(null, null);
        $ent = $testsdk->Attestation(null);
        $this->assertNotNull($ent);
    }

    // Feature #4: the entity stream(action, ...) method runs the op pipeline
    // and yields result items. With the streaming feature active it yields the
    // feature's incremental output; otherwise it falls back to the materialised
    // list so stream always yields.
    public function test_stream(): void
    {
        $seed = [
            "entity" => [
                "attestation" => [
                    "s1" => ["id" => "s1"],
                    "s2" => ["id" => "s2"],
                    "s3" => ["id" => "s3"],
                ],
            ],
        ];

        // Fallback: streaming inactive -> yields the materialised list items.
        $base = BluefinDecryptxP2peSDK::test($seed, null);
        $seen = iterator_to_array($base->Attestation(null)->stream("list", null, null), false);
        $this->assertCount(3, $seen);

        // Inbound: streaming active -> yields each item from the feature.
        $cfg = BluefinDecryptxP2peConfig::make_config();
        if (isset($cfg["feature"]) && is_array($cfg["feature"]) && isset($cfg["feature"]["streaming"])) {
            $sdk = BluefinDecryptxP2peSDK::test($seed, ["feature" => ["streaming" => ["active" => true]]]);
            $got = [];
            foreach ($sdk->Attestation(null)->stream("list", null, null) as $item) {
                if (is_array($item) && array_is_list($item)) {
                    foreach ($item as $sub) {
                        $got[] = $sub;
                    }
                } else {
                    $got[] = $item;
                }
            }
            $this->assertCount(3, $got);
        }
    }

    public function test_basic_flow(): void
    {
        $setup = attestation_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["create", "list", "load"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "attestation." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_ATTESTATION_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // CREATE
        $attestation_ref01_ent = $client->Attestation(null);
        $attestation_ref01_data = Helpers::to_map(Vs::getprop(
            Vs::getpath($setup["data"], "new.attestation"), "attestation_ref01"));

        $attestation_ref01_data_result = $attestation_ref01_ent->create($attestation_ref01_data, null);
        $attestation_ref01_data = Helpers::to_map($attestation_ref01_data_result);
        $this->assertNotNull($attestation_ref01_data);
        $this->assertNotNull($attestation_ref01_data["id"]);

        // LIST
        $attestation_ref01_match = [];

        $attestation_ref01_list_result = $attestation_ref01_ent->list($attestation_ref01_match, null);
        $this->assertIsArray($attestation_ref01_list_result);

        $found_item = sdk_select(
            Runner::entity_list_to_data($attestation_ref01_list_result),
            ["id" => $attestation_ref01_data["id"]]);
        $this->assertNotEmpty($found_item);

        // LOAD
        $attestation_ref01_match_dt0 = [
            "id" => $attestation_ref01_data["id"],
        ];
        $attestation_ref01_data_dt0_loaded = $attestation_ref01_ent->load($attestation_ref01_match_dt0, null);
        $attestation_ref01_data_dt0_load_result = Helpers::to_map($attestation_ref01_data_dt0_loaded);
        $this->assertNotNull($attestation_ref01_data_dt0_load_result);
        $this->assertEquals($attestation_ref01_data_dt0_load_result["id"], $attestation_ref01_data["id"]);

    }
}

function attestation_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/attestation/AttestationTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = BluefinDecryptxP2peSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["attestation01", "attestation02", "attestation03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("BLUEFINDECRYPTXP_PE_TEST_ATTESTATION_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "BLUEFINDECRYPTXP_PE_TEST_ATTESTATION_ENTID" => $idmap,
        "BLUEFINDECRYPTXP_PE_TEST_LIVE" => "FALSE",
        "BLUEFINDECRYPTXP_PE_TEST_EXPLAIN" => "FALSE",
        "BLUEFINDECRYPTXP_PE_APIKEY" => "NONE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["BLUEFINDECRYPTXP_PE_TEST_ATTESTATION_ENTID"]);
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

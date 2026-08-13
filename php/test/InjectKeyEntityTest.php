<?php
declare(strict_types=1);

// InjectKey entity test

require_once __DIR__ . '/../bluefindecryptxp2pe_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class InjectKeyEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = BluefinDecryptxP2peSDK::test(null, null);
        $ent = $testsdk->InjectKey(null);
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
                "inject_key" => [
                    "s1" => ["id" => "s1"],
                    "s2" => ["id" => "s2"],
                    "s3" => ["id" => "s3"],
                ],
            ],
        ];

        // Fallback: streaming inactive -> yields the materialised list items.
        $base = BluefinDecryptxP2peSDK::test($seed, null);
        $seen = iterator_to_array($base->InjectKey(null)->stream("list", null, null), false);
        $this->assertCount(3, $seen);

        // Inbound: streaming active -> yields each item from the feature.
        $cfg = BluefinDecryptxP2peConfig::make_config();
        if (isset($cfg["feature"]) && is_array($cfg["feature"]) && isset($cfg["feature"]["streaming"])) {
            $sdk = BluefinDecryptxP2peSDK::test($seed, ["feature" => ["streaming" => ["active" => true]]]);
            $got = [];
            foreach ($sdk->InjectKey(null)->stream("list", null, null) as $item) {
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
        $setup = inject_key_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["list", "load"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "inject_key." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set BLUEFIN_DECRYPTX_P2PE_TEST_INJECT_KEY_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // Bootstrap entity data from existing test data.
        $inject_key_ref01_data_raw = Vs::items(Helpers::to_map(
            Vs::getpath($setup["data"], "existing.inject_key")));
        $inject_key_ref01_data = null;
        if (count($inject_key_ref01_data_raw) > 0) {
            $inject_key_ref01_data = Helpers::to_map($inject_key_ref01_data_raw[0][1]);
        }

        // LIST
        $inject_key_ref01_ent = $client->InjectKey(null);
        $inject_key_ref01_match = [];

        $inject_key_ref01_list_result = $inject_key_ref01_ent->list($inject_key_ref01_match, null);
        $this->assertIsArray($inject_key_ref01_list_result);

        // LOAD
        $inject_key_ref01_match_dt0 = [
            "id" => $inject_key_ref01_data["id"],
        ];
        $inject_key_ref01_data_dt0_loaded = $inject_key_ref01_ent->load($inject_key_ref01_match_dt0, null);
        $inject_key_ref01_data_dt0_load_result = Helpers::to_map(is_object($inject_key_ref01_data_dt0_loaded) && method_exists($inject_key_ref01_data_dt0_loaded, 'data_get') ? $inject_key_ref01_data_dt0_loaded->data_get() : $inject_key_ref01_data_dt0_loaded);
        $this->assertNotNull($inject_key_ref01_data_dt0_load_result);
        $this->assertEquals($inject_key_ref01_data_dt0_load_result["id"], $inject_key_ref01_data["id"]);

    }
}

function inject_key_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/inject_key/InjectKeyTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = BluefinDecryptxP2peSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["inject_key01", "inject_key02", "inject_key03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("BLUEFIN_DECRYPTX_P2PE_TEST_INJECT_KEY_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "BLUEFIN_DECRYPTX_P2PE_TEST_INJECT_KEY_ENTID" => $idmap,
        "BLUEFIN_DECRYPTX_P2PE_TEST_LIVE" => "FALSE",
        "BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN" => "FALSE",
        "BLUEFIN_DECRYPTX_P2PE_APIKEY" => "NONE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["BLUEFIN_DECRYPTX_P2PE_TEST_INJECT_KEY_ENTID"]);
    if ($idmap_resolved === null) {
        $idmap_resolved = Helpers::to_map($idmap);
    }

    if ($env["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"] === "TRUE") {
        $merged_opts = Vs::merge([
            [
                "apikey" => $env["BLUEFIN_DECRYPTX_P2PE_APIKEY"],
            ],
            $extra ?? [],
        ]);
        $client = new BluefinDecryptxP2peSDK(Helpers::to_map($merged_opts));
    }

    $live = $env["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"] === "TRUE";
    return [
        "client" => $client,
        "data" => $entity_data,
        "idmap" => $idmap_resolved,
        "env" => $env,
        "explain" => $env["BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN"] === "TRUE",
        "live" => $live,
        "synthetic_only" => $live && !$idmap_overridden,
        "now" => (int)(microtime(true) * 1000),
    ];
}

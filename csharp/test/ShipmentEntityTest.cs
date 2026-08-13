// shipment entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinDecryptxP2peSdk.Test;

public class ShipmentEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinDecryptxP2peSDK.TestSDK(null, null);
        var ent = testsdk.Shipment();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = ShipmentBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "create", "list", "load" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "shipment." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFIN_DECRYPTX_P2PE_TEST_SHIPMENT_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // CREATE
        var shipmentRef01Ent = client.Shipment();
        var shipmentRef01Data = Helpers.ToMapAny(StructUtils.GetProp(
            StructUtils.GetPath(setup.Data, StructUtils.Jt("new", "shipment")),
            "shipment_ref01"));

        var shipmentRef01DataResult = shipmentRef01Ent.Create(shipmentRef01Data, null);
        shipmentRef01Data = Helpers.ToMapAny(shipmentRef01DataResult is IEntity ce ? ce.Data() : shipmentRef01DataResult);
        Assert.True(shipmentRef01Data != null, "expected create result to be a map");
        Assert.True(shipmentRef01Data!["id"] != null, "expected created entity to have an id");

        // LIST
        var shipmentRef01Match = new Dictionary<string, object?>();

        var shipmentRef01ListResult = shipmentRef01Ent.List(shipmentRef01Match, null);
        var shipmentRef01List = shipmentRef01ListResult as List<object?>;
        Assert.True(shipmentRef01List != null,
            $"expected list result to be a list, got {shipmentRef01ListResult?.GetType()}");

        var shipmentRef01ListFound = StructUtils.Select(
            TestRunner.EntityListToData(shipmentRef01List!),
            new Dictionary<string, object?> { ["id"] = shipmentRef01Data!["id"] });
        Assert.False(StructUtils.IsEmpty(shipmentRef01ListFound),
            "expected to find created entity in list");

        // LOAD
        var shipmentRef01MatchDt0 = new Dictionary<string, object?>
        {
            ["id"] = shipmentRef01Data!["id"],
        };
        var shipmentRef01DataDt0Loaded = shipmentRef01Ent.Load(shipmentRef01MatchDt0, null);
        var shipmentRef01DataDt0LoadResult = Helpers.ToMapAny(shipmentRef01DataDt0Loaded is IEntity le ? le.Data() : shipmentRef01DataDt0Loaded);
        Assert.True(shipmentRef01DataDt0LoadResult != null, "expected load result to be a map");
        Assert.True(StructRunner.DeepEqual(shipmentRef01DataDt0LoadResult!["id"], shipmentRef01Data["id"]),
            "expected load result id to match");

    }

    [Fact]
    public async Task Stream()
    {
        var setup = ShipmentBasicSetup(new Dictionary<string, object?>
        {
            ["feature"] = new Dictionary<string, object?>
            {
                ["streaming"] = new Dictionary<string, object?> { ["active"] = true },
            },
        });
        if (setup.Live)
        {
            return; // unit mode only - streams the seeded fixture data
        }

        var ent = setup.Client.Shipment();
        var match = new Dictionary<string, object?>();

        // Materialised list result for the same op.
        var listed = ent.List(match, null) as List<object?> ?? new List<object?>();

        // stream("list") yields items via the streaming feature's iterator.
        var streamed = new List<object?>();
        await foreach (var item in ent.Stream("list", match, null))
        {
            streamed.Add(item);
        }
        Assert.True(streamed.Count > 0, "expected stream to yield items");
        Assert.Equal(listed.Count, streamed.Count);

        // Fallback: with streaming inactive, stream still yields the
        // materialised items.
        var setup2 = ShipmentBasicSetup(null);
        var ent2 = setup2.Client.Shipment();
        var streamed2 = new List<object?>();
        await foreach (var item in ent2.Stream("list", match, null))
        {
            streamed2.Add(item);
        }
        Assert.Equal(listed.Count, streamed2.Count);
    }

    private static EntityTestSetup ShipmentBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "shipment",
            "ShipmentTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse shipment test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinDecryptxP2peSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "shipment01", "shipment02", "shipment03" },
            new Dictionary<string, object?>
            {
                ["`$PACK`"] = new List<object?>
                {
                    "",
                    new Dictionary<string, object?>
                    {
                        ["`$KEY`"] = "`$COPY`",
                        ["`$VAL`"] = new List<object?> { "`$FORMAT`", "upper", "`$COPY`" },
                    },
                },
            });

        // Detect ENTID env override before EnvOverride consumes it. When
        // live mode is on without a real override, the basic test runs
        // against synthetic IDs from the fixture and 4xx's.
        var entidEnvRaw = Environment.GetEnvironmentVariable(
            "BLUEFIN_DECRYPTX_P2PE_TEST_SHIPMENT_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFIN_DECRYPTX_P2PE_TEST_SHIPMENT_ENTID"] = idmap,
            ["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"] = "FALSE",
            ["BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFIN_DECRYPTX_P2PE_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFIN_DECRYPTX_P2PE_TEST_SHIPMENT_ENTID"])
            ?? Helpers.ToMapAny(idmap)
            ?? new Dictionary<string, object?>();

        if (Equals(env["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"], "TRUE"))
        {
            var mergedOpts = StructUtils.Merge(new List<object?>
            {
                new Dictionary<string, object?>
                {
                    ["apikey"] = env["BLUEFIN_DECRYPTX_P2PE_APIKEY"],
                },
                extra,
            });
            client = new BluefinDecryptxP2peSDK(Helpers.ToMapAny(mergedOpts));
        }

        var live = Equals(env["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"], "TRUE");
        return new EntityTestSetup
        {
            Client = client,
            Data = entityData,
            Idmap = idmapResolved,
            Env = env,
            Explain = Equals(env["BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN"], "TRUE"),
            Live = live,
            SyntheticOnly = live && !idmapOverridden,
            Now = DateTimeOffset.UtcNow.ToUnixTimeMilliseconds(),
        };
    }
}

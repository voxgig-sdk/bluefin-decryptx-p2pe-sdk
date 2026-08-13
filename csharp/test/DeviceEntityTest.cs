// device entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinDecryptxP2peSdk.Test;

public class DeviceEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinDecryptxP2peSDK.TestSDK(null, null);
        var ent = testsdk.Device();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = DeviceBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "create", "list", "load" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "device." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // CREATE
        var deviceRef01Ent = client.Device();
        var deviceRef01Data = Helpers.ToMapAny(StructUtils.GetProp(
            StructUtils.GetPath(setup.Data, StructUtils.Jt("new", "device")),
            "device_ref01"));
        deviceRef01Data!["serial_number"] = setup.Idmap["serial_number01"];

        var deviceRef01DataResult = deviceRef01Ent.Create(deviceRef01Data, null);
        deviceRef01Data = Helpers.ToMapAny(deviceRef01DataResult is IEntity ce ? ce.Data() : deviceRef01DataResult);
        Assert.True(deviceRef01Data != null, "expected create result to be a map");
        Assert.True(deviceRef01Data!["id"] != null, "expected created entity to have an id");

        // LIST
        var deviceRef01Match = new Dictionary<string, object?>();

        var deviceRef01ListResult = deviceRef01Ent.List(deviceRef01Match, null);
        var deviceRef01List = deviceRef01ListResult as List<object?>;
        Assert.True(deviceRef01List != null,
            $"expected list result to be a list, got {deviceRef01ListResult?.GetType()}");

        var deviceRef01ListFound = StructUtils.Select(
            TestRunner.EntityListToData(deviceRef01List!),
            new Dictionary<string, object?> { ["id"] = deviceRef01Data!["id"] });
        Assert.False(StructUtils.IsEmpty(deviceRef01ListFound),
            "expected to find created entity in list");

        // LOAD
        var deviceRef01MatchDt0 = new Dictionary<string, object?>
        {
            ["id"] = deviceRef01Data!["id"],
        };
        var deviceRef01DataDt0Loaded = deviceRef01Ent.Load(deviceRef01MatchDt0, null);
        var deviceRef01DataDt0LoadResult = Helpers.ToMapAny(deviceRef01DataDt0Loaded is IEntity le ? le.Data() : deviceRef01DataDt0Loaded);
        Assert.True(deviceRef01DataDt0LoadResult != null, "expected load result to be a map");
        Assert.True(StructRunner.DeepEqual(deviceRef01DataDt0LoadResult!["id"], deviceRef01Data["id"]),
            "expected load result id to match");

    }

    [Fact]
    public async Task Stream()
    {
        var setup = DeviceBasicSetup(new Dictionary<string, object?>
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

        var ent = setup.Client.Device();
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
        var setup2 = DeviceBasicSetup(null);
        var ent2 = setup2.Client.Device();
        var streamed2 = new List<object?>();
        await foreach (var item in ent2.Stream("list", match, null))
        {
            streamed2.Add(item);
        }
        Assert.Equal(listed.Count, streamed2.Count);
    }

    private static EntityTestSetup DeviceBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "device",
            "DeviceTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse device test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinDecryptxP2peSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "device01", "device02", "device03", "serial_number01" },
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
            "BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_ENTID"] = idmap,
            ["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"] = "FALSE",
            ["BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFIN_DECRYPTX_P2PE_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_ENTID"])
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

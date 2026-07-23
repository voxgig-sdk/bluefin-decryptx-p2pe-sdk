// device_build entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinDecryptxP2peSdk.Test;

public class DeviceBuildEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinDecryptxP2peSDK.TestSDK(null, null);
        var ent = testsdk.DeviceBuild();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = DeviceBuildBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "list", "load" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "device_build." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFINDECRYPTXP_PE_TEST_DEVICE_BUILD_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // Bootstrap entity data from existing test data (no create step in flow).
        var deviceBuildRef01DataRaw = StructUtils.Items(
            Helpers.ToMapAny(StructUtils.GetPath(setup.Data, "existing.device_build")));
        var deviceBuildRef01Data = deviceBuildRef01DataRaw.Count > 0
            ? Helpers.ToMapAny(deviceBuildRef01DataRaw[0][1])
            : null;

        // LIST
        var deviceBuildRef01Ent = client.DeviceBuild();
        var deviceBuildRef01Match = new Dictionary<string, object?>();

        var deviceBuildRef01ListResult = deviceBuildRef01Ent.List(deviceBuildRef01Match, null);
        var deviceBuildRef01List = deviceBuildRef01ListResult as List<object?>;
        Assert.True(deviceBuildRef01List != null,
            $"expected list result to be a list, got {deviceBuildRef01ListResult?.GetType()}");

        // LOAD
        var deviceBuildRef01MatchDt0 = new Dictionary<string, object?>
        {
            ["id"] = deviceBuildRef01Data!["id"],
        };
        var deviceBuildRef01DataDt0Loaded = deviceBuildRef01Ent.Load(deviceBuildRef01MatchDt0, null);
        var deviceBuildRef01DataDt0LoadResult = Helpers.ToMapAny(deviceBuildRef01DataDt0Loaded);
        Assert.True(deviceBuildRef01DataDt0LoadResult != null, "expected load result to be a map");
        Assert.True(StructRunner.DeepEqual(deviceBuildRef01DataDt0LoadResult!["id"], deviceBuildRef01Data["id"]),
            "expected load result id to match");

    }

    [Fact]
    public async Task Stream()
    {
        var setup = DeviceBuildBasicSetup(new Dictionary<string, object?>
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

        var ent = setup.Client.DeviceBuild();
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
        var setup2 = DeviceBuildBasicSetup(null);
        var ent2 = setup2.Client.DeviceBuild();
        var streamed2 = new List<object?>();
        await foreach (var item in ent2.Stream("list", match, null))
        {
            streamed2.Add(item);
        }
        Assert.Equal(listed.Count, streamed2.Count);
    }

    private static EntityTestSetup DeviceBuildBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "device_build",
            "DeviceBuildTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse device_build test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinDecryptxP2peSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "device_build01", "device_build02", "device_build03" },
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
            "BLUEFINDECRYPTXP_PE_TEST_DEVICE_BUILD_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFINDECRYPTXP_PE_TEST_DEVICE_BUILD_ENTID"] = idmap,
            ["BLUEFINDECRYPTXP_PE_TEST_LIVE"] = "FALSE",
            ["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFINDECRYPTXP_PE_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFINDECRYPTXP_PE_TEST_DEVICE_BUILD_ENTID"])
            ?? Helpers.ToMapAny(idmap)
            ?? new Dictionary<string, object?>();

        if (Equals(env["BLUEFINDECRYPTXP_PE_TEST_LIVE"], "TRUE"))
        {
            var mergedOpts = StructUtils.Merge(new List<object?>
            {
                new Dictionary<string, object?>
                {
                    ["apikey"] = env["BLUEFINDECRYPTXP_PE_APIKEY"],
                },
                extra,
            });
            client = new BluefinDecryptxP2peSDK(Helpers.ToMapAny(mergedOpts));
        }

        var live = Equals(env["BLUEFINDECRYPTXP_PE_TEST_LIVE"], "TRUE");
        return new EntityTestSetup
        {
            Client = client,
            Data = entityData,
            Idmap = idmapResolved,
            Env = env,
            Explain = Equals(env["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"], "TRUE"),
            Live = live,
            SyntheticOnly = live && !idmapOverridden,
            Now = DateTimeOffset.UtcNow.ToUnixTimeMilliseconds(),
        };
    }
}

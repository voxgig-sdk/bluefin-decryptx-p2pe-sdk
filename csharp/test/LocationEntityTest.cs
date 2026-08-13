// location entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinDecryptxP2peSdk.Test;

public class LocationEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinDecryptxP2peSDK.TestSDK(null, null);
        var ent = testsdk.Location();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = LocationBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "create", "list", "load", "remove" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "location." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFIN_DECRYPTX_P2PE_TEST_LOCATION_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // CREATE
        var locationRef01Ent = client.Location();
        var locationRef01Data = Helpers.ToMapAny(StructUtils.GetProp(
            StructUtils.GetPath(setup.Data, StructUtils.Jt("new", "location")),
            "location_ref01"));

        var locationRef01DataResult = locationRef01Ent.Create(locationRef01Data, null);
        locationRef01Data = Helpers.ToMapAny(locationRef01DataResult is IEntity ce ? ce.Data() : locationRef01DataResult);
        Assert.True(locationRef01Data != null, "expected create result to be a map");
        Assert.True(locationRef01Data!["id"] != null, "expected created entity to have an id");

        // LIST
        var locationRef01Match = new Dictionary<string, object?>();

        var locationRef01ListResult = locationRef01Ent.List(locationRef01Match, null);
        var locationRef01List = locationRef01ListResult as List<object?>;
        Assert.True(locationRef01List != null,
            $"expected list result to be a list, got {locationRef01ListResult?.GetType()}");

        var locationRef01ListFound = StructUtils.Select(
            TestRunner.EntityListToData(locationRef01List!),
            new Dictionary<string, object?> { ["id"] = locationRef01Data!["id"] });
        Assert.False(StructUtils.IsEmpty(locationRef01ListFound),
            "expected to find created entity in list");

        // LOAD
        var locationRef01MatchDt0 = new Dictionary<string, object?>
        {
            ["id"] = locationRef01Data!["id"],
        };
        var locationRef01DataDt0Loaded = locationRef01Ent.Load(locationRef01MatchDt0, null);
        var locationRef01DataDt0LoadResult = Helpers.ToMapAny(locationRef01DataDt0Loaded is IEntity le ? le.Data() : locationRef01DataDt0Loaded);
        Assert.True(locationRef01DataDt0LoadResult != null, "expected load result to be a map");
        Assert.True(StructRunner.DeepEqual(locationRef01DataDt0LoadResult!["id"], locationRef01Data["id"]),
            "expected load result id to match");

        // REMOVE
        var locationRef01MatchRm0 = new Dictionary<string, object?>
        {
            ["id"] = locationRef01Data!["id"],
        };
        locationRef01Ent.Remove(locationRef01MatchRm0, null);

        // LIST
        var locationRef01MatchRt0 = new Dictionary<string, object?>();

        var locationRef01ListRt0Result = locationRef01Ent.List(locationRef01MatchRt0, null);
        var locationRef01ListRt0 = locationRef01ListRt0Result as List<object?>;
        Assert.True(locationRef01ListRt0 != null,
            $"expected list result to be a list, got {locationRef01ListRt0Result?.GetType()}");

        var locationRef01ListRt0NotFound = StructUtils.Select(
            TestRunner.EntityListToData(locationRef01ListRt0!),
            new Dictionary<string, object?> { ["id"] = locationRef01Data!["id"] });
        Assert.True(StructUtils.IsEmpty(locationRef01ListRt0NotFound),
            "expected removed entity to not be in list");

    }

    [Fact]
    public async Task Stream()
    {
        var setup = LocationBasicSetup(new Dictionary<string, object?>
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

        var ent = setup.Client.Location();
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
        var setup2 = LocationBasicSetup(null);
        var ent2 = setup2.Client.Location();
        var streamed2 = new List<object?>();
        await foreach (var item in ent2.Stream("list", match, null))
        {
            streamed2.Add(item);
        }
        Assert.Equal(listed.Count, streamed2.Count);
    }

    private static EntityTestSetup LocationBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "location",
            "LocationTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse location test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinDecryptxP2peSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "location01", "location02", "location03" },
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
            "BLUEFIN_DECRYPTX_P2PE_TEST_LOCATION_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFIN_DECRYPTX_P2PE_TEST_LOCATION_ENTID"] = idmap,
            ["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"] = "FALSE",
            ["BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFIN_DECRYPTX_P2PE_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFIN_DECRYPTX_P2PE_TEST_LOCATION_ENTID"])
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

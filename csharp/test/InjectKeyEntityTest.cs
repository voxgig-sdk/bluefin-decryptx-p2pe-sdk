// inject_key entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinDecryptxP2peSdk.Test;

public class InjectKeyEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinDecryptxP2peSDK.TestSDK(null, null);
        var ent = testsdk.InjectKey();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = InjectKeyBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "list", "load" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "inject_key." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFINDECRYPTXP_PE_TEST_INJECT_KEY_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // Bootstrap entity data from existing test data (no create step in flow).
        var injectKeyRef01DataRaw = StructUtils.Items(
            Helpers.ToMapAny(StructUtils.GetPath(setup.Data, "existing.inject_key")));
        var injectKeyRef01Data = injectKeyRef01DataRaw.Count > 0
            ? Helpers.ToMapAny(injectKeyRef01DataRaw[0][1])
            : null;

        // LIST
        var injectKeyRef01Ent = client.InjectKey();
        var injectKeyRef01Match = new Dictionary<string, object?>();

        var injectKeyRef01ListResult = injectKeyRef01Ent.List(injectKeyRef01Match, null);
        var injectKeyRef01List = injectKeyRef01ListResult as List<object?>;
        Assert.True(injectKeyRef01List != null,
            $"expected list result to be a list, got {injectKeyRef01ListResult?.GetType()}");

        // LOAD
        var injectKeyRef01MatchDt0 = new Dictionary<string, object?>
        {
            ["id"] = injectKeyRef01Data!["id"],
        };
        var injectKeyRef01DataDt0Loaded = injectKeyRef01Ent.Load(injectKeyRef01MatchDt0, null);
        var injectKeyRef01DataDt0LoadResult = Helpers.ToMapAny(injectKeyRef01DataDt0Loaded);
        Assert.True(injectKeyRef01DataDt0LoadResult != null, "expected load result to be a map");
        Assert.True(StructRunner.DeepEqual(injectKeyRef01DataDt0LoadResult!["id"], injectKeyRef01Data["id"]),
            "expected load result id to match");

    }

    [Fact]
    public async Task Stream()
    {
        var setup = InjectKeyBasicSetup(new Dictionary<string, object?>
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

        var ent = setup.Client.InjectKey();
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
        var setup2 = InjectKeyBasicSetup(null);
        var ent2 = setup2.Client.InjectKey();
        var streamed2 = new List<object?>();
        await foreach (var item in ent2.Stream("list", match, null))
        {
            streamed2.Add(item);
        }
        Assert.Equal(listed.Count, streamed2.Count);
    }

    private static EntityTestSetup InjectKeyBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "inject_key",
            "InjectKeyTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse inject_key test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinDecryptxP2peSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "inject_key01", "inject_key02", "inject_key03" },
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
            "BLUEFINDECRYPTXP_PE_TEST_INJECT_KEY_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFINDECRYPTXP_PE_TEST_INJECT_KEY_ENTID"] = idmap,
            ["BLUEFINDECRYPTXP_PE_TEST_LIVE"] = "FALSE",
            ["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFINDECRYPTXP_PE_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFINDECRYPTXP_PE_TEST_INJECT_KEY_ENTID"])
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

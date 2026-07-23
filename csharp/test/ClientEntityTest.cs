// client entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinDecryptxP2peSdk.Test;

public class ClientEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinDecryptxP2peSDK.TestSDK(null, null);
        var ent = testsdk.Client();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = ClientBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "create", "list", "load", "remove" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "client." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFINDECRYPTXP_PE_TEST_CLIENT_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // CREATE
        var clientRef01Ent = client.Client();
        var clientRef01Data = Helpers.ToMapAny(StructUtils.GetProp(
            StructUtils.GetPath(setup.Data, StructUtils.Jt("new", "client")),
            "client_ref01"));

        var clientRef01DataResult = clientRef01Ent.Create(clientRef01Data, null);
        clientRef01Data = Helpers.ToMapAny(clientRef01DataResult);
        Assert.True(clientRef01Data != null, "expected create result to be a map");
        Assert.True(clientRef01Data!["id"] != null, "expected created entity to have an id");

        // LIST
        var clientRef01Match = new Dictionary<string, object?>();

        var clientRef01ListResult = clientRef01Ent.List(clientRef01Match, null);
        var clientRef01List = clientRef01ListResult as List<object?>;
        Assert.True(clientRef01List != null,
            $"expected list result to be a list, got {clientRef01ListResult?.GetType()}");

        var clientRef01ListFound = StructUtils.Select(
            TestRunner.EntityListToData(clientRef01List!),
            new Dictionary<string, object?> { ["id"] = clientRef01Data!["id"] });
        Assert.False(StructUtils.IsEmpty(clientRef01ListFound),
            "expected to find created entity in list");

        // LOAD
        var clientRef01MatchDt0 = new Dictionary<string, object?>
        {
            ["id"] = clientRef01Data!["id"],
        };
        var clientRef01DataDt0Loaded = clientRef01Ent.Load(clientRef01MatchDt0, null);
        var clientRef01DataDt0LoadResult = Helpers.ToMapAny(clientRef01DataDt0Loaded);
        Assert.True(clientRef01DataDt0LoadResult != null, "expected load result to be a map");
        Assert.True(StructRunner.DeepEqual(clientRef01DataDt0LoadResult!["id"], clientRef01Data["id"]),
            "expected load result id to match");

        // REMOVE
        var clientRef01MatchRm0 = new Dictionary<string, object?>
        {
            ["id"] = clientRef01Data!["id"],
        };
        clientRef01Ent.Remove(clientRef01MatchRm0, null);

        // LIST
        var clientRef01MatchRt0 = new Dictionary<string, object?>();

        var clientRef01ListRt0Result = clientRef01Ent.List(clientRef01MatchRt0, null);
        var clientRef01ListRt0 = clientRef01ListRt0Result as List<object?>;
        Assert.True(clientRef01ListRt0 != null,
            $"expected list result to be a list, got {clientRef01ListRt0Result?.GetType()}");

        var clientRef01ListRt0NotFound = StructUtils.Select(
            TestRunner.EntityListToData(clientRef01ListRt0!),
            new Dictionary<string, object?> { ["id"] = clientRef01Data!["id"] });
        Assert.True(StructUtils.IsEmpty(clientRef01ListRt0NotFound),
            "expected removed entity to not be in list");

    }

    [Fact]
    public async Task Stream()
    {
        var setup = ClientBasicSetup(new Dictionary<string, object?>
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

        var ent = setup.Client.Client();
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
        var setup2 = ClientBasicSetup(null);
        var ent2 = setup2.Client.Client();
        var streamed2 = new List<object?>();
        await foreach (var item in ent2.Stream("list", match, null))
        {
            streamed2.Add(item);
        }
        Assert.Equal(listed.Count, streamed2.Count);
    }

    private static EntityTestSetup ClientBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "client",
            "ClientTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse client test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinDecryptxP2peSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "client01", "client02", "client03" },
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
            "BLUEFINDECRYPTXP_PE_TEST_CLIENT_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFINDECRYPTXP_PE_TEST_CLIENT_ENTID"] = idmap,
            ["BLUEFINDECRYPTXP_PE_TEST_LIVE"] = "FALSE",
            ["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFINDECRYPTXP_PE_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFINDECRYPTXP_PE_TEST_CLIENT_ENTID"])
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

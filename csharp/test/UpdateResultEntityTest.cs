// update_result entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinDecryptxP2peSdk.Test;

public class UpdateResultEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinDecryptxP2peSDK.TestSDK(null, null);
        var ent = testsdk.UpdateResult();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = UpdateResultBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "create", "list", "update" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "update_result." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFINDECRYPTXP_PE_TEST_UPDATE_RESULT_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // CREATE
        var updateResultRef01Ent = client.UpdateResult();
        var updateResultRef01Data = Helpers.ToMapAny(StructUtils.GetProp(
            StructUtils.GetPath(setup.Data, StructUtils.Jt("new", "update_result")),
            "update_result_ref01"));

        var updateResultRef01DataResult = updateResultRef01Ent.Create(updateResultRef01Data, null);
        updateResultRef01Data = Helpers.ToMapAny(updateResultRef01DataResult);
        Assert.True(updateResultRef01Data != null, "expected create result to be a map");
        Assert.True(updateResultRef01Data!["id"] != null, "expected created entity to have an id");

        // LIST
        var updateResultRef01Match = new Dictionary<string, object?>();

        var updateResultRef01ListResult = updateResultRef01Ent.List(updateResultRef01Match, null);
        var updateResultRef01List = updateResultRef01ListResult as List<object?>;
        Assert.True(updateResultRef01List != null,
            $"expected list result to be a list, got {updateResultRef01ListResult?.GetType()}");

        var updateResultRef01ListFound = StructUtils.Select(
            TestRunner.EntityListToData(updateResultRef01List!),
            new Dictionary<string, object?> { ["id"] = updateResultRef01Data!["id"] });
        Assert.False(StructUtils.IsEmpty(updateResultRef01ListFound),
            "expected to find created entity in list");

        // UPDATE
        var updateResultRef01DataUp0Up = new Dictionary<string, object?>
        {
            ["id"] = updateResultRef01Data!["id"],
        };

        var updateResultRef01MarkdefUp0Name = "email";
        var updateResultRef01MarkdefUp0Value = $"Mark01-update_result_ref01_{setup.Now}";
        updateResultRef01DataUp0Up[updateResultRef01MarkdefUp0Name] = updateResultRef01MarkdefUp0Value;

        var updateResultRef01ResdataUp0Result = updateResultRef01Ent.Update(updateResultRef01DataUp0Up, null);
        var updateResultRef01ResdataUp0 = Helpers.ToMapAny(updateResultRef01ResdataUp0Result);
        Assert.True(updateResultRef01ResdataUp0 != null, "expected update result to be a map");
        Assert.True(StructRunner.DeepEqual(updateResultRef01ResdataUp0!["id"], updateResultRef01DataUp0Up["id"]),
            "expected update result id to match");
        Assert.True(Equals(updateResultRef01ResdataUp0![updateResultRef01MarkdefUp0Name], updateResultRef01MarkdefUp0Value),
            $"expected {updateResultRef01MarkdefUp0Name} to be updated, got {updateResultRef01ResdataUp0[updateResultRef01MarkdefUp0Name]}");

    }

    [Fact]
    public async Task Stream()
    {
        var setup = UpdateResultBasicSetup(new Dictionary<string, object?>
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

        var ent = setup.Client.UpdateResult();
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
        var setup2 = UpdateResultBasicSetup(null);
        var ent2 = setup2.Client.UpdateResult();
        var streamed2 = new List<object?>();
        await foreach (var item in ent2.Stream("list", match, null))
        {
            streamed2.Add(item);
        }
        Assert.Equal(listed.Count, streamed2.Count);
    }

    private static EntityTestSetup UpdateResultBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "update_result",
            "UpdateResultTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse update_result test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinDecryptxP2peSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "update_result01", "update_result02", "update_result03" },
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
            "BLUEFINDECRYPTXP_PE_TEST_UPDATE_RESULT_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFINDECRYPTXP_PE_TEST_UPDATE_RESULT_ENTID"] = idmap,
            ["BLUEFINDECRYPTXP_PE_TEST_LIVE"] = "FALSE",
            ["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFINDECRYPTXP_PE_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFINDECRYPTXP_PE_TEST_UPDATE_RESULT_ENTID"])
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

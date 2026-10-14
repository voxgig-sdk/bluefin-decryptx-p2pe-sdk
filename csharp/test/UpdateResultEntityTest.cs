// update_result entity test - basic flow (generated from the API model).

using System.Text.Json;

using BluefinDecryptxP2peSdk.Feature;
using Voxgig.Struct;
using Xunit;

namespace BluefinDecryptxP2peSdk.Test;

public class UpdateResultEntityTest
{
    // main.kit.test.live.strict is true (the default is true): a live
    // request that fails, or a live test missing an input it needs,
    // fails the test.
    // An account with no record for a test to read skips it either way.
    private const bool LIVE_STRICT = true;

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
        var client = setup.Client;

        // CREATE
        var updateResultRef01Ent = client.UpdateResult();
        var updateResultRef01Data = Helpers.ToMapAny(StructUtils.GetProp(
            StructUtils.GetPath(setup.Data, StructUtils.Jt("new", "update_result")),
            "update_result_ref01"));

        var updateResultRef01DataResult = updateResultRef01Ent.Create(updateResultRef01Data, null);
        updateResultRef01Data = Helpers.ToMapAny(updateResultRef01DataResult is IEntity ce ? ce.Data() : updateResultRef01DataResult);
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

        var updateResultRef01MarkdefUp0Name = "address1";
        var updateResultRef01MarkdefUp0Value = $"Mark01-update_result_ref01_{setup.Now}";
        updateResultRef01DataUp0Up[updateResultRef01MarkdefUp0Name] = updateResultRef01MarkdefUp0Value;

        var updateResultRef01ResdataUp0Result = updateResultRef01Ent.Update(updateResultRef01DataUp0Up, null);
        var updateResultRef01ResdataUp0 = Helpers.ToMapAny(updateResultRef01ResdataUp0Result is IEntity ue ? ue.Data() : updateResultRef01ResdataUp0Result);
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

    private sealed class FailHook : BaseFeature
    {
        public int Unexpected;

        public FailHook()
        {
            Name = "failhook";
            Version = "0.0.1";
            Active = true;
        }

        public override void PreSpec(Context ctx) =>
            throw new Exception("update_result hook failed");

        public override void PreUnexpected(Context ctx) => Unexpected++;
    }

    [Fact]
    public async Task StreamError()
    {
        var offline = new Dictionary<string, object?> { ["net"] = new Dictionary<string, object?> { ["offline"] = true } };
        var err = await Assert.ThrowsAnyAsync<Exception>(async () =>
        {
            await foreach (var _ in BluefinDecryptxP2peSDK.TestSDK(offline, null).UpdateResult().Stream("list", null, null)) { }
        });
        Assert.Contains("offline", err.Message);

        await foreach (var _ in BluefinDecryptxP2peSDK.TestSDK(offline, null).UpdateResult().Stream("list", null,
            new Dictionary<string, object?> { ["ctrl"] = new Dictionary<string, object?> { ["throw"] = false } })) { }

        if (Fh.HasFeature("rbac"))
        {
            var denied = BluefinDecryptxP2peSDK.TestSDK(null,
                new Dictionary<string, object?> { ["feature"] = new Dictionary<string, object?> { ["rbac"] = new Dictionary<string, object?> { ["active"] = true, ["deny"] = true } } });
            var denyerr = await Assert.ThrowsAnyAsync<BluefinDecryptxP2peError>(async () =>
            {
                await foreach (var _ in denied.UpdateResult().Stream("list", null, null)) { }
            });
            Assert.Equal("rbac_denied", denyerr.Code);
        }
    }

    [Fact]
    public async Task StreamCtrl()
    {
        var explain = new Dictionary<string, object?>();
        var ctrl = new Dictionary<string, object?> { ["explain"] = explain };
        await foreach (var _ in BluefinDecryptxP2peSDK.TestSDK(null, null).UpdateResult().Stream("list", null,
            new Dictionary<string, object?> { ["ctrl"] = ctrl })) { }
        Assert.Equal(new[] { "explain" }, ctrl.Keys.ToArray());
        Assert.Same(explain, ctrl["explain"]);
        Assert.NotEmpty(explain);
    }

    [Fact]
    public void Unexpected()
    {
        var hook = new FailHook();
        var client = new BluefinDecryptxP2peSDK(new Dictionary<string, object?>
        {
            ["feature"] = new Dictionary<string, object?> { ["test"] = new Dictionary<string, object?> { ["active"] = true } },
            ["extend"] = new List<object?> { hook },
        });

        var err = Assert.ThrowsAny<Exception>(() => client.UpdateResult().List(null, null));
        Assert.Contains("hook failed", err.Message);
        Assert.True(hook.Unexpected > 0);

        var fired = hook.Unexpected;
        client.UpdateResult().List(null, new Dictionary<string, object?> { ["throw"] = false });
        Assert.True(hook.Unexpected > fired);
    }

    [Fact]
    public void Validate()
    {
        if (!Fh.HasFeature("validate"))
        {
            Console.WriteLine("skip: feature not present in this SDK: validate");
            return;
        }
        var client = BluefinDecryptxP2peSDK.TestSDK(null,
            new Dictionary<string, object?> { ["feature"] = new Dictionary<string, object?> { ["validate"] = new Dictionary<string, object?> { ["active"] = true } } });
        var err = Assert.ThrowsAny<BluefinDecryptxP2peError>(() => client.UpdateResult().List(
            new Dictionary<string, object?> { ["client"] = 1 }, null));
        Assert.Equal("validate_failed", err.Code);
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

        // Whether *_ENTID supplied the idmap, read before EnvOverride consumes
        // it: without it, the ids a live flow binds are the fixture's synthetic ones.
        var entidEnvRaw = Environment.GetEnvironmentVariable(
            "BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID"] = idmap,
            ["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"] = "FALSE",
            ["BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFIN_DECRYPTX_P2PE_APIKEY"] = "",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID"])
            ?? Helpers.ToMapAny(idmap)
            ?? new Dictionary<string, object?>();

        if (Equals(env["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"], "TRUE"))
        {
            // 'extra ?? new ...', not a bare 'extra': Merge returns null when
            // the last entry is null, and BasicSetup is normally called with no
            // argument at all - so a bare 'extra' silently discarded the apikey
            // and server values above and handed the SDK null.
            var extraOpts = extra ?? new Dictionary<string, object?>();
            var mergedOpts = StructUtils.Merge(new List<object?>
            {
                // FIRST, so the generated fields below win: sdk-test-control.json's
                // test.client.options adds to the live client, it does not redirect it.
                TestRunner.LiveClientOptions(),
                new Dictionary<string, object?>
                {
                    ["apikey"] = env["BLUEFIN_DECRYPTX_P2PE_APIKEY"],
                },
                extraOpts,
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

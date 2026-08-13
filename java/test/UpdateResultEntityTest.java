package voxgig.bluefindecryptxp2pesdk.sdktest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.junit.jupiter.api.Assumptions;
import org.junit.jupiter.api.Test;

import voxgig.bluefindecryptxp2pesdk.core.Helpers;
import voxgig.bluefindecryptxp2pesdk.core.SdkEntity;
import voxgig.bluefindecryptxp2pesdk.core.BluefinDecryptxP2peSDK;
import voxgig.bluefindecryptxp2pesdk.utility.Json;
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct;

@SuppressWarnings({"unchecked", "unused"})
public class UpdateResultEntityTest {

  @Test
  public void instance() {
    BluefinDecryptxP2peSDK testsdk = BluefinDecryptxP2peSDK.testSDK();
    SdkEntity ent = testsdk.updateResult(null);
    assertNotNull(ent, "expected non-null update_result entity");
  }

  @Test
  public void basic() {
    RunnerSupport.EntityTestSetup setup = updateResultBasicSetup(null);
    // Per-op sdk-test-control.json skip — basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    String mode = setup.live ? "live" : "unit";
    for (String op : new String[] { "create", "list", "update" }) {
      String reason = RunnerSupport.skipReason("entityOp", "update_result." + op, mode);
      Assumptions.assumeTrue(reason == null,
          reason == null || "".equals(reason)
              ? "skipped via sdk-test-control.json" : reason);
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    Assumptions.assumeFalse(setup.syntheticOnly,
        "live entity test uses synthetic IDs from fixture — set BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID JSON to run live");
    BluefinDecryptxP2peSDK client = setup.client;

    // CREATE
    SdkEntity updateResultRef01Ent = client.updateResult(null);
    Map<String, Object> updateResultRef01Data = Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.update_result"), "update_result_ref01"));

    Object updateResultRef01DataResult = updateResultRef01Ent.create(updateResultRef01Data, null);
    updateResultRef01Data = Helpers.toMapAny(updateResultRef01DataResult instanceof SdkEntity ? ((SdkEntity) updateResultRef01DataResult).data() : updateResultRef01DataResult);
    assertNotNull(updateResultRef01Data, "expected create result to be a map");
    assertNotNull(updateResultRef01Data.get("id"), "expected created entity to have an id");

    // LIST
    Map<String, Object> updateResultRef01Match = new LinkedHashMap<>();

    Object updateResultRef01ListResult = updateResultRef01Ent.list(updateResultRef01Match, null);
    assertTrue(updateResultRef01ListResult instanceof List,
        "expected list result to be an array, got " + updateResultRef01ListResult);
    List<Object> updateResultRef01List = (List<Object>) updateResultRef01ListResult;

    List<Object> foundItem = Struct.select(
        RunnerSupport.entityListToData(updateResultRef01List),
        Struct.jm("id", updateResultRef01Data.get("id")));
    assertFalse(Struct.isempty(foundItem), "expected to find created entity in list");

    // UPDATE
    Map<String, Object> updateResultRef01DataUp0Up = new LinkedHashMap<>();
    updateResultRef01DataUp0Up.put("id", updateResultRef01Data.get("id"));

    String updateResultRef01MarkdefUp0Name = "email";
    String updateResultRef01MarkdefUp0Value = "Mark01-update_result_ref01_" + setup.now;
    updateResultRef01DataUp0Up.put(updateResultRef01MarkdefUp0Name, updateResultRef01MarkdefUp0Value);

    Object updateResultRef01ResdataUp0Result = updateResultRef01Ent.update(updateResultRef01DataUp0Up, null);
    Map<String, Object> updateResultRef01ResdataUp0 = Helpers.toMapAny(updateResultRef01ResdataUp0Result instanceof SdkEntity ? ((SdkEntity) updateResultRef01ResdataUp0Result).data() : updateResultRef01ResdataUp0Result);
    assertNotNull(updateResultRef01ResdataUp0, "expected update result to be a map");
    assertEquals(updateResultRef01DataUp0Up.get("id"), updateResultRef01ResdataUp0.get("id"),
        "expected update result id to match");
    assertEquals(updateResultRef01MarkdefUp0Value, updateResultRef01ResdataUp0.get(updateResultRef01MarkdefUp0Name),
        "expected " + updateResultRef01MarkdefUp0Name + " to be updated");

  }

  @Test
  public void stream() {
    Map<String, Object> streamingActive = new LinkedHashMap<>();
    Map<String, Object> streamingOpts = new LinkedHashMap<>();
    streamingOpts.put("active", true);
    Map<String, Object> featureOpts = new LinkedHashMap<>();
    featureOpts.put("streaming", streamingOpts);
    streamingActive.put("feature", featureOpts);

    RunnerSupport.EntityTestSetup setup = updateResultBasicSetup(streamingActive);
    Assumptions.assumeFalse(setup.live,
        "stream test streams the seeded fixture data (unit mode only)");

    SdkEntity ent = setup.client.updateResult(null);
    Map<String, Object> match = new LinkedHashMap<>();

    // Materialised list result for the same op.
    Object listedResult = ent.list(match, null);
    List<Object> listed = listedResult instanceof List
        ? (List<Object>) listedResult : new ArrayList<>();

    // stream("list") yields items via the streaming feature's iterator.
    List<Object> streamed = ent.stream("list", match, null)
        .collect(Collectors.toList());
    assertTrue(streamed.size() > 0, "expected stream to yield items");
    assertEquals(listed.size(), streamed.size(),
        "expected stream to yield the same item count as list");

    // Fallback: with streaming inactive, stream still yields the
    // materialised items.
    RunnerSupport.EntityTestSetup setup2 = updateResultBasicSetup(null);
    SdkEntity ent2 = setup2.client.updateResult(null);
    List<Object> streamed2 = ent2.stream("list", match, null)
        .collect(Collectors.toList());
    assertEquals(listed.size(), streamed2.size(),
        "expected fallback stream to yield the materialised items");
  }

  static RunnerSupport.EntityTestSetup updateResultBasicSetup(Map<String, Object> extra) {
    RunnerSupport.loadEnvLocal();

    Map<String, Object> entityData;
    try {
      String entityDataSource = Files.readString(Path.of(
          "..", ".sdk", "test", "entity", "update_result", "UpdateResultTestData.json"));
      entityData = Helpers.toMapAny(Json.parse(entityDataSource));
    }
    catch (Exception e) {
      throw new AssertionError("failed to read update_result test data: " + e.getMessage(), e);
    }

    Map<String, Object> options = new LinkedHashMap<>();
    options.put("entity", entityData.get("existing"));

    BluefinDecryptxP2peSDK client = BluefinDecryptxP2peSDK.testSDK(options, extra);

    // Generate idmap via transform, matching TS pattern.
    List<Object> idnames = new ArrayList<>();
    idnames.add("update_result01");
    idnames.add("update_result02");
    idnames.add("update_result03");
    Object idmap = Struct.transform(idnames, Json.parse(
        "{\"`$PACK`\": [\"\", {"
        + "\"`$KEY`\": \"`$COPY`\","
        + "\"`$VAL`\": [\"`$FORMAT`\", \"upper\", \"`$COPY`\"]"
        + "}]}"));

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against
    // synthetic IDs from the fixture and 4xx's. Surface this so the test
    // can skip.
    String entidEnvRaw = RunnerSupport.getenv("BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID");
    boolean idmapOverridden = entidEnvRaw != null
        && entidEnvRaw.trim().startsWith("{");

    Map<String, Object> envm = new LinkedHashMap<>();
    envm.put("BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID", idmap);
    envm.put("BLUEFIN_DECRYPTX_P2PE_TEST_LIVE", "FALSE");
    envm.put("BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN", "FALSE");
    envm.put("BLUEFIN_DECRYPTX_P2PE_APIKEY", "NONE");
    Map<String, Object> env = RunnerSupport.envOverride(envm);

    Map<String, Object> idmapResolved = Helpers.toMapAny(env.get("BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID"));
    if (idmapResolved == null) {
      idmapResolved = Helpers.toMapAny(idmap);
    }

    boolean live = "TRUE".equals(env.get("BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"));
    if (live) {
      Map<String, Object> liveOpts = new LinkedHashMap<>();
      liveOpts.put("apikey", env.get("BLUEFIN_DECRYPTX_P2PE_APIKEY"));
      Object mergedOpts = Struct.merge(Struct.jt(liveOpts, extra));
      client = new BluefinDecryptxP2peSDK(Helpers.toMapAny(mergedOpts));
    }

    RunnerSupport.EntityTestSetup setup = new RunnerSupport.EntityTestSetup();
    setup.client = client;
    setup.data = entityData;
    setup.idmap = idmapResolved;
    setup.env = env;
    setup.explain = "TRUE".equals(env.get("BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN"));
    setup.live = live;
    setup.syntheticOnly = live && !idmapOverridden;
    setup.now = System.currentTimeMillis();
    return setup;
  }
}

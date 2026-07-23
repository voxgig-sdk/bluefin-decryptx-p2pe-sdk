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
public class DeviceRkiActivateResultEntityTest {

  @Test
  public void instance() {
    BluefinDecryptxP2peSDK testsdk = BluefinDecryptxP2peSDK.testSDK();
    SdkEntity ent = testsdk.deviceRkiActivateResult(null);
    assertNotNull(ent, "expected non-null device_rki_activate_result entity");
  }

  @Test
  public void basic() {
    RunnerSupport.EntityTestSetup setup = deviceRkiActivateResultBasicSetup(null);
    // Per-op sdk-test-control.json skip — basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    String mode = setup.live ? "live" : "unit";
    for (String op : new String[] { "create" }) {
      String reason = RunnerSupport.skipReason("entityOp", "device_rki_activate_result." + op, mode);
      Assumptions.assumeTrue(reason == null,
          reason == null || "".equals(reason)
              ? "skipped via sdk-test-control.json" : reason);
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    Assumptions.assumeFalse(setup.syntheticOnly,
        "live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID JSON to run live");
    BluefinDecryptxP2peSDK client = setup.client;

    // CREATE
    SdkEntity deviceRkiActivateResultRef01Ent = client.deviceRkiActivateResult(null);
    Map<String, Object> deviceRkiActivateResultRef01Data = Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.device_rki_activate_result"), "device_rki_activate_result_ref01"));

    Object deviceRkiActivateResultRef01DataResult = deviceRkiActivateResultRef01Ent.create(deviceRkiActivateResultRef01Data, null);
    deviceRkiActivateResultRef01Data = Helpers.toMapAny(deviceRkiActivateResultRef01DataResult);
    assertNotNull(deviceRkiActivateResultRef01Data, "expected create result to be a map");

  }

  static RunnerSupport.EntityTestSetup deviceRkiActivateResultBasicSetup(Map<String, Object> extra) {
    RunnerSupport.loadEnvLocal();

    Map<String, Object> entityData;
    try {
      String entityDataSource = Files.readString(Path.of(
          "..", ".sdk", "test", "entity", "device_rki_activate_result", "DeviceRkiActivateResultTestData.json"));
      entityData = Helpers.toMapAny(Json.parse(entityDataSource));
    }
    catch (Exception e) {
      throw new AssertionError("failed to read device_rki_activate_result test data: " + e.getMessage(), e);
    }

    Map<String, Object> options = new LinkedHashMap<>();
    options.put("entity", entityData.get("existing"));

    BluefinDecryptxP2peSDK client = BluefinDecryptxP2peSDK.testSDK(options, extra);

    // Generate idmap via transform, matching TS pattern.
    List<Object> idnames = new ArrayList<>();
    idnames.add("device_rki_activate_result01");
    idnames.add("device_rki_activate_result02");
    idnames.add("device_rki_activate_result03");
    Object idmap = Struct.transform(idnames, Json.parse(
        "{\"`$PACK`\": [\"\", {"
        + "\"`$KEY`\": \"`$COPY`\","
        + "\"`$VAL`\": [\"`$FORMAT`\", \"upper\", \"`$COPY`\"]"
        + "}]}"));

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against
    // synthetic IDs from the fixture and 4xx's. Surface this so the test
    // can skip.
    String entidEnvRaw = RunnerSupport.getenv("BLUEFINDECRYPTXP_PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID");
    boolean idmapOverridden = entidEnvRaw != null
        && entidEnvRaw.trim().startsWith("{");

    Map<String, Object> envm = new LinkedHashMap<>();
    envm.put("BLUEFINDECRYPTXP_PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID", idmap);
    envm.put("BLUEFINDECRYPTXP_PE_TEST_LIVE", "FALSE");
    envm.put("BLUEFINDECRYPTXP_PE_TEST_EXPLAIN", "FALSE");
    envm.put("BLUEFINDECRYPTXP_PE_APIKEY", "NONE");
    Map<String, Object> env = RunnerSupport.envOverride(envm);

    Map<String, Object> idmapResolved = Helpers.toMapAny(env.get("BLUEFINDECRYPTXP_PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID"));
    if (idmapResolved == null) {
      idmapResolved = Helpers.toMapAny(idmap);
    }

    boolean live = "TRUE".equals(env.get("BLUEFINDECRYPTXP_PE_TEST_LIVE"));
    if (live) {
      Map<String, Object> liveOpts = new LinkedHashMap<>();
      liveOpts.put("apikey", env.get("BLUEFINDECRYPTXP_PE_APIKEY"));
      Object mergedOpts = Struct.merge(Struct.jt(liveOpts, extra));
      client = new BluefinDecryptxP2peSDK(Helpers.toMapAny(mergedOpts));
    }

    RunnerSupport.EntityTestSetup setup = new RunnerSupport.EntityTestSetup();
    setup.client = client;
    setup.data = entityData;
    setup.idmap = idmapResolved;
    setup.env = env;
    setup.explain = "TRUE".equals(env.get("BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"));
    setup.live = live;
    setup.syntheticOnly = live && !idmapOverridden;
    setup.now = System.currentTimeMillis();
    return setup;
  }
}

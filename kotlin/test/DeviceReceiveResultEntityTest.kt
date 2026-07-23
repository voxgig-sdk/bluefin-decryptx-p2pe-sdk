package voxgig.bluefindecryptxp2pesdk.sdktest

import java.nio.file.Files
import java.nio.file.Paths

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions
import org.junit.jupiter.api.Test

import voxgig.bluefindecryptxp2pesdk.core.Helpers
import voxgig.bluefindecryptxp2pesdk.core.SdkEntity
import voxgig.bluefindecryptxp2pesdk.core.BluefinDecryptxP2peSDK
import voxgig.bluefindecryptxp2pesdk.utility.Json
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

@Suppress("UNCHECKED_CAST", "UNUSED_VARIABLE", "UNUSED_VALUE")
class DeviceReceiveResultEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinDecryptxP2peSDK.testSDK()
    val ent = testsdk.deviceReceiveResult(null)
    assertNotNull(ent, "expected non-null device_receive_result entity")
  }

  @Test
  fun basic() {
    val setup = deviceReceiveResultBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("create")) {
      val reason = RunnerSupport.skipReason("entityOp", "device_receive_result.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_DEVICE_RECEIVE_RESULT_ENTID JSON to run live",
    )
    val client = setup.client

    // CREATE
    val deviceReceiveResultRef01Ent = client.deviceReceiveResult(null)
    var deviceReceiveResultRef01Data: MutableMap<String, Any?> = (Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.device_receive_result"), "device_receive_result_ref01")) ?: linkedMapOf())

    val deviceReceiveResultRef01DataResult = deviceReceiveResultRef01Ent.create(deviceReceiveResultRef01Data, null)
    deviceReceiveResultRef01Data = Helpers.toMapAny(deviceReceiveResultRef01DataResult) ?: linkedMapOf()
    assertNotNull(deviceReceiveResultRef01Data, "expected create result to be a map")

  }

  companion object {
    fun deviceReceiveResultBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "device_receive_result", "DeviceReceiveResultTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read device_receive_result test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinDecryptxP2peSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("device_receive_result01")
      idnames.add("device_receive_result02")
      idnames.add("device_receive_result03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINDECRYPTXP_PE_TEST_DEVICE_RECEIVE_RESULT_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINDECRYPTXP_PE_TEST_DEVICE_RECEIVE_RESULT_ENTID"] = idmap
      envm["BLUEFINDECRYPTXP_PE_TEST_LIVE"] = "FALSE"
      envm["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFINDECRYPTXP_PE_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINDECRYPTXP_PE_TEST_DEVICE_RECEIVE_RESULT_ENTID"])
      if (idmapResolved == null) {
        idmapResolved = Helpers.toMapAny(idmap) ?: linkedMapOf()
      }

      val live = "TRUE" == env["BLUEFINDECRYPTXP_PE_TEST_LIVE"]
      if (live) {
        val liveOpts = linkedMapOf<String, Any?>()
        liveOpts["apikey"] = env["BLUEFINDECRYPTXP_PE_APIKEY"]
        val mergedOpts = Struct.merge(Struct.jt(liveOpts, extra))
        client = BluefinDecryptxP2peSDK(Helpers.toMapAny(mergedOpts))
      }

      val setup = RunnerSupport.EntityTestSetup()
      setup.client = client
      setup.data = entityData
      setup.idmap = idmapResolved
      setup.env = env
      setup.explain = "TRUE" == env["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"]
      setup.live = live
      setup.syntheticOnly = live && !idmapOverridden
      setup.now = System.currentTimeMillis()
      return setup
    }
  }
}

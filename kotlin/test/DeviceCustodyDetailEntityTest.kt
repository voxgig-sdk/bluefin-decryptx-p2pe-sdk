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
class DeviceCustodyDetailEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinDecryptxP2peSDK.testSDK()
    val ent = testsdk.deviceCustodyDetail(null)
    assertNotNull(ent, "expected non-null device_custody_detail entity")
  }

  @Test
  fun basic() {
    val setup = deviceCustodyDetailBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("load")) {
      val reason = RunnerSupport.skipReason("entityOp", "device_custody_detail.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID JSON to run live",
    )
    val client = setup.client

    // Bootstrap entity data from existing test data (no create step in flow).
    val deviceCustodyDetailRef01DataRaw = Struct.items(Helpers.toMapAny(
        Struct.getpath(setup.data, "existing.device_custody_detail")))
    val deviceCustodyDetailRef01Data: MutableMap<String, Any?> = if (deviceCustodyDetailRef01DataRaw.isEmpty())
        linkedMapOf() else (Helpers.toMapAny(deviceCustodyDetailRef01DataRaw[0][1]) ?: linkedMapOf())

    // LOAD
    val deviceCustodyDetailRef01Ent = client.deviceCustodyDetail(null)
    val deviceCustodyDetailRef01MatchDt0 = linkedMapOf<String, Any?>()
    deviceCustodyDetailRef01MatchDt0["id"] = deviceCustodyDetailRef01Data["id"]
    val deviceCustodyDetailRef01DataDt0Loaded = deviceCustodyDetailRef01Ent.load(deviceCustodyDetailRef01MatchDt0, null)
    val deviceCustodyDetailRef01DataDt0LoadResult = Helpers.toMapAny(if (deviceCustodyDetailRef01DataDt0Loaded is SdkEntity) deviceCustodyDetailRef01DataDt0Loaded.data() else deviceCustodyDetailRef01DataDt0Loaded) ?: linkedMapOf()
    assertNotNull(deviceCustodyDetailRef01DataDt0LoadResult, "expected load result to be a map")
    assertEquals(deviceCustodyDetailRef01Data["id"], deviceCustodyDetailRef01DataDt0LoadResult["id"],
        "expected load result id to match")

  }

  companion object {
    fun deviceCustodyDetailBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "device_custody_detail", "DeviceCustodyDetailTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read device_custody_detail test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinDecryptxP2peSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("device_custody_detail01")
      idnames.add("device_custody_detail02")
      idnames.add("device_custody_detail03")
      idnames.add("device01")
      idnames.add("device02")
      idnames.add("device03")
      idnames.add("device_type01")
      idnames.add("serial_number01")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID"] = idmap
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"] = "FALSE"
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFIN_DECRYPTX_P2PE_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID"])
      if (idmapResolved == null) {
        idmapResolved = Helpers.toMapAny(idmap) ?: linkedMapOf()
      }

      val live = "TRUE" == env["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"]
      if (live) {
        val liveOpts = linkedMapOf<String, Any?>()
        liveOpts["apikey"] = env["BLUEFIN_DECRYPTX_P2PE_APIKEY"]
        val mergedOpts = Struct.merge(Struct.jt(liveOpts, extra))
        client = BluefinDecryptxP2peSDK(Helpers.toMapAny(mergedOpts))
      }

      val setup = RunnerSupport.EntityTestSetup()
      setup.client = client
      setup.data = entityData
      setup.idmap = idmapResolved
      setup.env = env
      setup.explain = "TRUE" == env["BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN"]
      setup.live = live
      setup.syntheticOnly = live && !idmapOverridden
      setup.now = System.currentTimeMillis()
      return setup
    }
  }
}

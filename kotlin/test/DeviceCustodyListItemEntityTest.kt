package voxgig.bluefindecryptxp2pesdk.sdktest

import java.nio.file.Files
import java.nio.file.Paths

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Assertions.assertThrows
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions
import org.junit.jupiter.api.Test

import voxgig.bluefindecryptxp2pesdk.core.Config
import voxgig.bluefindecryptxp2pesdk.core.Context
import voxgig.bluefindecryptxp2pesdk.core.Helpers
import voxgig.bluefindecryptxp2pesdk.core.SdkEntity
import voxgig.bluefindecryptxp2pesdk.core.SdkError
import voxgig.bluefindecryptxp2pesdk.core.BluefinDecryptxP2peSDK
import voxgig.bluefindecryptxp2pesdk.feature.BaseFeature
import voxgig.bluefindecryptxp2pesdk.utility.Json
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

@Suppress("UNCHECKED_CAST", "UNUSED_VARIABLE", "UNUSED_VALUE")
class DeviceCustodyListItemEntityTest {

  // main.kit.test.live.strict is true (the default is true): a live
  // request that fails, or a live test missing an input it needs,
  // fails the test.
  // An account with no record for a test to read skips it either way.
  private val LIVE_STRICT = true

  @Test
  fun instance() {
    val testsdk = BluefinDecryptxP2peSDK.testSDK()
    val ent = testsdk.deviceCustodyListItem(null)
    assertNotNull(ent, "expected non-null device_custody_list_item entity")
  }

  @Test
  fun basic() {
    val setup = deviceCustodyListItemBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf<String>("list")) {
      val reason = RunnerSupport.skipReason("entityOp", "device_custody_list_item.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    if (setup.live) {
      for (liveKey in arrayOf<String>("device_type01", "serial_number01")) {
        if (setup.syntheticOnly || setup.idmap?.get(liveKey) == null) {
          RunnerSupport.liveMiss(LIVE_STRICT, "Live entity test blocked: needs " + liveKey + " via BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_LIST_ITEM_ENTID")
        }
      }
    }
    val client = setup.client

    // Bootstrap entity data from existing test data (no create step in flow).
    val deviceCustodyListItemRef01DataRaw = Struct.items(Helpers.toMapAny(
        Struct.getpath(setup.data, "existing.device_custody_list_item")))
    val deviceCustodyListItemRef01Data: MutableMap<String, Any?> = if (deviceCustodyListItemRef01DataRaw.isEmpty())
        linkedMapOf() else (Helpers.toMapAny(deviceCustodyListItemRef01DataRaw[0][1]) ?: linkedMapOf())

    // LIST
    val deviceCustodyListItemRef01Ent = client.deviceCustodyListItem(null)
    val deviceCustodyListItemRef01Match = linkedMapOf<String, Any?>()
    deviceCustodyListItemRef01Match["device_type"] = setup.idmap!!["device_type01"]
    deviceCustodyListItemRef01Match["serial_number"] = setup.idmap!!["serial_number01"]

    val deviceCustodyListItemRef01ListResult = deviceCustodyListItemRef01Ent.list(deviceCustodyListItemRef01Match, null)
    assertTrue(deviceCustodyListItemRef01ListResult is List<*>,
        "expected list result to be an array, got " + deviceCustodyListItemRef01ListResult)

  }

  private fun hasFeature(name: String): Boolean {
    val fm = Helpers.toMapAny(Config.sharedConfig()["feature"])
    return fm != null && fm[name] != null
  }

  @Test
  fun validate() {
    Assumptions.assumeTrue(hasFeature("validate"), "feature not present in this SDK: validate")
    val client = BluefinDecryptxP2peSDK.testSDK(null, linkedMapOf<String, Any?>(
      "feature" to linkedMapOf<String, Any?>(
        "validate" to linkedMapOf<String, Any?>("active" to true))))
    val err = assertThrows(SdkError::class.java) {
      client.deviceCustodyListItem(null).list(linkedMapOf<String, Any?>("device_type" to 1, "serial_number" to "x"), null)
    }
    assertEquals("validate_failed", err.code)
  }

  companion object {
    fun deviceCustodyListItemBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "device_custody_list_item", "DeviceCustodyListItemTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read device_custody_list_item test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinDecryptxP2peSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("device_custody_list_item01")
      idnames.add("device_custody_list_item02")
      idnames.add("device_custody_list_item03")
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

      // Whether *_ENTID supplied the idmap, read before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_LIST_ITEM_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_LIST_ITEM_ENTID"] = idmap
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"] = "FALSE"
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFIN_DECRYPTX_P2PE_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_LIST_ITEM_ENTID"])
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

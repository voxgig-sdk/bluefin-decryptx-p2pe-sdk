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
class InjectKeyEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinDecryptxP2peSDK.testSDK()
    val ent = testsdk.injectKey(null)
    assertNotNull(ent, "expected non-null inject_key entity")
  }

  @Test
  fun basic() {
    val setup = injectKeyBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("list", "load")) {
      val reason = RunnerSupport.skipReason("entityOp", "inject_key.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_INJECT_KEY_ENTID JSON to run live",
    )
    val client = setup.client

    // Bootstrap entity data from existing test data (no create step in flow).
    val injectKeyRef01DataRaw = Struct.items(Helpers.toMapAny(
        Struct.getpath(setup.data, "existing.inject_key")))
    val injectKeyRef01Data: MutableMap<String, Any?> = if (injectKeyRef01DataRaw.isEmpty())
        linkedMapOf() else (Helpers.toMapAny(injectKeyRef01DataRaw[0][1]) ?: linkedMapOf())

    // LIST
    val injectKeyRef01Ent = client.injectKey(null)
    val injectKeyRef01Match = linkedMapOf<String, Any?>()

    val injectKeyRef01ListResult = injectKeyRef01Ent.list(injectKeyRef01Match, null)
    assertTrue(injectKeyRef01ListResult is List<*>,
        "expected list result to be an array, got " + injectKeyRef01ListResult)

    // LOAD
    val injectKeyRef01MatchDt0 = linkedMapOf<String, Any?>()
    injectKeyRef01MatchDt0["id"] = injectKeyRef01Data["id"]
    val injectKeyRef01DataDt0Loaded = injectKeyRef01Ent.load(injectKeyRef01MatchDt0, null)
    val injectKeyRef01DataDt0LoadResult = Helpers.toMapAny(injectKeyRef01DataDt0Loaded) ?: linkedMapOf()
    assertNotNull(injectKeyRef01DataDt0LoadResult, "expected load result to be a map")
    assertEquals(injectKeyRef01Data["id"], injectKeyRef01DataDt0LoadResult["id"],
        "expected load result id to match")

  }

  @Test
  fun stream() {
    val streamingActive = linkedMapOf<String, Any?>(
      "feature" to linkedMapOf<String, Any?>(
        "streaming" to linkedMapOf<String, Any?>("active" to true),
      ),
    )
    val setup = injectKeyBasicSetup(streamingActive)
    Assumptions.assumeFalse(
      setup.live,
      "stream test streams the seeded fixture data (unit mode only)",
    )

    val ent = setup.client.injectKey(null)
    val match = linkedMapOf<String, Any?>()

    // Materialised list result for the same op.
    val listedResult = ent.list(match, null)
    val listed = (listedResult as? List<Any?>) ?: emptyList<Any?>()

    // stream("list") yields items via the streaming feature's iterator.
    val streamed = ent.stream("list", match, null).toList()
    assertTrue(streamed.size > 0, "expected stream to yield items")
    assertEquals(listed.size, streamed.size, "expected stream to match list count")

    // Fallback: with streaming inactive, stream still yields the materialised
    // items.
    val setup2 = injectKeyBasicSetup(null)
    val ent2 = setup2.client.injectKey(null)
    val streamed2 = ent2.stream("list", match, null).toList()
    assertEquals(listed.size, streamed2.size, "expected fallback stream to match list")
  }

  companion object {
    fun injectKeyBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "inject_key", "InjectKeyTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read inject_key test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinDecryptxP2peSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("inject_key01")
      idnames.add("inject_key02")
      idnames.add("inject_key03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINDECRYPTXP_PE_TEST_INJECT_KEY_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINDECRYPTXP_PE_TEST_INJECT_KEY_ENTID"] = idmap
      envm["BLUEFINDECRYPTXP_PE_TEST_LIVE"] = "FALSE"
      envm["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFINDECRYPTXP_PE_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINDECRYPTXP_PE_TEST_INJECT_KEY_ENTID"])
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

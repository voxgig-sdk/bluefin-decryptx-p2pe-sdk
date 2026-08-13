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
class ClientEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinDecryptxP2peSDK.testSDK()
    val ent = testsdk.client(null)
    assertNotNull(ent, "expected non-null client entity")
  }

  @Test
  fun basic() {
    val setup = clientBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("create", "list", "load", "remove")) {
      val reason = RunnerSupport.skipReason("entityOp", "client.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID JSON to run live",
    )
    val client = setup.client

    // CREATE
    val clientRef01Ent = client.client(null)
    var clientRef01Data: MutableMap<String, Any?> = (Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.client"), "client_ref01")) ?: linkedMapOf())

    val clientRef01DataResult = clientRef01Ent.create(clientRef01Data, null)
    clientRef01Data = Helpers.toMapAny(if (clientRef01DataResult is SdkEntity) clientRef01DataResult.data() else clientRef01DataResult) ?: linkedMapOf()
    assertNotNull(clientRef01Data, "expected create result to be a map")
    assertNotNull(clientRef01Data["id"], "expected created entity to have an id")

    // LIST
    val clientRef01Match = linkedMapOf<String, Any?>()

    val clientRef01ListResult = clientRef01Ent.list(clientRef01Match, null)
    assertTrue(clientRef01ListResult is List<*>,
        "expected list result to be an array, got " + clientRef01ListResult)
    val clientRef01List = clientRef01ListResult as List<Any?>

    val foundItem = Struct.select(
        RunnerSupport.entityListToData(clientRef01List),
        Struct.jm("id", clientRef01Data["id"]))
    assertFalse(Struct.isempty(foundItem), "expected to find created entity in list")

    // LOAD
    val clientRef01MatchDt0 = linkedMapOf<String, Any?>()
    clientRef01MatchDt0["id"] = clientRef01Data["id"]
    val clientRef01DataDt0Loaded = clientRef01Ent.load(clientRef01MatchDt0, null)
    val clientRef01DataDt0LoadResult = Helpers.toMapAny(if (clientRef01DataDt0Loaded is SdkEntity) clientRef01DataDt0Loaded.data() else clientRef01DataDt0Loaded) ?: linkedMapOf()
    assertNotNull(clientRef01DataDt0LoadResult, "expected load result to be a map")
    assertEquals(clientRef01Data["id"], clientRef01DataDt0LoadResult["id"],
        "expected load result id to match")

    // REMOVE
    val clientRef01MatchRm0 = linkedMapOf<String, Any?>()
    clientRef01MatchRm0["id"] = clientRef01Data["id"]
    clientRef01Ent.remove(clientRef01MatchRm0, null)

    // LIST
    val clientRef01MatchRt0 = linkedMapOf<String, Any?>()

    val clientRef01ListRt0Result = clientRef01Ent.list(clientRef01MatchRt0, null)
    assertTrue(clientRef01ListRt0Result is List<*>,
        "expected list result to be an array, got " + clientRef01ListRt0Result)
    val clientRef01ListRt0 = clientRef01ListRt0Result as List<Any?>

    val notFoundItem = Struct.select(
        RunnerSupport.entityListToData(clientRef01ListRt0),
        Struct.jm("id", clientRef01Data["id"]))
    assertTrue(Struct.isempty(notFoundItem), "expected removed entity to not be in list")

  }

  @Test
  fun stream() {
    val streamingActive = linkedMapOf<String, Any?>(
      "feature" to linkedMapOf<String, Any?>(
        "streaming" to linkedMapOf<String, Any?>("active" to true),
      ),
    )
    val setup = clientBasicSetup(streamingActive)
    Assumptions.assumeFalse(
      setup.live,
      "stream test streams the seeded fixture data (unit mode only)",
    )

    val ent = setup.client.client(null)
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
    val setup2 = clientBasicSetup(null)
    val ent2 = setup2.client.client(null)
    val streamed2 = ent2.stream("list", match, null).toList()
    assertEquals(listed.size, streamed2.size, "expected fallback stream to match list")
  }

  companion object {
    fun clientBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "client", "ClientTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read client test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinDecryptxP2peSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("client01")
      idnames.add("client02")
      idnames.add("client03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID"] = idmap
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"] = "FALSE"
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFIN_DECRYPTX_P2PE_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID"])
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

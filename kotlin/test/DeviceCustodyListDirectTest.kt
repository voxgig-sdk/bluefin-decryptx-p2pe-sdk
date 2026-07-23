package voxgig.bluefindecryptxp2pesdk.sdktest

import java.util.function.BiFunction
import java.util.function.Supplier

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions
import org.junit.jupiter.api.Test

import voxgig.bluefindecryptxp2pesdk.core.Helpers
import voxgig.bluefindecryptxp2pesdk.core.BluefinDecryptxP2peSDK
import voxgig.bluefindecryptxp2pesdk.utility.Json

@Suppress("UNCHECKED_CAST", "UNUSED_VARIABLE")
class DeviceCustodyListDirectTest {

  @Test
  fun directListDeviceCustodyList() {
    val mockres = mutableListOf<Any?>()
    mockres.add(jm("id", "direct01"))
    mockres.add(jm("id", "direct02"))
    val setup = directSetup(mockres)
    val mode = if (setup.live) "live" else "unit"
    val reason = RunnerSupport.skipReason("direct", "direct-list-device_custody_list", mode)
    Assumptions.assumeTrue(
      reason == null,
      if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
    )
    if (setup.live) {
      for (liveKey in arrayOf("device_type01", "serial_number01")) {
        Assumptions.assumeTrue(setup.idmap[liveKey] != null,
            "live test needs " + liveKey + " via *_ENTID env var (synthetic IDs only)")
      }
    }
    val client = setup.client

    val params = linkedMapOf<String, Any?>()
    if (setup.live) {
      params["device_type"] = setup.idmap["device_type01"]
    } else {
      params["device_type"] = "direct01"
    }
    if (setup.live) {
      params["serial_number"] = setup.idmap["serial_number01"]
    } else {
      params["serial_number"] = "direct02"
    }

    val result = client.direct(jm(
        "path", "devices/{serial_number}/{device_type}/custody",
        "method", "GET",
        "params", params))
    if (setup.live) {
      Assumptions.assumeTrue(result["ok"] == true,
          "list call not ok (likely synthetic IDs against live API): " + result)
      val status = Helpers.toInt(result["status"])
      Assumptions.assumeTrue(status in 200..299, "expected 2xx status, got " + result["status"])
    } else {
      assertEquals(true, result["ok"], "expected ok to be true")
      assertEquals(200, Helpers.toInt(result["status"]), "expected status 200")
    }

    if (!setup.live) {
      assertTrue(result["data"] is List<*>,
          "expected data to be an array, got " + result["data"])
      assertEquals(2, (result["data"] as List<Any?>).size, "expected 2 items")

      assertEquals(1, setup.calls.size, "expected 1 call")
      val call = setup.calls[0]
      val initMap = Helpers.toMapAny(call["init"])
      if (initMap != null) {
        assertEquals("GET", initMap["method"], "expected method GET")
      }
      val url = if (call["url"] is String) call["url"] as String else ""
      assertTrue(url.contains("direct01"),
          "expected url to contain direct01, got " + url)
      assertTrue(url.contains("direct02"),
          "expected url to contain direct02, got " + url)
    }
  }

  companion object {
    fun jm(vararg kv: Any?): MutableMap<String, Any?> {
      val out = linkedMapOf<String, Any?>()
      var i = 0
      while (i < kv.size - 1) {
        out[kv[i].toString()] = kv[i + 1]
        i += 2
      }
      return out
    }

    class DirectSetup {
      lateinit var client: BluefinDecryptxP2peSDK
      var calls: MutableList<MutableMap<String, Any?>> = mutableListOf()
      var live: Boolean = false
      var idmap: MutableMap<String, Any?> = linkedMapOf()
    }

    fun directSetup(mockres: Any?): DirectSetup {
      RunnerSupport.loadEnvLocal()

      val calls = mutableListOf<MutableMap<String, Any?>>()

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_LIST_ENTID"] = linkedMapOf<String, Any?>()
      envm["BLUEFINDECRYPTXP_PE_TEST_LIVE"] = "FALSE"
      envm["BLUEFINDECRYPTXP_PE_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      val live = "TRUE" == env["BLUEFINDECRYPTXP_PE_TEST_LIVE"]

      val setup = DirectSetup()
      setup.calls = calls

      if (live) {
        val mergedOpts = linkedMapOf<String, Any?>()
        mergedOpts["apikey"] = env["BLUEFINDECRYPTXP_PE_APIKEY"]
        setup.client = BluefinDecryptxP2peSDK(mergedOpts)
        setup.live = true

        var idmap: MutableMap<String, Any?> = linkedMapOf()
        val entidRaw = env["BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_LIST_ENTID"]
        if (entidRaw is String && entidRaw.startsWith("{")) {
          val parsed = Helpers.toMapAny(Json.parseOrNull(entidRaw))
          if (parsed != null) {
            idmap = parsed
          }
        } else if (entidRaw is MutableMap<*, *>) {
          idmap = entidRaw as MutableMap<String, Any?>
        }
        setup.idmap = idmap
        return setup
      }

      val mockdata: Any? = mockres ?: jm("id", "direct01")
      val mockFetch = BiFunction<String, MutableMap<String, Any?>, MutableMap<String, Any?>> { url, init ->
        calls.add(jm("url", url, "init", init))
        jm(
            "status", 200,
            "statusText", "OK",
            "headers", linkedMapOf<String, Any?>(),
            "json", Supplier<Any?> { mockdata })
      }

      setup.client = BluefinDecryptxP2peSDK(jm(
          "base", "http://localhost:8080",
          "system", jm("fetch", mockFetch)))
      setup.live = false
      setup.idmap = linkedMapOf()
      return setup
    }
  }
}

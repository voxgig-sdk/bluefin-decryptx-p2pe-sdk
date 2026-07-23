// Generated direct-call tests for the device_custody_detail entity (mirrors the java
// TestDirect generator). A dependency-free scala-cli test object driven by
// SdkEntityTestMain: an offline mock transport records each call and the
// asserts confirm path-param substitution and the response shape.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}
import java.util.function.{BiFunction, Supplier}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, BluefinDecryptxP2peSDK}

object DeviceCustodyDetailDirectTest {

  private class DirectSetup(val client: BluefinDecryptxP2peSDK, val calls: JList[JMap[String, Object]])

  private def directSetup(mockres: Object): DirectSetup = {
    val calls = new ArrayList[JMap[String, Object]]()
    val mockdata: Object = if (mockres != null) mockres else SdkTestSupport.om("id" -> "direct01")
    val mockFetch: BiFunction[String, JMap[String, Object], Object] =
      (url, init) => {
        calls.add(SdkTestSupport.om("url" -> url, "init" -> init))
        val js: Supplier[Object] = () => mockdata
        SdkTestSupport.om(
          "status" -> SdkTestSupport.I(200),
          "statusText" -> "OK",
          "headers" -> new LinkedHashMap[String, Object](),
          "json" -> js)
      }
    val client = new BluefinDecryptxP2peSDK(SdkTestSupport.om(
      "base" -> "http://localhost:8080",
      "system" -> SdkTestSupport.om("fetch" -> mockFetch)))
    new DirectSetup(client, calls)
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("direct-load-device_custody_detail") {
      val setup = directSetup(SdkTestSupport.om("id" -> "direct01"))
      val client = setup.client

      val params = new LinkedHashMap[String, Object]()
      params.put("device_type", "direct01")
      params.put("id", "direct02")
      params.put("serial_number", "direct03")
      val result = client.direct(SdkTestSupport.om(
          "path" -> "devices/{serial_number}/{device_type}/custody/{id}",
          "method" -> "GET",
          "params" -> params))

      rep.eq("direct-load-device_custody_detail.ok", java.lang.Boolean.TRUE, result.get("ok"))
      rep.eqI("direct-load-device_custody_detail.status", 200, Helpers.toInt(result.get("status")))
      rep.check("direct-load-device_custody_detail.data", result.get("data") != null, "expected data to be non-null")
      val dataMap = Helpers.toMapAny(result.get("data"))
      if (dataMap != null) rep.eq("direct-load-device_custody_detail.dataId", "direct01", dataMap.get("id"))
      rep.eqI("direct-load-device_custody_detail.calls", 1, setup.calls.size())
      val url = setup.calls.get(0).get("url") match { case s: String => s; case _ => "" }
      rep.check("direct-load-device_custody_detail.url1", url.contains("direct01"), "expected url to contain direct01, got " + url)
      rep.check("direct-load-device_custody_detail.url2", url.contains("direct02"), "expected url to contain direct02, got " + url)
      rep.check("direct-load-device_custody_detail.url3", url.contains("direct03"), "expected url to contain direct03, got " + url)
    }
  }
}

// Generated basic-flow test for the device_state entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped DeviceStateTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, SdkEntity, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object DeviceStateEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("device_state.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.deviceState(null)
      rep.check("device_state.instance", ent != null, "expected non-null device_state entity")
    }

    rep.scope("device_state.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/device_state/DeviceStateTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("device_state01", "DEVICE_STATE01")
      idmap.put("device_state02", "DEVICE_STATE02")
      idmap.put("device_state03", "DEVICE_STATE03")
      val now = System.currentTimeMillis()

      // LIST
      val deviceStateRef01Ent = client.deviceState(null)
      val deviceStateRef01Match = new LinkedHashMap[String, Object]()
      val deviceStateRef01ListResult = deviceStateRef01Ent.list(deviceStateRef01Match, null)
      rep.check("device_state.list.islist", deviceStateRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + deviceStateRef01ListResult)
    }
  }
}

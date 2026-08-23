// Generated basic-flow test for the device_list entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped DeviceListTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, SdkEntity, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object DeviceListEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("device_list.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.deviceList(null)
      rep.check("device_list.instance", ent != null, "expected non-null device_list entity")
    }

    rep.scope("device_list.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/device_list/DeviceListTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("device_list01", "DEVICE_LIST01")
      idmap.put("device_list02", "DEVICE_LIST02")
      idmap.put("device_list03", "DEVICE_LIST03")
      idmap.put("virtual_device01", "VIRTUAL_DEVICE01")
      idmap.put("virtual_device02", "VIRTUAL_DEVICE02")
      idmap.put("virtual_device03", "VIRTUAL_DEVICE03")
      val now = System.currentTimeMillis()

      // LOAD
      val deviceListRef01Ent = client.deviceList(null)
      val deviceListRef01MatchDt0 = new LinkedHashMap[String, Object]()
      val deviceListRef01DataDt0Loaded = deviceListRef01Ent.load(deviceListRef01MatchDt0, null)
      rep.check("device_list.load.nonnull", deviceListRef01DataDt0Loaded != null, "expected load result to be non-null")
    }
  }
}

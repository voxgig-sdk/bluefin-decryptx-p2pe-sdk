// Generated basic-flow test for the device_custody_list entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped DeviceCustodyListTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object DeviceCustodyListEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("device_custody_list.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.deviceCustodyList(null)
      rep.check("device_custody_list.instance", ent != null, "expected non-null device_custody_list entity")
    }

    rep.scope("device_custody_list.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/device_custody_list/DeviceCustodyListTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("device_custody_list01", "DEVICE_CUSTODY_LIST01")
      idmap.put("device_custody_list02", "DEVICE_CUSTODY_LIST02")
      idmap.put("device_custody_list03", "DEVICE_CUSTODY_LIST03")
      idmap.put("device01", "DEVICE01")
      idmap.put("device02", "DEVICE02")
      idmap.put("device03", "DEVICE03")
      idmap.put("device_type01", "DEVICE_TYPE01")
      idmap.put("serial_number01", "SERIAL_NUMBER01")
      val now = System.currentTimeMillis()

      // LIST
      val deviceCustodyListRef01Ent = client.deviceCustodyList(null)
      val deviceCustodyListRef01Match = new LinkedHashMap[String, Object]()
      deviceCustodyListRef01Match.put("device_type", idmap.get("device_type01"))
      deviceCustodyListRef01Match.put("serial_number", idmap.get("serial_number01"))
      val deviceCustodyListRef01ListResult = deviceCustodyListRef01Ent.list(deviceCustodyListRef01Match, null)
      rep.check("device_custody_list.list.islist", deviceCustodyListRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + deviceCustodyListRef01ListResult)
    }
  }
}

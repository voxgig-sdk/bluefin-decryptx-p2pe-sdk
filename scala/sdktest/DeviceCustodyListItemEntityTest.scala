// Generated basic-flow test for the device_custody_list_item entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped DeviceCustodyListItemTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, SdkEntity, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object DeviceCustodyListItemEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("device_custody_list_item.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.deviceCustodyListItem(null)
      rep.check("device_custody_list_item.instance", ent != null, "expected non-null device_custody_list_item entity")
    }

    rep.scope("device_custody_list_item.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/device_custody_list_item/DeviceCustodyListItemTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("device_custody_list_item01", "DEVICE_CUSTODY_LIST_ITEM01")
      idmap.put("device_custody_list_item02", "DEVICE_CUSTODY_LIST_ITEM02")
      idmap.put("device_custody_list_item03", "DEVICE_CUSTODY_LIST_ITEM03")
      idmap.put("device01", "DEVICE01")
      idmap.put("device02", "DEVICE02")
      idmap.put("device03", "DEVICE03")
      idmap.put("device_type01", "DEVICE_TYPE01")
      idmap.put("serial_number01", "SERIAL_NUMBER01")
      val now = System.currentTimeMillis()

      // LIST
      val deviceCustodyListItemRef01Ent = client.deviceCustodyListItem(null)
      val deviceCustodyListItemRef01Match = new LinkedHashMap[String, Object]()
      deviceCustodyListItemRef01Match.put("device_type", idmap.get("device_type01"))
      deviceCustodyListItemRef01Match.put("serial_number", idmap.get("serial_number01"))
      val deviceCustodyListItemRef01ListResult = deviceCustodyListItemRef01Ent.list(deviceCustodyListItemRef01Match, null)
      rep.check("device_custody_list_item.list.islist", deviceCustodyListItemRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + deviceCustodyListItemRef01ListResult)
    }
  }
}

// Generated basic-flow test for the device_type entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped DeviceTypeTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, SdkEntity, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object DeviceTypeEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("device_type.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.deviceType(null)
      rep.check("device_type.instance", ent != null, "expected non-null device_type entity")
    }

    rep.scope("device_type.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/device_type/DeviceTypeTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("device_type01", "DEVICE_TYPE01")
      idmap.put("device_type02", "DEVICE_TYPE02")
      idmap.put("device_type03", "DEVICE_TYPE03")
      val now = System.currentTimeMillis()
      val deviceTypeRef01DataRaw = Struct.items(Helpers.toMapAny(
          Struct.getpath(entityData, "existing.device_type")))
      val deviceTypeRef01Data = Helpers.toMapAny(deviceTypeRef01DataRaw.get(0).get(1))

      // LIST
      val deviceTypeRef01Ent = client.deviceType(null)
      val deviceTypeRef01Match = new LinkedHashMap[String, Object]()
      val deviceTypeRef01ListResult = deviceTypeRef01Ent.list(deviceTypeRef01Match, null)
      rep.check("device_type.list.islist", deviceTypeRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + deviceTypeRef01ListResult)

      // LOAD
      val deviceTypeRef01MatchDt0 = new LinkedHashMap[String, Object]()
      deviceTypeRef01MatchDt0.put("id", deviceTypeRef01Data.get("id"))
      val deviceTypeRef01DataDt0Loaded = deviceTypeRef01Ent.load(deviceTypeRef01MatchDt0, null)
      val deviceTypeRef01DataDt0LoadResult = Helpers.toMapAny(deviceTypeRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("device_type.load.map", deviceTypeRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("device_type.load.id", deviceTypeRef01Data.get("id"), deviceTypeRef01DataDt0LoadResult.get("id"))
    }
  }
}

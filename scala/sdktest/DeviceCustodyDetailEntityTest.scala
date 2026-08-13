// Generated basic-flow test for the device_custody_detail entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped DeviceCustodyDetailTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object DeviceCustodyDetailEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("device_custody_detail.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.deviceCustodyDetail(null)
      rep.check("device_custody_detail.instance", ent != null, "expected non-null device_custody_detail entity")
    }

    rep.scope("device_custody_detail.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/device_custody_detail/DeviceCustodyDetailTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("device_custody_detail01", "DEVICE_CUSTODY_DETAIL01")
      idmap.put("device_custody_detail02", "DEVICE_CUSTODY_DETAIL02")
      idmap.put("device_custody_detail03", "DEVICE_CUSTODY_DETAIL03")
      idmap.put("device01", "DEVICE01")
      idmap.put("device02", "DEVICE02")
      idmap.put("device03", "DEVICE03")
      idmap.put("device_type01", "DEVICE_TYPE01")
      idmap.put("serial_number01", "SERIAL_NUMBER01")
      val now = System.currentTimeMillis()
      val deviceCustodyDetailRef01DataRaw = Struct.items(Helpers.toMapAny(
          Struct.getpath(entityData, "existing.device_custody_detail")))
      val deviceCustodyDetailRef01Data = Helpers.toMapAny(deviceCustodyDetailRef01DataRaw.get(0).get(1))

      // LOAD
      val deviceCustodyDetailRef01Ent = client.deviceCustodyDetail(null)
      val deviceCustodyDetailRef01MatchDt0 = new LinkedHashMap[String, Object]()
      deviceCustodyDetailRef01MatchDt0.put("id", deviceCustodyDetailRef01Data.get("id"))
      val deviceCustodyDetailRef01DataDt0Loaded = deviceCustodyDetailRef01Ent.load(deviceCustodyDetailRef01MatchDt0, null)
      val deviceCustodyDetailRef01DataDt0LoadResult = Helpers.toMapAny(deviceCustodyDetailRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("device_custody_detail.load.map", deviceCustodyDetailRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("device_custody_detail.load.id", deviceCustodyDetailRef01Data.get("id"), deviceCustodyDetailRef01DataDt0LoadResult.get("id"))
    }
  }
}

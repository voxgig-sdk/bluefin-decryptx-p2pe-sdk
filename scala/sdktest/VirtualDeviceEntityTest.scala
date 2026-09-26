// Generated basic-flow test for the virtual_device entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped VirtualDeviceTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, SdkEntity, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object VirtualDeviceEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("virtual_device.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.virtualDevice(null)
      rep.check("virtual_device.instance", ent != null, "expected non-null virtual_device entity")
    }

    rep.scope("virtual_device.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/virtual_device/VirtualDeviceTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("virtual_device01", "VIRTUAL_DEVICE01")
      idmap.put("virtual_device02", "VIRTUAL_DEVICE02")
      idmap.put("virtual_device03", "VIRTUAL_DEVICE03")
      val now = System.currentTimeMillis()
      val virtualDeviceRef01DataRaw = Struct.items(Helpers.toMapAny(
          Struct.getpath(entityData, "existing.virtual_device")))
      val virtualDeviceRef01Data = Helpers.toMapAny(virtualDeviceRef01DataRaw.get(0).get(1))

      // LOAD
      val virtualDeviceRef01Ent = client.virtualDevice(null)
      val virtualDeviceRef01MatchDt0 = new LinkedHashMap[String, Object]()
      virtualDeviceRef01MatchDt0.put("id", virtualDeviceRef01Data.get("id"))
      val virtualDeviceRef01DataDt0Loaded = virtualDeviceRef01Ent.load(virtualDeviceRef01MatchDt0, null)
      val virtualDeviceRef01DataDt0LoadResult = Helpers.toMapAny(virtualDeviceRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("virtual_device.load.map", virtualDeviceRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("virtual_device.load.id", virtualDeviceRef01Data.get("id"), virtualDeviceRef01DataDt0LoadResult.get("id"))
    }
  }
}

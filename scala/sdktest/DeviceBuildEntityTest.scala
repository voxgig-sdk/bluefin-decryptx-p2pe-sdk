// Generated basic-flow test for the device_build entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped DeviceBuildTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, SdkEntity, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object DeviceBuildEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("device_build.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.deviceBuild(null)
      rep.check("device_build.instance", ent != null, "expected non-null device_build entity")
    }

    rep.scope("device_build.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/device_build/DeviceBuildTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("device_build01", "DEVICE_BUILD01")
      idmap.put("device_build02", "DEVICE_BUILD02")
      idmap.put("device_build03", "DEVICE_BUILD03")
      val now = System.currentTimeMillis()
      val deviceBuildRef01DataRaw = Struct.items(Helpers.toMapAny(
          Struct.getpath(entityData, "existing.device_build")))
      val deviceBuildRef01Data = Helpers.toMapAny(deviceBuildRef01DataRaw.get(0).get(1))

      // LIST
      val deviceBuildRef01Ent = client.deviceBuild(null)
      val deviceBuildRef01Match = new LinkedHashMap[String, Object]()
      val deviceBuildRef01ListResult = deviceBuildRef01Ent.list(deviceBuildRef01Match, null)
      rep.check("device_build.list.islist", deviceBuildRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + deviceBuildRef01ListResult)

      // LOAD
      val deviceBuildRef01MatchDt0 = new LinkedHashMap[String, Object]()
      deviceBuildRef01MatchDt0.put("id", deviceBuildRef01Data.get("id"))
      val deviceBuildRef01DataDt0Loaded = deviceBuildRef01Ent.load(deviceBuildRef01MatchDt0, null)
      val deviceBuildRef01DataDt0LoadResult = Helpers.toMapAny(deviceBuildRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("device_build.load.map", deviceBuildRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("device_build.load.id", deviceBuildRef01Data.get("id"), deviceBuildRef01DataDt0LoadResult.get("id"))
    }
  }
}

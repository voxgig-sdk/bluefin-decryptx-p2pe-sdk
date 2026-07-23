// Generated basic-flow test for the device entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped DeviceTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object DeviceEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("device.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.device(null)
      rep.check("device.instance", ent != null, "expected non-null device entity")
    }

    rep.scope("device.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/device/DeviceTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("device01", "DEVICE01")
      idmap.put("device02", "DEVICE02")
      idmap.put("device03", "DEVICE03")
      idmap.put("serial_number01", "SERIAL_NUMBER01")
      val now = System.currentTimeMillis()

      // CREATE
      val deviceRef01Ent = client.device(null)
      var deviceRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.device"), "device_ref01"))
      deviceRef01Data.put("serial_number", idmap.get("serial_number01"))
      val deviceRef01DataResult = deviceRef01Ent.create(deviceRef01Data, null)
      deviceRef01Data = Helpers.toMapAny(deviceRef01DataResult)
      rep.check("device.create.map", deviceRef01Data != null, "expected create result to be a map")
      rep.check("device.create.id", deviceRef01Data != null && deviceRef01Data.get("id") != null, "expected created entity to have an id")

      // LIST
      val deviceRef01Match = new LinkedHashMap[String, Object]()
      val deviceRef01ListResult = deviceRef01Ent.list(deviceRef01Match, null)
      rep.check("device.list.islist", deviceRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + deviceRef01ListResult)
      val deviceRef01List = deviceRef01ListResult.asInstanceOf[JList[Object]]
      val deviceRef01ListFound = Struct.select(
          SdkTestSupport.entityListToData(deviceRef01List), SdkTestSupport.om("id" -> deviceRef01Data.get("id")))
      rep.check("device.list.exists", !Struct.isempty(deviceRef01ListFound), "expected to find created entity in list")

      // LOAD
      val deviceRef01MatchDt0 = new LinkedHashMap[String, Object]()
      deviceRef01MatchDt0.put("id", deviceRef01Data.get("id"))
      val deviceRef01DataDt0Loaded = deviceRef01Ent.load(deviceRef01MatchDt0, null)
      val deviceRef01DataDt0LoadResult = Helpers.toMapAny(deviceRef01DataDt0Loaded)
      rep.check("device.load.map", deviceRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("device.load.id", deviceRef01Data.get("id"), deviceRef01DataDt0LoadResult.get("id"))
    }
  }
}

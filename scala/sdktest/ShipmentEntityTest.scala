// Generated basic-flow test for the shipment entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped ShipmentTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object ShipmentEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("shipment.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.shipment(null)
      rep.check("shipment.instance", ent != null, "expected non-null shipment entity")
    }

    rep.scope("shipment.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/shipment/ShipmentTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("shipment01", "SHIPMENT01")
      idmap.put("shipment02", "SHIPMENT02")
      idmap.put("shipment03", "SHIPMENT03")
      val now = System.currentTimeMillis()

      // CREATE
      val shipmentRef01Ent = client.shipment(null)
      var shipmentRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.shipment"), "shipment_ref01"))
      val shipmentRef01DataResult = shipmentRef01Ent.create(shipmentRef01Data, null)
      shipmentRef01Data = Helpers.toMapAny(shipmentRef01DataResult match { case e: SdkEntity => e.data(); case o => o })
      rep.check("shipment.create.map", shipmentRef01Data != null, "expected create result to be a map")
      rep.check("shipment.create.id", shipmentRef01Data != null && shipmentRef01Data.get("id") != null, "expected created entity to have an id")

      // LIST
      val shipmentRef01Match = new LinkedHashMap[String, Object]()
      val shipmentRef01ListResult = shipmentRef01Ent.list(shipmentRef01Match, null)
      rep.check("shipment.list.islist", shipmentRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + shipmentRef01ListResult)
      val shipmentRef01List = shipmentRef01ListResult.asInstanceOf[JList[Object]]
      val shipmentRef01ListFound = Struct.select(
          SdkTestSupport.entityListToData(shipmentRef01List), SdkTestSupport.om("id" -> shipmentRef01Data.get("id")))
      rep.check("shipment.list.exists", !Struct.isempty(shipmentRef01ListFound), "expected to find created entity in list")

      // LOAD
      val shipmentRef01MatchDt0 = new LinkedHashMap[String, Object]()
      shipmentRef01MatchDt0.put("id", shipmentRef01Data.get("id"))
      val shipmentRef01DataDt0Loaded = shipmentRef01Ent.load(shipmentRef01MatchDt0, null)
      val shipmentRef01DataDt0LoadResult = Helpers.toMapAny(shipmentRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("shipment.load.map", shipmentRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("shipment.load.id", shipmentRef01Data.get("id"), shipmentRef01DataDt0LoadResult.get("id"))
    }
  }
}

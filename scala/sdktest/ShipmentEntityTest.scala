// Generated basic-flow test for the shipment entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped ShipmentTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Config, Context, Helpers, SdkEntity, SdkError, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.feature.BaseFeature
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object ShipmentEntityTest {

  import SdkTestSupport.{B, I, jl, om}

  private def hasFeature(name: String): Boolean = {
    val fm = Helpers.toMapAny(Config.sharedConfig().get("feature"))
    fm != null && fm.get(name) != null
  }

  final class FailHook extends BaseFeature("failhook", "0.0.1", true) {
    var unexpected = 0
    override def preSpec(ctx: Context): Unit = throw new RuntimeException("shipment hook failed")
    override def preUnexpected(ctx: Context): Unit = unexpected += 1
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("shipment.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.shipment(null)
      rep.check("shipment.instance", ent != null, "expected non-null shipment entity")
    }

    rep.scope("shipment.stream.error") {
      val offline = om("net" -> om("offline" -> B(true)))
      val err = try {
        BluefinDecryptxP2peSDK.testSDK(offline, null).shipment(null).stream("list", null, null).toList
        null
      } catch { case e: RuntimeException => e }
      rep.check("shipment.stream.error", err != null && String.valueOf(err.getMessage).contains("offline"),
        "expected the transport failure to raise from the stream, got " + err)

      BluefinDecryptxP2peSDK.testSDK(offline, null).shipment(null)
        .stream("list", null, om("ctrl" -> om("throw" -> B(false)))).toList

      if (hasFeature("rbac")) {
        val denied = BluefinDecryptxP2peSDK.testSDK(null,
          om("feature" -> om("rbac" -> om("active" -> B(true), "deny" -> B(true)))))
        val denyerr = try {
          denied.shipment(null).stream("list", null, null).toList
          null
        } catch { case e: SdkError => e }
        rep.check("shipment.stream.denied", denyerr != null && "rbac_denied" == denyerr.code,
          "expected the rbac denial to raise from the stream, got " + denyerr)
      }
    }

    rep.scope("shipment.stream.ctrl") {
      val explain = new LinkedHashMap[String, Object]()
      val ctrl = om("explain" -> explain)
      BluefinDecryptxP2peSDK.testSDK().shipment(null).stream("list", null, om("ctrl" -> ctrl)).toList
      rep.check("shipment.stream.ctrl", 1 == ctrl.size() && (explain eq ctrl.get("explain")),
        "the stream changed the caller's ctrl")
      rep.check("shipment.stream.explain", !explain.isEmpty(), "the caller's explain record was not filled")
    }

    rep.scope("shipment.unexpected") {
      val hook = new FailHook()
      val client = new BluefinDecryptxP2peSDK(om("feature" -> om("test" -> om("active" -> B(true))), "extend" -> jl(hook)))
      val err = try {
        client.shipment(null).list(null, null)
        null
      } catch { case e: RuntimeException => e }
      rep.check("shipment.unexpected.raise", err != null && String.valueOf(err.getMessage).contains("hook failed"),
        "expected the hook's failure, got " + err)
      rep.check("shipment.unexpected.fired", hook.unexpected > 0, "PreUnexpected did not fire")

      val fired = hook.unexpected
      client.shipment(null).list(null, om("throw" -> B(false)))
      rep.check("shipment.unexpected.nothrow", hook.unexpected > fired,
        "PreUnexpected did not fire under throw false")
    }

    rep.scope("shipment.validate") {
      if (hasFeature("validate")) {
        val client = BluefinDecryptxP2peSDK.testSDK(null, om("feature" -> om("validate" -> om("active" -> B(true)))))
        val err = try {
          client.shipment(null).list(om("kif" -> I(1)), null)
          null
        } catch { case e: SdkError => e }
        rep.check("shipment.validate", err != null && "validate_failed" == err.code,
          "expected validate_failed, got " + err)
      }
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

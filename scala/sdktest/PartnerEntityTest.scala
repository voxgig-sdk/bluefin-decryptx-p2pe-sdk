// Generated basic-flow test for the partner entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped PartnerTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Config, Context, Helpers, SdkEntity, SdkError, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.feature.BaseFeature
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object PartnerEntityTest {

  import SdkTestSupport.{B, I, jl, om}

  private def hasFeature(name: String): Boolean = {
    val fm = Helpers.toMapAny(Config.sharedConfig().get("feature"))
    fm != null && fm.get(name) != null
  }

  final class FailHook extends BaseFeature("failhook", "0.0.1", true) {
    var unexpected = 0
    override def preSpec(ctx: Context): Unit = throw new RuntimeException("partner hook failed")
    override def preUnexpected(ctx: Context): Unit = unexpected += 1
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("partner.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.partner(null)
      rep.check("partner.instance", ent != null, "expected non-null partner entity")
    }

    rep.scope("partner.stream.error") {
      val offline = om("net" -> om("offline" -> B(true)))
      val err = try {
        BluefinDecryptxP2peSDK.testSDK(offline, null).partner(null).stream("list", null, null).toList
        null
      } catch { case e: RuntimeException => e }
      rep.check("partner.stream.error", err != null && String.valueOf(err.getMessage).contains("offline"),
        "expected the transport failure to raise from the stream, got " + err)

      BluefinDecryptxP2peSDK.testSDK(offline, null).partner(null)
        .stream("list", null, om("ctrl" -> om("throw" -> B(false)))).toList

      if (hasFeature("rbac")) {
        val denied = BluefinDecryptxP2peSDK.testSDK(null,
          om("feature" -> om("rbac" -> om("active" -> B(true), "deny" -> B(true)))))
        val denyerr = try {
          denied.partner(null).stream("list", null, null).toList
          null
        } catch { case e: SdkError => e }
        rep.check("partner.stream.denied", denyerr != null && "rbac_denied" == denyerr.code,
          "expected the rbac denial to raise from the stream, got " + denyerr)
      }
    }

    rep.scope("partner.stream.ctrl") {
      val explain = new LinkedHashMap[String, Object]()
      val ctrl = om("explain" -> explain)
      BluefinDecryptxP2peSDK.testSDK().partner(null).stream("list", null, om("ctrl" -> ctrl)).toList
      rep.check("partner.stream.ctrl", 1 == ctrl.size() && (explain eq ctrl.get("explain")),
        "the stream changed the caller's ctrl")
      rep.check("partner.stream.explain", !explain.isEmpty(), "the caller's explain record was not filled")
    }

    rep.scope("partner.unexpected") {
      val hook = new FailHook()
      val client = new BluefinDecryptxP2peSDK(om("feature" -> om("test" -> om("active" -> B(true))), "extend" -> jl(hook)))
      val err = try {
        client.partner(null).list(null, null)
        null
      } catch { case e: RuntimeException => e }
      rep.check("partner.unexpected.raise", err != null && String.valueOf(err.getMessage).contains("hook failed"),
        "expected the hook's failure, got " + err)
      rep.check("partner.unexpected.fired", hook.unexpected > 0, "PreUnexpected did not fire")

      val fired = hook.unexpected
      client.partner(null).list(null, om("throw" -> B(false)))
      rep.check("partner.unexpected.nothrow", hook.unexpected > fired,
        "PreUnexpected did not fire under throw false")
    }

    rep.scope("partner.validate") {
      if (hasFeature("validate")) {
        val client = BluefinDecryptxP2peSDK.testSDK(null, om("feature" -> om("validate" -> om("active" -> B(true)))))
        val err = try {
          client.partner(null).list(om("partner" -> I(1)), null)
          null
        } catch { case e: SdkError => e }
        rep.check("partner.validate", err != null && "validate_failed" == err.code,
          "expected validate_failed, got " + err)
      }
    }

    rep.scope("partner.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/partner/PartnerTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("partner01", "PARTNER01")
      idmap.put("partner02", "PARTNER02")
      idmap.put("partner03", "PARTNER03")
      val now = System.currentTimeMillis()

      // CREATE
      val partnerRef01Ent = client.partner(null)
      var partnerRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.partner"), "partner_ref01"))
      val partnerRef01DataResult = partnerRef01Ent.create(partnerRef01Data, null)
      partnerRef01Data = Helpers.toMapAny(partnerRef01DataResult match { case e: SdkEntity => e.data(); case o => o })
      rep.check("partner.create.map", partnerRef01Data != null, "expected create result to be a map")
      rep.check("partner.create.id", partnerRef01Data != null && partnerRef01Data.get("id") != null, "expected created entity to have an id")

      // LIST
      val partnerRef01Match = new LinkedHashMap[String, Object]()
      val partnerRef01ListResult = partnerRef01Ent.list(partnerRef01Match, null)
      rep.check("partner.list.islist", partnerRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + partnerRef01ListResult)
      val partnerRef01List = partnerRef01ListResult.asInstanceOf[JList[Object]]
      val partnerRef01ListFound = Struct.select(
          SdkTestSupport.entityListToData(partnerRef01List), SdkTestSupport.om("id" -> partnerRef01Data.get("id")))
      rep.check("partner.list.exists", !Struct.isempty(partnerRef01ListFound), "expected to find created entity in list")

      // LOAD
      val partnerRef01MatchDt0 = new LinkedHashMap[String, Object]()
      partnerRef01MatchDt0.put("id", partnerRef01Data.get("id"))
      val partnerRef01DataDt0Loaded = partnerRef01Ent.load(partnerRef01MatchDt0, null)
      val partnerRef01DataDt0LoadResult = Helpers.toMapAny(partnerRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("partner.load.map", partnerRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("partner.load.id", partnerRef01Data.get("id"), partnerRef01DataDt0LoadResult.get("id"))
    }
  }
}

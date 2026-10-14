// Generated basic-flow test for the kif entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped KifTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Config, Context, Helpers, SdkEntity, SdkError, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.feature.BaseFeature
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object KifEntityTest {

  import SdkTestSupport.{B, I, jl, om}

  private def hasFeature(name: String): Boolean = {
    val fm = Helpers.toMapAny(Config.sharedConfig().get("feature"))
    fm != null && fm.get(name) != null
  }

  final class FailHook extends BaseFeature("failhook", "0.0.1", true) {
    var unexpected = 0
    override def preSpec(ctx: Context): Unit = throw new RuntimeException("kif hook failed")
    override def preUnexpected(ctx: Context): Unit = unexpected += 1
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("kif.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.kif(null)
      rep.check("kif.instance", ent != null, "expected non-null kif entity")
    }

    rep.scope("kif.stream.error") {
      val offline = om("net" -> om("offline" -> B(true)))
      val err = try {
        BluefinDecryptxP2peSDK.testSDK(offline, null).kif(null).stream("list", null, null).toList
        null
      } catch { case e: RuntimeException => e }
      rep.check("kif.stream.error", err != null && String.valueOf(err.getMessage).contains("offline"),
        "expected the transport failure to raise from the stream, got " + err)

      BluefinDecryptxP2peSDK.testSDK(offline, null).kif(null)
        .stream("list", null, om("ctrl" -> om("throw" -> B(false)))).toList

      if (hasFeature("rbac")) {
        val denied = BluefinDecryptxP2peSDK.testSDK(null,
          om("feature" -> om("rbac" -> om("active" -> B(true), "deny" -> B(true)))))
        val denyerr = try {
          denied.kif(null).stream("list", null, null).toList
          null
        } catch { case e: SdkError => e }
        rep.check("kif.stream.denied", denyerr != null && "rbac_denied" == denyerr.code,
          "expected the rbac denial to raise from the stream, got " + denyerr)
      }
    }

    rep.scope("kif.stream.ctrl") {
      val explain = new LinkedHashMap[String, Object]()
      val ctrl = om("explain" -> explain)
      BluefinDecryptxP2peSDK.testSDK().kif(null).stream("list", null, om("ctrl" -> ctrl)).toList
      rep.check("kif.stream.ctrl", 1 == ctrl.size() && (explain eq ctrl.get("explain")),
        "the stream changed the caller's ctrl")
      rep.check("kif.stream.explain", !explain.isEmpty(), "the caller's explain record was not filled")
    }

    rep.scope("kif.unexpected") {
      val hook = new FailHook()
      val client = new BluefinDecryptxP2peSDK(om("feature" -> om("test" -> om("active" -> B(true))), "extend" -> jl(hook)))
      val err = try {
        client.kif(null).list(null, null)
        null
      } catch { case e: RuntimeException => e }
      rep.check("kif.unexpected.raise", err != null && String.valueOf(err.getMessage).contains("hook failed"),
        "expected the hook's failure, got " + err)
      rep.check("kif.unexpected.fired", hook.unexpected > 0, "PreUnexpected did not fire")

      val fired = hook.unexpected
      client.kif(null).list(null, om("throw" -> B(false)))
      rep.check("kif.unexpected.nothrow", hook.unexpected > fired,
        "PreUnexpected did not fire under throw false")
    }

    rep.scope("kif.validate") {
      if (hasFeature("validate")) {
        val client = BluefinDecryptxP2peSDK.testSDK(null, om("feature" -> om("validate" -> om("active" -> B(true)))))
        val err = try {
          client.kif(null).list(om("id" -> "x"), null)
          null
        } catch { case e: SdkError => e }
        rep.check("kif.validate", err != null && "validate_failed" == err.code,
          "expected validate_failed, got " + err)
      }
    }

    rep.scope("kif.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/kif/KifTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("kif01", "KIF01")
      idmap.put("kif02", "KIF02")
      idmap.put("kif03", "KIF03")
      val now = System.currentTimeMillis()

      // LIST
      val kifRef01Ent = client.kif(null)
      val kifRef01Match = new LinkedHashMap[String, Object]()
      val kifRef01ListResult = kifRef01Ent.list(kifRef01Match, null)
      rep.check("kif.list.islist", kifRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + kifRef01ListResult)
    }
  }
}

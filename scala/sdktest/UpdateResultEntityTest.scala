// Generated basic-flow test for the update_result entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped UpdateResultTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Config, Context, Helpers, SdkEntity, SdkError, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.feature.BaseFeature
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object UpdateResultEntityTest {

  import SdkTestSupport.{B, I, jl, om}

  private def hasFeature(name: String): Boolean = {
    val fm = Helpers.toMapAny(Config.sharedConfig().get("feature"))
    fm != null && fm.get(name) != null
  }

  final class FailHook extends BaseFeature("failhook", "0.0.1", true) {
    var unexpected = 0
    override def preSpec(ctx: Context): Unit = throw new RuntimeException("update_result hook failed")
    override def preUnexpected(ctx: Context): Unit = unexpected += 1
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("update_result.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.updateResult(null)
      rep.check("update_result.instance", ent != null, "expected non-null update_result entity")
    }

    rep.scope("update_result.stream.error") {
      val offline = om("net" -> om("offline" -> B(true)))
      val err = try {
        BluefinDecryptxP2peSDK.testSDK(offline, null).updateResult(null).stream("list", null, null).toList
        null
      } catch { case e: RuntimeException => e }
      rep.check("update_result.stream.error", err != null && String.valueOf(err.getMessage).contains("offline"),
        "expected the transport failure to raise from the stream, got " + err)

      BluefinDecryptxP2peSDK.testSDK(offline, null).updateResult(null)
        .stream("list", null, om("ctrl" -> om("throw" -> B(false)))).toList

      if (hasFeature("rbac")) {
        val denied = BluefinDecryptxP2peSDK.testSDK(null,
          om("feature" -> om("rbac" -> om("active" -> B(true), "deny" -> B(true)))))
        val denyerr = try {
          denied.updateResult(null).stream("list", null, null).toList
          null
        } catch { case e: SdkError => e }
        rep.check("update_result.stream.denied", denyerr != null && "rbac_denied" == denyerr.code,
          "expected the rbac denial to raise from the stream, got " + denyerr)
      }
    }

    rep.scope("update_result.stream.ctrl") {
      val explain = new LinkedHashMap[String, Object]()
      val ctrl = om("explain" -> explain)
      BluefinDecryptxP2peSDK.testSDK().updateResult(null).stream("list", null, om("ctrl" -> ctrl)).toList
      rep.check("update_result.stream.ctrl", 1 == ctrl.size() && (explain eq ctrl.get("explain")),
        "the stream changed the caller's ctrl")
      rep.check("update_result.stream.explain", !explain.isEmpty(), "the caller's explain record was not filled")
    }

    rep.scope("update_result.unexpected") {
      val hook = new FailHook()
      val client = new BluefinDecryptxP2peSDK(om("feature" -> om("test" -> om("active" -> B(true))), "extend" -> jl(hook)))
      val err = try {
        client.updateResult(null).list(null, null)
        null
      } catch { case e: RuntimeException => e }
      rep.check("update_result.unexpected.raise", err != null && String.valueOf(err.getMessage).contains("hook failed"),
        "expected the hook's failure, got " + err)
      rep.check("update_result.unexpected.fired", hook.unexpected > 0, "PreUnexpected did not fire")

      val fired = hook.unexpected
      client.updateResult(null).list(null, om("throw" -> B(false)))
      rep.check("update_result.unexpected.nothrow", hook.unexpected > fired,
        "PreUnexpected did not fire under throw false")
    }

    rep.scope("update_result.validate") {
      if (hasFeature("validate")) {
        val client = BluefinDecryptxP2peSDK.testSDK(null, om("feature" -> om("validate" -> om("active" -> B(true)))))
        val err = try {
          client.updateResult(null).list(om("client" -> I(1)), null)
          null
        } catch { case e: SdkError => e }
        rep.check("update_result.validate", err != null && "validate_failed" == err.code,
          "expected validate_failed, got " + err)
      }
    }

    rep.scope("update_result.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/update_result/UpdateResultTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("update_result01", "UPDATE_RESULT01")
      idmap.put("update_result02", "UPDATE_RESULT02")
      idmap.put("update_result03", "UPDATE_RESULT03")
      val now = System.currentTimeMillis()

      // CREATE
      val updateResultRef01Ent = client.updateResult(null)
      var updateResultRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.update_result"), "update_result_ref01"))
      val updateResultRef01DataResult = updateResultRef01Ent.create(updateResultRef01Data, null)
      updateResultRef01Data = Helpers.toMapAny(updateResultRef01DataResult match { case e: SdkEntity => e.data(); case o => o })
      rep.check("update_result.create.map", updateResultRef01Data != null, "expected create result to be a map")
      rep.check("update_result.create.id", updateResultRef01Data != null && updateResultRef01Data.get("id") != null, "expected created entity to have an id")

      // LIST
      val updateResultRef01Match = new LinkedHashMap[String, Object]()
      val updateResultRef01ListResult = updateResultRef01Ent.list(updateResultRef01Match, null)
      rep.check("update_result.list.islist", updateResultRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + updateResultRef01ListResult)
      val updateResultRef01List = updateResultRef01ListResult.asInstanceOf[JList[Object]]
      val updateResultRef01ListFound = Struct.select(
          SdkTestSupport.entityListToData(updateResultRef01List), SdkTestSupport.om("id" -> updateResultRef01Data.get("id")))
      rep.check("update_result.list.exists", !Struct.isempty(updateResultRef01ListFound), "expected to find created entity in list")

      // UPDATE
      val updateResultRef01DataUp0Up = new LinkedHashMap[String, Object]()
      updateResultRef01DataUp0Up.put("id", updateResultRef01Data.get("id"))
      val updateResultRef01MarkdefUp0Name = "address1"
      val updateResultRef01MarkdefUp0Value = "Mark01-update_result_ref01_" + now
      updateResultRef01DataUp0Up.put(updateResultRef01MarkdefUp0Name, updateResultRef01MarkdefUp0Value)
      val updateResultRef01ResdataUp0Result = updateResultRef01Ent.update(updateResultRef01DataUp0Up, null)
      val updateResultRef01ResdataUp0 = Helpers.toMapAny(updateResultRef01ResdataUp0Result match { case e: SdkEntity => e.data(); case o => o })
      rep.check("update_result.update.map", updateResultRef01ResdataUp0 != null, "expected update result to be a map")
      rep.eq("update_result.update.id", updateResultRef01DataUp0Up.get("id"), updateResultRef01ResdataUp0.get("id"))
      rep.eq("update_result.update.mark", updateResultRef01MarkdefUp0Value, updateResultRef01ResdataUp0.get(updateResultRef01MarkdefUp0Name))
    }
  }
}

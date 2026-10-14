// Generated basic-flow test for the attestation entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped AttestationTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Config, Context, Helpers, SdkEntity, SdkError, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.feature.BaseFeature
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object AttestationEntityTest {

  import SdkTestSupport.{B, I, jl, om}

  private def hasFeature(name: String): Boolean = {
    val fm = Helpers.toMapAny(Config.sharedConfig().get("feature"))
    fm != null && fm.get(name) != null
  }

  final class FailHook extends BaseFeature("failhook", "0.0.1", true) {
    var unexpected = 0
    override def preSpec(ctx: Context): Unit = throw new RuntimeException("attestation hook failed")
    override def preUnexpected(ctx: Context): Unit = unexpected += 1
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("attestation.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.attestation(null)
      rep.check("attestation.instance", ent != null, "expected non-null attestation entity")
    }

    rep.scope("attestation.stream.error") {
      val offline = om("net" -> om("offline" -> B(true)))
      val err = try {
        BluefinDecryptxP2peSDK.testSDK(offline, null).attestation(null).stream("list", null, null).toList
        null
      } catch { case e: RuntimeException => e }
      rep.check("attestation.stream.error", err != null && String.valueOf(err.getMessage).contains("offline"),
        "expected the transport failure to raise from the stream, got " + err)

      BluefinDecryptxP2peSDK.testSDK(offline, null).attestation(null)
        .stream("list", null, om("ctrl" -> om("throw" -> B(false)))).toList

      if (hasFeature("rbac")) {
        val denied = BluefinDecryptxP2peSDK.testSDK(null,
          om("feature" -> om("rbac" -> om("active" -> B(true), "deny" -> B(true)))))
        val denyerr = try {
          denied.attestation(null).stream("list", null, null).toList
          null
        } catch { case e: SdkError => e }
        rep.check("attestation.stream.denied", denyerr != null && "rbac_denied" == denyerr.code,
          "expected the rbac denial to raise from the stream, got " + denyerr)
      }
    }

    rep.scope("attestation.stream.ctrl") {
      val explain = new LinkedHashMap[String, Object]()
      val ctrl = om("explain" -> explain)
      BluefinDecryptxP2peSDK.testSDK().attestation(null).stream("list", null, om("ctrl" -> ctrl)).toList
      rep.check("attestation.stream.ctrl", 1 == ctrl.size() && (explain eq ctrl.get("explain")),
        "the stream changed the caller's ctrl")
      rep.check("attestation.stream.explain", !explain.isEmpty(), "the caller's explain record was not filled")
    }

    rep.scope("attestation.unexpected") {
      val hook = new FailHook()
      val client = new BluefinDecryptxP2peSDK(om("feature" -> om("test" -> om("active" -> B(true))), "extend" -> jl(hook)))
      val err = try {
        client.attestation(null).list(null, null)
        null
      } catch { case e: RuntimeException => e }
      rep.check("attestation.unexpected.raise", err != null && String.valueOf(err.getMessage).contains("hook failed"),
        "expected the hook's failure, got " + err)
      rep.check("attestation.unexpected.fired", hook.unexpected > 0, "PreUnexpected did not fire")

      val fired = hook.unexpected
      client.attestation(null).list(null, om("throw" -> B(false)))
      rep.check("attestation.unexpected.nothrow", hook.unexpected > fired,
        "PreUnexpected did not fire under throw false")
    }

    rep.scope("attestation.validate") {
      if (hasFeature("validate")) {
        val client = BluefinDecryptxP2peSDK.testSDK(null, om("feature" -> om("validate" -> om("active" -> B(true)))))
        val err = try {
          client.attestation(null).list(om("client" -> I(1)), null)
          null
        } catch { case e: SdkError => e }
        rep.check("attestation.validate", err != null && "validate_failed" == err.code,
          "expected validate_failed, got " + err)
      }
    }

    rep.scope("attestation.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/attestation/AttestationTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("attestation01", "ATTESTATION01")
      idmap.put("attestation02", "ATTESTATION02")
      idmap.put("attestation03", "ATTESTATION03")
      val now = System.currentTimeMillis()

      // CREATE
      val attestationRef01Ent = client.attestation(null)
      var attestationRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.attestation"), "attestation_ref01"))
      val attestationRef01DataResult = attestationRef01Ent.create(attestationRef01Data, null)
      attestationRef01Data = Helpers.toMapAny(attestationRef01DataResult match { case e: SdkEntity => e.data(); case o => o })
      rep.check("attestation.create.map", attestationRef01Data != null, "expected create result to be a map")
      rep.check("attestation.create.id", attestationRef01Data != null && attestationRef01Data.get("id") != null, "expected created entity to have an id")

      // LIST
      val attestationRef01Match = new LinkedHashMap[String, Object]()
      val attestationRef01ListResult = attestationRef01Ent.list(attestationRef01Match, null)
      rep.check("attestation.list.islist", attestationRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + attestationRef01ListResult)
      val attestationRef01List = attestationRef01ListResult.asInstanceOf[JList[Object]]
      val attestationRef01ListFound = Struct.select(
          SdkTestSupport.entityListToData(attestationRef01List), SdkTestSupport.om("id" -> attestationRef01Data.get("id")))
      rep.check("attestation.list.exists", !Struct.isempty(attestationRef01ListFound), "expected to find created entity in list")

      // LOAD
      val attestationRef01MatchDt0 = new LinkedHashMap[String, Object]()
      attestationRef01MatchDt0.put("id", attestationRef01Data.get("id"))
      val attestationRef01DataDt0Loaded = attestationRef01Ent.load(attestationRef01MatchDt0, null)
      val attestationRef01DataDt0LoadResult = Helpers.toMapAny(attestationRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("attestation.load.map", attestationRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("attestation.load.id", attestationRef01Data.get("id"), attestationRef01DataDt0LoadResult.get("id"))
    }
  }
}

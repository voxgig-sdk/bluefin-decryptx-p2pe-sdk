// Generated basic-flow test for the attestation entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped AttestationTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object AttestationEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("attestation.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.attestation(null)
      rep.check("attestation.instance", ent != null, "expected non-null attestation entity")
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
      attestationRef01Data = Helpers.toMapAny(attestationRef01DataResult)
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
      val attestationRef01DataDt0LoadResult = Helpers.toMapAny(attestationRef01DataDt0Loaded)
      rep.check("attestation.load.map", attestationRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("attestation.load.id", attestationRef01Data.get("id"), attestationRef01DataDt0LoadResult.get("id"))
    }
  }
}

package voxgig.bluefindecryptxp2pesdk.entity

import voxgig.bluefindecryptxp2pesdk.core.Context
import voxgig.bluefindecryptxp2pesdk.core.Entity
import voxgig.bluefindecryptxp2pesdk.core.Helpers
import voxgig.bluefindecryptxp2pesdk.core.SdkClient
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

/** Attestation entity client for the BluefinDecryptxP2pe SDK. */
@Suppress("UNCHECKED_CAST", "UNUSED_PARAMETER", "UNUSED_VARIABLE")
class AttestationEntity(clientIn: SdkClient, entoptsIn: MutableMap<String, Any?>?) :
  EntityBase("attestation", clientIn, entoptsIn) {

  override fun make(): Entity {
    val opts = LinkedHashMap(this.entopts)
    return AttestationEntity(this.client, opts)
  }


  override fun load(reqmatch: MutableMap<String, Any?>?, ctrl: MutableMap<String, Any?>?): Any? {
    val ctxmap = linkedMapOf<String, Any?>()
    ctxmap["opname"] = "load"
    ctxmap["ctrl"] = ctrl
    ctxmap["match"] = this.match
    ctxmap["data"] = this.data
    ctxmap["reqmatch"] = reqmatch
    val ctx = this.utility.makeContext(ctxmap, this.entctx)

    return runOp(ctx) {
      val result = ctx.result
      if (result != null) {
        if (result.resmatch != null) {
          this.match = result.resmatch!!
        }
        if (result.resdata != null) {
          val d = Helpers.toMapAny(Struct.clone(result.resdata))
          this.data = d ?: linkedMapOf()
        }
      }
    }
  }




  override fun list(reqmatch: MutableMap<String, Any?>?, ctrl: MutableMap<String, Any?>?): Any? {
    val ctxmap = linkedMapOf<String, Any?>()
    ctxmap["opname"] = "list"
    ctxmap["ctrl"] = ctrl
    ctxmap["match"] = this.match
    ctxmap["data"] = this.data
    ctxmap["reqmatch"] = reqmatch
    val ctx = this.utility.makeContext(ctxmap, this.entctx)

    return runOp(ctx) {
      val result = ctx.result
      if (result != null) {
        if (result.resmatch != null) {
          this.match = result.resmatch!!
        }
      }
    }
  }




  override fun create(reqdata: MutableMap<String, Any?>?, ctrl: MutableMap<String, Any?>?): Any? {
    val ctxmap = linkedMapOf<String, Any?>()
    ctxmap["opname"] = "create"
    ctxmap["ctrl"] = ctrl
    ctxmap["match"] = this.match
    ctxmap["data"] = this.data
    ctxmap["reqdata"] = reqdata
    val ctx = this.utility.makeContext(ctxmap, this.entctx)

    return runOp(ctx) {
      val result = ctx.result
      if (result != null) {
        if (result.resdata != null) {
          val d = Helpers.toMapAny(Struct.clone(result.resdata))
          this.data = d ?: linkedMapOf()
        }
      }
    }
  }



  override fun update(req: MutableMap<String, Any?>?, ctrl: MutableMap<String, Any?>?): Any? {
    throw Helpers.unsupportedOp("update", this.name)
  }


  override fun remove(req: MutableMap<String, Any?>?, ctrl: MutableMap<String, Any?>?): Any? {
    throw Helpers.unsupportedOp("remove", this.name)
  }

}

package voxgig.bluefindecryptxp2pesdk.entity

import voxgig.bluefindecryptxp2pesdk.core.Context
import voxgig.bluefindecryptxp2pesdk.core.Entity
import voxgig.bluefindecryptxp2pesdk.core.Helpers
import voxgig.bluefindecryptxp2pesdk.core.SdkClient
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

/** DeviceCustodyDetail entity client for the BluefinDecryptxP2pe SDK. */
@Suppress("UNCHECKED_CAST", "UNUSED_PARAMETER", "UNUSED_VARIABLE")
class DeviceCustodyDetailEntity(clientIn: SdkClient, entoptsIn: MutableMap<String, Any?>?) :
  EntityBase("device_custody_detail", clientIn, entoptsIn) {

  override fun make(): Entity {
    val opts = LinkedHashMap(this.entopts)
    return DeviceCustodyDetailEntity(this.client, opts)
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



  override fun list(req: MutableMap<String, Any?>?, ctrl: MutableMap<String, Any?>?): Any? {
    throw Helpers.unsupportedOp("list", this.name)
  }


  override fun create(req: MutableMap<String, Any?>?, ctrl: MutableMap<String, Any?>?): Any? {
    throw Helpers.unsupportedOp("create", this.name)
  }


  override fun update(req: MutableMap<String, Any?>?, ctrl: MutableMap<String, Any?>?): Any? {
    throw Helpers.unsupportedOp("update", this.name)
  }


  override fun remove(req: MutableMap<String, Any?>?, ctrl: MutableMap<String, Any?>?): Any? {
    throw Helpers.unsupportedOp("remove", this.name)
  }

}

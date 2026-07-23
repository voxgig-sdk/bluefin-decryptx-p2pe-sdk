package voxgig.bluefindecryptxp2pesdk.entity

import java.util.{LinkedHashMap, List => JList, Map => JMap}
import voxgig.bluefindecryptxp2pesdk.core.{Context, Entity, Helpers, SdkClient}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

// Kif entity client for the BluefinDecryptxP2pe SDK.
class KifEntity(client0: SdkClient, entopts0: JMap[String, Object]) extends EntityBase("kif", client0, entopts0) {

  override def make(): Entity = {
    val opts = new LinkedHashMap[String, Object](this.entopts)
    new KifEntity(this.client, opts)
  }

  override def load(req: java.util.Map[String, Object], ctrl: java.util.Map[String, Object]): Object =
    throw Helpers.unsupportedOp("load", this.name)



  override def list(reqmatch: JMap[String, Object], ctrl: JMap[String, Object]): Object = {
    val ctxmap = new LinkedHashMap[String, Object]()
    ctxmap.put("opname", "list")
    ctxmap.put("ctrl", ctrl)
    ctxmap.put("match", this.matchState)
    ctxmap.put("data", this.dataState)
    ctxmap.put("reqmatch", reqmatch)
    val ctx = this.utility.makeContext(ctxmap, this.entctx)

    runOp(ctx, () => {
      if (ctx.result != null) {
        if (ctx.result.resmatch != null) this.matchState = ctx.result.resmatch
      }
    })
  }



  override def create(req: java.util.Map[String, Object], ctrl: java.util.Map[String, Object]): Object =
    throw Helpers.unsupportedOp("create", this.name)


  override def update(req: java.util.Map[String, Object], ctrl: java.util.Map[String, Object]): Object =
    throw Helpers.unsupportedOp("update", this.name)


  override def remove(req: java.util.Map[String, Object], ctrl: java.util.Map[String, Object]): Object =
    throw Helpers.unsupportedOp("remove", this.name)

}

package voxgig.bluefindecryptxp2pesdk.entity

import java.util.{LinkedHashMap, List => JList, Map => JMap}
import voxgig.bluefindecryptxp2pesdk.core.{Context, Entity, Helpers, SdkClient}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

// DeviceRkiActivateResult entity client for the BluefinDecryptxP2pe SDK.
class DeviceRkiActivateResultEntity(client0: SdkClient, entopts0: JMap[String, Object]) extends EntityBase("device_rki_activate_result", client0, entopts0) {

  override def make(): Entity = {
    val opts = new LinkedHashMap[String, Object](this.entopts)
    new DeviceRkiActivateResultEntity(this.client, opts)
  }

  override def load(req: java.util.Map[String, Object], ctrl: java.util.Map[String, Object]): Object =
    throw Helpers.unsupportedOp("load", this.name)


  override def list(req: java.util.Map[String, Object], ctrl: java.util.Map[String, Object]): Object =
    throw Helpers.unsupportedOp("list", this.name)



  override def create(reqdata: JMap[String, Object], ctrl: JMap[String, Object]): Object = {
    val ctxmap = new LinkedHashMap[String, Object]()
    ctxmap.put("opname", "create")
    ctxmap.put("ctrl", ctrl)
    ctxmap.put("match", this.matchState)
    ctxmap.put("data", this.dataState)
    ctxmap.put("reqdata", reqdata)
    val ctx = this.utility.makeContext(ctxmap, this.entctx)

    runOp(ctx, () => {
      if (ctx.result != null) {
        if (ctx.result.resdata != null) {
          val d = Helpers.toMapAny(Struct.clone(ctx.result.resdata))
          this.dataState = if (d == null) new LinkedHashMap[String, Object]() else d
        }
      }
    })
  }



  override def update(req: java.util.Map[String, Object], ctrl: java.util.Map[String, Object]): Object =
    throw Helpers.unsupportedOp("update", this.name)


  override def remove(req: java.util.Map[String, Object], ctrl: java.util.Map[String, Object]): Object =
    throw Helpers.unsupportedOp("remove", this.name)

}

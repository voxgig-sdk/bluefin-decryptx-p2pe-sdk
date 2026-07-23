package voxgig.bluefindecryptxp2pesdk.entity;

import java.util.LinkedHashMap;
import java.util.Map;

import voxgig.bluefindecryptxp2pesdk.core.Context;
import voxgig.bluefindecryptxp2pesdk.core.Entity;
import voxgig.bluefindecryptxp2pesdk.core.Helpers;
import voxgig.bluefindecryptxp2pesdk.core.SdkClient;
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct;

/** CreateResult entity client for the BluefinDecryptxP2pe SDK. */
@SuppressWarnings({"unchecked", "unused"})
public class CreateResultEntity extends EntityBase {

  public CreateResultEntity(SdkClient client, Map<String, Object> entopts) {
    super("create_result", client, entopts);
  }

  @Override
  public Entity make() {
    Map<String, Object> opts = new LinkedHashMap<>(this.entopts);
    return new CreateResultEntity(this.client, opts);
  }

  @Override
  public Object load(Map<String, Object> req, Map<String, Object> ctrl) {
    throw Helpers.unsupportedOp("load", this.name);
  }


  @Override
  public Object list(Map<String, Object> req, Map<String, Object> ctrl) {
    throw Helpers.unsupportedOp("list", this.name);
  }



  @Override
  public Object create(Map<String, Object> reqdata, Map<String, Object> ctrl) {
    Map<String, Object> ctxmap = new LinkedHashMap<>();
    ctxmap.put("opname", "create");
    ctxmap.put("ctrl", ctrl);
    ctxmap.put("match", this.match);
    ctxmap.put("data", this.data);
    ctxmap.put("reqdata", reqdata);
    Context ctx = this.utility.makeContext.apply(ctxmap, this.entctx);

    return runOp(ctx, () -> {
      if (ctx.result != null) {
        if (ctx.result.resdata != null) {
          Map<String, Object> d = Helpers.toMapAny(Struct.clone(ctx.result.resdata));
          this.data = d == null ? new LinkedHashMap<>() : d;
        }
      }
    });
  }



  @Override
  public Object update(Map<String, Object> req, Map<String, Object> ctrl) {
    throw Helpers.unsupportedOp("update", this.name);
  }


  @Override
  public Object remove(Map<String, Object> req, Map<String, Object> ctrl) {
    throw Helpers.unsupportedOp("remove", this.name);
  }

}

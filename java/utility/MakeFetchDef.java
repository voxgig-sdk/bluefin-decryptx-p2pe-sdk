package voxgig.bluefindecryptxp2pesdk.utility;

import java.util.LinkedHashMap;
import java.util.Map;

import voxgig.bluefindecryptxp2pesdk.core.Context;
import voxgig.bluefindecryptxp2pesdk.core.Result;
import voxgig.bluefindecryptxp2pesdk.core.Spec;
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct;

final class MakeFetchDef {

  private MakeFetchDef() {}

  static Map<String, Object> makeFetchDef(Context ctx) {
    Spec spec = ctx.spec;
    if (spec == null) {
      throw ctx.makeError("fetchdef_no_spec",
          "Expected context spec property to be defined.");
    }

    if (ctx.result == null) {
      ctx.result = new Result(new LinkedHashMap<>());
    }

    spec.step = "prepare";

    String url = ctx.utility.makeUrl.apply(ctx);

    spec.url = url;

    Map<String, Object> fetchdef = new LinkedHashMap<>();
    fetchdef.put("url", url);
    fetchdef.put("method", spec.method);
    fetchdef.put("headers", spec.headers);

    if (spec.body != null) {
      if (spec.body instanceof Map) {
        fetchdef.put("body", Struct.jsonify(spec.body));
      }
      else {
        fetchdef.put("body", spec.body);
      }
    }

    return fetchdef;
  }
}

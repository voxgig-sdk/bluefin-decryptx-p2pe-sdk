package voxgig.bluefindecryptxp2pesdk.utility;

import java.util.Map;

import voxgig.bluefindecryptxp2pesdk.core.Context;

final class MakeContext {

  private MakeContext() {}

  static Context makeContext(Map<String, Object> ctxmap, Context basectx) {
    return new Context(ctxmap, basectx);
  }
}

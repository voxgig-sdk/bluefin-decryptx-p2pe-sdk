package voxgig.bluefindecryptxp2pesdk.utility;

import java.util.ArrayList;
import java.util.List;

import voxgig.bluefindecryptxp2pesdk.core.Context;
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct;

@SuppressWarnings({"unchecked"})
final class PreparePath {

  private PreparePath() {}

  static String preparePath(Context ctx) {
    List<Object> parts = null;
    Object p = Struct.getprop(ctx.point, "parts");
    if (p instanceof List) {
      parts = (List<Object>) p;
    }
    if (parts == null) {
      parts = new ArrayList<>();
    }

    return Struct.join(parts, "/", true);
  }
}

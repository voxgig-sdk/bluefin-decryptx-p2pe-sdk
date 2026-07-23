package voxgig.bluefindecryptxp2pesdk.utility;

import voxgig.bluefindecryptxp2pesdk.core.Context;
import voxgig.bluefindecryptxp2pesdk.core.Response;
import voxgig.bluefindecryptxp2pesdk.core.Result;

final class ResultBody {

  private ResultBody() {}

  static Result resultBody(Context ctx) {
    Response response = ctx.response;
    Result result = ctx.result;

    if (result != null) {
      if (response != null && response.jsonFunc != null && response.body != null) {
        result.body = response.jsonFunc.get();
      }
    }

    return result;
  }
}

# BluefinDecryptxP2pe SDK utility: prepare_body
require_relative 'media'
module BluefinDecryptxP2peUtilities
  PrepareBody = ->(ctx) {
    return nil unless ctx.op.input == "data"
    return BluefinDecryptxP2peUtilities.raw_body(ctx.reqdata) if BluefinDecryptxP2peUtilities.raw_request?(ctx.point)
    ctx.utility.transform_request.call(ctx)
  }
end

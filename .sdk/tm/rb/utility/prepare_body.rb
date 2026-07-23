# BluefinDecryptxP2pe SDK utility: prepare_body
module BluefinDecryptxP2peUtilities
  PrepareBody = ->(ctx) {
    ctx.op.input == "data" ? ctx.utility.transform_request.call(ctx) : nil
  }
end

# BluefinDecryptxP2pe SDK utility: make_context
require_relative '../core/context'
module BluefinDecryptxP2peUtilities
  MakeContext = ->(ctxmap, basectx) {
    BluefinDecryptxP2peContext.new(ctxmap, basectx)
  }
end

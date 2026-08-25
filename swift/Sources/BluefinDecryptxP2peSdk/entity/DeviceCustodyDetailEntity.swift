// DeviceCustodyDetail entity client for the BluefinDecryptxP2pe SDK.

import Foundation

public final class DeviceCustodyDetailEntity: BluefinDecryptxP2peEntityBase {
  public init(_ client: BluefinDecryptxP2peSDK, _ entopts: VMap? = nil) {
    super.init(client, entopts, "device_custody_detail")
  }

  public override func make() -> Entity {
    return DeviceCustodyDetailEntity(client, cloneOpts())
  }

  public override func load(_ reqmatch: VMap?, _ ctrl: VMap?) throws -> Value {
    var ctxmap: [String: Any?] = ["opname": "load", "match": match, "data": data]
    if let ctrl = ctrl { ctxmap["ctrl"] = ctrl }
    if let reqmatch = reqmatch { ctxmap["reqmatch"] = reqmatch }
    let ctx = utility.makeContext(ctxmap, entctx)
  
    return try runOp(ctx) {
      if let result = ctx.result {
        if let rm = result.resmatch { self.match = rm }
        if !isNil(result.resdata) {
          self.data = clone(result.resdata).asMap ?? VMap()
        }
      }
    }
  }

  // (list not defined by this API - base class throws unsupportedOp)

  // (create not defined by this API - base class throws unsupportedOp)

  // (update not defined by this API - base class throws unsupportedOp)

  // (remove not defined by this API - base class throws unsupportedOp)
}

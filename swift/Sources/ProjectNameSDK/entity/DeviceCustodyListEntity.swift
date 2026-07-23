// DeviceCustodyList entity client for the BluefinDecryptxP2pe SDK.

import Foundation

public final class DeviceCustodyListEntity: BluefinDecryptxP2peEntityBase {
  public init(_ client: BluefinDecryptxP2peSDK, _ entopts: VMap? = nil) {
    super.init(client, entopts, "device_custody_list")
  }

  public override func make() -> Entity {
    return DeviceCustodyListEntity(client, cloneOpts())
  }

  // (load not defined by this API - base class throws unsupportedOp)

  public override func list(_ reqmatch: VMap?, _ ctrl: VMap?) throws -> Value {
    var ctxmap: [String: Any?] = ["opname": "list", "match": match, "data": data]
    if let ctrl = ctrl { ctxmap["ctrl"] = ctrl }
    if let reqmatch = reqmatch { ctxmap["reqmatch"] = reqmatch }
    let ctx = utility.makeContext(ctxmap, entctx)
  
    return try runOp(ctx) {
      if let result = ctx.result {
        if let rm = result.resmatch { self.match = rm }
      }
    }
  }

  // (create not defined by this API - base class throws unsupportedOp)

  // (update not defined by this API - base class throws unsupportedOp)

  // (remove not defined by this API - base class throws unsupportedOp)
}

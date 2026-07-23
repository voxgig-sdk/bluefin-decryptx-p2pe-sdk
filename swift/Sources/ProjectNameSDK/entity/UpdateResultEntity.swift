// UpdateResult entity client for the BluefinDecryptxP2pe SDK.

import Foundation

public final class UpdateResultEntity: BluefinDecryptxP2peEntityBase {
  public init(_ client: BluefinDecryptxP2peSDK, _ entopts: VMap? = nil) {
    super.init(client, entopts, "update_result")
  }

  public override func make() -> Entity {
    return UpdateResultEntity(client, cloneOpts())
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

  public override func create(_ reqdata: VMap?, _ ctrl: VMap?) throws -> Value {
    var ctxmap: [String: Any?] = ["opname": "create", "match": match, "data": data]
    if let ctrl = ctrl { ctxmap["ctrl"] = ctrl }
    if let reqdata = reqdata { ctxmap["reqdata"] = reqdata }
    let ctx = utility.makeContext(ctxmap, entctx)
  
    return try runOp(ctx) {
      if let result = ctx.result {
        if !isNil(result.resdata) {
          self.data = clone(result.resdata).asMap ?? VMap()
        }
      }
    }
  }

  public override func update(_ reqdata: VMap?, _ ctrl: VMap?) throws -> Value {
    var ctxmap: [String: Any?] = ["opname": "update", "match": match, "data": data]
    if let ctrl = ctrl { ctxmap["ctrl"] = ctrl }
    if let reqdata = reqdata { ctxmap["reqdata"] = reqdata }
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

  // (remove not defined by this API - base class throws unsupportedOp)
}

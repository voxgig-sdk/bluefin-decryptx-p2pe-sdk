// DeviceRkiActivateResult entity client for the BluefinDecryptxP2pe SDK.

import Foundation

public final class DeviceRkiActivateResultEntity: BluefinDecryptxP2peEntityBase {
  public init(_ client: BluefinDecryptxP2peSDK, _ entopts: VMap? = nil) {
    super.init(client, entopts, "device_rki_activate_result")
  }

  public override func make() -> Entity {
    return DeviceRkiActivateResultEntity(client, cloneOpts())
  }

  // (load not defined by this API - base class throws unsupportedOp)

  // (list not defined by this API - base class throws unsupportedOp)

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

  // (update not defined by this API - base class throws unsupportedOp)

  // (remove not defined by this API - base class throws unsupportedOp)
}

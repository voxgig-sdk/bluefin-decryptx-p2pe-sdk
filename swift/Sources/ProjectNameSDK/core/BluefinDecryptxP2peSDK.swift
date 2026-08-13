// BluefinDecryptxP2pe SDK client.

import Foundation

public final class BluefinDecryptxP2peSDK {
  public var mode = "live"
  private var options: VMap = VMap()
  private let utility: Utility
  public var features: [BaseFeature] = []
  private var rootctx: Context!

  public init(_ optionsIn: VMap? = nil) {
    utility = Utility()

    let config = SdkConfig.makeConfig()

    var ctxmap: [String: Any?] = [
      "client": self,
      "utility": utility,
      "config": config,
      "shared": VMap(),
    ]
    if let o = optionsIn { ctxmap["options"] = o }

    rootctx = utility.makeContext(ctxmap, nil)

    options = utility.makeOptions(rootctx)

    if gpath(options, "feature", "test", "active") == .bool(true) {
      mode = "test"
    }

    rootctx.options = options

    // Add features in the resolved order (makeOptions puts an explicit list
    // order first, else defaults to test-first). Ordering matters: the `test`
    // feature installs the base mock transport and the transport features
    // (retry/cache/netsim/proxy/ratelimit) wrap whatever is current, so `test`
    // must be added before them to sit at the base of the chain.
    let featureOpts = gp(options, "feature").asMap ?? VMap()
    if let featureOrder = gpath(options, "__derived__", "featureorder").asList {
      for fnameVal in featureOrder.items {
        let fname = fnameVal.asString ?? ""
        if fname != "", let fopts = gp(featureOpts, fname).asMap,
          fopts.entries["active"]?.asBool == true {
          utility.featureAdd(rootctx, SdkConfig.makeFeature(fname))
        }
      }
    }

    // Add extension features.
    if let extList = gp(options, "extend").asList {
      for f in extList.items {
        if let feat = f.asNative as? BaseFeature {
          utility.featureAdd(rootctx, feat)
        }
      }
    }

    // Initialize features.
    for f in features {
      utility.featureInit(rootctx, f)
    }

    utility.featureHook(rootctx, "PostConstruct")
  }

  public func optionsMap() -> VMap {
    return clone(.map(options)).asMap ?? VMap()
  }

  public func getUtility() -> Utility {
    return Utility.copy(utility)
  }

  public func getRootCtx() -> Context {
    return rootctx
  }

  public func prepare(_ fetchargsIn: VMap?) throws -> VMap {
    let utility = self.utility

    let fetchargs = fetchargsIn ?? VMap()

    let ctrl = gp(fetchargs, "ctrl").asMap ?? VMap()

    let ctx = utility.makeContext(["opname": "prepare", "ctrl": ctrl], rootctx)

    let options = self.options

    let path = gp(fetchargs, "path").asString ?? ""
    var method = gp(fetchargs, "method").asString ?? ""
    if method == "" { method = "GET" }

    let pathParams = gp(fetchargs, "params").asMap ?? VMap()
    let query = gp(fetchargs, "query").asMap ?? VMap()

    let headers = utility.prepareHeaders(ctx)

    let basev = gp(options, "base").asString ?? ""
    let prefix = gp(options, "prefix").asString ?? ""
    let suffix = gp(options, "suffix").asString ?? ""

    let specmap = VMap()
    specmap.entries["base"] = .string(basev)
    specmap.entries["prefix"] = .string(prefix)
    specmap.entries["suffix"] = .string(suffix)
    specmap.entries["path"] = .string(path)
    specmap.entries["method"] = .string(method)
    specmap.entries["params"] = .map(pathParams)
    specmap.entries["query"] = .map(query)
    specmap.entries["headers"] = .map(headers)
    specmap.entries["body"] = gp(fetchargs, "body")
    specmap.entries["step"] = .string("start")
    ctx.spec = Spec(specmap)

    // Merge user-provided headers.
    if let uhm = gp(fetchargs, "headers").asMap {
      for (k, v) in uhm.entries {
        ctx.spec!.headers.entries[k] = v
      }
    }

    _ = try utility.prepareAuth(ctx)

    return try utility.makeFetchDef(ctx)
  }

  // Raw endpoint access is operator-controllable, like every entity op.
  // Blocking it means denying BOTH the 'direct' and 'graphql' tokens, since
  // either one reaches the same endpoint.
  public func direct(_ fetchargsIn: VMap?) -> VMap {
    if !opAllowed("direct") {
      return opDenied("direct")
    }

    return rawRequest(fetchargsIn)
  }

  // Is this raw-access op permitted by the SDK's allow.op option?
  private func opAllowed(_ op: String) -> Bool {
    guard let allow = gpath(options, "allow", "op").asString else { return false }
    return allow.contains(op)
  }

  private func opDenied(_ op: String) -> VMap {
    let allow = gpath(options, "allow", "op").asString ?? ""
    let r = VMap()
    r.entries["ok"] = .bool(false)
    r.entries["err"] = .nat(BluefinDecryptxP2peError(
      op + "_allow",
      "BluefinDecryptxP2peSDK: \(op): operation not allowed by SDK option "
        + "allow.op value: \"\(allow)\"", nil))
    return r
  }

  // Ungated request path shared by direct and graphql, each of which checks
  // its own allow.op token first. Private, rather than a flag on fetchargs:
  // a caller-supplied marker would let anyone opt straight back out of the
  // gate by passing it.
  private func rawRequest(_ fetchargsIn: VMap?) -> VMap {
    let utility = self.utility

    let fetchdef: VMap
    do {
      fetchdef = try prepare(fetchargsIn)
    } catch {
      let r = VMap()
      r.entries["ok"] = .bool(false)
      r.entries["err"] = .nat(error)
      return r
    }

    let fetchargs = fetchargsIn ?? VMap()
    let ctrl = gp(fetchargs, "ctrl").asMap ?? VMap()

    let ctx = utility.makeContext(["opname": "direct", "ctrl": ctrl], rootctx)

    let url = gp(fetchdef, "url").asString ?? ""

    let fetched: Value
    do {
      fetched = try utility.fetcher(ctx, url, fetchdef)
    } catch {
      let r = VMap()
      r.entries["ok"] = .bool(false)
      r.entries["err"] = .nat(error)
      return r
    }

    if isNil(fetched) {
      let r = VMap()
      r.entries["ok"] = .bool(false)
      r.entries["err"] = .nat(ctx.makeError("direct_no_response", "response: undefined"))
      return r
    }

    if let fm = fetched.asMap {
      let status = toInt(gp(fm, "status"))
      let headers = gp(fm, "headers")

      // No-body responses (204, 304) and explicit zero content-length must
      // skip JSON parsing.
      var contentLength = ""
      if let hm = headers.asMap, let cl = hm.entries["content-length"], !isNil(cl) {
        contentLength = stringify(cl)
      }
      let noBody = status == 204 || status == 304 || contentLength == "0"

      var jsonData: Value = .noval
      if !noBody, let jf = gp(fm, "json").asNative as? NativeCall0 {
        jsonData = jf()
      }

      let r = VMap()
      r.entries["ok"] = .bool(status >= 200 && status < 300)
      r.entries["status"] = .int(Int64(status))
      r.entries["headers"] = headers
      r.entries["data"] = jsonData
      return r
    }

    let r = VMap()
    r.entries["ok"] = .bool(false)
    r.entries["err"] = .nat(ctx.makeError("direct_invalid", "invalid response type"))
    return r
  }

  // Raw GraphQL access: the pressure valve that makes the generated surface's
  // deliberate omissions (per-call selection sets, typed filter builders,
  // batching, subscriptions) livable — the whole schema stays reachable.
  //
  // Thin wrapper over the same prepare/fetch path direct uses, with the one
  // thing raw direct cannot do for GraphQL: a GraphQL failure rides HTTP 200
  // as a top-level `errors` array, so status alone would report a failed
  // query as ok.
  //
  // NOTE: like direct, this bypasses the feature pipeline — no retry,
  // ratelimit or paging features apply.
  public func graphql(
    _ query: String, _ variables: VMap? = nil, _ ctrl: VMap? = nil
  ) -> VMap {
    if !opAllowed("graphql") {
      return opDenied("graphql")
    }

    let headers = VMap()
    headers.entries["content-type"] = .string("application/json")

    let body = VMap()
    body.entries["query"] = .string(query)
    body.entries["variables"] = .map(variables ?? VMap())

    let fetchargs = VMap()
    fetchargs.entries["method"] = .string("POST")
    fetchargs.entries["headers"] = .map(headers)
    fetchargs.entries["body"] = .map(body)
    fetchargs.entries["ctrl"] = .map(ctrl ?? VMap())

    let res = rawRequest(fetchargs)

    // Errors are read BEFORE any status check: a GraphQL parse or validation
    // failure comes back as HTTP 400 carrying the standard { errors: [...] }
    // body, and the raw path represents a non-2xx as ok:false with no err —
    // so returning early on status would discard the server's own
    // diagnostics, which are the only useful part of that response.
    guard let errors = gp(gp(.map(res), "data"), "errors").asList,
          !errors.items.isEmpty else {
      return res
    }

    var msg = gp(errors.items[0], "message").asString ?? ""
    if msg.isEmpty { msg = "graphql error" }

    res.entries["ok"] = .bool(false)
    res.entries["err"] = .nat(BluefinDecryptxP2peError(
      "graphql_error", "BluefinDecryptxP2peSDK: graphql: " + msg, nil))
    res.entries["graphql"] = .list(errors)

    return res
  }


  // Attestation returns a Attestation entity bound to this client.
  // Idiomatic usage: try client.Attestation().list(nil) or
  // try client.Attestation().load(vm(("id", .string("..."))), nil).
  public func Attestation(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return AttestationEntity(self, entopts)
  }

  // Client returns a Client entity bound to this client.
  // Idiomatic usage: try client.Client().list(nil) or
  // try client.Client().load(vm(("id", .string("..."))), nil).
  public func Client(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return ClientEntity(self, entopts)
  }

  // CreateResult returns a CreateResult entity bound to this client.
  // Idiomatic usage: try client.CreateResult().list(nil) or
  // try client.CreateResult().load(vm(("id", .string("..."))), nil).
  public func CreateResult(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return CreateResultEntity(self, entopts)
  }

  // Decryption returns a Decryption entity bound to this client.
  // Idiomatic usage: try client.Decryption().list(nil) or
  // try client.Decryption().load(vm(("id", .string("..."))), nil).
  public func Decryption(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return DecryptionEntity(self, entopts)
  }

  // Device returns a Device entity bound to this client.
  // Idiomatic usage: try client.Device().list(nil) or
  // try client.Device().load(vm(("id", .string("..."))), nil).
  public func Device(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return DeviceEntity(self, entopts)
  }

  // DeviceBuild returns a DeviceBuild entity bound to this client.
  // Idiomatic usage: try client.DeviceBuild().list(nil) or
  // try client.DeviceBuild().load(vm(("id", .string("..."))), nil).
  public func DeviceBuild(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return DeviceBuildEntity(self, entopts)
  }

  // DeviceCustodyDetail returns a DeviceCustodyDetail entity bound to this client.
  // Idiomatic usage: try client.DeviceCustodyDetail().list(nil) or
  // try client.DeviceCustodyDetail().load(vm(("id", .string("..."))), nil).
  public func DeviceCustodyDetail(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return DeviceCustodyDetailEntity(self, entopts)
  }

  // DeviceCustodyList returns a DeviceCustodyList entity bound to this client.
  // Idiomatic usage: try client.DeviceCustodyList().list(nil) or
  // try client.DeviceCustodyList().load(vm(("id", .string("..."))), nil).
  public func DeviceCustodyList(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return DeviceCustodyListEntity(self, entopts)
  }

  // DeviceList returns a DeviceList entity bound to this client.
  // Idiomatic usage: try client.DeviceList().list(nil) or
  // try client.DeviceList().load(vm(("id", .string("..."))), nil).
  public func DeviceList(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return DeviceListEntity(self, entopts)
  }

  // DeviceReceiveResult returns a DeviceReceiveResult entity bound to this client.
  // Idiomatic usage: try client.DeviceReceiveResult().list(nil) or
  // try client.DeviceReceiveResult().load(vm(("id", .string("..."))), nil).
  public func DeviceReceiveResult(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return DeviceReceiveResultEntity(self, entopts)
  }

  // DeviceRkiActivateResult returns a DeviceRkiActivateResult entity bound to this client.
  // Idiomatic usage: try client.DeviceRkiActivateResult().list(nil) or
  // try client.DeviceRkiActivateResult().load(vm(("id", .string("..."))), nil).
  public func DeviceRkiActivateResult(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return DeviceRkiActivateResultEntity(self, entopts)
  }

  // DeviceState returns a DeviceState entity bound to this client.
  // Idiomatic usage: try client.DeviceState().list(nil) or
  // try client.DeviceState().load(vm(("id", .string("..."))), nil).
  public func DeviceState(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return DeviceStateEntity(self, entopts)
  }

  // DeviceType returns a DeviceType entity bound to this client.
  // Idiomatic usage: try client.DeviceType().list(nil) or
  // try client.DeviceType().load(vm(("id", .string("..."))), nil).
  public func DeviceType(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return DeviceTypeEntity(self, entopts)
  }

  // InjectKey returns a InjectKey entity bound to this client.
  // Idiomatic usage: try client.InjectKey().list(nil) or
  // try client.InjectKey().load(vm(("id", .string("..."))), nil).
  public func InjectKey(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return InjectKeyEntity(self, entopts)
  }

  // Kif returns a Kif entity bound to this client.
  // Idiomatic usage: try client.Kif().list(nil) or
  // try client.Kif().load(vm(("id", .string("..."))), nil).
  public func Kif(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return KifEntity(self, entopts)
  }

  // Location returns a Location entity bound to this client.
  // Idiomatic usage: try client.Location().list(nil) or
  // try client.Location().load(vm(("id", .string("..."))), nil).
  public func Location(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return LocationEntity(self, entopts)
  }

  // Partner returns a Partner entity bound to this client.
  // Idiomatic usage: try client.Partner().list(nil) or
  // try client.Partner().load(vm(("id", .string("..."))), nil).
  public func Partner(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return PartnerEntity(self, entopts)
  }

  // Shipment returns a Shipment entity bound to this client.
  // Idiomatic usage: try client.Shipment().list(nil) or
  // try client.Shipment().load(vm(("id", .string("..."))), nil).
  public func Shipment(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return ShipmentEntity(self, entopts)
  }

  // Success returns a Success entity bound to this client.
  // Idiomatic usage: try client.Success().list(nil) or
  // try client.Success().load(vm(("id", .string("..."))), nil).
  public func Success(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return SuccessEntity(self, entopts)
  }

  // Transaction returns a Transaction entity bound to this client.
  // Idiomatic usage: try client.Transaction().list(nil) or
  // try client.Transaction().load(vm(("id", .string("..."))), nil).
  public func Transaction(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return TransactionEntity(self, entopts)
  }

  // UpdateResult returns a UpdateResult entity bound to this client.
  // Idiomatic usage: try client.UpdateResult().list(nil) or
  // try client.UpdateResult().load(vm(("id", .string("..."))), nil).
  public func UpdateResult(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return UpdateResultEntity(self, entopts)
  }

  // User returns a User entity bound to this client.
  // Idiomatic usage: try client.User().list(nil) or
  // try client.User().load(vm(("id", .string("..."))), nil).
  public func User(_ entopts: VMap? = nil) -> BluefinDecryptxP2peEntityBase {
    return UserEntity(self, entopts)
  }


  public static func testSDK(_ testoptsIn: VMap?, _ sdkoptsIn: VMap?) -> BluefinDecryptxP2peSDK {
    let sdkopts = clone(.map(sdkoptsIn ?? VMap())).asMap ?? VMap()

    let testopts = clone(.map(testoptsIn ?? VMap())).asMap ?? VMap()
    testopts.entries["active"] = .bool(true)

    _ = setpath(.map(sdkopts), jtp("feature", "test"), .map(testopts))

    let sdk = BluefinDecryptxP2peSDK(sdkopts)
    sdk.mode = "test"
    return sdk
  }
}

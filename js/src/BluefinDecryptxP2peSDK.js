// BluefinDecryptxP2pe Js SDK

const { AttestationEntity } = require('./entity/AttestationEntity')
const { ClientEntity } = require('./entity/ClientEntity')
const { CreateResultEntity } = require('./entity/CreateResultEntity')
const { DecryptionEntity } = require('./entity/DecryptionEntity')
const { DeviceEntity } = require('./entity/DeviceEntity')
const { DeviceBuildEntity } = require('./entity/DeviceBuildEntity')
const { DeviceCustodyDetailEntity } = require('./entity/DeviceCustodyDetailEntity')
const { DeviceCustodyListItemEntity } = require('./entity/DeviceCustodyListItemEntity')
const { DeviceReceiveResultEntity } = require('./entity/DeviceReceiveResultEntity')
const { DeviceRkiActivateResultEntity } = require('./entity/DeviceRkiActivateResultEntity')
const { DeviceStateEntity } = require('./entity/DeviceStateEntity')
const { DeviceTypeEntity } = require('./entity/DeviceTypeEntity')
const { InjectKeyEntity } = require('./entity/InjectKeyEntity')
const { KifEntity } = require('./entity/KifEntity')
const { LocationEntity } = require('./entity/LocationEntity')
const { PartnerEntity } = require('./entity/PartnerEntity')
const { ShipmentEntity } = require('./entity/ShipmentEntity')
const { SuccessEntity } = require('./entity/SuccessEntity')
const { TransactionEntity } = require('./entity/TransactionEntity')
const { UpdateResultEntity } = require('./entity/UpdateResultEntity')
const { UserEntity } = require('./entity/UserEntity')
const { VirtualDeviceEntity } = require('./entity/VirtualDeviceEntity')


const { inspect } = require('node:util')

const { config } = require('./Config')
const { Utility } = require('./utility/Utility')
const { unreadableBody } = require('./utility/ResultBodyUtility')
const { abortError } = require('./utility/MakeRequestUtility')
const { allowed } = require('./utility/PrepareMethodUtility')
const { BluefinDecryptxP2peEntityBase } = require('./BluefinDecryptxP2peEntityBase')


const { BaseFeature } = require('./feature/base/BaseFeature')



const stdutil = new Utility()


class BluefinDecryptxP2peSDK {
  _mode = 'live'
  _options
  _utility = new Utility()
  _features
  _rootctx
  

  constructor(options) {

    this._rootctx = this._utility.makeContext({
      client: this,
      utility: this._utility,
      config,
      options,
      shared: new WeakMap()
    })

    this._options = this._utility.makeOptions(this._rootctx)

    // Each can hold a credential; feature state a resolved or bought one.
    // toJSON and inspect already leave them out; a spread or a structured
    // logger walking own properties must too.
    for (const key of ['_options', '_rootctx', '_features']) {
      Object.defineProperty(this, key, {
        value: this[key], enumerable: false, writable: true, configurable: true
      })
    }

    const struct = this._utility.struct
    const getpath = struct.getpath

    if (true === getpath(this._options.feature, 'test.active')) {
      this._mode = 'test'
    }

    this._rootctx.options = this._options

    this._features = []

    const featureAdd = this._utility.featureAdd
    const featureInit = this._utility.featureInit

    // Add features in the resolved order (makeOptions puts an explicit
    // array order first, else defaults to test-first). Ordering matters:
    // the `test` feature installs the base mock transport and the transport
    // features (retry/cache/netsim/proxy/ratelimit) wrap whatever is current,
    // so `test` must be added before them to sit at the base of the chain.
    const extend = this._options.extend || []

    const featureorder = getpath(this._options, '__derived__.featureorder') || []
    for (const fname of featureorder) {
      const fopts = this._options.feature[fname] || {}
      if (fopts.active) {
        // An active name with no generated class is legal when an
        // extend-supplied instance carries that name (station's adopt
        // path): the instance is added below, positioned by its own
        // __after__ entry, so skip it here rather than fail construction.
        if (!this._rootctx.config.hasFeature(fname) &&
          extend.some((f) => fname === f.name)) {
          continue
        }
        featureAdd(this._rootctx, this._rootctx.config.makeFeature(fname))
      }
    }

    for (let f of extend) {
      featureAdd(this._rootctx, f)
    }

    for (let f of this._features) {
      featureInit(this._rootctx, f)
    }

    const featureHook = this._utility.featureHook
    featureHook(this._rootctx, 'PostConstruct')
  }


  options() {
    return this._utility.struct.clone(this._options)
  }


  utility() {
    return this._utility.struct.clone(this._utility)
  }

  


  async prepare(fetchargs) {
    const utility = this._utility
    const struct = utility.struct
    const clone = struct.clone

    const {
      makeContext,
      makeFetchDef,
      prepareHeaders,
      prepareAuth,
    } = utility

    fetchargs = fetchargs || {}

    let ctx = makeContext({
      opname: 'prepare',
      ctrl: fetchargs.ctrl || {},
    }, this._rootctx)

    const options = this._options
    const method = String(fetchargs.method || 'GET').toUpperCase()

    if (!allowed(options.allow.method, method)) {
      return ctx.error('spec_method_allow', 'Method "' + method +
        '" not allowed by SDK option allow.method value: "' + options.allow.method + '"')
    }

    // Build spec directly from SDK options + user-provided fetch args.
    const spec = {
      base: options.base,
      prefix: options.prefix,
      suffix: options.suffix,
      path: fetchargs.path || '',
      method,
      params: fetchargs.params || {},
      query: fetchargs.query || {},
      headers: prepareHeaders(ctx),
      body: fetchargs.body,
      step: 'start',
    }

    ctx.spec = spec

    // Merge user-provided headers over SDK defaults.
    if (fetchargs.headers) {
      const uheaders = fetchargs.headers
      for (let key in uheaders) {
        spec.headers[key] = uheaders[key]
      }
    }

    

    // Apply SDK auth (apikey, auth prefix, etc.)
    const authResult = prepareAuth(ctx)
    if (authResult instanceof Error) {
      return authResult
    }

    return makeFetchDef(ctx)
  }


  // Raw endpoint access is operator-controllable, like every entity op.
  // Blocking it means denying BOTH the 'direct' and 'graphql' tokens, since
  // either one reaches the same endpoint.
  async direct(fetchargs) {
    if (!allowed(this._options.allow.op, 'direct')) {
      return {
        ok: false,
        err: new Error('BluefinDecryptxP2peSDK: direct: operation not allowed by' +
          ' SDK option allow.op value: "' + this._options.allow.op + '"'),
      }
    }

    return this._rawRequest(fetchargs)
  }


  // Ungated request path shared by direct() and graphql(), each of which
  // checks its own allow.op token first. Private, rather than a flag on
  // fetchargs: a caller-supplied marker would let anyone opt straight back
  // out of the gate by passing it.
  async _rawRequest(fetchargs) {
    const utility = this._utility

    const fetcher = utility.fetcher
    const makeContext = utility.makeContext

    const fetchdef = await this.prepare(fetchargs)
    if (fetchdef instanceof Error) {
      return { ok: false, err: utility.clean(this._rootctx, fetchdef) }
    }

    let ctx = makeContext({
      opname: 'direct',
      ctrl: (fetchargs || {}).ctrl || {},
    }, this._rootctx)

    try {
      if (true === fetchdef.signal?.aborted) {
        throw fetchdef.signal.reason
      }

      const fetched = await fetcher(ctx, fetchdef.url, fetchdef)

      if (null == fetched) {
        return { ok: false, err: ctx.error('direct_no_response', 'response: undefined') }
      }
      else if (fetched instanceof Error) {
        return { ok: false, err: utility.clean(ctx, abortError(ctx, fetched)) }
      }

      const status = fetched.status

      // No body responses (204 No Content, 304 Not Modified) and explicit
      // zero content-length must skip JSON parsing — fetched.json() would
      // throw `Unexpected end of JSON input` on an empty body.
      const headers = fetched.headers
      const contentLength = headers && 'function' === typeof headers.get
        ? headers.get('content-length')
        : (headers || {})['content-length']
      const noBody = 204 === status || 304 === status || '0' === String(contentLength)

      let json = undefined
      let err = undefined
      if (!noBody) {
        let text = undefined
        try {
          const raw = fetched
          if ('function' === typeof raw.text) {
            text = await raw.text()
            json = '' === text.trim() ? undefined : JSON.parse(text)
          }
          else {
            json = 'function' === typeof fetched.json ? await fetched.json() : fetched.json
          }
        }
        catch (parseErr) {
          if ('SyntaxError' !== parseErr?.name) {
            throw parseErr
          }
          err = unreadableBody(ctx, {
            status, headers, text: text ?? parseErr.text, sent: fetchdef.headers,
            failed: 200 <= status && status < 300 ? undefined :
              ctx.error('request_status', 'request: ' + status + ': ' + fetched.statusText),
          })
        }
      }

      return {
        ok: null == err && status >= 200 && status < 300,
        status,
        headers: fetched.headers,
        data: json,
        ...(null == err ? {} : { err: utility.clean(ctx, err) }),
      }
    }
    catch (err) {
      return { ok: false, err: utility.clean(ctx, abortError(ctx, err)) }
    }
  }



  // Raw GraphQL access: the pressure valve that makes the generated
  // surface's deliberate omissions (per-call selection sets, typed filter
  // builders, batching, subscriptions) livable — the whole schema stays
  // reachable.
  //
  // Thin wrapper over the same prepare/fetch path `direct` uses, with the
  // one thing raw `direct` cannot do for GraphQL: a GraphQL failure rides
  // HTTP 200 as a top-level `errors` array, so status alone would report a
  // failed query as ok.
  //
  // NOTE: like `direct`, this bypasses the feature pipeline — no retry,
  // ratelimit or paging features apply.
  async graphql(query, variables, ctrl) {
    const options = this._options

    if (!allowed(options.allow.op, 'graphql')) {
      return {
        ok: false,
        err: new Error('BluefinDecryptxP2peSDK: graphql: operation not allowed by' +
          ' SDK option allow.op value: "' + options.allow.op + '"'),
      }
    }

    const res = await this._rawRequest({
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: { query, variables: variables || {} },
      ctrl,
    })

    // Errors are read BEFORE any status check: a GraphQL parse or validation
    // failure comes back as HTTP 400 carrying the standard { errors: [...] }
    // body, and the raw path represents a non-2xx as { ok: false } with no
    // err — so returning early on status would discard the server's own
    // diagnostics, which are the only useful part of that response.
    const errors = null == res.data ? undefined : res.data.errors

    if (null != errors && Array.isArray(errors) && 0 < errors.length) {
      const first = errors[0] || {}
      const err = new Error('BluefinDecryptxP2peSDK: graphql: ' +
        (first.message || 'graphql error'))
      err.graphql = errors
      return { ok: false, status: res.status, headers: res.headers, err, data: res.data }
    }

    return res
  }



  // Entity access: `client.Attestation().list()` / `client.Attestation().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Attestation(entopts) {
    const self = this
    return new AttestationEntity(self, entopts)
  }


  // Entity access: `client.Client().list()` / `client.Client().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Client(entopts) {
    const self = this
    return new ClientEntity(self, entopts)
  }


  // Entity access: `client.CreateResult().list()` / `client.CreateResult().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  CreateResult(entopts) {
    const self = this
    return new CreateResultEntity(self, entopts)
  }


  // Entity access: `client.Decryption().list()` / `client.Decryption().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Decryption(entopts) {
    const self = this
    return new DecryptionEntity(self, entopts)
  }


  // Entity access: `client.Device().list()` / `client.Device().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Device(entopts) {
    const self = this
    return new DeviceEntity(self, entopts)
  }


  // Entity access: `client.DeviceBuild().list()` / `client.DeviceBuild().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  DeviceBuild(entopts) {
    const self = this
    return new DeviceBuildEntity(self, entopts)
  }


  // Entity access: `client.DeviceCustodyDetail().list()` / `client.DeviceCustodyDetail().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  DeviceCustodyDetail(entopts) {
    const self = this
    return new DeviceCustodyDetailEntity(self, entopts)
  }


  // Entity access: `client.DeviceCustodyListItem().list()` / `client.DeviceCustodyListItem().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  DeviceCustodyListItem(entopts) {
    const self = this
    return new DeviceCustodyListItemEntity(self, entopts)
  }


  // Entity access: `client.DeviceReceiveResult().list()` / `client.DeviceReceiveResult().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  DeviceReceiveResult(entopts) {
    const self = this
    return new DeviceReceiveResultEntity(self, entopts)
  }


  // Entity access: `client.DeviceRkiActivateResult().list()` / `client.DeviceRkiActivateResult().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  DeviceRkiActivateResult(entopts) {
    const self = this
    return new DeviceRkiActivateResultEntity(self, entopts)
  }


  // Entity access: `client.DeviceState().list()` / `client.DeviceState().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  DeviceState(entopts) {
    const self = this
    return new DeviceStateEntity(self, entopts)
  }


  // Entity access: `client.DeviceType().list()` / `client.DeviceType().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  DeviceType(entopts) {
    const self = this
    return new DeviceTypeEntity(self, entopts)
  }


  // Entity access: `client.InjectKey().list()` / `client.InjectKey().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  InjectKey(entopts) {
    const self = this
    return new InjectKeyEntity(self, entopts)
  }


  // Entity access: `client.Kif().list()` / `client.Kif().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Kif(entopts) {
    const self = this
    return new KifEntity(self, entopts)
  }


  // Entity access: `client.Location().list()` / `client.Location().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Location(entopts) {
    const self = this
    return new LocationEntity(self, entopts)
  }


  // Entity access: `client.Partner().list()` / `client.Partner().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Partner(entopts) {
    const self = this
    return new PartnerEntity(self, entopts)
  }


  // Entity access: `client.Shipment().list()` / `client.Shipment().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Shipment(entopts) {
    const self = this
    return new ShipmentEntity(self, entopts)
  }


  // Entity access: `client.Success().list()` / `client.Success().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Success(entopts) {
    const self = this
    return new SuccessEntity(self, entopts)
  }


  // Entity access: `client.Transaction().list()` / `client.Transaction().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Transaction(entopts) {
    const self = this
    return new TransactionEntity(self, entopts)
  }


  // Entity access: `client.UpdateResult().list()` / `client.UpdateResult().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  UpdateResult(entopts) {
    const self = this
    return new UpdateResultEntity(self, entopts)
  }


  // Entity access: `client.User().list()` / `client.User().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  User(entopts) {
    const self = this
    return new UserEntity(self, entopts)
  }


  // Entity access: `client.VirtualDevice().list()` / `client.VirtualDevice().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  VirtualDevice(entopts) {
    const self = this
    return new VirtualDeviceEntity(self, entopts)
  }




  static test(testoptsarg, sdkoptsarg) {
    const struct = stdutil.struct
    const setpath = struct.setpath
    const getdef = struct.getdef
    const clone = struct.clone
    const setprop = struct.setprop

    const sdkopts = getdef(clone(sdkoptsarg), {})
    const testopts = getdef(clone(testoptsarg), {})
    setprop(testopts, 'active', true)
    setpath(sdkopts, 'feature.test', testopts)

    const testsdk = new BluefinDecryptxP2peSDK(sdkopts)
    testsdk._mode = 'test'

    return testsdk
  }


  tester(testopts, sdkopts) {
    return BluefinDecryptxP2peSDK.test(testopts, sdkopts)
  }


  toJSON() {
    return { name: 'BluefinDecryptxP2pe' }
  }

  toString() {
    return 'BluefinDecryptxP2pe ' + this._utility.struct.jsonify(this.toJSON())
  }

  [inspect.custom]() {
    return this.toString()
  }

}




const SDK = BluefinDecryptxP2peSDK


module.exports = {
  stdutil,
  config,
  

  BaseFeature,
  BluefinDecryptxP2peEntityBase,

  BluefinDecryptxP2peSDK,
  SDK,
}


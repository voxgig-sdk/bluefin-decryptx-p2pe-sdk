// BluefinDecryptxP2pe Js SDK

const { AttestationEntity } = require('./entity/AttestationEntity')
const { ClientEntity } = require('./entity/ClientEntity')
const { CreateResultEntity } = require('./entity/CreateResultEntity')
const { DecryptionEntity } = require('./entity/DecryptionEntity')
const { DeviceEntity } = require('./entity/DeviceEntity')
const { DeviceBuildEntity } = require('./entity/DeviceBuildEntity')
const { DeviceCustodyDetailEntity } = require('./entity/DeviceCustodyDetailEntity')
const { DeviceCustodyListEntity } = require('./entity/DeviceCustodyListEntity')
const { DeviceListEntity } = require('./entity/DeviceListEntity')
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


const { inspect } = require('node:util')

const { config } = require('./Config')
const { Utility } = require('./utility/Utility')
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
    const featureorder = getpath(this._options, '__derived__.featureorder') || []
    for (const fname of featureorder) {
      const fopts = this._options.feature[fname] || {}
      if (fopts.active) {
        featureAdd(this._rootctx, this._rootctx.config.makeFeature(fname))
      }
    }

    if (null != this._options.extend) {
      for (let f of this._options.extend) {
        featureAdd(this._rootctx, f)
      }
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

    // Build spec directly from SDK options + user-provided fetch args.
    const spec = {
      base: options.base,
      prefix: options.prefix,
      suffix: options.suffix,
      path: fetchargs.path || '',
      method: fetchargs.method || 'GET',
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


  async direct(fetchargs) {
    const utility = this._utility
    const fetcher = utility.fetcher
    const makeContext = utility.makeContext

    const fetchdef = await this.prepare(fetchargs)
    if (fetchdef instanceof Error) {
      return fetchdef
    }

    let ctx = makeContext({
      opname: 'direct',
      ctrl: (fetchargs || {}).ctrl || {},
    }, this._rootctx)

    try {
      const fetched = await fetcher(ctx, fetchdef.url, fetchdef)

      if (null == fetched) {
        return { ok: false, err: ctx.error('direct_no_response', 'response: undefined') }
      }
      else if (fetched instanceof Error) {
        return { ok: false, err: fetched }
      }

      const status = fetched.status
      const json = 'function' === typeof fetched.json ? await fetched.json() : fetched.json

      return {
        ok: status >= 200 && status < 300,
        status,
        headers: fetched.headers,
        data: json,
      }
    }
    catch (err) {
      return { ok: false, err }
    }
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


  // Entity access: `client.DeviceCustodyList().list()` / `client.DeviceCustodyList().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  DeviceCustodyList(entopts) {
    const self = this
    return new DeviceCustodyListEntity(self, entopts)
  }


  // Entity access: `client.DeviceList().list()` / `client.DeviceList().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  DeviceList(entopts) {
    const self = this
    return new DeviceListEntity(self, entopts)
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



const envlocal = __dirname + '/../../../.env.local'
require('../../utility').loadEnvLocal(envlocal)

const Path = require('node:path')
const Fs = require('node:fs')

const { test, describe, afterEach } = require('node:test')
const assert = require('node:assert')
const { createLiveTransport } = require('../../live-runner')
const { runLiveEntity } = require('../../live-entity')


const { BluefinDecryptxP2peSDK, BaseFeature, stdutil, config } = require('../../..')

const {
  envOverride,
  liveClientOptions,
  liveDelay,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
} = require('../../utility')


describe('ShipmentEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Shipment()
    assert(null != ent)
  })


  class FailHook extends BaseFeature {
    constructor() {
      super()
      this.name = 'failhook'
      this.version = '0.0.1'
      this.active = true
      this.unexpected = 0
    }
    init() { }
    PreSpec() { throw new Error('shipment hook failed') }
    PreUnexpected() { this.unexpected++ }
  }

  test('stream-error', async () => {
    const offline = { net: { offline: true } }
    await assert.rejects(async () => {
      for await (const _item of BluefinDecryptxP2peSDK.test(offline).Shipment().stream('list')) { }
    }, /offline/)

    for await (const _item of BluefinDecryptxP2peSDK.test(offline).Shipment()
      .stream('list', undefined, { ctrl: { throw: false } })) { }

    if (null != config.feature?.rbac) {
      const denied = BluefinDecryptxP2peSDK.test(undefined, { feature: { rbac: { active: true, deny: true } } })
      await assert.rejects(async () => {
        for await (const _item of denied.Shipment().stream('list')) { }
      }, (err) => 'rbac_denied' === err.code)
    }
  })

  test('stream-ctrl', async () => {
    const explain = {}
    const ctrl = { explain }
    for await (const _item of BluefinDecryptxP2peSDK.test().Shipment().stream('list', undefined, { ctrl })) { }
    assert.deepStrictEqual(Object.keys(ctrl), ['explain'])
    assert(explain === ctrl.explain && 0 < Object.keys(explain).length)
  })

  test('unexpected', async () => {
    const hook = new FailHook()
    const client = new BluefinDecryptxP2peSDK({ feature: { test: { active: true } }, extend: [hook] })
    await assert.rejects(client.Shipment().list(), /hook failed/)
    assert(0 < hook.unexpected)

    const fired = hook.unexpected
    assert.strictEqual(await client.Shipment().list(undefined, { throw: false }), undefined)
    assert(fired < hook.unexpected)
  })

  test('validate', async (t) => {
    if (null == config.feature?.validate) {
      t.skip('feature not present in this SDK: validate')
      return
    }
    const client = BluefinDecryptxP2peSDK.test(undefined, { feature: { validate: { active: true } } })
    await assert.rejects(client.Shipment().list({"kif":1}),
      (err) => 'validate_failed' === err.code)
  })



  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"carrier":{"a":true,"h":"Carrier","n":"carrier","op":{"create":{"req":true,"type":"`$STRING`"}},"r":false,"sh":"The name of the courier.","t":"`$STRING`","key$":"carrier","index$":0},"client":{"a":true,"h":"Client","n":"client","op":{"create":{"req":true,"type":"`$OBJECT`"}},"r":false,"sh":"Reference to the associated Client resource.","t":"`$OBJECT`","key$":"client","index$":1},"created":{"a":true,"fo":"datetime","h":"Created","n":"created","r":false,"sh":"Creation timestamp in ISO 8601 format.","t":"`$STRING`","key$":"created","index$":2},"dateReceived":{"a":true,"fo":"datetime","h":"Date Received","n":"dateReceived","r":false,"sh":"The date and time that a package is recieved.","t":"`$STRING`","key$":"dateReceived","index$":3},"dateShipped":{"a":true,"fo":"datetime","h":"Date Shipped","n":"dateShipped","op":{"create":{"req":true,"type":"`$STRING`"}},"r":false,"sh":"The date and time that a package is shipped.","t":"`$STRING`","key$":"dateShipped","index$":4},"dcKif":{"a":true,"h":"Dc Kif","n":"dcKif","r":false,"sh":"Reference to the associated KIF resource.","t":"`$OBJECT`","key$":"dcKif","index$":5},"id":{"a":true,"h":"Id","n":"id","r":false,"sh":"This resource's unique identifier.","t":"`$STRING`","key$":"id","index$":6},"items":{"a":true,"h":"Items","n":"items","op":{"create":{"req":true,"type":"`$ARRAY`"}},"r":false,"t":"`$ARRAY`","key$":"items","index$":7},"kif":{"a":true,"h":"Kif","n":"kif","op":{"create":{"req":true,"type":"`$OBJECT`"}},"r":false,"sh":"Reference to the associated KIF resource.","t":"`$OBJECT`","key$":"kif","index$":8},"location":{"a":true,"h":"Location","n":"location","r":true,"sh":"Reference to the associated Location resource.","t":"`$OBJECT`","key$":"location","index$":9},"modified":{"a":true,"fo":"datetime","h":"Modified","n":"modified","r":false,"sh":"Last modified timestamp.","t":"`$STRING`","key$":"modified","index$":10},"partner":{"a":true,"h":"Partner","n":"partner","op":{"create":{"req":true,"type":"`$OBJECT`"}},"r":false,"sh":"Reference to the associated Partner.","t":"`$OBJECT`","key$":"partner","index$":11},"shipmentType":{"a":true,"h":"Shipment Type","n":"shipmentType","r":false,"sh":"The type of shipment.","t":"`$STRING`","key$":"shipmentType","index$":12},"tracking":{"a":true,"h":"Tracking","n":"tracking","op":{"create":{"req":true,"type":"`$STRING`"}},"r":false,"sh":"The courier's tracking number.","t":"`$STRING`","key$":"tracking","index$":13},"version":{"a":true,"fo":"int32","h":"Version","n":"version","r":false,"sh":"The number of times that this resource has been updated.","t":"`$INTEGER`","key$":"version","index$":14}},"id":{"field":"id","name":"id"},"name":"shipment","op":{"create":{"input":"data","name":"create","points":[{"a":true,"bf":["carrier","client","dateShipped","dcKif","items","kif","location","partner","tracking"],"co":{"id":"POST /shipments","source":"openapi3","version":2},"g":{},"k":"http","m":"POST","o":"/shipments","q":{},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"shipments"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"list":{"input":"data","name":"list","points":[{"a":true,"co":{"id":"GET /shipments","source":"openapi3","version":2},"g":{"query":[{"a":true,"k":"query","n":"kif","or":"kif","r":true,"t":"`$STRING`","index$":0},{"a":true,"k":"query","n":"mode","or":"mode","r":false,"t":"`$STRING`","index$":1},{"a":true,"ex":0,"k":"query","n":"skip","or":"skip","r":false,"t":"`$INTEGER`","index$":2},{"a":true,"ex":10,"k":"query","n":"take","or":"take","r":false,"t":"`$INTEGER`","index$":3}]},"k":"http","m":"GET","o":"/shipments","q":{"exist":["kif"]},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"shipments"}],"t":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /shipments/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/shipments/{id}","q":{"exist":["id"]},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"shipments"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"shipment","name__orig":"shipment","Name":"Shipment","name_":"shipment","name-":"shipment","NAME":"SHIPMENT","index$":16}, {"active":true,"entity":"shipment","key$":"BasicShipmentFlow","kind":"basic","name":"BasicShipmentFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"shipment_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0},{"a":true,"d":{},"i":{},"m":{},"o":"list","s":[],"v":[{"apply":"ItemExists","def":{"ref":"shipment_ref01"}}],"index$":1},{"a":true,"d":{},"i":{"ref":"shipment_ref01","srcdatavar":"shipment_ref01_data","suffix":"_dt0"},"m":{"id":"shipment01"},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-shipment_ref01"}}],"index$":2}]}, 'Shipment', {"POST /shipments":{"protocol":"http","requestBody":{"description":"Shipment to be created.","content":{"*/*":{"schema":{"required":["carrier","client","dateShipped","items","kif","location","partner","tracking"],"type":"object","properties":{"partner":{"type":"object","properties":{"id":{"type":"string","description":"The referenced Partner's ID.","example":"6580"},"name":{"type":"string","description":"The referenced Partner's name.","example":"ASM Software"}},"description":"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/PartnerReference","key$":"partner"},"client":{"type":"object","properties":{"id":{"type":"string","description":"The referenced Client's ID.","example":"4684"},"name":{"type":"string","description":"The referenced Client's name.","example":"The Tired Window"}},"description":"Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/ClientReference","key$":"client"},"location":{"required":["id"],"type":"object","properties":{"id":{"type":"string","description":"The referenced Location's ID.","example":"33668"},"customReference":{"type":"string","description":"A custom refernce to location object. This value can be set","example":"ASD234"},"name":{"type":"string","description":"The referenced Location's name.","example":"The Tired Window Atlanta Downtown"}},"description":"Reference to the associated Location resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/LocationWithCustomReference","key$":"location"},"kif":{"type":"object","properties":{"id":{"type":"string","description":"The referenced KIF's ID.","example":"4"},"name":{"type":"string","description":"The referenced KIF's name.","example":"Kriptithe Technologies"}},"description":"Reference to the associated KIF resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/KifReference","key$":"kif"},"dcKif":{"type":"object","properties":{"id":{"type":"string","description":"The referenced KIF's ID.","example":"4"},"name":{"type":"string","description":"The referenced KIF's name.","example":"Kriptithe Technologies"}},"description":"Reference to the associated KIF resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/KifReference","key$":"dcKif"},"carrier":{"type":"string","description":"The name of the courier.","enum":["UPS","FedEx"],"key$":"carrier"},"tracking":{"maxLength":255,"type":"string","description":"The courier's tracking number.","example":"1Z999AA10123456784","key$":"tracking"},"dateShipped":{"type":"string","description":"The date and time that a package is shipped.","format":"datetime","example":"2017-02-08T20:14:45.000Z","key$":"dateShipped"},"items":{"type":"array","items":{"type":"object","properties":{"tamperLabel":{"maxLength":255,"type":"string","description":"The code that is printed the tamper label of the Device that is shipped.","example":"BF120877"},"serialNumber":{"maxLength":255,"type":"string","description":"The serial number of the Device that is shipped.","example":"85000711"}},"x-ref":"#/components/schemas/ShipmentItemCreate"},"key$":"items"}},"x-ref":"#/components/schemas/ShipmentCreate","index$":1}}},"required":true},"parameters":[]},"GET /shipments":{"protocol":"http","parameters":[{"name":"kif","in":"query","description":"Filter the list by KIF. The parameter value can be either a KIF ID or Name.","required":true,"schema":{"type":"string"},"index$":0},{"name":"mode","in":"query","description":"Filter the list by shipment mode.","schema":{"type":"string","enum":["inTransit","received"]},"index$":1},{"name":"take","in":"query","description":"The number of entries to include in the list.","schema":{"type":"integer","format":"int32","default":10},"index$":2},{"name":"skip","in":"query","description":"The number of results to skip before listing entries.","schema":{"type":"integer","format":"int32","default":0},"index$":3}]},"GET /shipments/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"The Shipment's unique identifier.","required":true,"schema":{"type":"string"},"index$":0}]}}, { strict: LIVE_STRICT, t })
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const shipment_ref01_ent = client.Shipment()
    let shipment_ref01_data = setup.data.new.shipment['shipment_ref01']

    shipment_ref01_data = (await shipment_ref01_ent.create(shipment_ref01_data)).data()
    assert(null != shipment_ref01_data.id)


    // LIST
    const shipment_ref01_match = {}

    const shipment_ref01_list = (await shipment_ref01_ent.list(shipment_ref01_match)).map((e) => e.data())

    assert(!isempty(select(shipment_ref01_list, { id: shipment_ref01_data.id })))


    // LOAD
    const shipment_ref01_match_dt0 = {}
    shipment_ref01_match_dt0.id = shipment_ref01_data.id
    const shipment_ref01_data_dt0 = (await shipment_ref01_ent.load(shipment_ref01_match_dt0)).data()
    assert(shipment_ref01_data_dt0.id === shipment_ref01_data.id)


  })
})



// main.kit.test.live.strict is true (the default is true): a live
// request that fails, or a live test missing an input it needs,
// fails the test.
// An account with no record for a test to read skips it either way.
const LIVE_STRICT = true

function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname,
      '../../../../.sdk/test/entity/shipment/ShipmentTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = BluefinDecryptxP2peSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['shipment01','shipment02','shipment03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_SHIPMENT_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_SHIPMENT_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_SHIPMENT_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new BluefinDecryptxP2peSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
        apikey: env.BLUEFIN_DECRYPTX_P2PE_APIKEY,
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when
      // the last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey and
      // server values above and handed the SDK undefined.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  

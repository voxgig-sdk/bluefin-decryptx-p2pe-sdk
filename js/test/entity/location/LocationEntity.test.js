
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


describe('LocationEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Location()
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
    PreSpec() { throw new Error('location hook failed') }
    PreUnexpected() { this.unexpected++ }
  }

  test('stream-error', async () => {
    const offline = { net: { offline: true } }
    await assert.rejects(async () => {
      for await (const _item of BluefinDecryptxP2peSDK.test(offline).Location().stream('list')) { }
    }, /offline/)

    for await (const _item of BluefinDecryptxP2peSDK.test(offline).Location()
      .stream('list', undefined, { ctrl: { throw: false } })) { }

    if (null != config.feature?.rbac) {
      const denied = BluefinDecryptxP2peSDK.test(undefined, { feature: { rbac: { active: true, deny: true } } })
      await assert.rejects(async () => {
        for await (const _item of denied.Location().stream('list')) { }
      }, (err) => 'rbac_denied' === err.code)
    }
  })

  test('stream-ctrl', async () => {
    const explain = {}
    const ctrl = { explain }
    for await (const _item of BluefinDecryptxP2peSDK.test().Location().stream('list', undefined, { ctrl })) { }
    assert.deepStrictEqual(Object.keys(ctrl), ['explain'])
    assert(explain === ctrl.explain && 0 < Object.keys(explain).length)
  })

  test('unexpected', async () => {
    const hook = new FailHook()
    const client = new BluefinDecryptxP2peSDK({ feature: { test: { active: true } }, extend: [hook] })
    await assert.rejects(client.Location().list(), /hook failed/)
    assert(0 < hook.unexpected)

    const fired = hook.unexpected
    assert.strictEqual(await client.Location().list(undefined, { throw: false }), undefined)
    assert(fired < hook.unexpected)
  })

  test('validate', async (t) => {
    if (null == config.feature?.validate) {
      t.skip('feature not present in this SDK: validate')
      return
    }
    const client = BluefinDecryptxP2peSDK.test(undefined, { feature: { validate: { active: true } } })
    await assert.rejects(client.Location().list({"client":1}),
      (err) => 'validate_failed' === err.code)
  })



  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"address1":{"a":true,"h":"Address1","n":"address1","op":{"create":{"req":true,"type":"`$STRING`"}},"r":false,"sh":"The Location's street address.","t":"`$STRING`","key$":"address1","index$":0},"address2":{"a":true,"h":"Address2","n":"address2","r":false,"sh":"The Location's street address.","t":"`$STRING`","key$":"address2","index$":1},"billingId":{"a":true,"h":"Billing Id","n":"billingId","r":false,"sh":"\\?","t":"`$STRING`","key$":"billingId","index$":2},"city":{"a":true,"h":"City","n":"city","op":{"create":{"req":true,"type":"`$STRING`"}},"r":false,"sh":"The Location's city.","t":"`$STRING`","key$":"city","index$":3},"client":{"a":true,"h":"Client","n":"client","r":false,"sh":"Reference to the associated Client resource.","t":"`$OBJECT`","key$":"client","index$":4},"country":{"a":true,"h":"Country","n":"country","op":{"create":{"req":true,"type":"`$OBJECT`"}},"r":false,"sh":"The Location's country.","t":"`$STRING`","key$":"country","index$":5},"created":{"a":true,"fo":"datetime","h":"Created","n":"created","r":false,"sh":"Creation timestamp in ISO 8601 format.","t":"`$STRING`","key$":"created","index$":6},"customReference":{"a":true,"h":"Custom Reference","n":"customReference","r":false,"sh":"A Partner specified reference for a location.","t":"`$STRING`","key$":"customReference","index$":7},"id":{"a":true,"h":"Id","n":"id","r":false,"sh":"This resource's unique identifier.","t":"`$STRING`","key$":"id","index$":8},"locationType":{"a":true,"h":"Location Type","n":"locationType","op":{"create":{"req":true,"type":"`$STRING`"}},"r":false,"sh":"The Location's clasification.","t":"`$STRING`","key$":"locationType","index$":9},"mailAddress1":{"a":true,"h":"Mail Address1","n":"mailAddress1","r":false,"sh":"The Location's street address.","t":"`$STRING`","key$":"mailAddress1","index$":10},"mailAddress2":{"a":true,"h":"Mail Address2","n":"mailAddress2","r":false,"sh":"The Location's street address.","t":"`$STRING`","key$":"mailAddress2","index$":11},"mailCity":{"a":true,"h":"Mail City","n":"mailCity","r":false,"sh":"The Location's city.","t":"`$STRING`","key$":"mailCity","index$":12},"mailCountry":{"a":true,"h":"Mail Country","n":"mailCountry","r":false,"sh":"The Location's street address.","t":"`$STRING`","key$":"mailCountry","index$":13},"mailPostalCode":{"a":true,"h":"Mail Postal Code","n":"mailPostalCode","r":false,"sh":"The Location's postal code.","t":"`$STRING`","key$":"mailPostalCode","index$":14},"mailStateProvince":{"a":true,"h":"Mail State Province","n":"mailStateProvince","r":false,"sh":"The Location's street state or province.","t":"`$STRING`","key$":"mailStateProvince","index$":15},"modified":{"a":true,"fo":"datetime","h":"Modified","n":"modified","r":false,"sh":"Last modified timestamp.","t":"`$STRING`","key$":"modified","index$":16},"name":{"a":true,"h":"Name","n":"name","op":{"create":{"req":true,"type":"`$STRING`"}},"r":false,"sh":"The Location's name.","t":"`$STRING`","key$":"name","index$":17},"nameOfBusiness":{"a":true,"h":"Name Of Business","n":"nameOfBusiness","r":false,"sh":"The name of the business at this location.","t":"`$STRING`","key$":"nameOfBusiness","index$":18},"notes":{"a":true,"h":"Notes","n":"notes","r":false,"sh":"Note for delivery driver.","t":"`$STRING`","key$":"notes","index$":19},"postalCode":{"a":true,"h":"Postal Code","n":"postalCode","r":false,"sh":"The Location's postal code.","t":"`$STRING`","key$":"postalCode","index$":20},"stateProvince":{"a":true,"h":"State Province","n":"stateProvince","r":false,"sh":"The Location's street state or province.","t":"`$STRING`","key$":"stateProvince","index$":21},"uniqueId":{"a":true,"h":"Unique Id","n":"uniqueId","r":false,"sh":"Unique Identifier for the Location.","t":"`$STRING`","key$":"uniqueId","index$":22},"version":{"a":true,"h":"Version","n":"version","r":false,"sh":"The number of times that this resource has been updated.","t":"`$INTEGER`","key$":"version","index$":23}},"id":{"field":"id","name":"id"},"name":"location","op":{"create":{"input":"data","name":"create","points":[{"a":true,"bf":["address1","address2","billingId","city","client","country","customReference","locationType","mailAddress1","mailAddress2","mailCity","mailCountry","mailPostalCode","mailStateProvince","name","nameOfBusiness","notes","postalCode","stateProvince","uniqueId"],"co":{"id":"POST /locations","source":"openapi3","version":2},"g":{},"k":"http","m":"POST","o":"/locations","q":{},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"locations"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"list":{"input":"data","name":"list","points":[{"a":true,"co":{"id":"GET /locations","source":"openapi3","version":2},"g":{"query":[{"a":true,"k":"query","n":"client","or":"client","r":true,"t":"`$STRING`","index$":0},{"a":true,"ex":0,"k":"query","n":"skip","or":"skip","r":false,"t":"`$INTEGER`","index$":1},{"a":true,"ex":10,"k":"query","n":"take","or":"take","r":false,"t":"`$INTEGER`","index$":2}]},"k":"http","m":"GET","o":"/locations","q":{"exist":["client"]},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"locations"}],"t":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /locations/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/locations/{id}","q":{"exist":["id"]},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"locations"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"},"remove":{"input":"data","name":"remove","points":[{"a":true,"co":{"id":"DELETE /locations/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"DELETE","o":"/locations/{id}","q":{"exist":["id"]},"r":{},"s":[{"lit":"locations"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"remove"}},"relations":{"ancestors":[]},"key$":"location","name__orig":"location","Name":"Location","name_":"location","name-":"location","NAME":"LOCATION","index$":14}, {"active":true,"entity":"location","key$":"BasicLocationFlow","kind":"basic","name":"BasicLocationFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"location_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0},{"a":true,"d":{},"i":{},"m":{},"o":"list","s":[],"v":[{"apply":"ItemExists","def":{"ref":"location_ref01"}}],"index$":1},{"a":true,"d":{},"i":{"ref":"location_ref01","srcdatavar":"location_ref01_data","suffix":"_dt0"},"m":{"id":"location01"},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-location_ref01"}}],"index$":2},{"a":true,"d":{},"i":{"ref":"location_ref01","suffix":"_rm0"},"m":{"id":"location01"},"o":"remove","s":[],"v":[],"index$":3},{"a":true,"d":{},"i":{"suffix":"_rt0"},"m":{},"o":"list","s":[],"v":[{"apply":"ItemNotExists","def":{"ref":"location_ref01"}}],"index$":4}]}, 'Location', {"POST /locations":{"protocol":"http","requestBody":{"description":"Location to be created.","content":{"*/*":{"schema":{"required":["address1","city","country","locationType","name"],"type":"object","properties":{"client":{"type":"object","properties":{"id":{"type":"string","description":"The referenced Client's ID.","example":"4684"},"name":{"type":"string","description":"The referenced Client's name.","example":"The Tired Window"}},"description":"Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/ClientReference","key$":"client"},"name":{"maxLength":255,"type":"string","description":"The Location's name.","example":"ASM Software Headquarters","key$":"name"},"customReference":{"maxLength":255,"type":"string","description":"A Partner specified reference for a location. Must be unique to a Partner.","example":"ASDF234","key$":"customReference"},"billingId":{"maxLength":50,"type":"string","description":"\\?","key$":"billingId"},"nameOfBusiness":{"maxLength":255,"type":"string","description":"The name of the business at this location.","example":"The Tired Window","key$":"nameOfBusiness"},"locationType":{"type":"string","description":"The Location's clasification.","example":"Merchant retail location","enum":["Manufacturer","Manufacturer long term storage","KIF","Vendor fulfillment location","BF fulfillment location","Merchant retail location","Merchant CSR location","Merchant long term storage location","Merchant short term storage & distribution","Corporate Headquarters","Regional Office","Field Office","Partner Location"],"key$":"locationType"},"uniqueId":{"maxLength":255,"type":"string","description":"Unique Identifier for the Location.","example":"8","key$":"uniqueId"},"country":{"type":"object","properties":{"code":{"maxLength":2,"type":"string","description":"The referenced Country's code (two uppercase symbols).","example":"US"},"name":{"type":"string","description":"The referenced Country's name.","example":"United States"}},"description":"Reference to the associated Country. When used for POST and PATCH API calls, the reference can contain either the ISO-ALPHA2 country Code or Name.","x-ref":"#/components/schemas/CountryReference","key$":"country"},"address1":{"maxLength":255,"type":"string","description":"The Location's street address.","example":"123 Main St","key$":"address1"},"address2":{"maxLength":255,"type":"string","description":"The Location's street address.","example":"Suite 100","key$":"address2"},"city":{"maxLength":255,"type":"string","description":"The Location's city.","example":"Atlanta","key$":"city"},"stateProvince":{"maxLength":255,"type":"string","description":"The Location's street state or province.","example":"Georgia","key$":"stateProvince"},"postalCode":{"maxLength":10,"type":"string","description":"The Location's postal code.","example":"30350","key$":"postalCode"},"mailCountry":{"type":"string","description":"The Location's street address.","example":"United States","key$":"mailCountry"},"mailAddress1":{"maxLength":255,"type":"string","description":"The Location's street address.","example":"123 Main St","key$":"mailAddress1"},"mailAddress2":{"maxLength":255,"type":"string","description":"The Location's street address.","example":"Suite 100","key$":"mailAddress2"},"mailCity":{"maxLength":255,"type":"string","description":"The Location's city.","example":"Atlanta","key$":"mailCity"},"mailStateProvince":{"maxLength":255,"type":"string","description":"The Location's street state or province.","example":"Georgia","key$":"mailStateProvince"},"mailPostalCode":{"maxLength":10,"type":"string","description":"The Location's postal code.","example":"30350","key$":"mailPostalCode"},"notes":{"type":"string","description":"Note for delivery driver.","example":"Dial 129 on the intercom to speak with our receptionist.","key$":"notes"}},"x-ref":"#/components/schemas/LocationCreate","index$":1}}},"required":true},"parameters":[]},"GET /locations":{"protocol":"http","parameters":[{"name":"client","in":"query","description":"Filter the list by Client. The parameter value can be either a Client ID or Name.","required":true,"schema":{"type":"string"},"index$":0},{"name":"take","in":"query","description":"The number of entries to include in the list.","schema":{"type":"integer","format":"int32","default":10},"index$":1},{"name":"skip","in":"query","description":"The number of results to skip before listing entries.","schema":{"type":"integer","format":"int32","default":0},"index$":2}]},"GET /locations/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"The Location's unique identifier.","required":true,"schema":{"type":"string"},"index$":0}]},"DELETE /locations/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"The Location's unique identifier.","required":true,"schema":{"type":"string"},"index$":0}]}}, { strict: LIVE_STRICT, t })
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const location_ref01_ent = client.Location()
    let location_ref01_data = setup.data.new.location['location_ref01']

    location_ref01_data = (await location_ref01_ent.create(location_ref01_data)).data()
    assert(null != location_ref01_data.id)


    // LIST
    const location_ref01_match = {}

    const location_ref01_list = (await location_ref01_ent.list(location_ref01_match)).map((e) => e.data())

    assert(!isempty(select(location_ref01_list, { id: location_ref01_data.id })))


    // LOAD
    const location_ref01_match_dt0 = {}
    location_ref01_match_dt0.id = location_ref01_data.id
    const location_ref01_data_dt0 = (await location_ref01_ent.load(location_ref01_match_dt0)).data()
    assert(location_ref01_data_dt0.id === location_ref01_data.id)


    // REMOVE
    const location_ref01_match_rm0 = {}
    location_ref01_match_rm0.id = location_ref01_data.id
    await location_ref01_ent.remove(location_ref01_match_rm0)
  

    // LIST
    const location_ref01_match_rt0 = {}

    const location_ref01_list_rt0 = (await location_ref01_ent.list(location_ref01_match_rt0)).map((e) => e.data())

    assert(isempty(select(location_ref01_list_rt0, { id: location_ref01_data.id })))


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
      '../../../../.sdk/test/entity/location/LocationTestData.json')

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
    ['location01','location02','location03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_LOCATION_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_LOCATION_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_LOCATION_ENTID']
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
  

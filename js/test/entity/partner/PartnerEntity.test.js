
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


describe('PartnerEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Partner()
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
    PreSpec() { throw new Error('partner hook failed') }
    PreUnexpected() { this.unexpected++ }
  }

  test('stream-error', async () => {
    const offline = { net: { offline: true } }
    await assert.rejects(async () => {
      for await (const _item of BluefinDecryptxP2peSDK.test(offline).Partner().stream('list')) { }
    }, /offline/)

    for await (const _item of BluefinDecryptxP2peSDK.test(offline).Partner()
      .stream('list', undefined, { ctrl: { throw: false } })) { }

    if (null != config.feature?.rbac) {
      const denied = BluefinDecryptxP2peSDK.test(undefined, { feature: { rbac: { active: true, deny: true } } })
      await assert.rejects(async () => {
        for await (const _item of denied.Partner().stream('list')) { }
      }, (err) => 'rbac_denied' === err.code)
    }
  })

  test('stream-ctrl', async () => {
    const explain = {}
    const ctrl = { explain }
    for await (const _item of BluefinDecryptxP2peSDK.test().Partner().stream('list', undefined, { ctrl })) { }
    assert.deepStrictEqual(Object.keys(ctrl), ['explain'])
    assert(explain === ctrl.explain && 0 < Object.keys(explain).length)
  })

  test('unexpected', async () => {
    const hook = new FailHook()
    const client = new BluefinDecryptxP2peSDK({ feature: { test: { active: true } }, extend: [hook] })
    await assert.rejects(client.Partner().list(), /hook failed/)
    assert(0 < hook.unexpected)

    const fired = hook.unexpected
    assert.strictEqual(await client.Partner().list(undefined, { throw: false }), undefined)
    assert(fired < hook.unexpected)
  })

  test('validate', async (t) => {
    if (null == config.feature?.validate) {
      t.skip('feature not present in this SDK: validate')
      return
    }
    const client = BluefinDecryptxP2peSDK.test(undefined, { feature: { validate: { active: true } } })
    await assert.rejects(client.Partner().list({"partner":1}),
      (err) => 'validate_failed' === err.code)
  })



  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"billingId":{"a":true,"h":"Billing Id","n":"billingId","r":false,"sh":"The Partner's billing identifier.","t":"`$STRING`","key$":"billingId","index$":0},"clientCanOrderEquipment":{"a":true,"h":"Client Can Order Equipment","n":"clientCanOrderEquipment","r":false,"sh":"This property indicates if the Partner is allowed to order Equipment.","t":"`$BOOLEAN`","key$":"clientCanOrderEquipment","index$":1},"contact":{"a":true,"h":"Contact","n":"contact","op":{"create":{"req":true,"type":"`$OBJECT`"},"list":{"req":true,"type":"`$OBJECT`"}},"r":false,"sh":"Reference to the associated User resource.","t":"`$OBJECT`","key$":"contact","index$":2},"created":{"a":true,"fo":"datetime","h":"Created","n":"created","r":false,"sh":"Creation timestamp in ISO 8601 format.","t":"`$STRING`","key$":"created","index$":3},"id":{"a":true,"h":"Id","n":"id","r":false,"sh":"This resource's unique identifier.","t":"`$STRING`","key$":"id","index$":4},"isActive":{"a":true,"h":"Is Active","n":"isActive","r":false,"sh":"This property indicates if the Parter account is active or disabled.","t":"`$BOOLEAN`","key$":"isActive","index$":5},"location":{"a":true,"h":"Location","n":"location","r":true,"sh":"Reference to the associated Location resource.","t":"`$OBJECT`","key$":"location","index$":6},"modified":{"a":true,"fo":"datetime","h":"Modified","n":"modified","r":false,"sh":"Last modified timestamp.","t":"`$STRING`","key$":"modified","index$":7},"name":{"a":true,"h":"Name","n":"name","op":{"create":{"req":true,"type":"`$STRING`"}},"r":false,"sh":"The Partner's name.","t":"`$STRING`","key$":"name","index$":8},"parent":{"a":true,"h":"Parent","n":"parent","op":{"create":{"req":true,"type":"`$OBJECT`"}},"r":false,"sh":"Reference to the associated Partner.","t":"`$OBJECT`","key$":"parent","index$":9},"partnerId":{"a":true,"h":"Partner Id","n":"partnerId","r":false,"sh":"The Partner's id.","t":"`$STRING`","key$":"partnerId","index$":10},"reference":{"a":true,"h":"Reference","n":"reference","op":{"create":{"req":true,"type":"`$STRING`"}},"r":false,"sh":"The Partner's reference string.","t":"`$STRING`","key$":"reference","index$":11},"verificationPhrase":{"a":true,"h":"Verification Phrase","n":"verificationPhrase","r":false,"sh":"The verification phrase is a message that the Partner creates.","t":"`$STRING`","key$":"verificationPhrase","index$":12},"version":{"a":true,"h":"Version","n":"version","r":false,"sh":"The number of times that this resource has been updated.","t":"`$INTEGER`","key$":"version","index$":13}},"id":{"field":"id","name":"id"},"name":"partner","op":{"create":{"input":"data","name":"create","points":[{"a":true,"bf":["billingId","clientCanOrderEquipment","contact","isActive","location","name","parent","partnerId","reference","verificationPhrase"],"co":{"id":"POST /partners","source":"openapi3","version":2},"g":{},"k":"http","m":"POST","o":"/partners","q":{},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"partners"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"list":{"input":"data","name":"list","points":[{"a":true,"co":{"id":"GET /partners","source":"openapi3","version":2},"g":{"query":[{"a":true,"k":"query","n":"partner","or":"partner","r":false,"t":"`$STRING`","index$":0},{"a":true,"ex":0,"k":"query","n":"skip","or":"skip","r":false,"t":"`$INTEGER`","index$":1},{"a":true,"ex":10,"k":"query","n":"take","or":"take","r":false,"t":"`$INTEGER`","index$":2}]},"k":"http","m":"GET","o":"/partners","q":{},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"partners"}],"t":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /partners/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/partners/{id}","q":{"exist":["id"]},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"partners"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"partner","name__orig":"partner","Name":"Partner","name_":"partner","name-":"partner","NAME":"PARTNER","index$":15}, {"active":true,"entity":"partner","key$":"BasicPartnerFlow","kind":"basic","name":"BasicPartnerFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"partner_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0},{"a":true,"d":{},"i":{},"m":{},"o":"list","s":[],"v":[{"apply":"ItemExists","def":{"ref":"partner_ref01"}}],"index$":1},{"a":true,"d":{},"i":{"ref":"partner_ref01","srcdatavar":"partner_ref01_data","suffix":"_dt0"},"m":{"id":"partner01"},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-partner_ref01"}}],"index$":2}]}, 'Partner', {"POST /partners":{"protocol":"http","requestBody":{"description":"Partner to be created.","content":{"*/*":{"schema":{"required":["contact","location","name","parent","reference"],"type":"object","properties":{"name":{"maxLength":255,"type":"string","description":"The Partner's name.","example":"ASM Software","key$":"name"},"reference":{"maxLength":255,"type":"string","description":"The Partner's reference string. This reference is used in to identify the Partner on the Decryption APIs. It equates to the Partner ID.","example":"asmsoftware","key$":"reference"},"billingId":{"type":"string","description":"The Partner's billing identifier.","example":"001J000001ngZle","key$":"billingId"},"partnerId":{"type":"string","description":"The Partner's id.","example":"10","key$":"partnerId"},"verificationPhrase":{"type":"string","description":"The verification phrase is a message that the Partner creates. It can be used as a mechanism to authorize a partner when they initiate communication over the phone.","example":"The quick brown fox jumps over the lazy dog","key$":"verificationPhrase"},"clientCanOrderEquipment":{"type":"boolean","description":"This property indicates if the Partner is allowed to order Equipment.","example":false,"key$":"clientCanOrderEquipment"},"isActive":{"type":"boolean","description":"This property indicates if the Parter account is active or disabled.","example":true,"key$":"isActive"},"parent":{"type":"object","properties":{"id":{"type":"string","description":"The referenced Partner's ID.","example":"6580"},"name":{"type":"string","description":"The referenced Partner's name.","example":"ASM Software"}},"description":"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/PartnerReference","key$":"parent"},"location":{"required":["address1","city","country","locationType","name"],"type":"object","properties":{"name":{"maxLength":255,"type":"string","description":"The Location's name.","example":"ASM Software Headquarters"},"customReference":{"maxLength":255,"type":"string","description":"A Partner specified reference for a location.","example":"ASDF234"},"billingId":{"maxLength":50,"type":"string","description":"\\?"},"nameOfBusiness":{"maxLength":255,"type":"string","description":"The name of the business at this location.","example":"ASM Software"},"locationType":{"type":"string","description":"The Location's clasification.","example":"Corporate Headquarters","enum":["Manufacturer","Manufacturer long term storage","KIF","Vendor fulfillment location","BF fulfillment location","Merchant retail location","Merchant CSR location","Merchant long term storage location","Merchant short term storage & distribution","Corporate Headquarters","Regional Office","Field Office","Partner Location"]},"uniqueId":{"maxLength":255,"type":"string","description":"Unique Identifier for the Location.","example":"8"},"country":{"type":"object","properties":{"code":{},"name":{}},"description":"Reference to the associated Country. When used for POST and PATCH API calls, the reference can contain either the ISO-ALPHA2 country Code or Name.","x-ref":"#/components/schemas/CountryReference"},"address1":{"maxLength":255,"type":"string","description":"The Location's street address.","example":"123 Main St"},"address2":{"maxLength":255,"type":"string","description":"The Location's street address.","example":"Suite 100"},"city":{"maxLength":255,"type":"string","description":"The Location's city.","example":"Atlanta"},"stateProvince":{"maxLength":255,"type":"string","description":"The Location's street state or province.","example":"Georgia"},"postalCode":{"maxLength":10,"type":"string","description":"The Location's postal code.","example":"30350"},"mailCountry":{"type":"string","description":"The Location's street address.","example":"United States"},"mailAddress1":{"maxLength":255,"type":"string","description":"The Location's street address.","example":"123 Main St"},"mailAddress2":{"maxLength":255,"type":"string","description":"The Location's street address.","example":"Suite 100"},"mailCity":{"maxLength":255,"type":"string","description":"The Location's city.","example":"Atlanta"},"mailStateProvince":{"maxLength":255,"type":"string","description":"The Location's State or Province.","example":"Georgia"},"mailPostalCode":{"maxLength":10,"type":"string","description":"The Location's street address.","example":"30350"},"notes":{"type":"string","description":"Note for delivery driver.","example":"Dial 129 on the intercom to speak with our receptionist."}},"description":"A Location object.","x-ref":"#/components/schemas/LocationCreateInline","key$":"location"},"contact":{"required":["email","firstName","isActive","lastName","phone","userName","userRole"],"type":"object","properties":{"userName":{"maxLength":255,"type":"string","description":"The User's unique username.","example":"kgilluley0"},"firstName":{"maxLength":255,"type":"string","description":"The User's name.","example":"Kaleena"},"lastName":{"maxLength":255,"type":"string","description":"The User's Surname.","example":"Gilluley"},"email":{"maxLength":255,"type":"string","description":"The User's email address.","example":"kgilluley0@zdnet.com"},"phone":{"maxLength":255,"type":"string","description":"The User's phone number without dashes, spaces, or brackets.","example":"2025550162"},"userRole":{"type":"string","enum":["Partner User","Client Admin","Client User","Client Custodian","Client Procurement"]},"isActive":{"type":"boolean","description":"This property indicates if the User account is active or disabled. Once a user has logged into the system, their account cannot be deleted. As an alternative, their account can be set to inactive.","example":true},"sendWelcomeEmail":{"type":"boolean","description":"If this property is set to *'true'*, the newly created user will be sent a welcome email.","example":true}},"description":"A User object.","x-ref":"#/components/schemas/UserCreateInline","key$":"contact"}},"x-ref":"#/components/schemas/PartnerCreate","index$":1}}},"required":true},"parameters":[]},"GET /partners":{"protocol":"http","parameters":[{"name":"partner","in":"query","description":"Filter the list by Partner. The parameter value can be either a Partner ID or Name.","schema":{"type":"string"},"index$":0},{"name":"take","in":"query","description":"The number of entries to include in the list.","schema":{"type":"integer","format":"int32","default":10},"index$":1},{"name":"skip","in":"query","description":"The number of results to skip before listing entries.","schema":{"type":"integer","format":"int32","default":0},"index$":2}]},"GET /partners/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"The Partner's unique identifier.","required":true,"schema":{"type":"string"},"index$":0}]}}, { strict: LIVE_STRICT, t })
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const partner_ref01_ent = client.Partner()
    let partner_ref01_data = setup.data.new.partner['partner_ref01']

    partner_ref01_data = (await partner_ref01_ent.create(partner_ref01_data)).data()
    assert(null != partner_ref01_data.id)


    // LIST
    const partner_ref01_match = {}

    const partner_ref01_list = (await partner_ref01_ent.list(partner_ref01_match)).map((e) => e.data())

    assert(!isempty(select(partner_ref01_list, { id: partner_ref01_data.id })))


    // LOAD
    const partner_ref01_match_dt0 = {}
    partner_ref01_match_dt0.id = partner_ref01_data.id
    const partner_ref01_data_dt0 = (await partner_ref01_ent.load(partner_ref01_match_dt0)).data()
    assert(partner_ref01_data_dt0.id === partner_ref01_data.id)


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
      '../../../../.sdk/test/entity/partner/PartnerTestData.json')

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
    ['partner01','partner02','partner03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_PARTNER_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_PARTNER_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_PARTNER_ENTID']
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
  

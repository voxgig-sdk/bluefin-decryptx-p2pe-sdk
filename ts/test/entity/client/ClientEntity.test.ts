

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { BluefinDecryptxP2peSDK, BaseFeature, config, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


loadEnvLocal(__dirname + '/../../../.env.local')


describe('ClientEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Client()
    assert(null != ent)
  })


  class FailHook extends BaseFeature {
    name = 'failhook'
    version = '0.0.1'
    active = true
    unexpected = 0
    init() { }
    PreSpec() { throw new Error('client hook failed') }
    PreUnexpected() { this.unexpected++ }
  }

  test('stream-error', async () => {
    const offline = { net: { offline: true } }
    await assert.rejects(async () => {
      for await (const _item of BluefinDecryptxP2peSDK.test(offline).Client().stream('list')) { }
    }, /offline/)

    for await (const _item of BluefinDecryptxP2peSDK.test(offline).Client()
      .stream('list', undefined, { ctrl: { throw: false } })) { }

    if (null != (config as any).feature?.rbac) {
      const denied = BluefinDecryptxP2peSDK.test(undefined, { feature: { rbac: { active: true, deny: true } } })
      await assert.rejects(async () => {
        for await (const _item of denied.Client().stream('list')) { }
      }, (err: any) => 'rbac_denied' === err.code)
    }
  })

  test('stream-ctrl', async () => {
    const explain: any = {}
    const ctrl: any = { explain }
    for await (const _item of BluefinDecryptxP2peSDK.test().Client().stream('list', undefined, { ctrl })) { }
    assert.deepStrictEqual(Object.keys(ctrl), ['explain'])
    assert(explain === ctrl.explain && 0 < Object.keys(explain).length)
  })

  test('unexpected', async () => {
    const hook = new FailHook()
    const client = new BluefinDecryptxP2peSDK({ feature: { test: { active: true } }, extend: [hook] })
    await assert.rejects(client.Client().list(), /hook failed/)
    assert(0 < hook.unexpected)

    const fired = hook.unexpected
    assert.strictEqual(await client.Client().list(undefined, { throw: false }), undefined)
    assert(fired < hook.unexpected)
  })

  test('validate', async (t) => {
    if (null == (config as any).feature?.validate) {
      t.skip('feature not present in this SDK: validate')
      return
    }
    const client = BluefinDecryptxP2peSDK.test(undefined, { feature: { validate: { active: true } } })
    await assert.rejects(client.Client().list({"partner":1} as any),
      (err: any) => 'validate_failed' === err.code)
  })



  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
    for (const op of ['create', 'list', 'load', 'remove']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'client.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"contact":{"a":true,"h":"Contact","n":"contact","op":{"create":{"req":true,"type":"`$OBJECT`"},"list":{"req":true,"type":"`$OBJECT`"}},"r":false,"sh":"Reference to the associated User resource.","t":"`$OBJECT`","key$":"contact","index$":0},"created":{"a":true,"fo":"datetime","h":"Created","n":"created","r":false,"sh":"Creation timestamp in ISO 8601 format.","t":"`$STRING`","key$":"created","index$":1},"directPartner":{"a":true,"h":"Direct Partner","n":"directPartner","op":{"create":{"req":true,"type":"`$OBJECT`"}},"r":false,"sh":"Reference to the associated Partner.","t":"`$OBJECT`","key$":"directPartner","index$":2},"id":{"a":true,"h":"Id","n":"id","r":false,"sh":"This resource's unique identifier.","t":"`$STRING`","key$":"id","index$":3},"isActive":{"a":true,"h":"Is Active","n":"isActive","r":false,"sh":"This property indicates if the Client account is active or disabled.","t":"`$BOOLEAN`","key$":"isActive","index$":4},"location":{"a":true,"h":"Location","n":"location","r":true,"sh":"Reference to the associated Location resource.","t":"`$OBJECT`","key$":"location","index$":5},"mid":{"a":true,"h":"Mid","n":"mid","r":false,"sh":"Some Partners will have an merchant ids on their own software offerings.","t":"`$STRING`","key$":"mid","index$":6},"modified":{"a":true,"fo":"datetime","h":"Modified","n":"modified","r":false,"sh":"Last modified timestamp.","t":"`$STRING`","key$":"modified","index$":7},"name":{"a":true,"h":"Name","n":"name","op":{"create":{"req":true,"type":"`$STRING`"}},"r":false,"sh":"The Client's name.","t":"`$STRING`","key$":"name","index$":8},"partner":{"a":true,"h":"Partner","n":"partner","r":false,"sh":"Reference to the Client's root Partner.","t":"`$OBJECT`","key$":"partner","index$":9},"version":{"a":true,"h":"Version","n":"version","r":false,"sh":"The number of times that this resource has been updated.","t":"`$INTEGER`","key$":"version","index$":10}},"id":{"field":"id","name":"id"},"name":"client","op":{"create":{"input":"data","name":"create","points":[{"a":true,"bf":["contact","directPartner","isActive","location","mid","name"],"co":{"id":"POST /clients","source":"openapi3","version":2},"g":{},"k":"http","m":"POST","o":"/clients","q":{},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"clients"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"list":{"input":"data","name":"list","points":[{"a":true,"co":{"id":"GET /clients","source":"openapi3","version":2},"g":{"query":[{"a":true,"k":"query","n":"partner","or":"partner","r":true,"t":"`$STRING`","index$":0},{"a":true,"ex":0,"k":"query","n":"skip","or":"skip","r":false,"t":"`$INTEGER`","index$":1},{"a":true,"ex":10,"k":"query","n":"take","or":"take","r":false,"t":"`$INTEGER`","index$":2}]},"k":"http","m":"GET","o":"/clients","q":{"exist":["partner"]},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"clients"}],"t":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /clients/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/clients/{id}","q":{"exist":["id"]},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"clients"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"},"remove":{"input":"data","name":"remove","points":[{"a":true,"co":{"id":"DELETE /clients/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"DELETE","o":"/clients/{id}","q":{"exist":["id"]},"r":{},"s":[{"lit":"clients"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"remove"}},"relations":{"ancestors":[]},"key$":"client","name__orig":"client","Name":"Client","name_":"client","name-":"client","NAME":"CLIENT","index$":1}, {"active":true,"entity":"client","key$":"BasicClientFlow","kind":"basic","name":"BasicClientFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"client_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0},{"a":true,"d":{},"i":{},"m":{},"o":"list","s":[],"v":[{"apply":"ItemExists","def":{"ref":"client_ref01"}}],"index$":1},{"a":true,"d":{},"i":{"ref":"client_ref01","srcdatavar":"client_ref01_data","suffix":"_dt0"},"m":{"id":"client01"},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-client_ref01"}}],"index$":2},{"a":true,"d":{},"i":{"ref":"client_ref01","suffix":"_rm0"},"m":{"id":"client01"},"o":"remove","s":[],"v":[],"index$":3},{"a":true,"d":{},"i":{"suffix":"_rt0"},"m":{},"o":"list","s":[],"v":[{"apply":"ItemNotExists","def":{"ref":"client_ref01"}}],"index$":4}]}, 'Client', {"POST /clients":{"protocol":"http","requestBody":{"description":"Client to be created.","content":{"*/*":{"schema":{"required":["contact","directPartner","location","name"],"type":"object","properties":{"name":{"maxLength":255,"type":"string","description":"The Client's name.","example":"The Tired Window","key$":"name"},"mid":{"maxLength":50,"type":"string","description":"Some Partners will have an merchant ids on their own software offerings. This is an open field that allows those Partner associate a Client resource with their Merchant Identifier.","example":"220654321577","key$":"mid"},"isActive":{"type":"boolean","description":"This property indicates if the Client account is active or disabled. It is not possible to delete Clients, however their account can be set to inactive.","example":true,"key$":"isActive"},"directPartner":{"type":"object","properties":{"id":{"type":"string","description":"The referenced Partner's ID.","example":"6580"},"name":{"type":"string","description":"The referenced Partner's name.","example":"ASM Software"}},"description":"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/PartnerReference","key$":"directPartner"},"location":{"required":["address1","city","country","locationType","name"],"type":"object","properties":{"name":{"maxLength":255,"type":"string","description":"The Location's name.","example":"ASM Software Headquarters"},"customReference":{"maxLength":255,"type":"string","description":"A Partner specified reference for a location.","example":"ASDF234"},"billingId":{"maxLength":50,"type":"string","description":"\\?"},"nameOfBusiness":{"maxLength":255,"type":"string","description":"The name of the business at this location.","example":"ASM Software"},"locationType":{"type":"string","description":"The Location's clasification.","example":"Corporate Headquarters","enum":["Manufacturer","Manufacturer long term storage","KIF","Vendor fulfillment location","BF fulfillment location","Merchant retail location","Merchant CSR location","Merchant long term storage location","Merchant short term storage & distribution","Corporate Headquarters","Regional Office","Field Office","Partner Location"]},"uniqueId":{"maxLength":255,"type":"string","description":"Unique Identifier for the Location.","example":"8"},"country":{"type":"object","properties":{"code":{},"name":{}},"description":"Reference to the associated Country. When used for POST and PATCH API calls, the reference can contain either the ISO-ALPHA2 country Code or Name.","x-ref":"#/components/schemas/CountryReference"},"address1":{"maxLength":255,"type":"string","description":"The Location's street address.","example":"123 Main St"},"address2":{"maxLength":255,"type":"string","description":"The Location's street address.","example":"Suite 100"},"city":{"maxLength":255,"type":"string","description":"The Location's city.","example":"Atlanta"},"stateProvince":{"maxLength":255,"type":"string","description":"The Location's street state or province.","example":"Georgia"},"postalCode":{"maxLength":10,"type":"string","description":"The Location's postal code.","example":"30350"},"mailCountry":{"type":"string","description":"The Location's street address.","example":"United States"},"mailAddress1":{"maxLength":255,"type":"string","description":"The Location's street address.","example":"123 Main St"},"mailAddress2":{"maxLength":255,"type":"string","description":"The Location's street address.","example":"Suite 100"},"mailCity":{"maxLength":255,"type":"string","description":"The Location's city.","example":"Atlanta"},"mailStateProvince":{"maxLength":255,"type":"string","description":"The Location's State or Province.","example":"Georgia"},"mailPostalCode":{"maxLength":10,"type":"string","description":"The Location's street address.","example":"30350"},"notes":{"type":"string","description":"Note for delivery driver.","example":"Dial 129 on the intercom to speak with our receptionist."}},"description":"A Location object.","x-ref":"#/components/schemas/LocationCreateInline","key$":"location"},"contact":{"required":["email","firstName","isActive","lastName","phone","userName","userRole"],"type":"object","properties":{"userName":{"maxLength":255,"type":"string","description":"The User's unique username.","example":"kgilluley0"},"firstName":{"maxLength":255,"type":"string","description":"The User's name.","example":"Kaleena"},"lastName":{"maxLength":255,"type":"string","description":"The User's Surname.","example":"Gilluley"},"email":{"maxLength":255,"type":"string","description":"The User's email address.","example":"kgilluley0@zdnet.com"},"phone":{"maxLength":255,"type":"string","description":"The User's phone number without dashes, spaces, or brackets.","example":"2025550162"},"userRole":{"type":"string","enum":["Partner User","Client Admin","Client User","Client Custodian","Client Procurement"]},"isActive":{"type":"boolean","description":"This property indicates if the User account is active or disabled. Once a user has logged into the system, their account cannot be deleted. As an alternative, their account can be set to inactive.","example":true},"sendWelcomeEmail":{"type":"boolean","description":"If this property is set to *'true'*, the newly created user will be sent a welcome email.","example":true}},"description":"A User object.","x-ref":"#/components/schemas/UserCreateInline","key$":"contact"}},"x-ref":"#/components/schemas/ClientCreate","index$":1}}},"required":true},"parameters":[]},"GET /clients":{"protocol":"http","parameters":[{"name":"partner","in":"query","description":"Filter the list by Partner. The parameter value can be either a Partner ID or Name.","required":true,"schema":{"type":"string"},"index$":0},{"name":"take","in":"query","description":"The number of entries to include in the list.","schema":{"type":"integer","format":"int32","default":10},"index$":1},{"name":"skip","in":"query","description":"The number of results to skip before listing entries.","schema":{"type":"integer","format":"int32","default":0},"index$":2}]},"GET /clients/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"The Client's unique identifier.","required":true,"schema":{"type":"string"},"index$":0}]},"DELETE /clients/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"The Client's unique identifier.","required":true,"schema":{"type":"string"},"index$":0}]}}, { strict: LIVE_STRICT, t })
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const client_ref01_ent = client.Client()
    let client_ref01_data = setup.data.new.client['client_ref01']

    client_ref01_data = (await client_ref01_ent.create(client_ref01_data)).data()
    assert(null != client_ref01_data.id)


    // LIST
    const client_ref01_match: any = {}

    const client_ref01_list = (await client_ref01_ent.list(client_ref01_match)).map((e: any) => e.data())

    assert(!isempty(select(client_ref01_list, { id: client_ref01_data.id })))


    // LOAD
    const client_ref01_match_dt0: any = {}
    client_ref01_match_dt0.id = client_ref01_data.id
    const client_ref01_data_dt0 = (await client_ref01_ent.load(client_ref01_match_dt0)).data()
    assert(client_ref01_data_dt0.id === client_ref01_data.id)


    // REMOVE
    const client_ref01_match_rm0: any = { id: client_ref01_data.id }
    await client_ref01_ent.remove(client_ref01_match_rm0)
  

    // LIST
    const client_ref01_match_rt0: any = {}

    const client_ref01_list_rt0 = (await client_ref01_ent.list(client_ref01_match_rt0)).map((e: any) => e.data())

    assert(isempty(select(client_ref01_list_rt0, { id: client_ref01_data.id })))


  })
})



// main.kit.test.live.strict is true (the default is true): a live
// request that fails, or a live test missing an input it needs,
// fails the test.
// An account with no record for a test to read skips it either way.
const LIVE_STRICT = true

function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/client/ClientTestData.json')

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
    ['client01','client02','client03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
    'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID']
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
        secret: env.BLUEFIN_DECRYPTX_P2PE_SECRET,
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
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
  

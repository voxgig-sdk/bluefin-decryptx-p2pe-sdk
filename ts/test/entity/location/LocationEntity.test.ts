

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { BluefinDecryptxP2peSDK, BaseFeature, stdutil } from '../../..'

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


describe('LocationEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Location()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
    for (const op of ['create', 'list', 'load', 'remove']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'location.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"address1":{"a":true,"h":"Address1","n":"address1","r":false,"sh":"The Location's street address.","t":"`$STRING`","key$":"address1","index$":0},"address2":{"a":true,"h":"Address2","n":"address2","r":false,"sh":"The Location's street address.","t":"`$STRING`","key$":"address2","index$":1},"billingId":{"a":true,"h":"Billing Id","n":"billingId","r":false,"sh":"\\?","t":"`$STRING`","key$":"billingId","index$":2},"city":{"a":true,"h":"City","n":"city","r":false,"sh":"The Location's city.","t":"`$STRING`","key$":"city","index$":3},"country":{"a":true,"h":"Country","n":"country","r":false,"sh":"The Location's country.","t":"`$STRING`","key$":"country","index$":4},"created":{"a":true,"fo":"datetime","h":"Created","n":"created","r":false,"sh":"Creation timestamp in ISO 8601 format.","t":"`$STRING`","key$":"created","index$":5},"customReference":{"a":true,"h":"Custom Reference","n":"customReference","r":false,"sh":"A Partner specified reference for a location.","t":"`$STRING`","key$":"customReference","index$":6},"id":{"a":true,"h":"Id","n":"id","r":false,"sh":"This resource's unique identifier.","t":"`$STRING`","key$":"id","index$":7},"locationType":{"a":true,"h":"Location Type","n":"locationType","r":false,"sh":"The Location's clasification.","t":"`$STRING`","key$":"locationType","index$":8},"mailAddress1":{"a":true,"h":"Mail Address1","n":"mailAddress1","r":false,"sh":"The Location's street address.","t":"`$STRING`","key$":"mailAddress1","index$":9},"mailAddress2":{"a":true,"h":"Mail Address2","n":"mailAddress2","r":false,"sh":"The Location's street address.","t":"`$STRING`","key$":"mailAddress2","index$":10},"mailCity":{"a":true,"h":"Mail City","n":"mailCity","r":false,"sh":"The Location's city.","t":"`$STRING`","key$":"mailCity","index$":11},"mailCountry":{"a":true,"h":"Mail Country","n":"mailCountry","r":false,"sh":"The Location's street address.","t":"`$STRING`","key$":"mailCountry","index$":12},"mailPostalCode":{"a":true,"h":"Mail Postal Code","n":"mailPostalCode","r":false,"sh":"The Location's postal code.","t":"`$STRING`","key$":"mailPostalCode","index$":13},"mailStateProvince":{"a":true,"h":"Mail State Province","n":"mailStateProvince","r":false,"sh":"The Location's street state or province.","t":"`$STRING`","key$":"mailStateProvince","index$":14},"modified":{"a":true,"fo":"datetime","h":"Modified","n":"modified","r":false,"sh":"Last modified timestamp.","t":"`$STRING`","key$":"modified","index$":15},"name":{"a":true,"h":"Name","n":"name","r":false,"sh":"The Location's name.","t":"`$STRING`","key$":"name","index$":16},"nameOfBusiness":{"a":true,"h":"Name Of Business","n":"nameOfBusiness","r":false,"sh":"The name of the business at this location.","t":"`$STRING`","key$":"nameOfBusiness","index$":17},"notes":{"a":true,"h":"Notes","n":"notes","r":false,"sh":"Note for delivery driver.","t":"`$STRING`","key$":"notes","index$":18},"postalCode":{"a":true,"h":"Postal Code","n":"postalCode","r":false,"sh":"The Location's postal code.","t":"`$STRING`","key$":"postalCode","index$":19},"stateProvince":{"a":true,"h":"State Province","n":"stateProvince","r":false,"sh":"The Location's street state or province.","t":"`$STRING`","key$":"stateProvince","index$":20},"uniqueId":{"a":true,"h":"Unique Id","n":"uniqueId","r":false,"sh":"Unique Identifier for the Location.","t":"`$STRING`","key$":"uniqueId","index$":21},"version":{"a":true,"h":"Version","n":"version","r":false,"sh":"The number of times that this resource has been updated.","t":"`$INTEGER`","key$":"version","index$":22}},"id":{"field":"id","name":"id"},"name":"location","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /locations","source":"openapi3","version":2},"g":{},"k":"http","m":"POST","o":"/locations","q":{},"r":{},"s":[{"lit":"locations"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"list":{"input":"data","name":"list","points":[{"a":true,"co":{"id":"GET /locations","source":"openapi3","version":2},"g":{"query":[{"a":true,"k":"query","n":"client","or":"client","r":true,"t":"`$STRING`","index$":0},{"a":true,"ex":0,"k":"query","n":"skip","or":"skip","r":false,"t":"`$INTEGER`","index$":1},{"a":true,"ex":10,"k":"query","n":"take","or":"take","r":false,"t":"`$INTEGER`","index$":2}]},"k":"http","m":"GET","o":"/locations","q":{"exist":["client","skip","take"]},"r":{},"s":[{"lit":"locations"}],"t":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /locations/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/locations/{id}","q":{"exist":["id"]},"r":{},"s":[{"lit":"locations"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"},"remove":{"input":"data","name":"remove","points":[{"a":true,"co":{"id":"DELETE /locations/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"DELETE","o":"/locations/{id}","q":{"exist":["id"]},"r":{},"s":[{"lit":"locations"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"remove"}},"relations":{"ancestors":[]},"key$":"location","name__orig":"location","Name":"Location","name_":"location","name-":"location","NAME":"LOCATION","index$":14}, {"active":true,"entity":"location","key$":"BasicLocationFlow","kind":"basic","name":"BasicLocationFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"location_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0},{"a":true,"d":{},"i":{},"m":{},"o":"list","s":[],"v":[{"apply":"ItemExists","def":{"ref":"location_ref01"}}],"index$":1},{"a":true,"d":{},"i":{"ref":"location_ref01","srcdatavar":"location_ref01_data","suffix":"_dt0"},"m":{"id":"location01"},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-location_ref01"}}],"index$":2},{"a":true,"d":{},"i":{"ref":"location_ref01","suffix":"_rm0"},"m":{"id":"location01"},"o":"remove","s":[],"v":[],"index$":3},{"a":true,"d":{},"i":{"suffix":"_rt0"},"m":{},"o":"list","s":[],"v":[{"apply":"ItemNotExists","def":{"ref":"location_ref01"}}],"index$":4}]}, 'Location', {"POST /locations":{"protocol":"http","requestBody":{"description":"Location to be created.","content":{"*/*":{"schema":{"required":["address1","city","country","locationType","name"],"type":"object","properties":{"client":{"type":"object","properties":{"id":{"description":"The referenced Client's ID.","example":"4684","type":"string"},"name":{"description":"The referenced Client's name.","example":"The Tired Window","type":"string"}},"description":"Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/ClientReference"},"name":{"maxLength":255,"type":"string","description":"The Location's name.","example":"ASM Software Headquarters"},"customReference":{"maxLength":255,"type":"string","description":"A Partner specified reference for a location. Must be unique to a Partner.","example":"ASDF234"},"billingId":{"maxLength":50,"type":"string","description":"\\?"},"nameOfBusiness":{"maxLength":255,"type":"string","description":"The name of the business at this location.","example":"The Tired Window"},"locationType":{"type":"string","description":"The Location's clasification.","example":"Merchant retail location","enum":["Manufacturer","Manufacturer long term storage","KIF","Vendor fulfillment location","BF fulfillment location","Merchant retail location","Merchant CSR location","Merchant long term storage location","Merchant short term storage & distribution","Corporate Headquarters","Regional Office","Field Office","Partner Location"]},"uniqueId":{"maxLength":255,"type":"string","description":"Unique Identifier for the Location.","example":"8"},"country":{"type":"object","properties":{"code":{"maxLength":2,"type":"string","description":"The referenced Country's code (two uppercase symbols).","example":"US"},"name":{"type":"string","description":"The referenced Country's name.","example":"United States"}},"description":"Reference to the associated Country. When used for POST and PATCH API calls, the reference can contain either the ISO-ALPHA2 country Code or Name.","x-ref":"#/components/schemas/CountryReference"},"address1":{"maxLength":255,"type":"string","description":"The Location's street address.","example":"123 Main St"},"address2":{"maxLength":255,"type":"string","description":"The Location's street address.","example":"Suite 100"},"city":{"maxLength":255,"type":"string","description":"The Location's city.","example":"Atlanta"},"stateProvince":{"maxLength":255,"type":"string","description":"The Location's street state or province.","example":"Georgia"},"postalCode":{"maxLength":10,"type":"string","description":"The Location's postal code.","example":"30350"},"mailCountry":{"type":"string","description":"The Location's street address.","example":"United States"},"mailAddress1":{"maxLength":255,"type":"string","description":"The Location's street address.","example":"123 Main St"},"mailAddress2":{"maxLength":255,"type":"string","description":"The Location's street address.","example":"Suite 100"},"mailCity":{"maxLength":255,"type":"string","description":"The Location's city.","example":"Atlanta"},"mailStateProvince":{"maxLength":255,"type":"string","description":"The Location's street state or province.","example":"Georgia"},"mailPostalCode":{"maxLength":10,"type":"string","description":"The Location's postal code.","example":"30350"},"notes":{"type":"string","description":"Note for delivery driver.","example":"Dial 129 on the intercom to speak with our receptionist."}},"x-ref":"#/components/schemas/LocationCreate"}}},"required":true},"parameters":[]},"GET /locations":{"protocol":"http","parameters":[{"name":"client","in":"query","description":"Filter the list by Client. The parameter value can be either a Client ID or Name.","required":true,"schema":{"type":"string"},"index$":0},{"name":"take","in":"query","description":"The number of entries to include in the list.","schema":{"type":"integer","format":"int32","default":10},"index$":1},{"name":"skip","in":"query","description":"The number of results to skip before listing entries.","schema":{"type":"integer","format":"int32","default":0},"index$":2}]},"GET /locations/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"The Location's unique identifier.","required":true,"schema":{"type":"string"},"index$":0}]},"DELETE /locations/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"The Location's unique identifier.","required":true,"schema":{"type":"string"},"index$":0}]}})
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
    const location_ref01_match: any = {}

    const location_ref01_list = (await location_ref01_ent.list(location_ref01_match)).map((e: any) => e.data())

    assert(!isempty(select(location_ref01_list, { id: location_ref01_data.id })))


    // LOAD
    const location_ref01_match_dt0: any = {}
    location_ref01_match_dt0.id = location_ref01_data.id
    const location_ref01_data_dt0 = (await location_ref01_ent.load(location_ref01_match_dt0)).data()
    assert(location_ref01_data_dt0.id === location_ref01_data.id)


    // REMOVE
    const location_ref01_match_rm0: any = { id: location_ref01_data.id }
    await location_ref01_ent.remove(location_ref01_match_rm0)
  

    // LIST
    const location_ref01_match_rt0: any = {}

    const location_ref01_list_rt0 = (await location_ref01_ent.list(location_ref01_match_rt0)).map((e: any) => e.data())

    assert(isempty(select(location_ref01_list_rt0, { id: location_ref01_data.id })))


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

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
    'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
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
  

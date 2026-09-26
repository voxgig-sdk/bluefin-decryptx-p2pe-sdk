

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


describe('AttestationEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Attestation()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
    for (const op of ['create', 'list', 'load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'attestation.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"client":{"a":true,"h":"Client","n":"client","r":false,"sh":"Reference to the associated Client resource.","t":"`$OBJECT`","key$":"client","index$":0},"completeDate":{"a":true,"fo":"datetime","h":"Complete Date","n":"completeDate","r":false,"sh":"The date and time that the Attestation took place.","t":"`$STRING`","key$":"completeDate","index$":1},"created":{"a":true,"fo":"datetime","h":"Created","n":"created","r":false,"sh":"Creation timestamp in ISO 8601 format.","t":"`$STRING`","key$":"created","index$":2},"device":{"a":true,"h":"Device","n":"device","r":false,"sh":"Reference to the associated Device resource.","t":"`$OBJECT`","key$":"device","index$":3},"id":{"a":true,"h":"Id","n":"id","r":false,"sh":"This resource's unique identifier.","t":"`$STRING`","key$":"id","index$":4},"name":{"a":true,"h":"Name","n":"name","r":false,"sh":"Text describing the attestation.","t":"`$STRING`","key$":"name","index$":5},"notes":{"a":true,"h":"Notes","n":"notes","r":false,"sh":"Free form field that allows the Client associate notes with the Attestation.","t":"`$STRING`","key$":"notes","index$":6}},"id":{"field":"id","name":"id"},"name":"attestation","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /attestations","source":"openapi3","version":2},"g":{},"k":"http","m":"POST","o":"/attestations","q":{},"r":{},"s":[{"lit":"attestations"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"list":{"input":"data","name":"list","points":[{"a":true,"co":{"id":"GET /attestations","source":"openapi3","version":2},"g":{"query":[{"a":true,"k":"query","n":"client","or":"client","r":true,"t":"`$STRING`","index$":0},{"a":true,"ex":0,"k":"query","n":"skip","or":"skip","r":false,"t":"`$INTEGER`","index$":1},{"a":true,"ex":10,"k":"query","n":"take","or":"take","r":false,"t":"`$INTEGER`","index$":2}]},"k":"http","m":"GET","o":"/attestations","q":{"exist":["client","skip","take"]},"r":{},"s":[{"lit":"attestations"}],"t":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /attestations/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/attestations/{id}","q":{"exist":["id"]},"r":{},"s":[{"lit":"attestations"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"attestation","name__orig":"attestation","Name":"Attestation","name_":"attestation","name-":"attestation","NAME":"ATTESTATION","index$":0}, {"active":true,"entity":"attestation","key$":"BasicAttestationFlow","kind":"basic","name":"BasicAttestationFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"attestation_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0},{"a":true,"d":{},"i":{},"m":{},"o":"list","s":[],"v":[{"apply":"ItemExists","def":{"ref":"attestation_ref01"}}],"index$":1},{"a":true,"d":{},"i":{"ref":"attestation_ref01","srcdatavar":"attestation_ref01_data","suffix":"_dt0"},"m":{"id":"attestation01"},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-attestation_ref01"}}],"index$":2}]}, 'Attestation', {"POST /attestations":{"protocol":"http","requestBody":{"description":"Attestation to be created.","content":{"*/*":{"schema":{"required":["client","completeDate","devices","name"],"type":"object","properties":{"name":{"maxLength":255,"type":"string","description":"Text describing the attestation.","example":"2015 Attestation Atlanta Shop (Terminal 85000711)"},"completeDate":{"type":"string","description":"The date and time that the Attestation took place.","format":"datetime","example":"2017-02-08T20:14:45.000Z"},"client":{"type":"object","properties":{"id":{"description":"The referenced Client's ID.","example":"4684","type":"string"},"name":{"description":"The referenced Client's name.","example":"The Tired Window","type":"string"}},"description":"Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/ClientReference"},"devices":{"type":"array","items":{"required":["serialNumber"],"type":"object","properties":{"serialNumber":{"maxLength":255,"type":"string","description":"The serial number of Device undergoing Attestation.","example":"85000711"}},"x-ref":"#/components/schemas/AttestationDeviceCreate"}},"notes":{"type":"string","description":"Free form field that allows the Client associate notes with the Attestation.","example":"Terminal 85000711 meets all the attestation requirements."}},"x-ref":"#/components/schemas/AttestationCreate"}}},"required":true},"parameters":[]},"GET /attestations":{"protocol":"http","parameters":[{"name":"client","in":"query","description":"Filter the list by Client. The parameter value can be either a Client ID or Name.","required":true,"schema":{"type":"string"},"index$":0},{"name":"take","in":"query","description":"The number of entries to include in the list.","schema":{"type":"integer","format":"int32","default":10},"index$":1},{"name":"skip","in":"query","description":"The number of results to skip before listing entries.","schema":{"type":"integer","format":"int32","default":0},"index$":2}]},"GET /attestations/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"The Attestation's unique identifier.","required":true,"schema":{"type":"string"},"index$":0}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const attestation_ref01_ent = client.Attestation()
    let attestation_ref01_data = setup.data.new.attestation['attestation_ref01']

    attestation_ref01_data = (await attestation_ref01_ent.create(attestation_ref01_data)).data()
    assert(null != attestation_ref01_data.id)


    // LIST
    const attestation_ref01_match: any = {}

    const attestation_ref01_list = (await attestation_ref01_ent.list(attestation_ref01_match)).map((e: any) => e.data())

    assert(!isempty(select(attestation_ref01_list, { id: attestation_ref01_data.id })))


    // LOAD
    const attestation_ref01_match_dt0: any = {}
    attestation_ref01_match_dt0.id = attestation_ref01_data.id
    const attestation_ref01_data_dt0 = (await attestation_ref01_ent.load(attestation_ref01_match_dt0)).data()
    assert(attestation_ref01_data_dt0.id === attestation_ref01_data.id)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/attestation/AttestationTestData.json')

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
    ['attestation01','attestation02','attestation03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_ATTESTATION_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
    'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_ATTESTATION_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_ATTESTATION_ENTID']
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
  

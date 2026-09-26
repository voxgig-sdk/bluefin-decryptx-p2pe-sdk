

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


describe('CreateResultEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.CreateResult()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
    for (const op of ['create']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'create_result.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{},"name":"create_result","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /devices/{serialNumber}/{deviceType}/custody","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"device_type","or":"device_type","r":true,"t":"`$STRING`","index$":0},{"a":true,"k":"param","n":"serial_number","or":"serial_number","r":true,"t":"`$STRING`","index$":1}]},"k":"http","m":"POST","o":"/devices/{serialNumber}/{deviceType}/custody","q":{"exist":["device_type","serial_number"]},"r":{"param":{"deviceType":"device_type","serialNumber":"serial_number"}},"s":[{"lit":"devices"},{"var":"serial_number"},{"var":"device_type"},{"lit":"custody"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[["$.main.kit.entity.device"]]},"key$":"create_result","name__orig":"create_result","Name":"CreateResult","name_":"create_result","name-":"create-result","NAME":"CREATE_RESULT","index$":2}, {"active":true,"entity":"create_result","key$":"BasicCreateResultFlow","kind":"basic","name":"BasicCreateResultFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"create_result_ref01"},"m":{"device_type":"device_type01","serial_number":"serial_number01"},"o":"create","s":[],"v":[],"index$":0}]}, 'CreateResult', {"POST /devices/{serialNumber}/{deviceType}/custody":{"protocol":"http","requestBody":{"description":"Device custody to be created.","content":{"*/*":{"schema":{"type":"object","properties":{"location":{"required":["id"],"type":"object","properties":{"id":{"description":"The referenced Location's ID.","example":"33668","type":"string"},"name":{"description":"The referenced Location's name.","example":"The Tired Window Atlanta Downtown","type":"string"}},"description":"Reference to the associated Location resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/LocationReference"},"custodian":{"required":["id"],"type":"object","properties":{"id":{"description":"The referenced User's ID.","example":"56","type":"string"}},"description":"Reference to the associated User resource. When used for POST and PATCH API calls, the reference must contain the User's id.","x-ref":"#/components/schemas/UserReference"},"completeDate":{"type":"string","description":"The date and time that the Custody change took place.","format":"date-time","example":"2017-02-08T20:14:45.000Z"},"notes":{"type":"string","description":"Free form field that allows the Client associate notes with the Custody Change.","example":"Altering custody due to change of personel at site."}},"x-ref":"#/components/schemas/DeviceCustodyCreate"}}},"required":true},"parameters":[{"name":"serialNumber","in":"path","description":"Device serial number.","required":true,"schema":{"type":"string"},"index$":0},{"name":"deviceType","in":"path","description":"Device type name.","required":true,"schema":{"type":"string"},"index$":1}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const create_result_ref01_ent = client.CreateResult()
    let create_result_ref01_data = setup.data.new.create_result['create_result_ref01']
    create_result_ref01_data['device_type'] = setup.idmap['device_type01']
    create_result_ref01_data['serial_number'] = setup.idmap['serial_number01']

    create_result_ref01_data = (await create_result_ref01_ent.create(create_result_ref01_data)).data()
    assert(null != create_result_ref01_data)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/create_result/CreateResultTestData.json')

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
    ['create_result01','create_result02','create_result03','device01','device02','device03','device_type01','serial_number01'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_CREATE_RESULT_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
    'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_CREATE_RESULT_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_CREATE_RESULT_ENTID']
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
  

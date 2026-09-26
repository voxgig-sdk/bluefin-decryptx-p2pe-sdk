

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


describe('DeviceCustodyListItemEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.DeviceCustodyListItem()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
    for (const op of ['list']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'device_custody_list_item.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"completeDate":{"a":true,"fo":"date-time","h":"Complete Date","n":"completeDate","r":false,"sh":"The date and time that the Custody change took place.","t":"`$STRING`","key$":"completeDate","index$":0},"created":{"a":true,"fo":"date-time","h":"Created","n":"created","r":false,"sh":"Creation timestamp in ISO 8601 format.","t":"`$STRING`","key$":"created","index$":1},"createdBy":{"a":true,"h":"Created By","n":"createdBy","r":true,"sh":"Reference to the associated User resource.","t":"`$OBJECT`","key$":"createdBy","index$":2},"custodian":{"a":true,"h":"Custodian","n":"custodian","r":true,"sh":"Reference to the associated User resource.","t":"`$OBJECT`","key$":"custodian","index$":3},"device":{"a":true,"h":"Device","n":"device","r":false,"sh":"Reference to the associated Device resource.","t":"`$OBJECT`","key$":"device","index$":4},"id":{"a":true,"fo":"int64","h":"Id","n":"id","r":false,"sh":"This resource's unique identifier.","t":"`$INTEGER`","key$":"id","index$":5},"location":{"a":true,"h":"Location","n":"location","r":true,"sh":"Reference to the associated Location resource.","t":"`$OBJECT`","key$":"location","index$":6},"modified":{"a":true,"fo":"date-time","h":"Modified","n":"modified","r":false,"sh":"Last modified timestamp.","t":"`$STRING`","key$":"modified","index$":7},"modifiedBy":{"a":true,"h":"Modified By","n":"modifiedBy","r":true,"sh":"Reference to the associated User resource.","t":"`$OBJECT`","key$":"modifiedBy","index$":8},"notes":{"a":true,"h":"Notes","n":"notes","r":false,"sh":"Free form field that allows the Client associate notes with the Custody Change.","t":"`$STRING`","key$":"notes","index$":9},"status":{"a":true,"h":"Status","n":"status","r":false,"sh":"Reference to the associated Custody Status.","t":"`$OBJECT`","key$":"status","index$":10},"transferMethod":{"a":true,"h":"Transfer Method","n":"transferMethod","r":false,"sh":"Reference to the associated Transfer Method.","t":"`$OBJECT`","key$":"transferMethod","index$":11},"version":{"a":true,"h":"Version","n":"version","r":false,"sh":"The number of times that this resource has been updated.","t":"`$INTEGER`","key$":"version","index$":12}},"id":{"field":"id","name":"id"},"name":"device_custody_list_item","op":{"list":{"input":"data","name":"list","points":[{"a":true,"co":{"id":"GET /devices/{serialNumber}/{deviceType}/custody","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"device_type","or":"device_type","r":true,"t":"`$STRING`","index$":0},{"a":true,"k":"param","n":"serial_number","or":"serial_number","r":true,"t":"`$STRING`","index$":1}],"query":[{"a":true,"ex":0,"k":"query","n":"skip","or":"skip","r":false,"t":"`$INTEGER`","index$":0},{"a":true,"ex":10,"k":"query","n":"take","or":"take","r":false,"t":"`$INTEGER`","index$":1}]},"k":"http","m":"GET","o":"/devices/{serialNumber}/{deviceType}/custody","q":{"exist":["device_type","serial_number","skip","take"]},"r":{"param":{"deviceType":"device_type","serialNumber":"serial_number"}},"s":[{"lit":"devices"},{"var":"serial_number"},{"var":"device_type"},{"lit":"custody"}],"t":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"}},"relations":{"ancestors":[["$.main.kit.entity.device"]]},"key$":"device_custody_list_item","name__orig":"device_custody_list_item","Name":"DeviceCustodyListItem","name_":"device_custody_list_item","name-":"device-custody-list-item","NAME":"DEVICE_CUSTODY_LIST_ITEM","index$":7}, {"active":true,"entity":"device_custody_list_item","key$":"BasicDeviceCustodyListItemFlow","kind":"basic","name":"BasicDeviceCustodyListItemFlow","param":{},"step":[{"a":true,"d":{},"i":{},"m":{"device_type":"device_type01","serial_number":"serial_number01"},"o":"list","s":[],"v":[{"apply":"ItemExists","def":{"ref":"device_custody_list_item_ref01"}}],"index$":0}]}, 'DeviceCustodyListItem', {"GET /devices/{serialNumber}/{deviceType}/custody":{"protocol":"http","parameters":[{"name":"serialNumber","in":"path","description":"Device serial number.","required":true,"schema":{"type":"string"},"index$":0},{"name":"deviceType","in":"path","description":"Device type name.","required":true,"schema":{"type":"string"},"index$":1},{"name":"take","in":"query","description":"The number of entries to include in the response.","schema":{"type":"integer","format":"int32","default":10},"index$":2},{"name":"skip","in":"query","description":"The number of results to skip before listing the remainder.","schema":{"type":"integer","format":"int32","default":0},"index$":3}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let device_custody_list_item_ref01_data = Object.values(setup.data.existing.device_custody_list_item)[0] as any

    // LIST
    const device_custody_list_item_ref01_ent = client.DeviceCustodyListItem()
    const device_custody_list_item_ref01_match: any = {}
    device_custody_list_item_ref01_match['device_type'] = setup.idmap['device_type01']
    device_custody_list_item_ref01_match['serial_number'] = setup.idmap['serial_number01']

    const device_custody_list_item_ref01_list = (await device_custody_list_item_ref01_ent.list(device_custody_list_item_ref01_match)).map((e: any) => e.data())


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/device_custody_list_item/DeviceCustodyListItemTestData.json')

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
    ['device_custody_list_item01','device_custody_list_item02','device_custody_list_item03','device01','device02','device03','device_type01','serial_number01'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_LIST_ITEM_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
    'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_LIST_ITEM_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_LIST_ITEM_ENTID']
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
  



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


describe('DeviceReceiveResultEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.DeviceReceiveResult()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
    for (const op of ['create']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'device_receive_result.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"success":{"a":true,"h":"Success","n":"success","r":true,"sh":"Indicates if the action succeeded.","t":"`$BOOLEAN`","key$":"success","index$":0}},"name":"device_receive_result","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /devices/receive","source":"openapi3","version":2},"g":{},"k":"http","m":"POST","o":"/devices/receive","q":{},"r":{},"s":[{"lit":"devices"},{"lit":"receive"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"device_receive_result","name__orig":"device_receive_result","Name":"DeviceReceiveResult","name_":"device_receive_result","name-":"device-receive-result","NAME":"DEVICE_RECEIVE_RESULT","index$":8}, {"active":true,"entity":"device_receive_result","key$":"BasicDeviceReceiveResultFlow","kind":"basic","name":"BasicDeviceReceiveResultFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"device_receive_result_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0}]}, 'DeviceReceiveResult', {"POST /devices/receive":{"protocol":"http","requestBody":{"description":"Device Shippment Details.","content":{"*/*":{"schema":{"required":["serialNumber","tamperLabel"],"type":"object","properties":{"tamperLabel":{"maxLength":255,"type":"string","description":"The code that is printed the tamper label of the Device that is shipped.","example":"BF120877"},"serialNumber":{"maxLength":255,"type":"string","description":"The serial number of the Device that is shipped.","example":"85000711"}},"x-ref":"#/components/schemas/DeviceReceive"}}},"required":true},"parameters":[]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const device_receive_result_ref01_ent = client.DeviceReceiveResult()
    let device_receive_result_ref01_data = setup.data.new.device_receive_result['device_receive_result_ref01']

    device_receive_result_ref01_data = (await device_receive_result_ref01_ent.create(device_receive_result_ref01_data)).data()
    assert(null != device_receive_result_ref01_data)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/device_receive_result/DeviceReceiveResultTestData.json')

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
    ['device_receive_result01','device_receive_result02','device_receive_result03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_RECEIVE_RESULT_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
    'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_RECEIVE_RESULT_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_RECEIVE_RESULT_ENTID']
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
  



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


describe('DeviceRkiActivateResultEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.DeviceRkiActivateResult()
    assert(null != ent)
  })


  test('validate', async (t) => {
    if (null == (config as any).feature?.validate) {
      t.skip('feature not present in this SDK: validate')
      return
    }
    const client = BluefinDecryptxP2peSDK.test(undefined, { feature: { validate: { active: true } } })
    await assert.rejects(client.DeviceRkiActivateResult().create({"appVersion":1,"serialNumber":"x","success":true} as any),
      (err: any) => 'validate_failed' === err.code)
  })



  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
    for (const op of ['create']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'device_rki_activate_result.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"appVersion":{"a":true,"h":"App Version","n":"appVersion","r":false,"sh":"If a Device Type has more than one Application Code version the supported version is specified here.","t":"`$STRING`","key$":"appVersion","index$":0},"buildName":{"a":true,"h":"Build Name","n":"buildName","r":false,"sh":"The Device Builds's name.","t":"`$STRING`","key$":"buildName","index$":1},"buildNumber":{"a":true,"h":"Build Number","n":"buildNumber","r":false,"sh":"The Build Number.","t":"`$STRING`","key$":"buildNumber","index$":2},"configFile":{"a":true,"h":"Config File","n":"configFile","r":false,"sh":"\\?","t":"`$STRING`","key$":"configFile","index$":3},"firmwareVersion":{"a":true,"h":"Firmware Version","n":"firmwareVersion","r":false,"sh":"A list of firmware versions that this Device Build covers.","t":"`$STRING`","key$":"firmwareVersion","index$":4},"hardwareVersion":{"a":true,"h":"Hardware Version","n":"hardwareVersion","r":false,"sh":"A list of hardware versions that this Device Build covers.","t":"`$STRING`","key$":"hardwareVersion","index$":5},"serialNumber":{"a":true,"h":"Serial Number","n":"serialNumber","r":true,"sh":"The referenced Device's serial number.","t":"`$STRING`","key$":"serialNumber","index$":6},"success":{"a":true,"h":"Success","n":"success","r":true,"sh":"Indicates if the RKI activation succeeded.","t":"`$BOOLEAN`","key$":"success","index$":7},"whiteListingBinRanges":{"a":true,"h":"White Listing Bin Ranges","n":"whiteListingBinRanges","r":false,"sh":"\\?","t":"`$STRING`","key$":"whiteListingBinRanges","index$":8}},"name":"device_rki_activate_result","op":{"create":{"input":"data","name":"create","points":[{"a":true,"bf":["appVersion","buildName","buildNumber","configFile","firmwareVersion","hardwareVersion","serialNumber","whiteListingBinRanges"],"co":{"id":"POST /devices/rki/activate","source":"openapi3","version":2},"g":{},"k":"http","m":"POST","o":"/devices/rki/activate","q":{},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"devices"},{"lit":"rki"},{"lit":"activate"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"device_rki_activate_result","name__orig":"device_rki_activate_result","Name":"DeviceRkiActivateResult","name_":"device_rki_activate_result","name-":"device-rki-activate-result","NAME":"DEVICE_RKI_ACTIVATE_RESULT","index$":9}, {"active":true,"entity":"device_rki_activate_result","key$":"BasicDeviceRkiActivateResultFlow","kind":"basic","name":"BasicDeviceRkiActivateResultFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"device_rki_activate_result_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0}]}, 'DeviceRkiActivateResult', {"POST /devices/rki/activate":{"protocol":"http","requestBody":{"description":"Device Activation Details.","content":{"*/*":{"schema":{"required":["serialNumber"],"type":"object","properties":{"serialNumber":{"type":"string","description":"The referenced Device's serial number.","example":"85000711","key$":"serialNumber"},"buildName":{"type":"string","description":"The Device Builds's name.","example":"SREDKey 2 - PTS 5.X","key$":"buildName"},"buildNumber":{"type":"string","description":"The Build Number.","example":"IDTECH-007","key$":"buildNumber"},"appVersion":{"type":"string","description":"If a Device Type has more than one Application Code version the supported version is specified here.","example":"N/A","key$":"appVersion"},"hardwareVersion":{"type":"string","description":"A list of hardware versions that this Device Build covers.","example":"80172001(With MSR), 80172002(Without MSR)","key$":"hardwareVersion"},"firmwareVersion":{"type":"string","description":"A list of firmware versions that this Device Build covers.","example":"SREDKEY2 FW v1.00.xxx.xxxx.S","key$":"firmwareVersion"},"whiteListingBinRanges":{"type":"string","description":"\\?","example":"","key$":"whiteListingBinRanges"},"configFile":{"type":"string","description":"\\?","example":"","key$":"configFile"}},"x-ref":"#/components/schemas/DeviceRkiActivate","index$":1}}},"required":true},"parameters":[]}}, { strict: LIVE_STRICT, t })
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const device_rki_activate_result_ref01_ent = client.DeviceRkiActivateResult()
    let device_rki_activate_result_ref01_data = setup.data.new.device_rki_activate_result['device_rki_activate_result_ref01']

    device_rki_activate_result_ref01_data = (await device_rki_activate_result_ref01_ent.create(device_rki_activate_result_ref01_data)).data()
    assert(null != device_rki_activate_result_ref01_data)


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
      '../../../../.sdk/test/entity/device_rki_activate_result/DeviceRkiActivateResultTestData.json')

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
    ['device_rki_activate_result01','device_rki_activate_result02','device_rki_activate_result03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
    'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID']
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
  

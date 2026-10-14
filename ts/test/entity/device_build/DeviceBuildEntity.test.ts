

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


describe('DeviceBuildEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.DeviceBuild()
    assert(null != ent)
  })


  class FailHook extends BaseFeature {
    name = 'failhook'
    version = '0.0.1'
    active = true
    unexpected = 0
    init() { }
    PreSpec() { throw new Error('device_build hook failed') }
    PreUnexpected() { this.unexpected++ }
  }

  test('stream-error', async () => {
    const offline = { net: { offline: true } }
    await assert.rejects(async () => {
      for await (const _item of BluefinDecryptxP2peSDK.test(offline).DeviceBuild().stream('list')) { }
    }, /offline/)

    for await (const _item of BluefinDecryptxP2peSDK.test(offline).DeviceBuild()
      .stream('list', undefined, { ctrl: { throw: false } })) { }

    if (null != (config as any).feature?.rbac) {
      const denied = BluefinDecryptxP2peSDK.test(undefined, { feature: { rbac: { active: true, deny: true } } })
      await assert.rejects(async () => {
        for await (const _item of denied.DeviceBuild().stream('list')) { }
      }, (err: any) => 'rbac_denied' === err.code)
    }
  })

  test('stream-ctrl', async () => {
    const explain: any = {}
    const ctrl: any = { explain }
    for await (const _item of BluefinDecryptxP2peSDK.test().DeviceBuild().stream('list', undefined, { ctrl })) { }
    assert.deepStrictEqual(Object.keys(ctrl), ['explain'])
    assert(explain === ctrl.explain && 0 < Object.keys(explain).length)
  })

  test('unexpected', async () => {
    const hook = new FailHook()
    const client = new BluefinDecryptxP2peSDK({ feature: { test: { active: true } }, extend: [hook] })
    await assert.rejects(client.DeviceBuild().list(), /hook failed/)
    assert(0 < hook.unexpected)

    const fired = hook.unexpected
    assert.strictEqual(await client.DeviceBuild().list(undefined, { throw: false }), undefined)
    assert(fired < hook.unexpected)
  })

  test('validate', async (t) => {
    if (null == (config as any).feature?.validate) {
      t.skip('feature not present in this SDK: validate')
      return
    }
    const client = BluefinDecryptxP2peSDK.test(undefined, { feature: { validate: { active: true } } })
    await assert.rejects(client.DeviceBuild().list({"device_type":1} as any),
      (err: any) => 'validate_failed' === err.code)
  })



  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
    for (const op of ['list', 'load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'device_build.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"appVersion":{"a":true,"h":"App Version","n":"appVersion","r":false,"sh":"If a Device Type has more than one Application Code version the supported version is specified here.","t":"`$STRING`","key$":"appVersion","index$":0},"buildNumber":{"a":true,"h":"Build Number","n":"buildNumber","r":false,"sh":"The Build Number.","t":"`$STRING`","key$":"buildNumber","index$":1},"configFileName":{"a":true,"h":"Config File Name","n":"configFileName","r":false,"sh":"The name of the configuration file that is uploaded to the device.","t":"`$STRING`","key$":"configFileName","index$":2},"created":{"a":true,"fo":"date-time","h":"Created","n":"created","r":false,"sh":"Creation timestamp in ISO 8601 format.","t":"`$STRING`","key$":"created","index$":3},"deviceType":{"a":true,"h":"Device Type","n":"deviceType","r":false,"sh":"The Device Type Name.","t":"`$STRING`","key$":"deviceType","index$":4},"firmwareVersion":{"a":true,"h":"Firmware Version","n":"firmwareVersion","r":false,"sh":"A list of firmware versions that this Device Build covers.","t":"`$STRING`","key$":"firmwareVersion","index$":5},"hardwareVersion":{"a":true,"h":"Hardware Version","n":"hardwareVersion","r":false,"sh":"A list of hardware versions that this Device Build covers.","t":"`$STRING`","key$":"hardwareVersion","index$":6},"id":{"a":true,"fo":"int64","h":"Id","n":"id","r":false,"sh":"This resource's unique identifier.","t":"`$INTEGER`","key$":"id","index$":7},"isActive":{"a":true,"h":"Is Active","n":"isActive","r":false,"sh":"This property indicates if the device build is still active and not succeeded by subsequent build.","t":"`$BOOLEAN`","key$":"isActive","index$":8},"modified":{"a":true,"fo":"date-time","h":"Modified","n":"modified","r":false,"sh":"Last modified timestamp.","t":"`$STRING`","key$":"modified","index$":9},"name":{"a":true,"h":"Name","n":"name","r":false,"sh":"The Device Builds's name.","t":"`$STRING`","key$":"name","index$":10},"notes":{"a":true,"h":"Notes","n":"notes","r":false,"sh":"Notes attached to the device build by Bluefin CISO.","t":"`$STRING`","key$":"notes","index$":11},"version":{"a":true,"h":"Version","n":"version","r":false,"sh":"The number of times that this resource has been updated.","t":"`$INTEGER`","key$":"version","index$":12},"whiteListingBinRanges":{"a":true,"h":"White Listing Bin Ranges","n":"whiteListingBinRanges","r":false,"sh":"A comma separated list of BIN ranges that aren't encrypted by the terminal.","t":"`$STRING`","key$":"whiteListingBinRanges","index$":13},"whiteListingUsed":{"a":true,"h":"White Listing Used","n":"whiteListingUsed","r":false,"sh":"This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal.","t":"`$BOOLEAN`","key$":"whiteListingUsed","index$":14}},"id":{"field":"id","name":"id"},"name":"device_build","op":{"list":{"input":"data","name":"list","points":[{"a":true,"co":{"id":"GET /deviceBuilds","source":"openapi3","version":2},"g":{"query":[{"a":true,"k":"query","n":"device_type","or":"deviceType","r":false,"t":"`$STRING`","index$":0},{"a":true,"ex":0,"k":"query","n":"skip","or":"skip","r":false,"t":"`$INTEGER`","index$":1},{"a":true,"ex":10,"k":"query","n":"take","or":"take","r":false,"t":"`$INTEGER`","index$":2}]},"k":"http","m":"GET","o":"/deviceBuilds","q":{},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"deviceBuilds"}],"t":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /deviceBuilds/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/deviceBuilds/{id}","q":{"exist":["id"]},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"deviceBuilds"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"device_build","name__orig":"device_build","Name":"DeviceBuild","name_":"device_build","name-":"device-build","NAME":"DEVICE_BUILD","index$":5}, {"active":true,"entity":"device_build","key$":"BasicDeviceBuildFlow","kind":"basic","name":"BasicDeviceBuildFlow","param":{},"step":[{"a":true,"d":{},"i":{},"m":{},"o":"list","s":[],"v":[{"apply":"ItemExists","def":{"ref":"device_build_ref01"}}],"index$":0},{"a":true,"d":{},"i":{"ref":"device_build_ref01","srcdatavar":"device_build_ref01_data","suffix":"_dt0"},"m":{"id":"device_build01"},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-device_build_ref01"}}],"index$":1}]}, 'DeviceBuild', {"GET /deviceBuilds":{"protocol":"http","parameters":[{"name":"deviceType","in":"query","description":"Filter by Device Type. The parameter value must be the Device Type name, Device Type ID is not supported.","schema":{"type":"string"},"index$":0},{"name":"take","in":"query","description":"The number of entries to include in the response.","schema":{"type":"integer","format":"int32","default":10},"index$":1},{"name":"skip","in":"query","description":"The number of results to skip before listing entries.","schema":{"type":"integer","format":"int32","default":0},"index$":2}]},"GET /deviceBuilds/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"The Device Build's unique identifier.","required":true,"schema":{"type":"string"},"index$":0}]}}, { strict: LIVE_STRICT, t })
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let device_build_ref01_data = Object.values(setup.data.existing.device_build)[0] as any

    // LIST
    const device_build_ref01_ent = client.DeviceBuild()
    const device_build_ref01_match: any = {}

    const device_build_ref01_list = (await device_build_ref01_ent.list(device_build_ref01_match)).map((e: any) => e.data())


    // LOAD
    const device_build_ref01_match_dt0: any = {}
    device_build_ref01_match_dt0.id = device_build_ref01_data.id
    const device_build_ref01_data_dt0 = (await device_build_ref01_ent.load(device_build_ref01_match_dt0)).data()
    assert(device_build_ref01_data_dt0.id === device_build_ref01_data.id)


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
      '../../../../.sdk/test/entity/device_build/DeviceBuildTestData.json')

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
    ['device_build01','device_build02','device_build03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_BUILD_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
    'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_BUILD_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_BUILD_ENTID']
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
  

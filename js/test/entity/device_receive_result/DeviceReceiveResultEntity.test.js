
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


describe('DeviceReceiveResultEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.DeviceReceiveResult()
    assert(null != ent)
  })


  test('validate', async (t) => {
    if (null == config.feature?.validate) {
      t.skip('feature not present in this SDK: validate')
      return
    }
    const client = BluefinDecryptxP2peSDK.test(undefined, { feature: { validate: { active: true } } })
    await assert.rejects(client.DeviceReceiveResult().create({"serialNumber":1,"success":true,"tamperLabel":"x"}),
      (err) => 'validate_failed' === err.code)
  })



  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"serialNumber":{"a":true,"h":"Serial Number","n":"serialNumber","r":true,"sh":"The serial number of the Device that is shipped.","t":"`$STRING`","key$":"serialNumber","index$":0},"success":{"a":true,"h":"Success","n":"success","r":true,"sh":"Indicates if the action succeeded.","t":"`$BOOLEAN`","key$":"success","index$":1},"tamperLabel":{"a":true,"h":"Tamper Label","n":"tamperLabel","r":true,"sh":"The code that is printed the tamper label of the Device that is shipped.","t":"`$STRING`","key$":"tamperLabel","index$":2}},"name":"device_receive_result","op":{"create":{"input":"data","name":"create","points":[{"a":true,"bf":["serialNumber","tamperLabel"],"co":{"id":"POST /devices/receive","source":"openapi3","version":2},"g":{},"k":"http","m":"POST","o":"/devices/receive","q":{},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"devices"},{"lit":"receive"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"device_receive_result","name__orig":"device_receive_result","Name":"DeviceReceiveResult","name_":"device_receive_result","name-":"device-receive-result","NAME":"DEVICE_RECEIVE_RESULT","index$":8}, {"active":true,"entity":"device_receive_result","key$":"BasicDeviceReceiveResultFlow","kind":"basic","name":"BasicDeviceReceiveResultFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"device_receive_result_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0}]}, 'DeviceReceiveResult', {"POST /devices/receive":{"protocol":"http","requestBody":{"description":"Device Shippment Details.","content":{"*/*":{"schema":{"required":["serialNumber","tamperLabel"],"type":"object","properties":{"tamperLabel":{"maxLength":255,"type":"string","description":"The code that is printed the tamper label of the Device that is shipped.","example":"BF120877","key$":"tamperLabel"},"serialNumber":{"maxLength":255,"type":"string","description":"The serial number of the Device that is shipped.","example":"85000711","key$":"serialNumber"}},"x-ref":"#/components/schemas/DeviceReceive","index$":1}}},"required":true},"parameters":[]}}, { strict: LIVE_STRICT, t })
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
  

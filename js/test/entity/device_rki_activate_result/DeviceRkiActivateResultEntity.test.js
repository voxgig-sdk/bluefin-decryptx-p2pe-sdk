
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


describe('DeviceRkiActivateResultEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.DeviceRkiActivateResult()
    assert(null != ent)
  })


  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"success":{"a":true,"h":"Success","n":"success","r":true,"sh":"Indicates if the RKI activation succeeded.","t":"`$BOOLEAN`","key$":"success","index$":0}},"name":"device_rki_activate_result","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /devices/rki/activate","source":"openapi3","version":2},"g":{},"k":"http","m":"POST","o":"/devices/rki/activate","q":{},"r":{},"s":[{"lit":"devices"},{"lit":"rki"},{"lit":"activate"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"device_rki_activate_result","name__orig":"device_rki_activate_result","Name":"DeviceRkiActivateResult","name_":"device_rki_activate_result","name-":"device-rki-activate-result","NAME":"DEVICE_RKI_ACTIVATE_RESULT","index$":9}, {"active":true,"entity":"device_rki_activate_result","key$":"BasicDeviceRkiActivateResultFlow","kind":"basic","name":"BasicDeviceRkiActivateResultFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"device_rki_activate_result_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0}]}, 'DeviceRkiActivateResult', {"POST /devices/rki/activate":{"protocol":"http","requestBody":{"description":"Device Activation Details.","content":{"*/*":{"schema":{"required":["serialNumber"],"type":"object","properties":{"serialNumber":{"type":"string","description":"The referenced Device's serial number.","example":"85000711"},"buildName":{"type":"string","description":"The Device Builds's name.","example":"SREDKey 2 - PTS 5.X"},"buildNumber":{"type":"string","description":"The Build Number.","example":"IDTECH-007"},"appVersion":{"type":"string","description":"If a Device Type has more than one Application Code version the supported version is specified here.","example":"N/A"},"hardwareVersion":{"type":"string","description":"A list of hardware versions that this Device Build covers.","example":"80172001(With MSR), 80172002(Without MSR)"},"firmwareVersion":{"type":"string","description":"A list of firmware versions that this Device Build covers.","example":"SREDKEY2 FW v1.00.xxx.xxxx.S"},"whiteListingBinRanges":{"type":"string","description":"\\?","example":""},"configFile":{"type":"string","description":"\\?","example":""}},"x-ref":"#/components/schemas/DeviceRkiActivate"}}},"required":true},"parameters":[]}})
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



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

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
  

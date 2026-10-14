
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


describe('DeviceCustodyDetailEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.DeviceCustodyDetail()
    assert(null != ent)
  })


  test('validate', async (t) => {
    if (null == config.feature?.validate) {
      t.skip('feature not present in this SDK: validate')
      return
    }
    const client = BluefinDecryptxP2peSDK.test(undefined, { feature: { validate: { active: true } } })
    await assert.rejects(client.DeviceCustodyDetail().load({"device_type":1,"id":"x","serial_number":"x"}),
      (err) => 'validate_failed' === err.code)
  })



  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"completeDate":{"a":true,"fo":"date-time","h":"Complete Date","n":"completeDate","r":false,"sh":"The date and time that the Custody change took place.","t":"`$STRING`","key$":"completeDate","index$":0},"created":{"a":true,"fo":"date-time","h":"Created","n":"created","r":false,"sh":"Creation timestamp in ISO 8601 format.","t":"`$STRING`","key$":"created","index$":1},"createdBy":{"a":true,"h":"Created By","n":"createdBy","r":true,"sh":"Reference to the associated User resource.","t":"`$OBJECT`","key$":"createdBy","index$":2},"custodian":{"a":true,"h":"Custodian","n":"custodian","r":true,"sh":"Reference to the associated User resource.","t":"`$OBJECT`","key$":"custodian","index$":3},"device":{"a":true,"h":"Device","n":"device","r":false,"sh":"Reference to the associated Device resource.","t":"`$OBJECT`","key$":"device","index$":4},"id":{"a":true,"fo":"int64","h":"Id","n":"id","r":false,"sh":"This resource's unique identifier.","t":"`$INTEGER`","key$":"id","index$":5},"location":{"a":true,"h":"Location","n":"location","r":true,"sh":"Reference to the associated Location resource.","t":"`$OBJECT`","key$":"location","index$":6},"modified":{"a":true,"fo":"date-time","h":"Modified","n":"modified","r":false,"sh":"Last modified timestamp.","t":"`$STRING`","key$":"modified","index$":7},"modifiedBy":{"a":true,"h":"Modified By","n":"modifiedBy","r":true,"sh":"Reference to the associated User resource.","t":"`$OBJECT`","key$":"modifiedBy","index$":8},"notes":{"a":true,"h":"Notes","n":"notes","r":false,"sh":"Free form field that allows the Client associate notes with the Custody Change.","t":"`$STRING`","key$":"notes","index$":9},"status":{"a":true,"h":"Status","n":"status","r":false,"sh":"Reference to the associated Custody Status.","t":"`$OBJECT`","key$":"status","index$":10},"transferMethod":{"a":true,"h":"Transfer Method","n":"transferMethod","r":false,"sh":"Reference to the associated Transfer Method.","t":"`$OBJECT`","key$":"transferMethod","index$":11},"version":{"a":true,"h":"Version","n":"version","r":false,"sh":"The number of times that this resource has been updated.","t":"`$INTEGER`","key$":"version","index$":12}},"id":{"field":"id","name":"id"},"name":"device_custody_detail","op":{"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /devices/{serialNumber}/{deviceType}/custody/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"device_type","or":"deviceType","r":true,"t":"`$STRING`","index$":0},{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":1},{"a":true,"k":"param","n":"serial_number","or":"serialNumber","r":true,"t":"`$STRING`","index$":2}]},"k":"http","m":"GET","o":"/devices/{serialNumber}/{deviceType}/custody/{id}","q":{"exist":["device_type","id","serial_number"]},"r":{"param":{"deviceType":"device_type","serialNumber":"serial_number"}},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"devices"},{"var":"serial_number"},{"var":"device_type"},{"lit":"custody"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[["$.main.kit.entity.device"]]},"key$":"device_custody_detail","name__orig":"device_custody_detail","Name":"DeviceCustodyDetail","name_":"device_custody_detail","name-":"device-custody-detail","NAME":"DEVICE_CUSTODY_DETAIL","index$":6}, {"active":true,"entity":"device_custody_detail","key$":"BasicDeviceCustodyDetailFlow","kind":"basic","name":"BasicDeviceCustodyDetailFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"device_custody_detail_ref01","srcdatavar":"device_custody_detail_ref01_data","suffix":"_dt0"},"m":{"device_type":"device_type01","id":"device_custody_detail01","serial_number":"serial_number01"},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-device_custody_detail_ref01"}}],"index$":0}]}, 'DeviceCustodyDetail', {"GET /devices/{serialNumber}/{deviceType}/custody/{id}":{"protocol":"http","parameters":[{"name":"serialNumber","in":"path","description":"Device serial number.","required":true,"schema":{"type":"string"},"index$":0},{"name":"deviceType","in":"path","description":"Device type name.","required":true,"schema":{"type":"string"},"index$":1},{"name":"id","in":"path","description":"Custody id.","required":true,"schema":{"type":"string"},"index$":2}]}}, { strict: LIVE_STRICT, t })
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let device_custody_detail_ref01_data = Object.values(setup.data.existing.device_custody_detail)[0]

    // LOAD
    const device_custody_detail_ref01_ent = client.DeviceCustodyDetail()
    const device_custody_detail_ref01_match_dt0 = {}
    device_custody_detail_ref01_match_dt0.id = device_custody_detail_ref01_data.id
    device_custody_detail_ref01_match_dt0['device_type'] = setup.idmap['device_type'] ?? setup.idmap['device_type01']
    device_custody_detail_ref01_match_dt0['serial_number'] = setup.idmap['serial_number'] ?? setup.idmap['serial_number01']
    const device_custody_detail_ref01_data_dt0 = (await device_custody_detail_ref01_ent.load(device_custody_detail_ref01_match_dt0)).data()
    assert(device_custody_detail_ref01_data_dt0.id === device_custody_detail_ref01_data.id)


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
      '../../../../.sdk/test/entity/device_custody_detail/DeviceCustodyDetailTestData.json')

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
    ['device_custody_detail01','device_custody_detail02','device_custody_detail03','device01','device02','device03','device_type01','serial_number01'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID']
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
  

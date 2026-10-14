
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


describe('VirtualDeviceEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.VirtualDevice()
    assert(null != ent)
  })


  test('validate', async (t) => {
    if (null == config.feature?.validate) {
      t.skip('feature not present in this SDK: validate')
      return
    }
    const client = BluefinDecryptxP2peSDK.test(undefined, { feature: { validate: { active: true } } })
    await assert.rejects(client.VirtualDevice().load({"id":1}),
      (err) => 'validate_failed' === err.code)
  })



  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"data":{"a":true,"h":"Data","n":"data","r":false,"sh":"List of Devices.","t":"`$ARRAY`","key$":"data","index$":0},"id":{"a":true,"h":"Id","n":"id","r":false,"t":"`$STRING`","key$":"id","index$":1},"total":{"a":true,"h":"Total","n":"total","r":false,"sh":"Total number of Devices available (not the number of Users in the response).","t":"`$INTEGER`","key$":"total","index$":2}},"id":{"field":"id","name":"id"},"name":"virtual_device","op":{"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /virtualDevices/{sharePartnerTo}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"sharePartnerTo","r":true,"t":"`$STRING`","index$":0}],"query":[{"a":true,"ex":0,"k":"query","n":"skip","or":"skip","r":false,"t":"`$INTEGER`","index$":0},{"a":true,"ex":"asc","k":"query","n":"sorting_direction","or":"sorting.direction","r":false,"t":"`$STRING`","index$":1},{"a":true,"ex":"serialnumber","k":"query","n":"sorting_field","or":"sorting.field","r":false,"t":"`$STRING`","index$":2},{"a":true,"ex":10,"k":"query","n":"take","or":"take","r":false,"t":"`$INTEGER`","index$":3}]},"k":"http","m":"GET","o":"/virtualDevices/{sharePartnerTo}","q":{"exist":["id"]},"r":{"param":{"sharePartnerTo":"id"}},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"virtualDevices"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"virtual_device","name__orig":"virtual_device","Name":"VirtualDevice","name_":"virtual_device","name-":"virtual-device","NAME":"VIRTUAL_DEVICE","index$":21}, {"active":true,"entity":"virtual_device","key$":"BasicVirtualDeviceFlow","kind":"basic","name":"BasicVirtualDeviceFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"virtual_device_ref01","srcdatavar":"virtual_device_ref01_data","suffix":"_dt0"},"m":{"id":"virtual_device01"},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-virtual_device_ref01"}}],"index$":0}]}, 'VirtualDevice', {"GET /virtualDevices/{sharePartnerTo}":{"protocol":"http","parameters":[{"name":"sharePartnerTo","in":"path","description":"Partner that the Devices have been shared with.","required":true,"schema":{"type":"string"},"index$":0},{"name":"take","in":"query","description":"The number of entries to include in the list.","schema":{"type":"integer","format":"int32","default":10},"index$":1},{"name":"skip","in":"query","description":"The number of results to skip before listing entries.","schema":{"type":"integer","format":"int32","default":0},"index$":2},{"name":"sorting.field","in":"query","description":"Sorts the list by one of these fields.","schema":{"type":"string","default":"serialnumber","enum":["id","version","created","modified","serialnumber","alternatekey","name","devicetype","devicestate","location.id","location.name","activationdate","partner.id","partner.name","client.id","client.name","kif.id","kif.name"]},"index$":3},{"name":"sorting.direction","in":"query","description":"Direction to sort list direction. Used in conjunction with sorting.field parameter.","schema":{"type":"string","default":"asc","enum":["asc","desc"]},"index$":4}]}}, { strict: LIVE_STRICT, t })
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let virtual_device_ref01_data = Object.values(setup.data.existing.virtual_device)[0]

    // LOAD
    const virtual_device_ref01_ent = client.VirtualDevice()
    const virtual_device_ref01_match_dt0 = {}
    virtual_device_ref01_match_dt0.id = virtual_device_ref01_data.id
    const virtual_device_ref01_data_dt0 = (await virtual_device_ref01_ent.load(virtual_device_ref01_match_dt0)).data()
    assert(virtual_device_ref01_data_dt0.id === virtual_device_ref01_data.id)


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
      '../../../../.sdk/test/entity/virtual_device/VirtualDeviceTestData.json')

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
    ['virtual_device01','virtual_device02','virtual_device03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_VIRTUAL_DEVICE_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_VIRTUAL_DEVICE_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_VIRTUAL_DEVICE_ENTID']
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
  

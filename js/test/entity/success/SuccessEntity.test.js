
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


describe('SuccessEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Success()
    assert(null != ent)
  })


  test('validate', async (t) => {
    if (null == config.feature?.validate) {
      t.skip('feature not present in this SDK: validate')
      return
    }
    const client = BluefinDecryptxP2peSDK.test(undefined, { feature: { validate: { active: true } } })
    await assert.rejects(client.Success().create({"share_partner_to":1,"devices":"x","sharePartnerFrom":"x"}),
      (err) => 'validate_failed' === err.code)
  })



  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"devices":{"a":true,"h":"Devices","n":"devices","r":true,"sh":"An array of Device ids to share with partner.","t":"`$ARRAY`","key$":"devices","index$":0},"sharePartnerFrom":{"a":true,"h":"Share Partner From","n":"sharePartnerFrom","r":true,"sh":"Reference to the associated Partner.","t":"`$OBJECT`","key$":"sharePartnerFrom","index$":1},"success":{"a":true,"h":"Success","n":"success","r":false,"sh":"Indicates if the action was a success.","t":"`$BOOLEAN`","key$":"success","index$":2}},"name":"success","op":{"create":{"input":"data","name":"create","points":[{"a":true,"bf":["devices","sharePartnerFrom"],"co":{"id":"POST /virtualDevices/{sharePartnerTo}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"share_partner_to","or":"sharePartnerTo","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/virtualDevices/{sharePartnerTo}","q":{"exist":["share_partner_to"]},"r":{"param":{"sharePartnerTo":"share_partner_to"}},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"virtualDevices"},{"var":"share_partner_to"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"remove":{"input":"data","name":"remove","points":[{"a":true,"bf":["devices"],"co":{"id":"DELETE /virtualDevices/{sharePartnerTo}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"share_partner_to","or":"sharePartnerTo","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"DELETE","o":"/virtualDevices/{sharePartnerTo}","q":{"exist":["share_partner_to"]},"r":{"param":{"sharePartnerTo":"share_partner_to"}},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"virtualDevices"},{"var":"share_partner_to"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"remove"}},"relations":{"ancestors":[["$.main.kit.entity.virtual_device"]]},"key$":"success","name__orig":"success","Name":"Success","name_":"success","name-":"success","NAME":"SUCCESS","index$":17}, {"active":true,"entity":"success","key$":"BasicSuccessFlow","kind":"basic","name":"BasicSuccessFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"success_ref01"},"m":{"share_partner_to":"share_partner_to01"},"o":"create","s":[],"v":[],"index$":0},{"a":true,"d":{},"i":{"ref":"success_ref01","suffix":"_rm0"},"m":{"id":"success01"},"o":"remove","s":[],"v":[],"index$":1}]}, 'Success', {"POST /virtualDevices/{sharePartnerTo}":{"protocol":"http","requestBody":{"description":"List of Devices to be shared with the Parner.","content":{"*/*":{"schema":{"required":["devices","sharePartnerFrom"],"type":"object","properties":{"sharePartnerFrom":{"type":"object","properties":{"id":{"type":"string","description":"The referenced Partner's ID.","example":"6580"},"name":{"type":"string","description":"The referenced Partner's name.","example":"ASM Software"}},"description":"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/PartnerReference","key$":"sharePartnerFrom"},"devices":{"type":"array","description":"An array of Device ids to share with partner.","items":{"type":"integer"},"key$":"devices"}},"x-ref":"#/components/schemas/VirtualDeviceCreate","index$":1}}},"required":true},"parameters":[{"name":"sharePartnerTo","in":"path","description":"Partner that the Devices are to be shared with.","required":true,"schema":{"type":"string"},"index$":0}]},"DELETE /virtualDevices/{sharePartnerTo}":{"protocol":"http","requestBody":{"description":"List of Device to be unshared.","content":{"*/*":{"schema":{"required":["devices"],"type":"object","properties":{"devices":{"type":"array","description":"An array of Device ids to unshare with partner.","items":{"type":"integer"}}},"x-ref":"#/components/schemas/VirtualDeviceDelete"}}},"required":true},"parameters":[{"name":"sharePartnerTo","in":"path","description":"Partner that the Devices are to be unshared with.","required":true,"schema":{"type":"string"},"index$":0}]}}, { strict: LIVE_STRICT, t })
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const success_ref01_ent = client.Success()
    let success_ref01_data = setup.data.new.success['success_ref01']
    success_ref01_data['share_partner_to'] = setup.idmap['share_partner_to01']

    success_ref01_data = (await success_ref01_ent.create(success_ref01_data)).data()
    assert(null != success_ref01_data)



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
      '../../../../.sdk/test/entity/success/SuccessTestData.json')

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
    ['success01','success02','success03','virtual_device01','virtual_device02','virtual_device03','share_partner_to01'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_SUCCESS_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_SUCCESS_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_SUCCESS_ENTID']
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
  

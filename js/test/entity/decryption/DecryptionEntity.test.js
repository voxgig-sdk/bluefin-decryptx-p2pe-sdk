
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


describe('DecryptionEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Decryption()
    assert(null != ent)
  })


  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"success":{"a":true,"h":"Success","n":"success","r":false,"sh":"true if the payload decryption was successful.","t":"`$BOOLEAN`","key$":"success","index$":0}},"name":"decryption","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /decryption","source":"openapi3","version":2},"g":{},"k":"http","m":"POST","o":"/decryption","q":{},"r":{},"s":[{"lit":"decryption"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"decryption","name__orig":"decryption","Name":"Decryption","name_":"decryption","name-":"decryption","NAME":"DECRYPTION","index$":3}, {"active":true,"entity":"decryption","key$":"BasicDecryptionFlow","kind":"basic","name":"BasicDecryptionFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"decryption_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0}]}, 'Decryption', {"POST /decryption":{"protocol":"http","requestBody":{"description":"Data to be decrypted.","content":{"*/*":{"schema":{"required":["deviceType","encrypted","serialNumber"],"type":"object","properties":{"serialNumber":{"type":"string","description":"The serial number of the device.","example":"541T112708"},"deviceType":{"type":"string","description":"The device Type.","example":"Pax A920"},"encrypted":{"type":"array","items":{"required":["name","value"],"type":"object","properties":{"name":{"type":"string","description":"String identifier for the value to be decrypted. This name will be returned in the response so that values can be matched up. Additionally, the response array of decrypted values will be returned in the same order they were provided.","example":"track1"},"value":{"type":"string","description":"Base64 or hex encoded encrypted data retrieved from device.","example":"EF77ABC20DE782C48A88FBF25C59A6C7E21FD7E42D9A1C091F5FC8BBC1BF7DA89E2D8DB1AEB58A7318A79DDE4E59A5E7BD682FCAE9F6BBFD"}},"x-ref":"#/components/schemas/DecryptionItemRequest"}},"sequenceNumber":{"type":"string","description":"Sequence number obtained from device in base 64 or hex encoded format. This value is typically required for DUKPT encryption/decryption. This parameter is optional and not required if the device does not generate a key sequence number.","example":"629949960E001D200037"},"reference":{"type":"string","description":"A string (of up to 50 characters) that helps partners identify individual API calls. If provided, the value will be logged to the P2PE Manager where it can be used to troubleshoot technical issues. It is highly recommended that a unique value be used on each Decryptx API call. The reference value will be returned in the response body, whether the API call is successful or not.","example":"723f57e1-e9c8-48cb-81d9-547ad2b76435"},"cbcVector":{"type":"string","description":"Base64 or hex encoded initial vector obtained from device. This parameter is optional. It’s used in devices that implement 3DES Cipher Block Chaining (CBC) encryption with non-zero initial vector.","example":""},"hasCcData":{"type":"string","description":"Validation flag that indicates whether inbound and outbound data should be checked for credit card numbers. If hasCcData is set to \"1\" and the inbound data contains a credit card number or if the outbound data does not contain credit card number the decrypt operation will fail. If hasCcData is set to \"0\", no checks will be performed on inbound and outbound data. If no value for hasCcData flag provided, Decryptx defaults it to \"1\".","default":"1","enum":["1","0"]},"encoding":{"type":"string","description":"The payload encoding","default":"base64","enum":["base64","ascii","utf8","hex"]}},"x-ref":"#/components/schemas/DecryptionRequest"}}},"required":true},"parameters":[]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const decryption_ref01_ent = client.Decryption()
    let decryption_ref01_data = setup.data.new.decryption['decryption_ref01']

    decryption_ref01_data = (await decryption_ref01_ent.create(decryption_ref01_data)).data()
    assert(null != decryption_ref01_data)


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname,
      '../../../../.sdk/test/entity/decryption/DecryptionTestData.json')

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
    ['decryption01','decryption02','decryption03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_DECRYPTION_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_DECRYPTION_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_DECRYPTION_ENTID']
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
  

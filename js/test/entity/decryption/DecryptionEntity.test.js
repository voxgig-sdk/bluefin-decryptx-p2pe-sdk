
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
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"success","req":false,"short":"true if the payload decryption was successful.","type":"`$BOOLEAN`","index$":0}],"name":"decryption","op":{"create":{"input":"data","name":"create","points":[{"active":true,"args":{},"contract":{"id":"POST /decryption","json":"{\"operationId\":\"decrypt-data\",\"parameters\":[],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"cbcVector\":{\"description\":\"Base64 or hex encoded initial vector obtained from device. This parameter is optional. It’s used in devices that implement 3DES Cipher Block Chaining (CBC) encryption with non-zero initial vector.\",\"example\":\"\",\"type\":\"string\"},\"deviceType\":{\"description\":\"The device Type.\",\"example\":\"Pax A920\",\"type\":\"string\"},\"encoding\":{\"default\":\"base64\",\"description\":\"The payload encoding\",\"enum\":[\"base64\",\"ascii\",\"utf8\",\"hex\"],\"type\":\"string\"},\"encrypted\":{\"items\":{\"properties\":{\"name\":{\"description\":\"String identifier for the value to be decrypted. This name will be returned in the response so that values can be matched up. Additionally, the response array of decrypted values will be returned in the same order they were provided.\",\"example\":\"track1\",\"type\":\"string\"},\"value\":{\"description\":\"Base64 or hex encoded encrypted data retrieved from device.\",\"example\":\"EF77ABC20DE782C48A88FBF25C59A6C7E21FD7E42D9A1C091F5FC8BBC1BF7DA89E2D8DB1AEB58A7318A79DDE4E59A5E7BD682FCAE9F6BBFD\",\"type\":\"string\"}},\"required\":[\"name\",\"value\"],\"type\":\"object\"},\"type\":\"array\"},\"hasCcData\":{\"default\":\"1\",\"description\":\"Validation flag that indicates whether inbound and outbound data should be checked for credit card numbers. If hasCcData is set to \\\"1\\\" and the inbound data contains a credit card number or if the outbound data does not contain credit card number the decrypt operation will fail. If hasCcData is set to \\\"0\\\", no checks will be performed on inbound and outbound data. If no value for hasCcData flag provided, Decryptx defaults it to \\\"1\\\".\",\"enum\":[\"1\",\"0\"],\"type\":\"string\"},\"reference\":{\"description\":\"A string (of up to 50 characters) that helps partners identify individual API calls. If provided, the value will be logged to the P2PE Manager where it can be used to troubleshoot technical issues. It is highly recommended that a unique value be used on each Decryptx API call. The reference value will be returned in the response body, whether the API call is successful or not.\",\"example\":\"723f57e1-e9c8-48cb-81d9-547ad2b76435\",\"type\":\"string\"},\"sequenceNumber\":{\"description\":\"Sequence number obtained from device in base 64 or hex encoded format. This value is typically required for DUKPT encryption/decryption. This parameter is optional and not required if the device does not generate a key sequence number.\",\"example\":\"629949960E001D200037\",\"type\":\"string\"},\"serialNumber\":{\"description\":\"The serial number of the device.\",\"example\":\"541T112708\",\"type\":\"string\"}},\"required\":[\"deviceType\",\"encrypted\",\"serialNumber\"],\"type\":\"object\"}}},\"description\":\"Data to be decrypted.\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"success\":{\"description\":\"true if the payload decryption was successful.\",\"example\":true,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Decryption response\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"errorCode\":{\"example\":7409,\"type\":\"integer\"},\"errors\":{\"items\":{\"properties\":{\"[attribute name]\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"attribute\":{\"description\":\"The name of the attribute that failed validation.\",\"example\":\"mailCountry\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"example\":1002,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Mail country has an incorrect length\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"type\":\"array\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Data validation constraints.\",\"type\":\"string\"},\"uuid\":{\"example\":\"995ce120-d42c-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/decryption","segments":[{"lit":"decryption"}],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"decryption","name__orig":"decryption","Name":"Decryption","name_":"decryption","name-":"decryption","NAME":"DECRYPTION","index$":3}, {"active":true,"entity":"decryption","key$":"BasicDecryptionFlow","kind":"basic","name":"BasicDecryptionFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"decryption_ref01"},"match":{},"op":"create","spec":[],"valid":[],"index$":0}]}, 'Decryption')
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
  

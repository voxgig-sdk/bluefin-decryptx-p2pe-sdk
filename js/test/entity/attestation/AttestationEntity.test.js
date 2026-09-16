
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


describe('AttestationEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Attestation()
    assert(null != ent)
  })


  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"client","req":false,"short":"Reference to the associated Client resource.","type":"`$OBJECT`","index$":0},{"active":true,"format":"datetime","name":"completeDate","req":false,"short":"The date and time that the Attestation took place.","type":"`$STRING`","index$":1},{"active":true,"format":"datetime","name":"created","req":false,"short":"Creation timestamp in ISO 8601 format.","type":"`$STRING`","index$":2},{"active":true,"name":"device","req":false,"short":"Reference to the associated Device resource.","type":"`$OBJECT`","index$":3},{"active":true,"name":"id","req":false,"short":"This resource's unique identifier.","type":"`$STRING`","index$":4},{"active":true,"name":"name","req":false,"short":"Text describing the attestation.","type":"`$STRING`","index$":5},{"active":true,"name":"notes","req":false,"short":"Free form field that allows the Client associate notes with the Attestation.","type":"`$STRING`","index$":6}],"id":{"field":"id","name":"id"},"name":"attestation","op":{"create":{"input":"data","name":"create","points":[{"active":true,"args":{},"contract":{"id":"POST /attestations","json":"{\"operationId\":\"create-attestation\",\"parameters\":[],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"client\":{\"description\":\"Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Client's ID.\",\"example\":\"4684\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Client's name.\",\"example\":\"The Tired Window\",\"type\":\"string\"}},\"type\":\"object\"},\"completeDate\":{\"description\":\"The date and time that the Attestation took place.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"devices\":{\"items\":{\"properties\":{\"serialNumber\":{\"description\":\"The serial number of Device undergoing Attestation.\",\"example\":\"85000711\",\"maxLength\":255,\"type\":\"string\"}},\"required\":[\"serialNumber\"],\"type\":\"object\"},\"type\":\"array\"},\"name\":{\"description\":\"Text describing the attestation.\",\"example\":\"2015 Attestation Atlanta Shop (Terminal 85000711)\",\"maxLength\":255,\"type\":\"string\"},\"notes\":{\"description\":\"Free form field that allows the Client associate notes with the Attestation.\",\"example\":\"Terminal 85000711 meets all the attestation requirements.\",\"type\":\"string\"}},\"required\":[\"client\",\"completeDate\",\"devices\",\"name\"],\"type\":\"object\"}}},\"description\":\"Attestation to be created.\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Attestation creation result\",\"items\":{\"description\":\"Attestation item result\",\"properties\":{\"device\":{\"description\":\"Reference to the associated Device resource. When used for POST and PATCH API calls, the reference can contain either the ID or Serial Number. With GET API calls, both properties are included in the response.\",\"properties\":{\"id\":{\"description\":\"The referenced Device's ID\",\"example\":\"73\",\"type\":\"string\"},\"serialNumber\":{\"description\":\"The referenced Device's serial number.\",\"example\":\"85000711\",\"type\":\"string\"}},\"type\":\"object\"},\"id\":{\"description\":\"Attestation Id\",\"example\":\"73\",\"maxLength\":255,\"type\":\"string\"}},\"type\":\"object\"},\"type\":\"array\"}}},\"description\":\"Attestation create response\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"errorCode\":{\"example\":7409,\"type\":\"integer\"},\"errors\":{\"items\":{\"properties\":{\"[attribute name]\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"attribute\":{\"description\":\"The name of the attribute that failed validation.\",\"example\":\"mailCountry\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"example\":1002,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Mail country has an incorrect length\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"type\":\"array\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Data validation constraints.\",\"type\":\"string\"},\"uuid\":{\"example\":\"995ce120-d42c-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/attestations","segments":[{"lit":"attestations"}],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"list":{"input":"data","name":"list","points":[{"active":true,"args":{"query":[{"active":true,"kind":"query","name":"client","orig":"client","reqd":true,"type":"`$STRING`","index$":0},{"active":true,"example":0,"kind":"query","name":"skip","orig":"skip","reqd":false,"type":"`$INTEGER`","index$":1},{"active":true,"example":10,"kind":"query","name":"take","orig":"take","reqd":false,"type":"`$INTEGER`","index$":2}]},"contract":{"id":"GET /attestations","json":"{\"operationId\":\"list-attestations\",\"parameters\":[{\"description\":\"Filter the list by Client. The parameter value can be either a Client ID or Name.\",\"in\":\"query\",\"name\":\"client\",\"required\":true,\"schema\":{\"type\":\"string\"}},{\"description\":\"The number of entries to include in the list.\",\"in\":\"query\",\"name\":\"take\",\"schema\":{\"default\":10,\"format\":\"int32\",\"type\":\"integer\"}},{\"description\":\"The number of results to skip before listing entries.\",\"in\":\"query\",\"name\":\"skip\",\"schema\":{\"default\":0,\"format\":\"int32\",\"type\":\"integer\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"data\":{\"description\":\"List of Attestations.\",\"items\":{\"properties\":{\"client\":{\"description\":\"Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Client's ID.\",\"example\":\"4684\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Client's name.\",\"example\":\"The Tired Window\",\"type\":\"string\"}},\"type\":\"object\"},\"completeDate\":{\"description\":\"The date and time that the Attestation took place.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"device\":{\"description\":\"Reference to the associated Device resource. When used for POST and PATCH API calls, the reference can contain either the ID or Serial Number. With GET API calls, both properties are included in the response.\",\"properties\":{\"id\":{\"description\":\"The referenced Device's ID\",\"example\":\"73\",\"type\":\"string\"},\"serialNumber\":{\"description\":\"The referenced Device's serial number.\",\"example\":\"85000711\",\"type\":\"string\"}},\"type\":\"object\"},\"id\":{\"description\":\"Unique identifier.\",\"example\":\"4566\",\"type\":\"string\"},\"name\":{\"description\":\"Text describing the attestation.\",\"example\":\"2015 Attestation Atlanta Shop (Terminal 85000711)\",\"type\":\"string\"},\"notes\":{\"description\":\"Free form field that allows the Client associate notes with the Attestation.\",\"example\":\"Terminal 85000711 meets all the attestation requirements.\",\"type\":\"string\"}},\"type\":\"object\"},\"type\":\"array\"},\"total\":{\"description\":\"Total number of Attestations available (not the number of Attestations in the response).\",\"example\":1,\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Attestations list\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"errorCode\":{\"example\":7409,\"type\":\"integer\"},\"errors\":{\"items\":{\"properties\":{\"[attribute name]\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"attribute\":{\"description\":\"The name of the attribute that failed validation.\",\"example\":\"mailCountry\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"example\":1002,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Mail country has an incorrect length\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"type\":\"array\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Data validation constraints.\",\"type\":\"string\"},\"uuid\":{\"example\":\"995ce120-d42c-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/attestations","segments":[{"lit":"attestations"}],"select":{"exist":["client","skip","take"]},"transform":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"active":true,"args":{"params":[{"active":true,"kind":"param","name":"id","orig":"id","reqd":true,"type":"`$STRING`","index$":0}]},"contract":{"id":"GET /attestations/{id}","json":"{\"operationId\":\"get-attestation\",\"parameters\":[{\"description\":\"The Attestation's unique identifier.\",\"in\":\"path\",\"name\":\"id\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"client\":{\"description\":\"Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Client's ID.\",\"example\":\"4684\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Client's name.\",\"example\":\"The Tired Window\",\"type\":\"string\"}},\"type\":\"object\"},\"completeDate\":{\"description\":\"The date and time that the Attestation took place.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"created\":{\"description\":\"Creation timestamp in ISO 8601 format.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"device\":{\"description\":\"Reference to the associated Device resource. When used for POST and PATCH API calls, the reference can contain either the ID or Serial Number. With GET API calls, both properties are included in the response.\",\"properties\":{\"id\":{\"description\":\"The referenced Device's ID\",\"example\":\"73\",\"type\":\"string\"},\"serialNumber\":{\"description\":\"The referenced Device's serial number.\",\"example\":\"85000711\",\"type\":\"string\"}},\"type\":\"object\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"example\":\"73\",\"type\":\"string\"},\"name\":{\"description\":\"Text describing the attestation.\",\"example\":\"2015 Attestation Atlanta Shop (Terminal 85000711)\",\"type\":\"string\"},\"notes\":{\"description\":\"Free form field that allows the Client associate notes with the Attestation.\",\"example\":\"Terminal 85000711 meets all the attestation requirements.\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Attestation details\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"404\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a resource cannot be found.\",\"properties\":{\"errorCode\":{\"example\":7404,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Requested resource cannot be found.\",\"type\":\"string\"},\"uuid\":{\"example\":\"a7518f50-d428-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Not found\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/attestations/{id}","segments":[{"lit":"attestations"},{"var":"id"}],"select":{"exist":["id"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"attestation","name__orig":"attestation","Name":"Attestation","name_":"attestation","name-":"attestation","NAME":"ATTESTATION","index$":0}, {"active":true,"entity":"attestation","key$":"BasicAttestationFlow","kind":"basic","name":"BasicAttestationFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"attestation_ref01"},"match":{},"op":"create","spec":[],"valid":[],"index$":0},{"active":true,"data":{},"input":{},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemExists","def":{"ref":"attestation_ref01"}}],"index$":1},{"active":true,"data":{},"input":{"ref":"attestation_ref01","srcdatavar":"attestation_ref01_data","suffix":"_dt0"},"match":{"id":"attestation01"},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-attestation_ref01"}}],"index$":2}]}, 'Attestation')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const attestation_ref01_ent = client.Attestation()
    let attestation_ref01_data = setup.data.new.attestation['attestation_ref01']

    attestation_ref01_data = (await attestation_ref01_ent.create(attestation_ref01_data)).data()
    assert(null != attestation_ref01_data.id)


    // LIST
    const attestation_ref01_match = {}

    const attestation_ref01_list = (await attestation_ref01_ent.list(attestation_ref01_match)).map((e) => e.data())

    assert(!isempty(select(attestation_ref01_list, { id: attestation_ref01_data.id })))


    // LOAD
    const attestation_ref01_match_dt0 = {}
    attestation_ref01_match_dt0.id = attestation_ref01_data.id
    const attestation_ref01_data_dt0 = (await attestation_ref01_ent.load(attestation_ref01_match_dt0)).data()
    assert(attestation_ref01_data_dt0.id === attestation_ref01_data.id)


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname,
      '../../../../.sdk/test/entity/attestation/AttestationTestData.json')

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
    ['attestation01','attestation02','attestation03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_ATTESTATION_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_ATTESTATION_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_ATTESTATION_ENTID']
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
  

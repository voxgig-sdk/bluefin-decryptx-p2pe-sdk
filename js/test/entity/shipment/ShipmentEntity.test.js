
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


describe('ShipmentEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Shipment()
    assert(null != ent)
  })


  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"carrier","req":false,"short":"The name of the courier.","type":"`$STRING`","index$":0},{"active":true,"name":"client","req":false,"short":"Reference to the associated Client resource.","type":"`$OBJECT`","index$":1},{"active":true,"format":"datetime","name":"created","req":false,"short":"Creation timestamp in ISO 8601 format.","type":"`$STRING`","index$":2},{"active":true,"format":"datetime","name":"dateReceived","req":false,"short":"The date and time that a package is recieved.","type":"`$STRING`","index$":3},{"active":true,"format":"datetime","name":"dateShipped","req":false,"short":"The date and time that a package is shipped.","type":"`$STRING`","index$":4},{"active":true,"name":"dcKif","req":false,"short":"Reference to the associated KIF resource.","type":"`$OBJECT`","index$":5},{"active":true,"name":"id","req":false,"short":"This resource's unique identifier.","type":"`$STRING`","index$":6},{"active":true,"name":"items","req":false,"type":"`$ARRAY`","index$":7},{"active":true,"name":"kif","req":false,"short":"Reference to the associated KIF resource.","type":"`$OBJECT`","index$":8},{"active":true,"format":"datetime","name":"modified","req":false,"short":"Last modified timestamp.","type":"`$STRING`","index$":9},{"active":true,"name":"partner","req":false,"short":"Reference to the associated Partner.","type":"`$OBJECT`","index$":10},{"active":true,"name":"shipmentType","req":false,"short":"The type of shipment.","type":"`$STRING`","index$":11},{"active":true,"name":"tracking","req":false,"short":"The courier's tracking number.","type":"`$STRING`","index$":12},{"active":true,"format":"int32","name":"version","req":false,"short":"The number of times that this resource has been updated.","type":"`$INTEGER`","index$":13}],"id":{"field":"id","name":"id"},"name":"shipment","op":{"create":{"input":"data","name":"create","points":[{"active":true,"args":{},"contract":{"id":"POST /shipments","json":"{\"operationId\":\"create-shipment\",\"parameters\":[],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"carrier\":{\"description\":\"The name of the courier.\",\"enum\":[\"UPS\",\"FedEx\"],\"type\":\"string\"},\"client\":{\"description\":\"Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Client's ID.\",\"example\":\"4684\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Client's name.\",\"example\":\"The Tired Window\",\"type\":\"string\"}},\"type\":\"object\"},\"dateShipped\":{\"description\":\"The date and time that a package is shipped.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"dcKif\":{\"description\":\"Reference to the associated KIF resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced KIF's ID.\",\"example\":\"4\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced KIF's name.\",\"example\":\"Kriptithe Technologies\",\"type\":\"string\"}},\"type\":\"object\"},\"items\":{\"items\":{\"properties\":{\"serialNumber\":{\"description\":\"The serial number of the Device that is shipped.\",\"example\":\"85000711\",\"maxLength\":255,\"type\":\"string\"},\"tamperLabel\":{\"description\":\"The code that is printed the tamper label of the Device that is shipped.\",\"example\":\"BF120877\",\"maxLength\":255,\"type\":\"string\"}},\"type\":\"object\"},\"type\":\"array\"},\"kif\":{\"description\":\"Reference to the associated KIF resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced KIF's ID.\",\"example\":\"4\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced KIF's name.\",\"example\":\"Kriptithe Technologies\",\"type\":\"string\"}},\"type\":\"object\"},\"location\":{\"description\":\"Reference to the associated Location resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"customReference\":{\"description\":\"A custom refernce to location object. This value can be set\",\"example\":\"ASD234\",\"type\":\"string\"},\"id\":{\"description\":\"The referenced Location's ID.\",\"example\":\"33668\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Location's name.\",\"example\":\"The Tired Window Atlanta Downtown\",\"type\":\"string\"}},\"required\":[\"id\"],\"type\":\"object\"},\"partner\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"example\":\"6580\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"example\":\"ASM Software\",\"type\":\"string\"}},\"type\":\"object\"},\"tracking\":{\"description\":\"The courier's tracking number.\",\"example\":\"1Z999AA10123456784\",\"maxLength\":255,\"type\":\"string\"}},\"required\":[\"carrier\",\"client\",\"dateShipped\",\"items\",\"kif\",\"location\",\"partner\",\"tracking\"],\"type\":\"object\"}}},\"description\":\"Shipment to be created.\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"A simple object containing the ID of the newly created resource.\",\"properties\":{\"id\":{\"description\":\"ID of newly created resource\",\"example\":\"10\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Shipment create response\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"errorCode\":{\"example\":7409,\"type\":\"integer\"},\"errors\":{\"items\":{\"properties\":{\"[attribute name]\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"attribute\":{\"description\":\"The name of the attribute that failed validation.\",\"example\":\"mailCountry\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"example\":1002,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Mail country has an incorrect length\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"type\":\"array\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Data validation constraints.\",\"type\":\"string\"},\"uuid\":{\"example\":\"995ce120-d42c-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/shipments","segments":[{"lit":"shipments"}],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"list":{"input":"data","name":"list","points":[{"active":true,"args":{"query":[{"active":true,"kind":"query","name":"kif","orig":"kif","reqd":true,"type":"`$STRING`","index$":0},{"active":true,"kind":"query","name":"mode","orig":"mode","reqd":false,"type":"`$STRING`","index$":1},{"active":true,"example":0,"kind":"query","name":"skip","orig":"skip","reqd":false,"type":"`$INTEGER`","index$":2},{"active":true,"example":10,"kind":"query","name":"take","orig":"take","reqd":false,"type":"`$INTEGER`","index$":3}]},"contract":{"id":"GET /shipments","json":"{\"operationId\":\"list-shipments\",\"parameters\":[{\"description\":\"Filter the list by KIF. The parameter value can be either a KIF ID or Name.\",\"in\":\"query\",\"name\":\"kif\",\"required\":true,\"schema\":{\"type\":\"string\"}},{\"description\":\"Filter the list by shipment mode.\",\"in\":\"query\",\"name\":\"mode\",\"schema\":{\"enum\":[\"inTransit\",\"received\"],\"type\":\"string\"}},{\"description\":\"The number of entries to include in the list.\",\"in\":\"query\",\"name\":\"take\",\"schema\":{\"default\":10,\"format\":\"int32\",\"type\":\"integer\"}},{\"description\":\"The number of results to skip before listing entries.\",\"in\":\"query\",\"name\":\"skip\",\"schema\":{\"default\":0,\"format\":\"int32\",\"type\":\"integer\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"data\":{\"description\":\"List of Shipments.\",\"items\":{\"properties\":{\"carrier\":{\"description\":\"The name of the courier.\",\"enum\":[\"UPS\",\"FedEx\"],\"type\":\"string\"},\"client\":{\"description\":\"Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Client's ID.\",\"example\":\"4684\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Client's name.\",\"example\":\"The Tired Window\",\"type\":\"string\"}},\"type\":\"object\"},\"dateReceived\":{\"description\":\"The date and time that a package was recieved.\",\"example\":\"2017-02-09T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"dateShipped\":{\"description\":\"The date and time that a package is shipped.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"dcKif\":{\"description\":\"Reference to the associated KIF resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced KIF's ID.\",\"example\":\"4\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced KIF's name.\",\"example\":\"Kriptithe Technologies\",\"type\":\"string\"}},\"type\":\"object\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"example\":\"73\",\"type\":\"string\"},\"kif\":{\"description\":\"Reference to the associated KIF resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced KIF's ID.\",\"example\":\"4\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced KIF's name.\",\"example\":\"Kriptithe Technologies\",\"type\":\"string\"}},\"type\":\"object\"},\"partner\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"example\":\"6580\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"example\":\"ASM Software\",\"type\":\"string\"}},\"type\":\"object\"},\"shipmentType\":{\"description\":\"The type of shipment.\",\"enum\":[\"KIF Shipment\",\"Client Shipment\"],\"type\":\"string\"},\"tracking\":{\"description\":\"The courier's tracking number.\",\"example\":\"1Z999AA10123456784\",\"type\":\"string\"},\"version\":{\"description\":\"The number of times that this resource has been updated.\",\"example\":3,\"format\":\"int32\",\"type\":\"integer\"}},\"type\":\"object\"},\"type\":\"array\"},\"total\":{\"description\":\"Total number of Shipments available (not the number of Shipments in the response).\",\"example\":1,\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Shipments list\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"errorCode\":{\"example\":7409,\"type\":\"integer\"},\"errors\":{\"items\":{\"properties\":{\"[attribute name]\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"attribute\":{\"description\":\"The name of the attribute that failed validation.\",\"example\":\"mailCountry\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"example\":1002,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Mail country has an incorrect length\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"type\":\"array\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Data validation constraints.\",\"type\":\"string\"},\"uuid\":{\"example\":\"995ce120-d42c-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/shipments","segments":[{"lit":"shipments"}],"select":{"exist":["kif","mode","skip","take"]},"transform":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"active":true,"args":{"params":[{"active":true,"kind":"param","name":"id","orig":"id","reqd":true,"type":"`$STRING`","index$":0}]},"contract":{"id":"GET /shipments/{id}","json":"{\"operationId\":\"get-shipment\",\"parameters\":[{\"description\":\"The Shipment's unique identifier.\",\"in\":\"path\",\"name\":\"id\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"carrier\":{\"description\":\"The name of the courier.\",\"enum\":[\"UPS\",\"FedEx\"],\"type\":\"string\"},\"client\":{\"description\":\"Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Client's ID.\",\"example\":\"4684\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Client's name.\",\"example\":\"The Tired Window\",\"type\":\"string\"}},\"type\":\"object\"},\"created\":{\"description\":\"Creation timestamp in ISO 8601 format.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"dateReceived\":{\"description\":\"The date and time that a package is recieved.\",\"example\":\"2017-02-09T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"dateShipped\":{\"description\":\"The date and time that a package is shipped.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"dcKif\":{\"description\":\"Reference to the associated KIF resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced KIF's ID.\",\"example\":\"4\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced KIF's name.\",\"example\":\"Kriptithe Technologies\",\"type\":\"string\"}},\"type\":\"object\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"example\":\"73\",\"type\":\"string\"},\"items\":{\"items\":{\"properties\":{\"alternateKey\":{\"description\":\"An encryption key.\",\"example\":\"\",\"maxLength\":255,\"type\":\"string\"},\"created\":{\"description\":\"Creation timestamp in ISO 8601 format.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"dateReceived\":{\"description\":\"The date and time that a package was recieved.\",\"example\":\"2017-02-09T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"deviceName\":{\"maxLength\":255,\"type\":\"string\"},\"deviceState\":{\"maxLength\":255,\"type\":\"string\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"example\":\"73\",\"type\":\"string\"},\"modified\":{\"description\":\"Last modified timestamp.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"serialNumber\":{\"description\":\"The serial number of the Device that is shipped.\",\"example\":\"85000711\",\"maxLength\":255,\"type\":\"string\"},\"tamperLabel\":{\"description\":\"The code that is printed the tamper label of the Device that is shipped.\",\"example\":\"BF120877\",\"maxLength\":255,\"type\":\"string\"},\"version\":{\"description\":\"The number of times that this resource has been updated.\",\"example\":3,\"format\":\"int32\",\"type\":\"integer\"}},\"type\":\"object\"},\"type\":\"array\"},\"kif\":{\"description\":\"Reference to the associated KIF resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced KIF's ID.\",\"example\":\"4\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced KIF's name.\",\"example\":\"Kriptithe Technologies\",\"type\":\"string\"}},\"type\":\"object\"},\"modified\":{\"description\":\"Last modified timestamp.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"partner\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"example\":\"6580\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"example\":\"ASM Software\",\"type\":\"string\"}},\"type\":\"object\"},\"shipmentType\":{\"description\":\"The type of shipment.\",\"enum\":[\"KIF Shipment\",\"Client Shipment\"],\"type\":\"string\"},\"tracking\":{\"description\":\"The courier's tracking number.\",\"example\":\"1Z999AA10123456784\",\"type\":\"string\"},\"version\":{\"description\":\"The number of times that this resource has been updated.\",\"example\":3,\"format\":\"int32\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Shipment details\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"404\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a resource cannot be found.\",\"properties\":{\"errorCode\":{\"example\":7404,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Requested resource cannot be found.\",\"type\":\"string\"},\"uuid\":{\"example\":\"a7518f50-d428-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Not found\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/shipments/{id}","segments":[{"lit":"shipments"},{"var":"id"}],"select":{"exist":["id"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"shipment","name__orig":"shipment","Name":"Shipment","name_":"shipment","name-":"shipment","NAME":"SHIPMENT","index$":17}, {"active":true,"entity":"shipment","key$":"BasicShipmentFlow","kind":"basic","name":"BasicShipmentFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"shipment_ref01"},"match":{},"op":"create","spec":[],"valid":[],"index$":0},{"active":true,"data":{},"input":{},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemExists","def":{"ref":"shipment_ref01"}}],"index$":1},{"active":true,"data":{},"input":{"ref":"shipment_ref01","srcdatavar":"shipment_ref01_data","suffix":"_dt0"},"match":{"id":"shipment01"},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-shipment_ref01"}}],"index$":2}]}, 'Shipment')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const shipment_ref01_ent = client.Shipment()
    let shipment_ref01_data = setup.data.new.shipment['shipment_ref01']

    shipment_ref01_data = (await shipment_ref01_ent.create(shipment_ref01_data)).data()
    assert(null != shipment_ref01_data.id)


    // LIST
    const shipment_ref01_match = {}

    const shipment_ref01_list = (await shipment_ref01_ent.list(shipment_ref01_match)).map((e) => e.data())

    assert(!isempty(select(shipment_ref01_list, { id: shipment_ref01_data.id })))


    // LOAD
    const shipment_ref01_match_dt0 = {}
    shipment_ref01_match_dt0.id = shipment_ref01_data.id
    const shipment_ref01_data_dt0 = (await shipment_ref01_ent.load(shipment_ref01_match_dt0)).data()
    assert(shipment_ref01_data_dt0.id === shipment_ref01_data.id)


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname,
      '../../../../.sdk/test/entity/shipment/ShipmentTestData.json')

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
    ['shipment01','shipment02','shipment03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_SHIPMENT_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_SHIPMENT_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_SHIPMENT_ENTID']
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
  

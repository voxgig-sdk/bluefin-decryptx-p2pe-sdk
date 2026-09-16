

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { BluefinDecryptxP2peSDK, BaseFeature, stdutil } from '../../..'

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


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('LocationEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Location()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
    for (const op of ['create', 'list', 'load', 'remove']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'location.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"address1","req":false,"short":"The Location's street address.","type":"`$STRING`","index$":0},{"active":true,"name":"address2","req":false,"short":"The Location's street address.","type":"`$STRING`","index$":1},{"active":true,"name":"billingId","req":false,"short":"\\?","type":"`$STRING`","index$":2},{"active":true,"name":"city","req":false,"short":"The Location's city.","type":"`$STRING`","index$":3},{"active":true,"name":"country","req":false,"short":"The Location's country.","type":"`$STRING`","index$":4},{"active":true,"format":"datetime","name":"created","req":false,"short":"Creation timestamp in ISO 8601 format.","type":"`$STRING`","index$":5},{"active":true,"name":"customReference","req":false,"short":"A Partner specified reference for a location.","type":"`$STRING`","index$":6},{"active":true,"name":"id","req":false,"short":"This resource's unique identifier.","type":"`$STRING`","index$":7},{"active":true,"name":"locationType","req":false,"short":"The Location's clasification.","type":"`$STRING`","index$":8},{"active":true,"name":"mailAddress1","req":false,"short":"The Location's street address.","type":"`$STRING`","index$":9},{"active":true,"name":"mailAddress2","req":false,"short":"The Location's street address.","type":"`$STRING`","index$":10},{"active":true,"name":"mailCity","req":false,"short":"The Location's city.","type":"`$STRING`","index$":11},{"active":true,"name":"mailCountry","req":false,"short":"The Location's street address.","type":"`$STRING`","index$":12},{"active":true,"name":"mailPostalCode","req":false,"short":"The Location's postal code.","type":"`$STRING`","index$":13},{"active":true,"name":"mailStateProvince","req":false,"short":"The Location's street state or province.","type":"`$STRING`","index$":14},{"active":true,"format":"datetime","name":"modified","req":false,"short":"Last modified timestamp.","type":"`$STRING`","index$":15},{"active":true,"name":"name","req":false,"short":"The Location's name.","type":"`$STRING`","index$":16},{"active":true,"name":"nameOfBusiness","req":false,"short":"The name of the business at this location.","type":"`$STRING`","index$":17},{"active":true,"name":"notes","req":false,"short":"Note for delivery driver.","type":"`$STRING`","index$":18},{"active":true,"name":"postalCode","req":false,"short":"The Location's postal code.","type":"`$STRING`","index$":19},{"active":true,"name":"stateProvince","req":false,"short":"The Location's street state or province.","type":"`$STRING`","index$":20},{"active":true,"name":"uniqueId","req":false,"short":"Unique Identifier for the Location.","type":"`$STRING`","index$":21},{"active":true,"name":"version","req":false,"short":"The number of times that this resource has been updated.","type":"`$INTEGER`","index$":22}],"id":{"field":"id","name":"id"},"name":"location","op":{"create":{"input":"data","name":"create","points":[{"active":true,"args":{},"contract":{"id":"POST /locations","json":"{\"operationId\":\"create-location\",\"parameters\":[],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"address1\":{\"description\":\"The Location's street address.\",\"example\":\"123 Main St\",\"maxLength\":255,\"type\":\"string\"},\"address2\":{\"description\":\"The Location's street address.\",\"example\":\"Suite 100\",\"maxLength\":255,\"type\":\"string\"},\"billingId\":{\"description\":\"\\\\?\",\"maxLength\":50,\"type\":\"string\"},\"city\":{\"description\":\"The Location's city.\",\"example\":\"Atlanta\",\"maxLength\":255,\"type\":\"string\"},\"client\":{\"description\":\"Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Client's ID.\",\"example\":\"4684\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Client's name.\",\"example\":\"The Tired Window\",\"type\":\"string\"}},\"type\":\"object\"},\"country\":{\"description\":\"Reference to the associated Country. When used for POST and PATCH API calls, the reference can contain either the ISO-ALPHA2 country Code or Name.\",\"properties\":{\"code\":{\"description\":\"The referenced Country's code (two uppercase symbols).\",\"example\":\"US\",\"maxLength\":2,\"type\":\"string\"},\"name\":{\"description\":\"The referenced Country's name.\",\"example\":\"United States\",\"type\":\"string\"}},\"type\":\"object\"},\"customReference\":{\"description\":\"A Partner specified reference for a location. Must be unique to a Partner.\",\"example\":\"ASDF234\",\"maxLength\":255,\"type\":\"string\"},\"locationType\":{\"description\":\"The Location's clasification.\",\"enum\":[\"Manufacturer\",\"Manufacturer long term storage\",\"KIF\",\"Vendor fulfillment location\",\"BF fulfillment location\",\"Merchant retail location\",\"Merchant CSR location\",\"Merchant long term storage location\",\"Merchant short term storage & distribution\",\"Corporate Headquarters\",\"Regional Office\",\"Field Office\",\"Partner Location\"],\"example\":\"Merchant retail location\",\"type\":\"string\"},\"mailAddress1\":{\"description\":\"The Location's street address.\",\"example\":\"123 Main St\",\"maxLength\":255,\"type\":\"string\"},\"mailAddress2\":{\"description\":\"The Location's street address.\",\"example\":\"Suite 100\",\"maxLength\":255,\"type\":\"string\"},\"mailCity\":{\"description\":\"The Location's city.\",\"example\":\"Atlanta\",\"maxLength\":255,\"type\":\"string\"},\"mailCountry\":{\"description\":\"The Location's street address.\",\"example\":\"United States\",\"type\":\"string\"},\"mailPostalCode\":{\"description\":\"The Location's postal code.\",\"example\":\"30350\",\"maxLength\":10,\"type\":\"string\"},\"mailStateProvince\":{\"description\":\"The Location's street state or province.\",\"example\":\"Georgia\",\"maxLength\":255,\"type\":\"string\"},\"name\":{\"description\":\"The Location's name.\",\"example\":\"ASM Software Headquarters\",\"maxLength\":255,\"type\":\"string\"},\"nameOfBusiness\":{\"description\":\"The name of the business at this location.\",\"example\":\"The Tired Window\",\"maxLength\":255,\"type\":\"string\"},\"notes\":{\"description\":\"Note for delivery driver.\",\"example\":\"Dial 129 on the intercom to speak with our receptionist.\",\"type\":\"string\"},\"postalCode\":{\"description\":\"The Location's postal code.\",\"example\":\"30350\",\"maxLength\":10,\"type\":\"string\"},\"stateProvince\":{\"description\":\"The Location's street state or province.\",\"example\":\"Georgia\",\"maxLength\":255,\"type\":\"string\"},\"uniqueId\":{\"description\":\"Unique Identifier for the Location.\",\"example\":\"8\",\"maxLength\":255,\"type\":\"string\"}},\"required\":[\"address1\",\"city\",\"country\",\"locationType\",\"name\"],\"type\":\"object\"}}},\"description\":\"Location to be created.\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"A simple object containing the ID of the newly created resource.\",\"properties\":{\"id\":{\"description\":\"ID of newly created resource\",\"example\":\"10\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Location create response\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"errorCode\":{\"example\":7409,\"type\":\"integer\"},\"errors\":{\"items\":{\"properties\":{\"[attribute name]\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"attribute\":{\"description\":\"The name of the attribute that failed validation.\",\"example\":\"mailCountry\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"example\":1002,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Mail country has an incorrect length\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"type\":\"array\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Data validation constraints.\",\"type\":\"string\"},\"uuid\":{\"example\":\"995ce120-d42c-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/locations","segments":[{"lit":"locations"}],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"list":{"input":"data","name":"list","points":[{"active":true,"args":{"query":[{"active":true,"kind":"query","name":"client","orig":"client","reqd":true,"type":"`$STRING`","index$":0},{"active":true,"example":0,"kind":"query","name":"skip","orig":"skip","reqd":false,"type":"`$INTEGER`","index$":1},{"active":true,"example":10,"kind":"query","name":"take","orig":"take","reqd":false,"type":"`$INTEGER`","index$":2}]},"contract":{"id":"GET /locations","json":"{\"operationId\":\"list-location\",\"parameters\":[{\"description\":\"Filter the list by Client. The parameter value can be either a Client ID or Name.\",\"in\":\"query\",\"name\":\"client\",\"required\":true,\"schema\":{\"type\":\"string\"}},{\"description\":\"The number of entries to include in the list.\",\"in\":\"query\",\"name\":\"take\",\"schema\":{\"default\":10,\"format\":\"int32\",\"type\":\"integer\"}},{\"description\":\"The number of results to skip before listing entries.\",\"in\":\"query\",\"name\":\"skip\",\"schema\":{\"default\":0,\"format\":\"int32\",\"type\":\"integer\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"data\":{\"description\":\"List of Locations.\",\"items\":{\"properties\":{\"address1\":{\"description\":\"The Location's street address.\",\"example\":\"123 Main St\",\"type\":\"string\"},\"address2\":{\"description\":\"The Location's street address.\",\"example\":\"Suite 100\",\"type\":\"string\"},\"billingId\":{\"description\":\"\\\\?\",\"maxLength\":50,\"type\":\"string\"},\"city\":{\"description\":\"The Location's city.\",\"example\":\"Atlanta\",\"type\":\"string\"},\"country\":{\"description\":\"The Location's country.\",\"example\":\"United States\",\"type\":\"string\"},\"customReference\":{\"description\":\"A Partner specified reference for a location. Must be unique to a Partner.\",\"example\":\"ASDF234\",\"maxLength\":255,\"type\":\"string\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"example\":\"73\",\"type\":\"string\"},\"locationType\":{\"description\":\"The Location's clasification.\",\"enum\":[\"Manufacturer\",\"Manufacturer long term storage\",\"KIF\",\"Vendor fulfillment location\",\"BF fulfillment location\",\"Merchant retail location\",\"Merchant CSR location\",\"Merchant long term storage location\",\"Merchant short term storage & distribution\",\"Corporate Headquarters\",\"Regional Office\",\"Field Office\",\"Partner Location\"],\"example\":\"Merchant retail location\",\"type\":\"string\"},\"mailAddress1\":{\"description\":\"The Location's street address.\",\"example\":\"123 Main St\",\"type\":\"string\"},\"mailAddress2\":{\"description\":\"The Location's street address.\",\"example\":\"Suite 100\",\"type\":\"string\"},\"mailCity\":{\"description\":\"The Location's city.\",\"example\":\"Atlanta\",\"type\":\"string\"},\"mailCountry\":{\"description\":\"The Location's country.\",\"example\":\"United States\",\"type\":\"string\"},\"mailPostalCode\":{\"description\":\"The Location's postal code.\",\"example\":\"30350\",\"type\":\"string\"},\"mailStateProvince\":{\"description\":\"The Location's street state or province.\",\"example\":\"Georgia\",\"type\":\"string\"},\"name\":{\"description\":\"The Location's name.\",\"example\":\"ASM Software Headquarters\",\"type\":\"string\"},\"nameOfBusiness\":{\"description\":\"The name of the business at this location.\",\"example\":\"The Tired Window\",\"type\":\"string\"},\"notes\":{\"description\":\"Note for delivery driver.\",\"example\":\"Dial 129 on the intercom to speak with our receptionist.\",\"type\":\"string\"},\"postalCode\":{\"description\":\"The Location's postal code.\",\"example\":\"30350\",\"type\":\"string\"},\"stateProvince\":{\"description\":\"The Location's street state or province.\",\"example\":\"Georgia\",\"type\":\"string\"},\"version\":{\"description\":\"The number of times that this resource has been updated.\",\"example\":3,\"type\":\"integer\"}},\"type\":\"object\"},\"type\":\"array\"},\"total\":{\"description\":\"Total number of Locations available (not the number of Locations in the response).\",\"example\":1,\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Locations list\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"errorCode\":{\"example\":7409,\"type\":\"integer\"},\"errors\":{\"items\":{\"properties\":{\"[attribute name]\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"attribute\":{\"description\":\"The name of the attribute that failed validation.\",\"example\":\"mailCountry\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"example\":1002,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Mail country has an incorrect length\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"type\":\"array\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Data validation constraints.\",\"type\":\"string\"},\"uuid\":{\"example\":\"995ce120-d42c-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/locations","segments":[{"lit":"locations"}],"select":{"exist":["client","skip","take"]},"transform":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"active":true,"args":{"params":[{"active":true,"kind":"param","name":"id","orig":"id","reqd":true,"type":"`$STRING`","index$":0}]},"contract":{"id":"GET /locations/{id}","json":"{\"operationId\":\"get-location\",\"parameters\":[{\"description\":\"The Location's unique identifier.\",\"in\":\"path\",\"name\":\"id\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"address1\":{\"description\":\"The Location's street address.\",\"example\":\"123 Main St\",\"type\":\"string\"},\"address2\":{\"description\":\"The Location's street address.\",\"example\":\"Suite 100\",\"type\":\"string\"},\"billingId\":{\"description\":\"\\\\?\",\"maxLength\":50,\"type\":\"string\"},\"city\":{\"description\":\"The Location's city.\",\"example\":\"Atlanta\",\"type\":\"string\"},\"country\":{\"description\":\"The Location's country.\",\"example\":\"United States\",\"type\":\"string\"},\"created\":{\"description\":\"Creation timestamp in ISO 8601 format.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"customReference\":{\"description\":\"A Partner specified reference for a location.\",\"example\":\"ASDF234\",\"maxLength\":255,\"type\":\"string\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"example\":\"73\",\"type\":\"string\"},\"locationType\":{\"description\":\"The Location's clasification.\",\"enum\":[\"Manufacturer\",\"Manufacturer long term storage\",\"KIF\",\"Vendor fulfillment location\",\"BF fulfillment location\",\"Merchant retail location\",\"Merchant CSR location\",\"Merchant long term storage location\",\"Merchant short term storage & distribution\",\"Corporate Headquarters\",\"Regional Office\",\"Field Office\",\"Partner Location\"],\"example\":\"Merchant retail location\",\"type\":\"string\"},\"mailAddress1\":{\"description\":\"The Location's street address.\",\"example\":\"123 Main St\",\"type\":\"string\"},\"mailAddress2\":{\"description\":\"The Location's street address.\",\"example\":\"Suite 100\",\"type\":\"string\"},\"mailCity\":{\"description\":\"The Location's city.\",\"example\":\"Atlanta\",\"type\":\"string\"},\"mailCountry\":{\"description\":\"The Location's street address.\",\"example\":\"United States\",\"type\":\"string\"},\"mailPostalCode\":{\"description\":\"The Location's postal code.\",\"example\":\"30350\",\"type\":\"string\"},\"mailStateProvince\":{\"description\":\"The Location's street state or province.\",\"example\":\"Georgia\",\"type\":\"string\"},\"modified\":{\"description\":\"Last modified timestamp.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"name\":{\"description\":\"The Location's name.\",\"example\":\"ASM Software Headquarters\",\"type\":\"string\"},\"nameOfBusiness\":{\"description\":\"The name of the business at this location.\",\"example\":\"The Tired Window\",\"type\":\"string\"},\"notes\":{\"description\":\"Note for delivery driver.\",\"example\":\"Dial 129 on the intercom to speak with our receptionist.\",\"type\":\"string\"},\"postalCode\":{\"description\":\"The Location's postal code.\",\"example\":\"30350\",\"type\":\"string\"},\"stateProvince\":{\"description\":\"The Location's street state or province.\",\"example\":\"Georgia\",\"type\":\"string\"},\"uniqueId\":{\"description\":\"Unique Identifier for the Location.\",\"example\":\"8\",\"type\":\"string\"},\"version\":{\"description\":\"The number of times that this resource has been updated.\",\"example\":3,\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Location details\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"404\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a resource cannot be found.\",\"properties\":{\"errorCode\":{\"example\":7404,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Requested resource cannot be found.\",\"type\":\"string\"},\"uuid\":{\"example\":\"a7518f50-d428-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Not found\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/locations/{id}","segments":[{"lit":"locations"},{"var":"id"}],"select":{"exist":["id"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"},"remove":{"input":"data","name":"remove","points":[{"active":true,"args":{"params":[{"active":true,"kind":"param","name":"id","orig":"id","reqd":true,"type":"`$STRING`","index$":0}]},"contract":{"id":"DELETE /locations/{id}","json":"{\"operationId\":\"delete-location\",\"parameters\":[{\"description\":\"The Location's unique identifier.\",\"in\":\"path\",\"name\":\"id\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{},\"description\":\"Location has been deleted successfully\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"404\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a resource cannot be found.\",\"properties\":{\"errorCode\":{\"example\":7404,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Requested resource cannot be found.\",\"type\":\"string\"},\"uuid\":{\"example\":\"a7518f50-d428-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Not found\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"errorCode\":{\"example\":7409,\"type\":\"integer\"},\"errors\":{\"items\":{\"properties\":{\"[attribute name]\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"attribute\":{\"description\":\"The name of the attribute that failed validation.\",\"example\":\"mailCountry\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"example\":1002,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Mail country has an incorrect length\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"type\":\"array\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Data validation constraints.\",\"type\":\"string\"},\"uuid\":{\"example\":\"995ce120-d42c-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"DELETE","orig":"/locations/{id}","segments":[{"lit":"locations"},{"var":"id"}],"select":{"exist":["id"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"remove"}},"relations":{"ancestors":[]},"key$":"location","name__orig":"location","Name":"Location","name_":"location","name-":"location","NAME":"LOCATION","index$":15}, {"active":true,"entity":"location","key$":"BasicLocationFlow","kind":"basic","name":"BasicLocationFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"location_ref01"},"match":{},"op":"create","spec":[],"valid":[],"index$":0},{"active":true,"data":{},"input":{},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemExists","def":{"ref":"location_ref01"}}],"index$":1},{"active":true,"data":{},"input":{"ref":"location_ref01","srcdatavar":"location_ref01_data","suffix":"_dt0"},"match":{"id":"location01"},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-location_ref01"}}],"index$":2},{"active":true,"data":{},"input":{"ref":"location_ref01","suffix":"_rm0"},"match":{"id":"location01"},"op":"remove","spec":[],"valid":[],"index$":3},{"active":true,"data":{},"input":{"suffix":"_rt0"},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemNotExists","def":{"ref":"location_ref01"}}],"index$":4}]}, 'Location')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const location_ref01_ent = client.Location()
    let location_ref01_data = setup.data.new.location['location_ref01']

    location_ref01_data = (await location_ref01_ent.create(location_ref01_data)).data()
    assert(null != location_ref01_data.id)


    // LIST
    const location_ref01_match: any = {}

    const location_ref01_list = (await location_ref01_ent.list(location_ref01_match)).map((e: any) => e.data())

    assert(!isempty(select(location_ref01_list, { id: location_ref01_data.id })))


    // LOAD
    const location_ref01_match_dt0: any = {}
    location_ref01_match_dt0.id = location_ref01_data.id
    const location_ref01_data_dt0 = (await location_ref01_ent.load(location_ref01_match_dt0)).data()
    assert(location_ref01_data_dt0.id === location_ref01_data.id)


    // REMOVE
    const location_ref01_match_rm0: any = { id: location_ref01_data.id }
    await location_ref01_ent.remove(location_ref01_match_rm0)
  

    // LIST
    const location_ref01_match_rt0: any = {}

    const location_ref01_list_rt0 = (await location_ref01_ent.list(location_ref01_match_rt0)).map((e: any) => e.data())

    assert(isempty(select(location_ref01_list_rt0, { id: location_ref01_data.id })))


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/location/LocationTestData.json')

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
    ['location01','location02','location03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_LOCATION_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
    'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_LOCATION_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_LOCATION_ENTID']
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
  

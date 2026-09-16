

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


describe('ClientEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Client()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
    for (const op of ['create', 'list', 'load', 'remove']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'client.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"contact","op":{"list":{"req":true,"type":"`$OBJECT`"}},"req":false,"short":"Reference to the associated User resource.","type":"`$OBJECT`","index$":0},{"active":true,"format":"datetime","name":"created","req":false,"short":"Creation timestamp in ISO 8601 format.","type":"`$STRING`","index$":1},{"active":true,"name":"directPartner","req":false,"short":"Reference to the associated Partner.","type":"`$OBJECT`","index$":2},{"active":true,"name":"id","req":false,"short":"This resource's unique identifier.","type":"`$STRING`","index$":3},{"active":true,"name":"isActive","req":false,"short":"This property indicates if the Client account is active or disabled.","type":"`$BOOLEAN`","index$":4},{"active":true,"name":"location","req":true,"short":"Reference to the associated Location resource.","type":"`$OBJECT`","index$":5},{"active":true,"name":"mid","req":false,"short":"Some Partners will have an merchant ids on their own software offerings.","type":"`$STRING`","index$":6},{"active":true,"format":"datetime","name":"modified","req":false,"short":"Last modified timestamp.","type":"`$STRING`","index$":7},{"active":true,"name":"name","req":false,"short":"The Client's name.","type":"`$STRING`","index$":8},{"active":true,"name":"partner","req":false,"short":"Reference to the Client's root Partner.","type":"`$OBJECT`","index$":9},{"active":true,"name":"version","req":false,"short":"The number of times that this resource has been updated.","type":"`$INTEGER`","index$":10}],"id":{"field":"id","name":"id"},"name":"client","op":{"create":{"input":"data","name":"create","points":[{"active":true,"args":{},"contract":{"id":"POST /clients","json":"{\"operationId\":\"create-client\",\"parameters\":[],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"contact\":{\"description\":\"A User object.\",\"properties\":{\"email\":{\"description\":\"The User's email address.\",\"example\":\"kgilluley0@zdnet.com\",\"maxLength\":255,\"type\":\"string\"},\"firstName\":{\"description\":\"The User's name.\",\"example\":\"Kaleena\",\"maxLength\":255,\"type\":\"string\"},\"isActive\":{\"description\":\"This property indicates if the User account is active or disabled. Once a user has logged into the system, their account cannot be deleted. As an alternative, their account can be set to inactive.\",\"example\":true,\"type\":\"boolean\"},\"lastName\":{\"description\":\"The User's Surname.\",\"example\":\"Gilluley\",\"maxLength\":255,\"type\":\"string\"},\"phone\":{\"description\":\"The User's phone number without dashes, spaces, or brackets.\",\"example\":\"2025550162\",\"maxLength\":255,\"type\":\"string\"},\"sendWelcomeEmail\":{\"description\":\"If this property is set to *'true'*, the newly created user will be sent a welcome email.\",\"example\":true,\"type\":\"boolean\"},\"userName\":{\"description\":\"The User's unique username.\",\"example\":\"kgilluley0\",\"maxLength\":255,\"type\":\"string\"},\"userRole\":{\"enum\":[\"Partner User\",\"Client Admin\",\"Client User\",\"Client Custodian\",\"Client Procurement\"],\"type\":\"string\"}},\"required\":[\"email\",\"firstName\",\"isActive\",\"lastName\",\"phone\",\"userName\",\"userRole\"],\"type\":\"object\"},\"directPartner\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"example\":\"6580\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"example\":\"ASM Software\",\"type\":\"string\"}},\"type\":\"object\"},\"isActive\":{\"description\":\"This property indicates if the Client account is active or disabled. It is not possible to delete Clients, however their account can be set to inactive.\",\"example\":true,\"type\":\"boolean\"},\"location\":{\"description\":\"A Location object.\",\"properties\":{\"address1\":{\"description\":\"The Location's street address.\",\"example\":\"123 Main St\",\"maxLength\":255,\"type\":\"string\"},\"address2\":{\"description\":\"The Location's street address.\",\"example\":\"Suite 100\",\"maxLength\":255,\"type\":\"string\"},\"billingId\":{\"description\":\"\\\\?\",\"maxLength\":50,\"type\":\"string\"},\"city\":{\"description\":\"The Location's city.\",\"example\":\"Atlanta\",\"maxLength\":255,\"type\":\"string\"},\"country\":{\"description\":\"Reference to the associated Country. When used for POST and PATCH API calls, the reference can contain either the ISO-ALPHA2 country Code or Name.\",\"properties\":{\"code\":{\"description\":\"The referenced Country's code (two uppercase symbols).\",\"example\":\"US\",\"maxLength\":2,\"type\":\"string\"},\"name\":{\"description\":\"The referenced Country's name.\",\"example\":\"United States\",\"type\":\"string\"}},\"type\":\"object\"},\"customReference\":{\"description\":\"A Partner specified reference for a location.\",\"example\":\"ASDF234\",\"maxLength\":255,\"type\":\"string\"},\"locationType\":{\"description\":\"The Location's clasification.\",\"enum\":[\"Manufacturer\",\"Manufacturer long term storage\",\"KIF\",\"Vendor fulfillment location\",\"BF fulfillment location\",\"Merchant retail location\",\"Merchant CSR location\",\"Merchant long term storage location\",\"Merchant short term storage & distribution\",\"Corporate Headquarters\",\"Regional Office\",\"Field Office\",\"Partner Location\"],\"example\":\"Corporate Headquarters\",\"type\":\"string\"},\"mailAddress1\":{\"description\":\"The Location's street address.\",\"example\":\"123 Main St\",\"maxLength\":255,\"type\":\"string\"},\"mailAddress2\":{\"description\":\"The Location's street address.\",\"example\":\"Suite 100\",\"maxLength\":255,\"type\":\"string\"},\"mailCity\":{\"description\":\"The Location's city.\",\"example\":\"Atlanta\",\"maxLength\":255,\"type\":\"string\"},\"mailCountry\":{\"description\":\"The Location's street address.\",\"example\":\"United States\",\"type\":\"string\"},\"mailPostalCode\":{\"description\":\"The Location's street address.\",\"example\":\"30350\",\"maxLength\":10,\"type\":\"string\"},\"mailStateProvince\":{\"description\":\"The Location's State or Province.\",\"example\":\"Georgia\",\"maxLength\":255,\"type\":\"string\"},\"name\":{\"description\":\"The Location's name.\",\"example\":\"ASM Software Headquarters\",\"maxLength\":255,\"type\":\"string\"},\"nameOfBusiness\":{\"description\":\"The name of the business at this location.\",\"example\":\"ASM Software\",\"maxLength\":255,\"type\":\"string\"},\"notes\":{\"description\":\"Note for delivery driver.\",\"example\":\"Dial 129 on the intercom to speak with our receptionist.\",\"type\":\"string\"},\"postalCode\":{\"description\":\"The Location's postal code.\",\"example\":\"30350\",\"maxLength\":10,\"type\":\"string\"},\"stateProvince\":{\"description\":\"The Location's street state or province.\",\"example\":\"Georgia\",\"maxLength\":255,\"type\":\"string\"},\"uniqueId\":{\"description\":\"Unique Identifier for the Location.\",\"example\":\"8\",\"maxLength\":255,\"type\":\"string\"}},\"required\":[\"address1\",\"city\",\"country\",\"locationType\",\"name\"],\"type\":\"object\"},\"mid\":{\"description\":\"Some Partners will have an merchant ids on their own software offerings. This is an open field that allows those Partner associate a Client resource with their Merchant Identifier.\",\"example\":\"220654321577\",\"maxLength\":50,\"type\":\"string\"},\"name\":{\"description\":\"The Client's name.\",\"example\":\"The Tired Window\",\"maxLength\":255,\"type\":\"string\"}},\"required\":[\"contact\",\"directPartner\",\"location\",\"name\"],\"type\":\"object\"}}},\"description\":\"Client to be created.\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"A simple object containing the ID of the newly created resource.\",\"properties\":{\"id\":{\"description\":\"ID of newly created resource\",\"example\":\"10\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Client create response\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"errorCode\":{\"example\":7409,\"type\":\"integer\"},\"errors\":{\"items\":{\"properties\":{\"[attribute name]\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"attribute\":{\"description\":\"The name of the attribute that failed validation.\",\"example\":\"mailCountry\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"example\":1002,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Mail country has an incorrect length\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"type\":\"array\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Data validation constraints.\",\"type\":\"string\"},\"uuid\":{\"example\":\"995ce120-d42c-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/clients","segments":[{"lit":"clients"}],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"list":{"input":"data","name":"list","points":[{"active":true,"args":{"query":[{"active":true,"kind":"query","name":"partner","orig":"partner","reqd":true,"type":"`$STRING`","index$":0},{"active":true,"example":0,"kind":"query","name":"skip","orig":"skip","reqd":false,"type":"`$INTEGER`","index$":1},{"active":true,"example":10,"kind":"query","name":"take","orig":"take","reqd":false,"type":"`$INTEGER`","index$":2}]},"contract":{"id":"GET /clients","json":"{\"operationId\":\"list-clients\",\"parameters\":[{\"description\":\"Filter the list by Partner. The parameter value can be either a Partner ID or Name.\",\"in\":\"query\",\"name\":\"partner\",\"required\":true,\"schema\":{\"type\":\"string\"}},{\"description\":\"The number of entries to include in the list.\",\"in\":\"query\",\"name\":\"take\",\"schema\":{\"default\":10,\"format\":\"int32\",\"type\":\"integer\"}},{\"description\":\"The number of results to skip before listing entries.\",\"in\":\"query\",\"name\":\"skip\",\"schema\":{\"default\":0,\"format\":\"int32\",\"type\":\"integer\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"data\":{\"description\":\"List of Clients.\",\"items\":{\"properties\":{\"contact\":{\"description\":\"Reference to the associated User resource. When used for POST and PATCH API calls, the reference must contain the User's id.\",\"properties\":{\"id\":{\"description\":\"The referenced User's ID.\",\"example\":\"56\",\"type\":\"string\"}},\"required\":[\"id\"],\"type\":\"object\"},\"directPartner\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"example\":\"6580\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"example\":\"ASM Software\",\"type\":\"string\"}},\"type\":\"object\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"example\":\"73\",\"type\":\"string\"},\"isActive\":{\"description\":\"This property indicates if the Client account is active or disabled. It is not possible to delete Clients, however their account can be set to inactive.\",\"example\":true,\"type\":\"boolean\"},\"location\":{\"description\":\"Reference to the associated Location resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Location's ID.\",\"example\":\"33668\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Location's name.\",\"example\":\"The Tired Window Atlanta Downtown\",\"type\":\"string\"}},\"required\":[\"id\"],\"type\":\"object\"},\"mid\":{\"description\":\"Some Partners will have an merchant ids on their own software offerings. This is an open field that allows those Partner associate a Client resource with their Merchant Identifier.\",\"example\":\"220654321577\",\"type\":\"string\"},\"name\":{\"description\":\"The Client's name.\",\"example\":\"The Tired Window\",\"type\":\"string\"},\"partner\":{\"description\":\"Reference to the Client's root Partner. The Client's direct Partner is a Sub-Partner of this root Partner. The root and direct Partner's can be the same resource.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"example\":\"73\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"example\":\"ASM Software Corporate\",\"type\":\"string\"}},\"type\":\"object\"},\"version\":{\"description\":\"The number of times that this resource has been updated.\",\"example\":3,\"type\":\"integer\"}},\"type\":\"object\"},\"type\":\"array\"},\"total\":{\"description\":\"Total number of Clients available (not the number of Clients in the response).\",\"example\":1,\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Clients list\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"errorCode\":{\"example\":7409,\"type\":\"integer\"},\"errors\":{\"items\":{\"properties\":{\"[attribute name]\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"attribute\":{\"description\":\"The name of the attribute that failed validation.\",\"example\":\"mailCountry\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"example\":1002,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Mail country has an incorrect length\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"type\":\"array\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Data validation constraints.\",\"type\":\"string\"},\"uuid\":{\"example\":\"995ce120-d42c-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/clients","segments":[{"lit":"clients"}],"select":{"exist":["partner","skip","take"]},"transform":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"active":true,"args":{"params":[{"active":true,"kind":"param","name":"id","orig":"id","reqd":true,"type":"`$STRING`","index$":0}]},"contract":{"id":"GET /clients/{id}","json":"{\"operationId\":\"get-client\",\"parameters\":[{\"description\":\"The Client's unique identifier.\",\"in\":\"path\",\"name\":\"id\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"contact\":{\"description\":\"Reference to the associated User resource.\",\"properties\":{\"email\":{\"description\":\"The referenced User's email address.\",\"example\":\"kgilluley0@zdnet.com\",\"type\":\"string\"},\"firstName\":{\"description\":\"The referenced User's first name.\",\"example\":\"Kaleena\",\"type\":\"string\"},\"id\":{\"description\":\"The referenced User's ID.\",\"example\":\"56\",\"type\":\"string\"},\"lastName\":{\"description\":\"The referenced User's last name.\",\"example\":\"Gilluley\",\"type\":\"string\"}},\"type\":\"object\"},\"created\":{\"description\":\"Creation timestamp in ISO 8601 format.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"directPartner\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"example\":\"6580\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"example\":\"ASM Software\",\"type\":\"string\"}},\"type\":\"object\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"example\":\"73\",\"type\":\"string\"},\"isActive\":{\"description\":\"This property indicates if the Client account is active or disabled. It is not possible to delete Clients, however their account can be set to inactive.\",\"example\":true,\"type\":\"boolean\"},\"location\":{\"description\":\"Reference to the associated Location resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Location's ID.\",\"example\":\"33668\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Location's name.\",\"example\":\"The Tired Window Atlanta Downtown\",\"type\":\"string\"}},\"required\":[\"id\"],\"type\":\"object\"},\"mid\":{\"description\":\"Some Partners will have an merchant ids on their own software offerings. This is an open field that allows those Partner associate a Client resource with their Merchant Identifier.\",\"example\":\"220654321577\",\"type\":\"string\"},\"modified\":{\"description\":\"Last modified timestamp.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"name\":{\"description\":\"The Client's name.\",\"example\":\"The Tired Window\",\"type\":\"string\"},\"partner\":{\"description\":\"Reference to the Client's root Partner. The Client's direct Partner is a Sub-Partner of this root Partner. The root and direct Partner's can be the same resource.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"example\":\"73\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"example\":\"ASM Software Corporate\",\"type\":\"string\"}},\"type\":\"object\"},\"version\":{\"description\":\"The number of times that this resource has been updated.\",\"example\":3,\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Client details\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"404\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a resource cannot be found.\",\"properties\":{\"errorCode\":{\"example\":7404,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Requested resource cannot be found.\",\"type\":\"string\"},\"uuid\":{\"example\":\"a7518f50-d428-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Not found\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/clients/{id}","segments":[{"lit":"clients"},{"var":"id"}],"select":{"exist":["id"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"},"remove":{"input":"data","name":"remove","points":[{"active":true,"args":{"params":[{"active":true,"kind":"param","name":"id","orig":"id","reqd":true,"type":"`$STRING`","index$":0}]},"contract":{"id":"DELETE /clients/{id}","json":"{\"operationId\":\"delete-client\",\"parameters\":[{\"description\":\"The Client's unique identifier.\",\"in\":\"path\",\"name\":\"id\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{},\"description\":\"Client has been deleted successfully\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"404\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a resource cannot be found.\",\"properties\":{\"errorCode\":{\"example\":7404,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Requested resource cannot be found.\",\"type\":\"string\"},\"uuid\":{\"example\":\"a7518f50-d428-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Not found\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"errorCode\":{\"example\":7409,\"type\":\"integer\"},\"errors\":{\"items\":{\"properties\":{\"[attribute name]\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"attribute\":{\"description\":\"The name of the attribute that failed validation.\",\"example\":\"mailCountry\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"example\":1002,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Mail country has an incorrect length\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"type\":\"array\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Data validation constraints.\",\"type\":\"string\"},\"uuid\":{\"example\":\"995ce120-d42c-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"DELETE","orig":"/clients/{id}","segments":[{"lit":"clients"},{"var":"id"}],"select":{"exist":["id"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"remove"}},"relations":{"ancestors":[]},"key$":"client","name__orig":"client","Name":"Client","name_":"client","name-":"client","NAME":"CLIENT","index$":1}, {"active":true,"entity":"client","key$":"BasicClientFlow","kind":"basic","name":"BasicClientFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"client_ref01"},"match":{},"op":"create","spec":[],"valid":[],"index$":0},{"active":true,"data":{},"input":{},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemExists","def":{"ref":"client_ref01"}}],"index$":1},{"active":true,"data":{},"input":{"ref":"client_ref01","srcdatavar":"client_ref01_data","suffix":"_dt0"},"match":{"id":"client01"},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-client_ref01"}}],"index$":2},{"active":true,"data":{},"input":{"ref":"client_ref01","suffix":"_rm0"},"match":{"id":"client01"},"op":"remove","spec":[],"valid":[],"index$":3},{"active":true,"data":{},"input":{"suffix":"_rt0"},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemNotExists","def":{"ref":"client_ref01"}}],"index$":4}]}, 'Client')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const client_ref01_ent = client.Client()
    let client_ref01_data = setup.data.new.client['client_ref01']

    client_ref01_data = (await client_ref01_ent.create(client_ref01_data)).data()
    assert(null != client_ref01_data.id)


    // LIST
    const client_ref01_match: any = {}

    const client_ref01_list = (await client_ref01_ent.list(client_ref01_match)).map((e: any) => e.data())

    assert(!isempty(select(client_ref01_list, { id: client_ref01_data.id })))


    // LOAD
    const client_ref01_match_dt0: any = {}
    client_ref01_match_dt0.id = client_ref01_data.id
    const client_ref01_data_dt0 = (await client_ref01_ent.load(client_ref01_match_dt0)).data()
    assert(client_ref01_data_dt0.id === client_ref01_data.id)


    // REMOVE
    const client_ref01_match_rm0: any = { id: client_ref01_data.id }
    await client_ref01_ent.remove(client_ref01_match_rm0)
  

    // LIST
    const client_ref01_match_rt0: any = {}

    const client_ref01_list_rt0 = (await client_ref01_ent.list(client_ref01_match_rt0)).map((e: any) => e.data())

    assert(isempty(select(client_ref01_list_rt0, { id: client_ref01_data.id })))


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/client/ClientTestData.json')

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
    ['client01','client02','client03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
    'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID']
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
  

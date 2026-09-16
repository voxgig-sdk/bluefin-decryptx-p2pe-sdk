
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


describe('PartnerEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Partner()
    assert(null != ent)
  })


  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"billingId","req":false,"short":"The Partner's billing identifier.","type":"`$STRING`","index$":0},{"active":true,"name":"clientCanOrderEquipment","req":false,"short":"This property indicates if the Partner is allowed to order Equipment.","type":"`$BOOLEAN`","index$":1},{"active":true,"name":"contact","op":{"list":{"req":true,"type":"`$OBJECT`"}},"req":false,"short":"Reference to the associated User resource.","type":"`$OBJECT`","index$":2},{"active":true,"format":"datetime","name":"created","req":false,"short":"Creation timestamp in ISO 8601 format.","type":"`$STRING`","index$":3},{"active":true,"name":"id","req":false,"short":"This resource's unique identifier.","type":"`$STRING`","index$":4},{"active":true,"name":"isActive","req":false,"short":"This property indicates if the Parter account is active or disabled.","type":"`$BOOLEAN`","index$":5},{"active":true,"name":"location","req":true,"short":"Reference to the associated Location resource.","type":"`$OBJECT`","index$":6},{"active":true,"format":"datetime","name":"modified","req":false,"short":"Last modified timestamp.","type":"`$STRING`","index$":7},{"active":true,"name":"name","req":false,"short":"The Partner's name.","type":"`$STRING`","index$":8},{"active":true,"name":"parent","req":false,"short":"Reference to the associated Partner.","type":"`$OBJECT`","index$":9},{"active":true,"name":"partnerId","req":false,"short":"The Partner's id.","type":"`$STRING`","index$":10},{"active":true,"name":"reference","req":false,"short":"The Partner's reference string.","type":"`$STRING`","index$":11},{"active":true,"name":"verificationPhrase","req":false,"short":"The verification phrase is a message that the Partner creates.","type":"`$STRING`","index$":12},{"active":true,"name":"version","req":false,"short":"The number of times that this resource has been updated.","type":"`$INTEGER`","index$":13}],"id":{"field":"id","name":"id"},"name":"partner","op":{"create":{"input":"data","name":"create","points":[{"active":true,"args":{},"contract":{"id":"POST /partners","json":"{\"operationId\":\"create-partner\",\"parameters\":[],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"billingId\":{\"description\":\"The Partner's billing identifier.\",\"example\":\"001J000001ngZle\",\"type\":\"string\"},\"clientCanOrderEquipment\":{\"description\":\"This property indicates if the Partner is allowed to order Equipment.\",\"example\":false,\"type\":\"boolean\"},\"contact\":{\"description\":\"A User object.\",\"properties\":{\"email\":{\"description\":\"The User's email address.\",\"example\":\"kgilluley0@zdnet.com\",\"maxLength\":255,\"type\":\"string\"},\"firstName\":{\"description\":\"The User's name.\",\"example\":\"Kaleena\",\"maxLength\":255,\"type\":\"string\"},\"isActive\":{\"description\":\"This property indicates if the User account is active or disabled. Once a user has logged into the system, their account cannot be deleted. As an alternative, their account can be set to inactive.\",\"example\":true,\"type\":\"boolean\"},\"lastName\":{\"description\":\"The User's Surname.\",\"example\":\"Gilluley\",\"maxLength\":255,\"type\":\"string\"},\"phone\":{\"description\":\"The User's phone number without dashes, spaces, or brackets.\",\"example\":\"2025550162\",\"maxLength\":255,\"type\":\"string\"},\"sendWelcomeEmail\":{\"description\":\"If this property is set to *'true'*, the newly created user will be sent a welcome email.\",\"example\":true,\"type\":\"boolean\"},\"userName\":{\"description\":\"The User's unique username.\",\"example\":\"kgilluley0\",\"maxLength\":255,\"type\":\"string\"},\"userRole\":{\"enum\":[\"Partner User\",\"Client Admin\",\"Client User\",\"Client Custodian\",\"Client Procurement\"],\"type\":\"string\"}},\"required\":[\"email\",\"firstName\",\"isActive\",\"lastName\",\"phone\",\"userName\",\"userRole\"],\"type\":\"object\"},\"isActive\":{\"description\":\"This property indicates if the Parter account is active or disabled.\",\"example\":true,\"type\":\"boolean\"},\"location\":{\"description\":\"A Location object.\",\"properties\":{\"address1\":{\"description\":\"The Location's street address.\",\"example\":\"123 Main St\",\"maxLength\":255,\"type\":\"string\"},\"address2\":{\"description\":\"The Location's street address.\",\"example\":\"Suite 100\",\"maxLength\":255,\"type\":\"string\"},\"billingId\":{\"description\":\"\\\\?\",\"maxLength\":50,\"type\":\"string\"},\"city\":{\"description\":\"The Location's city.\",\"example\":\"Atlanta\",\"maxLength\":255,\"type\":\"string\"},\"country\":{\"description\":\"Reference to the associated Country. When used for POST and PATCH API calls, the reference can contain either the ISO-ALPHA2 country Code or Name.\",\"properties\":{\"code\":{\"description\":\"The referenced Country's code (two uppercase symbols).\",\"example\":\"US\",\"maxLength\":2,\"type\":\"string\"},\"name\":{\"description\":\"The referenced Country's name.\",\"example\":\"United States\",\"type\":\"string\"}},\"type\":\"object\"},\"customReference\":{\"description\":\"A Partner specified reference for a location.\",\"example\":\"ASDF234\",\"maxLength\":255,\"type\":\"string\"},\"locationType\":{\"description\":\"The Location's clasification.\",\"enum\":[\"Manufacturer\",\"Manufacturer long term storage\",\"KIF\",\"Vendor fulfillment location\",\"BF fulfillment location\",\"Merchant retail location\",\"Merchant CSR location\",\"Merchant long term storage location\",\"Merchant short term storage & distribution\",\"Corporate Headquarters\",\"Regional Office\",\"Field Office\",\"Partner Location\"],\"example\":\"Corporate Headquarters\",\"type\":\"string\"},\"mailAddress1\":{\"description\":\"The Location's street address.\",\"example\":\"123 Main St\",\"maxLength\":255,\"type\":\"string\"},\"mailAddress2\":{\"description\":\"The Location's street address.\",\"example\":\"Suite 100\",\"maxLength\":255,\"type\":\"string\"},\"mailCity\":{\"description\":\"The Location's city.\",\"example\":\"Atlanta\",\"maxLength\":255,\"type\":\"string\"},\"mailCountry\":{\"description\":\"The Location's street address.\",\"example\":\"United States\",\"type\":\"string\"},\"mailPostalCode\":{\"description\":\"The Location's street address.\",\"example\":\"30350\",\"maxLength\":10,\"type\":\"string\"},\"mailStateProvince\":{\"description\":\"The Location's State or Province.\",\"example\":\"Georgia\",\"maxLength\":255,\"type\":\"string\"},\"name\":{\"description\":\"The Location's name.\",\"example\":\"ASM Software Headquarters\",\"maxLength\":255,\"type\":\"string\"},\"nameOfBusiness\":{\"description\":\"The name of the business at this location.\",\"example\":\"ASM Software\",\"maxLength\":255,\"type\":\"string\"},\"notes\":{\"description\":\"Note for delivery driver.\",\"example\":\"Dial 129 on the intercom to speak with our receptionist.\",\"type\":\"string\"},\"postalCode\":{\"description\":\"The Location's postal code.\",\"example\":\"30350\",\"maxLength\":10,\"type\":\"string\"},\"stateProvince\":{\"description\":\"The Location's street state or province.\",\"example\":\"Georgia\",\"maxLength\":255,\"type\":\"string\"},\"uniqueId\":{\"description\":\"Unique Identifier for the Location.\",\"example\":\"8\",\"maxLength\":255,\"type\":\"string\"}},\"required\":[\"address1\",\"city\",\"country\",\"locationType\",\"name\"],\"type\":\"object\"},\"name\":{\"description\":\"The Partner's name.\",\"example\":\"ASM Software\",\"maxLength\":255,\"type\":\"string\"},\"parent\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"example\":\"6580\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"example\":\"ASM Software\",\"type\":\"string\"}},\"type\":\"object\"},\"partnerId\":{\"description\":\"The Partner's id.\",\"example\":\"10\",\"type\":\"string\"},\"reference\":{\"description\":\"The Partner's reference string. This reference is used in to identify the Partner on the Decryption APIs. It equates to the Partner ID.\",\"example\":\"asmsoftware\",\"maxLength\":255,\"type\":\"string\"},\"verificationPhrase\":{\"description\":\"The verification phrase is a message that the Partner creates. It can be used as a mechanism to authorize a partner when they initiate communication over the phone.\",\"example\":\"The quick brown fox jumps over the lazy dog\",\"type\":\"string\"}},\"required\":[\"contact\",\"location\",\"name\",\"parent\",\"reference\"],\"type\":\"object\"}}},\"description\":\"Partner to be created.\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"A simple object containing the ID of the newly created resource.\",\"properties\":{\"id\":{\"description\":\"ID of newly created resource\",\"example\":\"10\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Partner create response\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"errorCode\":{\"example\":7409,\"type\":\"integer\"},\"errors\":{\"items\":{\"properties\":{\"[attribute name]\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"attribute\":{\"description\":\"The name of the attribute that failed validation.\",\"example\":\"mailCountry\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"example\":1002,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Mail country has an incorrect length\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"type\":\"array\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Data validation constraints.\",\"type\":\"string\"},\"uuid\":{\"example\":\"995ce120-d42c-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/partners","segments":[{"lit":"partners"}],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"list":{"input":"data","name":"list","points":[{"active":true,"args":{"query":[{"active":true,"kind":"query","name":"partner","orig":"partner","reqd":false,"type":"`$STRING`","index$":0},{"active":true,"example":0,"kind":"query","name":"skip","orig":"skip","reqd":false,"type":"`$INTEGER`","index$":1},{"active":true,"example":10,"kind":"query","name":"take","orig":"take","reqd":false,"type":"`$INTEGER`","index$":2}]},"contract":{"id":"GET /partners","json":"{\"operationId\":\"list-partners\",\"parameters\":[{\"description\":\"Filter the list by Partner. The parameter value can be either a Partner ID or Name.\",\"in\":\"query\",\"name\":\"partner\",\"schema\":{\"type\":\"string\"}},{\"description\":\"The number of entries to include in the list.\",\"in\":\"query\",\"name\":\"take\",\"schema\":{\"default\":10,\"format\":\"int32\",\"type\":\"integer\"}},{\"description\":\"The number of results to skip before listing entries.\",\"in\":\"query\",\"name\":\"skip\",\"schema\":{\"default\":0,\"format\":\"int32\",\"type\":\"integer\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"data\":{\"description\":\"List of Partners.\",\"items\":{\"properties\":{\"billingId\":{\"description\":\"The Partner's billing identifier.\",\"example\":\"001J000001ngZle\",\"type\":\"string\"},\"clientCanOrderEquipment\":{\"description\":\"This property indicates if the Partner is allowed to order Equipment.\",\"example\":false,\"type\":\"boolean\"},\"contact\":{\"description\":\"Reference to the associated User resource. When used for POST and PATCH API calls, the reference must contain the User's id.\",\"properties\":{\"id\":{\"description\":\"The referenced User's ID.\",\"example\":\"56\",\"type\":\"string\"}},\"required\":[\"id\"],\"type\":\"object\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"example\":\"73\",\"type\":\"string\"},\"isActive\":{\"description\":\"This property indicates if the Parter account is active or disabled. It is not possible to delete a Partner account, however their account can be set to inactive.\",\"example\":true,\"type\":\"boolean\"},\"location\":{\"description\":\"Reference to the associated Location resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Location's ID.\",\"example\":\"33668\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Location's name.\",\"example\":\"The Tired Window Atlanta Downtown\",\"type\":\"string\"}},\"required\":[\"id\"],\"type\":\"object\"},\"name\":{\"description\":\"The Partner's name.\",\"example\":\"ASM Software\",\"type\":\"string\"},\"parent\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"example\":\"6580\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"example\":\"ASM Software\",\"type\":\"string\"}},\"type\":\"object\"},\"partnerId\":{\"description\":\"The Partner's id.\",\"example\":\"10\",\"type\":\"string\"},\"reference\":{\"description\":\"The Partner's reference string. This reference is used in to identify the Partner on the Decryption APIs. It equates to the Partner ID.\",\"example\":\"asmsoftware\",\"type\":\"string\"},\"verificationPhrase\":{\"description\":\"The verification phrase is a message that the Partner creates. It can be used as a mechanism to authorize a partner when they initiate communication over the phone.\",\"example\":\"The quick brown fox jumps over the lazy dog\",\"type\":\"string\"},\"version\":{\"description\":\"The number of times that this resource has been updated.\",\"example\":3,\"type\":\"integer\"}},\"type\":\"object\"},\"type\":\"array\"},\"total\":{\"description\":\"Total number of Partners available (not the number of Partners in the response).\",\"example\":1,\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Partners list\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"errorCode\":{\"example\":7409,\"type\":\"integer\"},\"errors\":{\"items\":{\"properties\":{\"[attribute name]\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"attribute\":{\"description\":\"The name of the attribute that failed validation.\",\"example\":\"mailCountry\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"example\":1002,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Mail country has an incorrect length\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"type\":\"array\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Data validation constraints.\",\"type\":\"string\"},\"uuid\":{\"example\":\"995ce120-d42c-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/partners","segments":[{"lit":"partners"}],"select":{"exist":["partner","skip","take"]},"transform":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"active":true,"args":{"params":[{"active":true,"kind":"param","name":"id","orig":"id","reqd":true,"type":"`$STRING`","index$":0}]},"contract":{"id":"GET /partners/{id}","json":"{\"operationId\":\"get-partner\",\"parameters\":[{\"description\":\"The Partner's unique identifier.\",\"in\":\"path\",\"name\":\"id\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"billingId\":{\"description\":\"The Partner's billing identifier.\",\"example\":\"001J000001ngZle\",\"type\":\"string\"},\"clientCanOrderEquipment\":{\"description\":\"This property indicates if the Partner is allowed to order Equipment.\",\"example\":false,\"type\":\"boolean\"},\"contact\":{\"description\":\"Reference to the associated User resource.\",\"properties\":{\"email\":{\"description\":\"The referenced User's email address.\",\"example\":\"kgilluley0@zdnet.com\",\"type\":\"string\"},\"firstName\":{\"description\":\"The referenced User's first name.\",\"example\":\"Kaleena\",\"type\":\"string\"},\"id\":{\"description\":\"The referenced User's ID.\",\"example\":\"56\",\"type\":\"string\"},\"lastName\":{\"description\":\"The referenced User's last name.\",\"example\":\"Gilluley\",\"type\":\"string\"}},\"type\":\"object\"},\"created\":{\"description\":\"Creation timestamp in ISO 8601 format.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"example\":\"73\",\"type\":\"string\"},\"isActive\":{\"description\":\"This property indicates if the Parter account is active or disabled. It is not possible to delete a Partner account, however their account can be set to inactive.\",\"example\":true,\"type\":\"boolean\"},\"location\":{\"description\":\"Reference to the associated Location resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Location's ID.\",\"example\":\"33668\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Location's name.\",\"example\":\"The Tired Window Atlanta Downtown\",\"type\":\"string\"}},\"required\":[\"id\"],\"type\":\"object\"},\"modified\":{\"description\":\"Last modified timestamp.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"name\":{\"description\":\"The Partner's name.\",\"example\":\"ASM Software\",\"type\":\"string\"},\"parent\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"example\":\"6580\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"example\":\"ASM Software\",\"type\":\"string\"}},\"type\":\"object\"},\"partnerId\":{\"description\":\"The Partner's id.\",\"example\":\"10\",\"type\":\"string\"},\"reference\":{\"description\":\"The Partner's reference string. This reference is used in to identify the Partner on the Decryption APIs. It equates to the Partner ID.\",\"example\":\"asmsoftware\",\"type\":\"string\"},\"verificationPhrase\":{\"description\":\"The verification phrase is a message that the Partner creates. It can be used as a mechanism to authorize a partner when they initiate communication over the phone.\",\"example\":\"The quick brown fox jumps over the lazy dog\",\"type\":\"string\"},\"version\":{\"description\":\"The number of times that this resource has been updated.\",\"example\":3,\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Partner details\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"404\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a resource cannot be found.\",\"properties\":{\"errorCode\":{\"example\":7404,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Requested resource cannot be found.\",\"type\":\"string\"},\"uuid\":{\"example\":\"a7518f50-d428-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Not found\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/partners/{id}","segments":[{"lit":"partners"},{"var":"id"}],"select":{"exist":["id"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"partner","name__orig":"partner","Name":"Partner","name_":"partner","name-":"partner","NAME":"PARTNER","index$":16}, {"active":true,"entity":"partner","key$":"BasicPartnerFlow","kind":"basic","name":"BasicPartnerFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"partner_ref01"},"match":{},"op":"create","spec":[],"valid":[],"index$":0},{"active":true,"data":{},"input":{},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemExists","def":{"ref":"partner_ref01"}}],"index$":1},{"active":true,"data":{},"input":{"ref":"partner_ref01","srcdatavar":"partner_ref01_data","suffix":"_dt0"},"match":{"id":"partner01"},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-partner_ref01"}}],"index$":2}]}, 'Partner')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const partner_ref01_ent = client.Partner()
    let partner_ref01_data = setup.data.new.partner['partner_ref01']

    partner_ref01_data = (await partner_ref01_ent.create(partner_ref01_data)).data()
    assert(null != partner_ref01_data.id)


    // LIST
    const partner_ref01_match = {}

    const partner_ref01_list = (await partner_ref01_ent.list(partner_ref01_match)).map((e) => e.data())

    assert(!isempty(select(partner_ref01_list, { id: partner_ref01_data.id })))


    // LOAD
    const partner_ref01_match_dt0 = {}
    partner_ref01_match_dt0.id = partner_ref01_data.id
    const partner_ref01_data_dt0 = (await partner_ref01_ent.load(partner_ref01_match_dt0)).data()
    assert(partner_ref01_data_dt0.id === partner_ref01_data.id)


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname,
      '../../../../.sdk/test/entity/partner/PartnerTestData.json')

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
    ['partner01','partner02','partner03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_PARTNER_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_PARTNER_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_PARTNER_ENTID']
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
  

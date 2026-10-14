

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { BluefinDecryptxP2peSDK, BaseFeature, config, stdutil } from '../../..'

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


loadEnvLocal(__dirname + '/../../../.env.local')


describe('TransactionEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Transaction()
    assert(null != ent)
  })


  class FailHook extends BaseFeature {
    name = 'failhook'
    version = '0.0.1'
    active = true
    unexpected = 0
    init() { }
    PreSpec() { throw new Error('transaction hook failed') }
    PreUnexpected() { this.unexpected++ }
  }

  test('stream-error', async () => {
    const offline = { net: { offline: true } }
    await assert.rejects(async () => {
      for await (const _item of BluefinDecryptxP2peSDK.test(offline).Transaction().stream('list')) { }
    }, /offline/)

    for await (const _item of BluefinDecryptxP2peSDK.test(offline).Transaction()
      .stream('list', undefined, { ctrl: { throw: false } })) { }

    if (null != (config as any).feature?.rbac) {
      const denied = BluefinDecryptxP2peSDK.test(undefined, { feature: { rbac: { active: true, deny: true } } })
      await assert.rejects(async () => {
        for await (const _item of denied.Transaction().stream('list')) { }
      }, (err: any) => 'rbac_denied' === err.code)
    }
  })

  test('stream-ctrl', async () => {
    const explain: any = {}
    const ctrl: any = { explain }
    for await (const _item of BluefinDecryptxP2peSDK.test().Transaction().stream('list', undefined, { ctrl })) { }
    assert.deepStrictEqual(Object.keys(ctrl), ['explain'])
    assert(explain === ctrl.explain && 0 < Object.keys(explain).length)
  })

  test('unexpected', async () => {
    const hook = new FailHook()
    const client = new BluefinDecryptxP2peSDK({ feature: { test: { active: true } }, extend: [hook] })
    await assert.rejects(client.Transaction().list(), /hook failed/)
    assert(0 < hook.unexpected)

    const fired = hook.unexpected
    assert.strictEqual(await client.Transaction().list(undefined, { throw: false }), undefined)
    assert(fired < hook.unexpected)
  })

  test('validate', async (t) => {
    if (null == (config as any).feature?.validate) {
      t.skip('feature not present in this SDK: validate')
      return
    }
    const client = BluefinDecryptxP2peSDK.test(undefined, { feature: { validate: { active: true } } })
    await assert.rejects(client.Transaction().list({"client":1} as any),
      (err: any) => 'validate_failed' === err.code)
  })



  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
    for (const op of ['create', 'list', 'load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'transaction.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"alternateKey":{"a":true,"h":"Alternate Key","n":"alternateKey","r":false,"sh":"The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.","t":"`$STRING`","key$":"alternateKey","index$":0},"client":{"a":true,"h":"Client","n":"client","op":{"create":{"req":true,"type":"`$OBJECT`"}},"r":false,"sh":"Reference to the associated Client resource.","t":"`$OBJECT`","key$":"client","index$":1},"clientRef":{"a":true,"h":"Client Ref","n":"clientRef","r":false,"sh":"Client Reference property that is included in the decrypt API call.","t":"`$STRING`","key$":"clientRef","index$":2},"created":{"a":true,"fo":"datetime","h":"Created","n":"created","r":false,"sh":"Creation timestamp in ISO 8601 format.","t":"`$STRING`","key$":"created","index$":3},"decrypted":{"a":true,"fo":"int32","h":"Decrypted","n":"decrypted","r":false,"sh":"A Transcation can process muliple decryptions.","t":"`$INTEGER`","key$":"decrypted","index$":4},"device":{"a":true,"h":"Device","n":"device","r":true,"sh":"Reference to the associated Device resource.","t":"`$OBJECT`","key$":"device","index$":5},"deviceName":{"a":true,"h":"Device Name","n":"deviceName","r":false,"sh":"The name of the Device that generated the payload to decrypt.","t":"`$STRING`","key$":"deviceName","index$":6},"directPartner":{"a":true,"h":"Direct Partner","n":"directPartner","r":false,"sh":"Reference to the associated Partner.","t":"`$OBJECT`","key$":"directPartner","index$":7},"encrypted":{"a":true,"fo":"int32","h":"Encrypted","n":"encrypted","r":false,"sh":"A Transcation can process muliple encryptions.","t":"`$INTEGER`","key$":"encrypted","index$":8},"endDate":{"a":true,"fo":"datetime","h":"End Date","n":"endDate","r":false,"sh":"Timestamp from the end of the transaction.","t":"`$STRING`","key$":"endDate","index$":9},"errCode":{"a":true,"h":"Err Code","n":"errCode","r":false,"sh":"The error code that is sent in response to a failed decrypt API call.","t":"`$STRING`","key$":"errCode","index$":10},"errMessage":{"a":true,"h":"Err Message","n":"errMessage","r":false,"sh":"The error messge that is sent in response to a failed decrypt API call.","t":"`$STRING`","key$":"errMessage","index$":11},"id":{"a":true,"h":"Id","n":"id","r":false,"sh":"This resource's unique identifier.","t":"`$STRING`","key$":"id","index$":12},"ipAddress":{"a":true,"h":"Ip Address","n":"ipAddress","op":{"create":{"req":true,"type":"`$STRING`"}},"r":false,"sh":"The IP address of the http client that makes the decrypt API call.","t":"`$STRING`","key$":"ipAddress","index$":13},"isVirtual":{"a":true,"h":"Is Virtual","n":"isVirtual","r":false,"sh":"Indicates if the Transaction came from a virtual Device.","t":"`$BOOLEAN`","key$":"isVirtual","index$":14},"keyType":{"a":true,"h":"Key Type","n":"keyType","op":{"create":{"req":true,"type":"`$STRING`"}},"r":false,"sh":"The type of cipher used during decrytion.","t":"`$STRING`","key$":"keyType","index$":15},"location":{"a":true,"h":"Location","n":"location","r":true,"sh":"Reference to the associated Location resource.","t":"`$OBJECT`","key$":"location","index$":16},"messageId":{"a":true,"h":"Message Id","n":"messageId","r":false,"sh":"Message ID.","t":"`$STRING`","key$":"messageId","index$":17},"method":{"a":true,"h":"Method","n":"method","op":{"create":{"req":true,"type":"`$STRING`"}},"r":false,"sh":"The decryption cypher/method.","t":"`$STRING`","key$":"method","index$":18},"partner":{"a":true,"h":"Partner","n":"partner","op":{"create":{"req":true,"type":"`$OBJECT`"}},"r":false,"sh":"Reference to the associated Partner.","t":"`$OBJECT`","key$":"partner","index$":19},"reference":{"a":true,"h":"Reference","n":"reference","r":false,"sh":"The reference property that the Client includes in the decrypt API call.","t":"`$STRING`","key$":"reference","index$":20},"serialNumber":{"a":true,"h":"Serial Number","n":"serialNumber","r":false,"sh":"The serial number of the Device that generated the payload to decrypt.","t":"`$STRING`","key$":"serialNumber","index$":21},"startDate":{"a":true,"fo":"datetime","h":"Start Date","n":"startDate","r":false,"sh":"Timestamp from the beginning of the transaction.","t":"`$STRING`","key$":"startDate","index$":22},"success":{"a":true,"h":"Success","n":"success","r":false,"sh":"The success indicator.","t":"`$BOOLEAN`","key$":"success","index$":23},"transactionSource":{"a":true,"h":"Transaction Source","n":"transactionSource","r":false,"sh":"The source of the Transaction.","t":"`$STRING`","key$":"transactionSource","index$":24}},"id":{"field":"id","name":"id"},"name":"transaction","op":{"create":{"input":"data","name":"create","points":[{"a":true,"bf":["client","clientRef","decrypted","device","encrypted","endDate","errCode","errMessage","ipAddress","keyType","messageId","method","partner","reference","startDate","success"],"co":{"id":"POST /transactions","source":"openapi3","version":2},"g":{},"k":"http","m":"POST","o":"/transactions","q":{},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"transactions"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"list":{"input":"data","name":"list","points":[{"a":true,"co":{"id":"GET /transactions","source":"openapi3","version":2},"g":{"query":[{"a":true,"k":"query","n":"client","or":"client","r":false,"t":"`$STRING`","index$":0},{"a":true,"k":"query","n":"client_ref","or":"clientRef","r":false,"t":"`$STRING`","index$":1},{"a":true,"k":"query","n":"date_from","or":"dateFrom","r":false,"t":"`$STRING`","index$":2},{"a":true,"k":"query","n":"date_to","or":"dateTo","r":false,"t":"`$STRING`","index$":3},{"a":true,"k":"query","n":"location","or":"location","r":false,"t":"`$STRING`","index$":4},{"a":true,"k":"query","n":"message_id","or":"messageId","r":false,"t":"`$STRING`","index$":5},{"a":true,"ex":"nocount","k":"query","n":"paging_mode","or":"paging.mode","r":false,"t":"`$STRING`","index$":6},{"a":true,"k":"query","n":"partner","or":"partner","r":false,"t":"`$STRING`","index$":7},{"a":true,"k":"query","n":"reference","or":"reference","r":false,"t":"`$STRING`","index$":8},{"a":true,"k":"query","n":"serial_number","or":"serialNumber","r":false,"t":"`$STRING`","index$":9},{"a":true,"ex":0,"k":"query","n":"skip","or":"skip","r":false,"t":"`$INTEGER`","index$":10},{"a":true,"k":"query","n":"success","or":"success","r":false,"t":"`$BOOLEAN`","index$":11},{"a":true,"ex":10,"k":"query","n":"take","or":"take","r":false,"t":"`$INTEGER`","index$":12}]},"k":"http","m":"GET","o":"/transactions","q":{},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"transactions"}],"t":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /transactions/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/transactions/{id}","q":{"exist":["id"]},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"transactions"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"transaction","name__orig":"transaction","Name":"Transaction","name_":"transaction","name-":"transaction","NAME":"TRANSACTION","index$":18}, {"active":true,"entity":"transaction","key$":"BasicTransactionFlow","kind":"basic","name":"BasicTransactionFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"transaction_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0},{"a":true,"d":{},"i":{},"m":{},"o":"list","s":[],"v":[{"apply":"ItemExists","def":{"ref":"transaction_ref01"}}],"index$":1},{"a":true,"d":{},"i":{"ref":"transaction_ref01","srcdatavar":"transaction_ref01_data","suffix":"_dt0"},"m":{"id":"transaction01"},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-transaction_ref01"}}],"index$":2}]}, 'Transaction', {"POST /transactions":{"protocol":"http","requestBody":{"description":"Transaction to be created.","content":{"*/*":{"schema":{"required":["client","device","ipAddress","keyType","method","partner"],"type":"object","properties":{"partner":{"type":"object","properties":{"id":{"type":"string","description":"The referenced Partner's ID.","example":"6580"},"name":{"type":"string","description":"The referenced Partner's name.","example":"ASM Software"}},"description":"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/PartnerReference","key$":"partner"},"client":{"type":"object","properties":{"id":{"type":"string","description":"The referenced Client's ID.","example":"4684"},"name":{"type":"string","description":"The referenced Client's name.","example":"The Tired Window"}},"description":"Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/ClientReference","key$":"client"},"device":{"type":"object","properties":{"id":{"type":"string","description":"The referenced Device's ID","example":"73"},"serialNumber":{"type":"string","description":"The referenced Device's serial number.","example":"85000711"}},"description":"Reference to the associated Device resource. When used for POST and PATCH API calls, the reference can contain either the ID or Serial Number. With GET API calls, both properties are included in the response.","x-ref":"#/components/schemas/DeviceReference","key$":"device"},"keyType":{"type":"string","description":"The type of cipher used during decrytion.","example":"3DES/CBC","enum":["3DES/CBC","3DES/ECB","BPS","Visa/DSP"],"key$":"keyType"},"method":{"maxLength":255,"type":"string","description":"The decryption cypher/method.","example":"/decrypt/3DES/CBC","key$":"method"},"reference":{"maxLength":255,"type":"string","description":"The reference property that the Client includes in the decrypt API call.","example":"723f57e1-e9c8-48cb-81d9-547ad2b76435","key$":"reference"},"messageId":{"maxLength":255,"type":"string","description":"Message ID.","example":"1201712060850502212320171","key$":"messageId"},"clientRef":{"maxLength":255,"type":"string","description":"Client Reference property that is included in the decrypt API call.","example":"The Tired Window","key$":"clientRef"},"success":{"type":"boolean","description":"The success indicator.","example":true,"key$":"success"},"ipAddress":{"maxLength":255,"type":"string","description":"The IP address of the http client that makes the decrypt API call.","example":"199.83.131.136","key$":"ipAddress"},"startDate":{"type":"string","description":"Timestamp from the beginning of the transaction.","format":"datetime","example":"2017-02-08T20:14:45.000Z","key$":"startDate"},"endDate":{"type":"string","description":"Timestamp from the end of the transaction.","format":"datetime","example":"2017-02-08T20:14:45.000Z","key$":"endDate"},"encrypted":{"type":"integer","description":"A Transcation can process muliple encryptions. This property contains the total encryptions count.","format":"int32","example":0,"key$":"encrypted"},"decrypted":{"type":"integer","description":"A Transcation can process muliple decryptions. This property contains the total decryption count.","format":"int32","example":2,"key$":"decrypted"},"errMessage":{"type":"string","description":"The error messge that is sent in response to a failed decrypt API call.","example":"Device not found","key$":"errMessage"},"errCode":{"maxLength":255,"type":"string","description":"The error code that is sent in response to a failed decrypt API call.","example":"1701","key$":"errCode"}},"x-ref":"#/components/schemas/TransactionCreate","index$":1}}},"required":true},"parameters":[]},"GET /transactions":{"protocol":"http","parameters":[{"name":"partner","in":"query","description":"Filter the list by Partner. The parameter value can be either a Partner ID or Name.","schema":{"type":"string"},"index$":0},{"name":"client","in":"query","description":"Filter the list by Client. The parameter value can be either a Client ID or Name.","schema":{"type":"string"},"index$":1},{"name":"location","in":"query","description":"Filter the list by Location. The parameter value can be either a Location ID or Name.","schema":{"type":"string"},"index$":2},{"name":"success","in":"query","description":"Filter the list by success indicator.","schema":{"type":"boolean","enum":[true,false]},"index$":3},{"name":"dateFrom","in":"query","description":"Filter the list by transaction date. Only show transactions that were processed after this date.","schema":{"type":"string","format":"datetime"},"index$":4},{"name":"dateTo","in":"query","description":"Filter the list by transaction date. Only show transactions that were processed before this date.","schema":{"type":"string","format":"datetime"},"index$":5},{"name":"messageId","in":"query","description":"Filter the list by Message ID.","schema":{"type":"string"},"index$":6},{"name":"clientRef","in":"query","description":"Filter the list by the ClientRef ID.","schema":{"type":"string"},"index$":7},{"name":"serialNumber","in":"query","description":"Filter the list by Device serial number.","schema":{"type":"string"},"index$":8},{"name":"reference","in":"query","description":"Filter the list by Reference ID.","schema":{"type":"string"},"index$":9},{"name":"take","in":"query","description":"The number of entries to include in the list.","schema":{"type":"integer","format":"int32","default":10},"index$":10},{"name":"skip","in":"query","description":"The number of results to skip before listing entries.","schema":{"type":"integer","format":"int32","default":0},"index$":11},{"name":"paging.mode","in":"query","description":"Toggles the total count in the response.","schema":{"type":"string","default":"nocount","enum":["nocount","full"]},"index$":12}]},"GET /transactions/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"The Transaction's unique identifier.","required":true,"schema":{"type":"string"},"index$":0}]}}, { strict: LIVE_STRICT, t })
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const transaction_ref01_ent = client.Transaction()
    let transaction_ref01_data = setup.data.new.transaction['transaction_ref01']

    transaction_ref01_data = (await transaction_ref01_ent.create(transaction_ref01_data)).data()
    assert(null != transaction_ref01_data.id)


    // LIST
    const transaction_ref01_match: any = {}

    const transaction_ref01_list = (await transaction_ref01_ent.list(transaction_ref01_match)).map((e: any) => e.data())

    assert(!isempty(select(transaction_ref01_list, { id: transaction_ref01_data.id })))


    // LOAD
    const transaction_ref01_match_dt0: any = {}
    transaction_ref01_match_dt0.id = transaction_ref01_data.id
    const transaction_ref01_data_dt0 = (await transaction_ref01_ent.load(transaction_ref01_match_dt0)).data()
    assert(transaction_ref01_data_dt0.id === transaction_ref01_data.id)


  })
})



// main.kit.test.live.strict is true (the default is true): a live
// request that fails, or a live test missing an input it needs,
// fails the test.
// An account with no record for a test to read skips it either way.
const LIVE_STRICT = true

function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/transaction/TransactionTestData.json')

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
    ['transaction01','transaction02','transaction03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_TRANSACTION_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
    'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_TRANSACTION_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_TRANSACTION_ENTID']
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
  

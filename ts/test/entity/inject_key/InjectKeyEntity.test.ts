

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


describe('InjectKeyEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.InjectKey()
    assert(null != ent)
  })


  class FailHook extends BaseFeature {
    name = 'failhook'
    version = '0.0.1'
    active = true
    unexpected = 0
    init() { }
    PreSpec() { throw new Error('inject_key hook failed') }
    PreUnexpected() { this.unexpected++ }
  }

  test('stream-error', async () => {
    const offline = { net: { offline: true } }
    await assert.rejects(async () => {
      for await (const _item of BluefinDecryptxP2peSDK.test(offline).InjectKey().stream('list')) { }
    }, /offline/)

    for await (const _item of BluefinDecryptxP2peSDK.test(offline).InjectKey()
      .stream('list', undefined, { ctrl: { throw: false } })) { }

    if (null != (config as any).feature?.rbac) {
      const denied = BluefinDecryptxP2peSDK.test(undefined, { feature: { rbac: { active: true, deny: true } } })
      await assert.rejects(async () => {
        for await (const _item of denied.InjectKey().stream('list')) { }
      }, (err: any) => 'rbac_denied' === err.code)
    }
  })

  test('stream-ctrl', async () => {
    const explain: any = {}
    const ctrl: any = { explain }
    for await (const _item of BluefinDecryptxP2peSDK.test().InjectKey().stream('list', undefined, { ctrl })) { }
    assert.deepStrictEqual(Object.keys(ctrl), ['explain'])
    assert(explain === ctrl.explain && 0 < Object.keys(explain).length)
  })

  test('unexpected', async () => {
    const hook = new FailHook()
    const client = new BluefinDecryptxP2peSDK({ feature: { test: { active: true } }, extend: [hook] })
    await assert.rejects(client.InjectKey().list(), /hook failed/)
    assert(0 < hook.unexpected)

    const fired = hook.unexpected
    assert.strictEqual(await client.InjectKey().list(undefined, { throw: false }), undefined)
    assert(fired < hook.unexpected)
  })

  test('validate', async (t) => {
    if (null == (config as any).feature?.validate) {
      t.skip('feature not present in this SDK: validate')
      return
    }
    const client = BluefinDecryptxP2peSDK.test(undefined, { feature: { validate: { active: true } } })
    await assert.rejects(client.InjectKey().list({"created":1} as any),
      (err: any) => 'validate_failed' === err.code)
  })



  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
    for (const op of ['list', 'load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'inject_key.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"created":{"a":true,"fo":"datetime","h":"Created","n":"created","r":false,"sh":"Creation timestamp in ISO 8601 format.","t":"`$STRING`","key$":"created","index$":0},"id":{"a":true,"h":"Id","n":"id","r":false,"sh":"unique idenifier","t":"`$STRING`","key$":"id","index$":1},"isActive":{"a":true,"h":"Is Active","n":"isActive","r":false,"sh":"Active flag, inactive keys cannot be assigned to devices.","t":"`$BOOLEAN`","key$":"isActive","index$":2},"isP2PE":{"a":true,"h":"Is P2 Pe","n":"isP2PE","r":false,"sh":"Flags if a key is for a P2PE compliant cypher.","t":"`$BOOLEAN`","key$":"isP2PE","index$":3},"keyType":{"a":true,"h":"Key Type","n":"keyType","r":false,"sh":"The cipher type that the key works with.","t":"`$STRING`","key$":"keyType","index$":4},"modified":{"a":true,"fo":"datetime","h":"Modified","n":"modified","r":false,"sh":"Last modified timestamp in ISO 8601 format.","t":"`$STRING`","key$":"modified","index$":5},"name":{"a":true,"h":"Name","n":"name","r":false,"sh":"Key name.","t":"`$STRING`","key$":"name","index$":6},"version":{"a":true,"h":"Version","n":"version","r":false,"sh":"The number of times that this resource has been updated.","t":"`$INTEGER`","key$":"version","index$":7}},"id":{"field":"id","name":"id"},"name":"inject_key","op":{"list":{"input":"data","name":"list","points":[{"a":true,"co":{"id":"GET /injectKeys","source":"openapi3","version":2},"g":{},"k":"http","m":"GET","o":"/injectKeys","q":{},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"injectKeys"}],"t":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /injectKeys/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/injectKeys/{id}","q":{"exist":["id"]},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"injectKeys"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"inject_key","name__orig":"inject_key","Name":"InjectKey","name_":"inject_key","name-":"inject-key","NAME":"INJECT_KEY","index$":12}, {"active":true,"entity":"inject_key","key$":"BasicInjectKeyFlow","kind":"basic","name":"BasicInjectKeyFlow","param":{},"step":[{"a":true,"d":{},"i":{},"m":{},"o":"list","s":[],"v":[{"apply":"ItemExists","def":{"ref":"inject_key_ref01"}}],"index$":0},{"a":true,"d":{},"i":{"ref":"inject_key_ref01","srcdatavar":"inject_key_ref01_data","suffix":"_dt0"},"m":{"id":"inject_key01"},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-inject_key_ref01"}}],"index$":1}]}, 'InjectKey', {"GET /injectKeys":{"protocol":"http","parameters":[]},"GET /injectKeys/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"The Inject Key's unique identifier.","required":true,"schema":{"type":"string"},"index$":0}]}}, { strict: LIVE_STRICT, t })
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let inject_key_ref01_data = Object.values(setup.data.existing.inject_key)[0] as any

    // LIST
    const inject_key_ref01_ent = client.InjectKey()
    const inject_key_ref01_match: any = {}

    const inject_key_ref01_list = (await inject_key_ref01_ent.list(inject_key_ref01_match)).map((e: any) => e.data())


    // LOAD
    const inject_key_ref01_match_dt0: any = {}
    inject_key_ref01_match_dt0.id = inject_key_ref01_data.id
    const inject_key_ref01_data_dt0 = (await inject_key_ref01_ent.load(inject_key_ref01_match_dt0)).data()
    assert(inject_key_ref01_data_dt0.id === inject_key_ref01_data.id)


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
      '../../../../.sdk/test/entity/inject_key/InjectKeyTestData.json')

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
    ['inject_key01','inject_key02','inject_key03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_INJECT_KEY_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
    'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_INJECT_KEY_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_INJECT_KEY_ENTID']
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
  



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


loadEnvLocal(__dirname + '/../../../.env.local')


describe('UserEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.User()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
    for (const op of ['load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'user.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"client":{"a":true,"h":"Client","n":"client","r":false,"sh":"Reference to the associated Client resource.","t":"`$OBJECT`","key$":"client","index$":0},"created":{"a":true,"fo":"datetime","h":"Created","n":"created","r":false,"sh":"Creation timestamp in ISO 8601 format.","t":"`$STRING`","key$":"created","index$":1},"email":{"a":true,"h":"Email","n":"email","r":false,"sh":"The User's email address.","t":"`$STRING`","key$":"email","index$":2},"firstName":{"a":true,"h":"First Name","n":"firstName","r":false,"sh":"The User's name.","t":"`$STRING`","key$":"firstName","index$":3},"id":{"a":true,"h":"Id","n":"id","r":false,"sh":"This resource's unique identifier.","t":"`$STRING`","key$":"id","index$":4},"isActive":{"a":true,"h":"Is Active","n":"isActive","r":false,"sh":"This property indicates if the User account is active or disabled.","t":"`$BOOLEAN`","key$":"isActive","index$":5},"kif":{"a":true,"h":"Kif","n":"kif","r":false,"sh":"Reference to the associated KIF resource.","t":"`$OBJECT`","key$":"kif","index$":6},"lastName":{"a":true,"h":"Last Name","n":"lastName","r":false,"sh":"The User's Surname.","t":"`$STRING`","key$":"lastName","index$":7},"modified":{"a":true,"fo":"datetime","h":"Modified","n":"modified","r":false,"sh":"Last modified timestamp.","t":"`$STRING`","key$":"modified","index$":8},"partner":{"a":true,"h":"Partner","n":"partner","r":false,"sh":"Reference to the associated Partner.","t":"`$OBJECT`","key$":"partner","index$":9},"phone":{"a":true,"h":"Phone","n":"phone","r":false,"sh":"The User's phone number without dashes, spaces, or brackets.","t":"`$STRING`","key$":"phone","index$":10},"userName":{"a":true,"h":"User Name","n":"userName","r":false,"sh":"The User's unique username.","t":"`$STRING`","key$":"userName","index$":11},"userRole":{"a":true,"h":"User Role","n":"userRole","r":false,"sh":"Reference to the associated User Role.","t":"`$OBJECT`","key$":"userRole","index$":12},"version":{"a":true,"h":"Version","n":"version","r":false,"sh":"The number of times that this resource has been updated.","t":"`$INTEGER`","key$":"version","index$":13}},"id":{"field":"id","name":"id"},"name":"user","op":{"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /users/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/users/{id}","q":{"exist":["id"]},"r":{},"s":[{"lit":"users"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"},"remove":{"input":"data","name":"remove","points":[{"a":true,"co":{"id":"DELETE /users/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"DELETE","o":"/users/{id}","q":{"exist":["id"]},"r":{},"s":[{"lit":"users"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"remove"}},"relations":{"ancestors":[]},"key$":"user","name__orig":"user","Name":"User","name_":"user","name-":"user","NAME":"USER","index$":20}, {"active":true,"entity":"user","key$":"BasicUserFlow","kind":"basic","name":"BasicUserFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"user_ref01","srcdatavar":"user_ref01_data","suffix":"_dt0"},"m":{"id":"user01"},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-user_ref01"}}],"index$":0}]}, 'User', {"GET /users/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"The User's unique identifier.","required":true,"schema":{"type":"string"},"index$":0}]},"DELETE /users/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"The unique identifier of the User to delete.","required":true,"schema":{"type":"string"},"index$":0}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let user_ref01_data = Object.values(setup.data.existing.user)[0] as any

    // LOAD
    const user_ref01_ent = client.User()
    const user_ref01_match_dt0: any = {}
    user_ref01_match_dt0.id = user_ref01_data.id
    const user_ref01_data_dt0 = (await user_ref01_ent.load(user_ref01_match_dt0)).data()
    assert(user_ref01_data_dt0.id === user_ref01_data.id)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/user/UserTestData.json')

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
    ['user01','user02','user03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_USER_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
    'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_USER_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_USER_ENTID']
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
  

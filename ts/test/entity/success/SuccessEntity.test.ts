

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


describe('SuccessEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Success()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
    for (const op of ['create', 'remove']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'success.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"success":{"a":true,"h":"Success","n":"success","r":false,"sh":"Indicates if the action was a success.","t":"`$BOOLEAN`","key$":"success","index$":0}},"name":"success","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /virtualDevices/{sharePartnerTo}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"share_partner_to","or":"share_partner_to","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/virtualDevices/{sharePartnerTo}","q":{"exist":["share_partner_to"]},"r":{"param":{"sharePartnerTo":"share_partner_to"}},"s":[{"lit":"virtualDevices"},{"var":"share_partner_to"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"remove":{"input":"data","name":"remove","points":[{"a":true,"co":{"id":"DELETE /virtualDevices/{sharePartnerTo}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"share_partner_to","or":"share_partner_to","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"DELETE","o":"/virtualDevices/{sharePartnerTo}","q":{"exist":["share_partner_to"]},"r":{"param":{"sharePartnerTo":"share_partner_to"}},"s":[{"lit":"virtualDevices"},{"var":"share_partner_to"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"remove"}},"relations":{"ancestors":[["$.main.kit.entity.virtual_device"]]},"key$":"success","name__orig":"success","Name":"Success","name_":"success","name-":"success","NAME":"SUCCESS","index$":17}, {"active":true,"entity":"success","key$":"BasicSuccessFlow","kind":"basic","name":"BasicSuccessFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"success_ref01"},"m":{"share_partner_to":"share_partner_to01"},"o":"create","s":[],"v":[],"index$":0},{"a":true,"d":{},"i":{"ref":"success_ref01","suffix":"_rm0"},"m":{"id":"success01"},"o":"remove","s":[],"v":[],"index$":1}]}, 'Success', {"POST /virtualDevices/{sharePartnerTo}":{"protocol":"http","requestBody":{"description":"List of Devices to be shared with the Parner.","content":{"*/*":{"schema":{"required":["devices","sharePartnerFrom"],"type":"object","properties":{"sharePartnerFrom":{"type":"object","properties":{"id":{"description":"The referenced Partner's ID.","example":"6580","type":"string"},"name":{"description":"The referenced Partner's name.","example":"ASM Software","type":"string"}},"description":"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/PartnerReference"},"devices":{"type":"array","description":"An array of Device ids to share with partner.","items":{"type":"integer"}}},"x-ref":"#/components/schemas/VirtualDeviceCreate"}}},"required":true},"parameters":[{"name":"sharePartnerTo","in":"path","description":"Partner that the Devices are to be shared with.","required":true,"schema":{"type":"string"},"index$":0}]},"DELETE /virtualDevices/{sharePartnerTo}":{"protocol":"http","requestBody":{"description":"List of Device to be unshared.","content":{"*/*":{"schema":{"required":["devices"],"type":"object","properties":{"devices":{"type":"array","description":"An array of Device ids to unshare with partner.","items":{"type":"integer"}}},"x-ref":"#/components/schemas/VirtualDeviceDelete"}}},"required":true},"parameters":[{"name":"sharePartnerTo","in":"path","description":"Partner that the Devices are to be unshared with.","required":true,"schema":{"type":"string"},"index$":0}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const success_ref01_ent = client.Success()
    let success_ref01_data = setup.data.new.success['success_ref01']
    success_ref01_data['share_partner_to'] = setup.idmap['share_partner_to01']

    success_ref01_data = (await success_ref01_ent.create(success_ref01_data)).data()
    assert(null != success_ref01_data)



  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/success/SuccessTestData.json')

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
    ['success01','success02','success03','virtual_device01','virtual_device02','virtual_device03','share_partner_to01'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_SUCCESS_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
    'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_SUCCESS_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_SUCCESS_ENTID']
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
  

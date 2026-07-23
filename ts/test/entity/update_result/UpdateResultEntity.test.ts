
const envlocal = __dirname + '/../../../.env.local'
require('dotenv').config({ quiet: true, path: [envlocal] })

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'


import { BluefinDecryptxP2peSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveDelay,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


describe('UpdateResultEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFINDECRYPTXP2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFINDECRYPTXP2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.UpdateResult()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P_PE_TEST_LIVE
    for (const op of ['create', 'list', 'update']) {
      if (maybeSkipControl(t, 'entityOp', 'update_result.' + op, live)) return
    }

    const setup = basicSetup()
    // The basic flow consumes synthetic IDs and field values from the
    // fixture (entity TestData.json). Those don't exist on the live API.
    // Skip live runs unless the user provided a real ENTID env override.
    if (setup.syntheticOnly) {
      t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_DECRYPTX_P_PE_TEST_UPDATE_RESULT_ENTID JSON to run live')
      return
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const update_result_ref01_ent = client.UpdateResult()
    let update_result_ref01_data = setup.data.new.update_result['update_result_ref01']

    update_result_ref01_data = await update_result_ref01_ent.create(update_result_ref01_data)
    assert(null != update_result_ref01_data.id)


    // LIST
    const update_result_ref01_match: any = {}

    const update_result_ref01_list = await update_result_ref01_ent.list(update_result_ref01_match)

    assert(!isempty(select(update_result_ref01_list, { id: update_result_ref01_data.id })))


    // UPDATE
    const update_result_ref01_data_up0: any = {}
    update_result_ref01_data_up0.id = update_result_ref01_data.id

    const update_result_ref01_markdef_up0 = { name: 'email', value: 'Mark01-update_result_ref01_' + setup.now }
    ;(update_result_ref01_data_up0 as any)[update_result_ref01_markdef_up0.name] = update_result_ref01_markdef_up0.value

    const update_result_ref01_resdata_up0 = await update_result_ref01_ent.update(update_result_ref01_data_up0)
    assert(update_result_ref01_resdata_up0.id === update_result_ref01_data_up0.id)

    assert((update_result_ref01_resdata_up0 as any)[update_result_ref01_markdef_up0.name] === update_result_ref01_markdef_up0.value)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/update_result/UpdateResultTestData.json')

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
    ['update_result01','update_result02','update_result03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  // Detect whether the user provided a real ENTID JSON via env var. The
  // basic flow consumes synthetic IDs from the fixture file; without an
  // override those synthetic IDs reach the live API and 4xx. Surface this
  // to the test so it can skip rather than fail.
  const idmapEnvVal = process.env['BLUEFIN_DECRYPTX_P_PE_TEST_UPDATE_RESULT_ENTID']
  const idmapOverridden = null != idmapEnvVal && idmapEnvVal.trim().startsWith('{')

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P_PE_TEST_UPDATE_RESULT_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P_PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P_PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P_PE_APIKEY': 'NONE',
  })

  idmap = env['BLUEFIN_DECRYPTX_P_PE_TEST_UPDATE_RESULT_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P_PE_TEST_LIVE

  if (live) {
    client = new BluefinDecryptxP2peSDK(merge([
      {
        apikey: env.BLUEFIN_DECRYPTX_P_PE_APIKEY,
      },
      extra
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.BLUEFIN_DECRYPTX_P_PE_TEST_EXPLAIN,
    live,
    syntheticOnly: live && !idmapOverridden,
    now: Date.now(),
  }

  return setup
}
  

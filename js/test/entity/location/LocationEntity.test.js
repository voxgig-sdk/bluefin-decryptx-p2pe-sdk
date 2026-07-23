
const envlocal = __dirname + '/../../../.env.local'
require('dotenv').config({ quiet: true, path: [envlocal] })

const Path = require('node:path')
const Fs = require('node:fs')

const { test, describe } = require('node:test')
const assert = require('node:assert')


const { BluefinDecryptxP2peSDK, BaseFeature, stdutil, config } = require('../../..')

const {
  envOverride,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
} = require('../../utility')


describe('LocationEntity', async () => {

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Location()
    assert(null != ent)
  })


  // Feature #4: the entity `stream(action, ...)` method runs the op pipeline
  // and returns an async iterator over result items. With the streaming
  // feature active it yields the feature's incremental output; otherwise it
  // falls back to the materialised list so `stream` always yields.
  test('stream', async () => {
    const seed = {
      entity: {
        location: { s1: { id: 's1' }, s2: { id: 's2' }, s3: { id: 's3' } }
      }
    }

    // Fallback: streaming inactive -> yields the materialised list items.
    const base = BluefinDecryptxP2peSDK.test(seed)
    const seen = []
    for await (const item of base.Location().stream('list')) {
      seen.push(item)
    }
    assert.equal(seen.length, 3)

    // Inbound: streaming active -> yields each item from the feature iterator.
    if (config.feature && config.feature.streaming) {
      const sdk = BluefinDecryptxP2peSDK.test(seed, { feature: { streaming: { active: true } } })
      const got = []
      for await (const item of sdk.Location().stream('list')) {
        if (Array.isArray(item)) { got.push(...item) } else { got.push(item) }
      }
      assert.equal(got.length, 3)
    }
  })


  test('basic', async () => {

    const setup = basicSetup()
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const location_ref01_ent = client.Location()
    let location_ref01_data = setup.data.new.location['location_ref01']

    location_ref01_data = await location_ref01_ent.create(location_ref01_data)
    assert(null != location_ref01_data.id)


    // LIST
    const location_ref01_match = {}

    const location_ref01_list = await location_ref01_ent.list(location_ref01_match)

    assert(!isempty(select(location_ref01_list, { id: location_ref01_data.id })))


    // LOAD
    const location_ref01_match_dt0 = {}
    location_ref01_match_dt0.id = location_ref01_data.id
    const location_ref01_data_dt0 = await location_ref01_ent.load(location_ref01_match_dt0)
    assert(location_ref01_data_dt0.id === location_ref01_data.id)


    // REMOVE
    const location_ref01_match_rm0 = {}
    location_ref01_match_rm0.id = location_ref01_data.id
    await location_ref01_ent.remove(location_ref01_match_rm0)
  

    // LIST
    const location_ref01_match_rt0 = {}

    const location_ref01_list_rt0 = await location_ref01_ent.list(location_ref01_match_rt0)

    assert(isempty(select(location_ref01_list_rt0, { id: location_ref01_data.id })))


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

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
    'BLUEFIN_DECRYPTX_P_PE_TEST_LOCATION_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P_PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P_PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P_PE_APIKEY': 'NONE',
  })

  idmap = env['BLUEFIN_DECRYPTX_P_PE_TEST_LOCATION_ENTID']

  if ('TRUE' === env.BLUEFIN_DECRYPTX_P_PE_TEST_LIVE) {
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
    now: Date.now(),
  }

  return setup
}
  

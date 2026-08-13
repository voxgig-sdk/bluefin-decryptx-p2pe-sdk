
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


describe('ClientEntity', async () => {

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Client()
    assert(null != ent)
  })


  test('basic', async () => {

    const setup = basicSetup()
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
    const client_ref01_match = {}

    const client_ref01_list = (await client_ref01_ent.list(client_ref01_match)).map((e) => e.data())

    assert(!isempty(select(client_ref01_list, { id: client_ref01_data.id })))


    // LOAD
    const client_ref01_match_dt0 = {}
    client_ref01_match_dt0.id = client_ref01_data.id
    const client_ref01_data_dt0 = (await client_ref01_ent.load(client_ref01_match_dt0)).data()
    assert(client_ref01_data_dt0.id === client_ref01_data.id)


    // REMOVE
    const client_ref01_match_rm0 = {}
    client_ref01_match_rm0.id = client_ref01_data.id
    await client_ref01_ent.remove(client_ref01_match_rm0)
  

    // LIST
    const client_ref01_match_rt0 = {}

    const client_ref01_list_rt0 = (await client_ref01_ent.list(client_ref01_match_rt0)).map((e) => e.data())

    assert(isempty(select(client_ref01_list_rt0, { id: client_ref01_data.id })))


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

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
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': 'NONE',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID']

  if ('TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE) {
    client = new BluefinDecryptxP2peSDK(merge([
      {
        apikey: env.BLUEFIN_DECRYPTX_P2PE_APIKEY,
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
    explain: 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN,
    now: Date.now(),
  }

  return setup
}
  

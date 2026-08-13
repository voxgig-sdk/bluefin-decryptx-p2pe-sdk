
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


describe('UpdateResultEntity', async () => {

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.UpdateResult()
    assert(null != ent)
  })


  test('basic', async () => {

    const setup = basicSetup()
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const update_result_ref01_ent = client.UpdateResult()
    let update_result_ref01_data = setup.data.new.update_result['update_result_ref01']

    update_result_ref01_data = (await update_result_ref01_ent.create(update_result_ref01_data)).data()
    assert(null != update_result_ref01_data.id)


    // LIST
    const update_result_ref01_match = {}

    const update_result_ref01_list = (await update_result_ref01_ent.list(update_result_ref01_match)).map((e) => e.data())

    assert(!isempty(select(update_result_ref01_list, { id: update_result_ref01_data.id })))


    // UPDATE
    const update_result_ref01_data_up0 = {}
    update_result_ref01_data_up0.id = update_result_ref01_data.id

    const update_result_ref01_markdef_up0 = { name: 'email', value: 'Mark01-update_result_ref01_' + setup.now }
    update_result_ref01_data_up0 [update_result_ref01_markdef_up0.name] = update_result_ref01_markdef_up0.value

    const update_result_ref01_resdata_up0 = (await update_result_ref01_ent.update(update_result_ref01_data_up0)).data()
    assert(update_result_ref01_resdata_up0.id === update_result_ref01_data_up0.id)

    assert(update_result_ref01_resdata_up0[update_result_ref01_markdef_up0.name] === update_result_ref01_markdef_up0.value)


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

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

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': 'NONE',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID']

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
  

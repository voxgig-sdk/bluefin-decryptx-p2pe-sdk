
const envlocal = __dirname + '/../../../.env.local'
require('dotenv').config({ quiet: true, path: [envlocal] })

const { test, describe } = require('node:test')
const assert = require('node:assert')


const { BluefinDecryptxP2peSDK } = require('../../..')

const {
  envOverride,
} = require('../../utility')


describe('DeviceCustodyDetailDirect', async () => {

  test('direct-exists', async () => {
    const sdk = new BluefinDecryptxP2peSDK({
      system: { fetch: async () => ({}) }
    })
    assert('function' === typeof sdk.direct)
    assert('function' === typeof sdk.prepare)
  })


  test('direct-load-device_custody_detail', async () => {
    const setup = directSetup({ id: 'direct01' })
    const { client, calls } = setup

    const params = {}
    if (!setup.live) {
      params.device_type = 'direct01'
      params.id = 'direct02'
      params.serial_number = 'direct03'
    }

    const result = await client.direct({
      path: 'devices/{serial_number}/{device_type}/custody/{id}',
      method: 'GET',
      params,
    })

    assert(result.ok === true)
    assert(result.status === 200)
    assert(null != result.data)

    if (!setup.live) {
      assert(result.data.id === 'direct01')
      assert(calls.length === 1)
      assert(calls[0].init.method === 'GET')
      assert(calls[0].url.includes('direct01'))
      assert(calls[0].url.includes('direct02'))
      assert(calls[0].url.includes('direct03'))
    }
  })

})



function directSetup(mockres) {
  const calls = []

  const env = envOverride({
    'BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID': {},
    'BLUEFINDECRYPTXP_PE_TEST_LIVE': 'FALSE',
    'BLUEFINDECRYPTXP_PE_APIKEY': 'NONE',
  })

  const live = 'TRUE' === env.BLUEFINDECRYPTXP_PE_TEST_LIVE

  if (live) {
    const client = new BluefinDecryptxP2peSDK({
      apikey: env.BLUEFINDECRYPTXP_PE_APIKEY,
    })

    let idmap = env['BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID']
    if ('string' === typeof idmap && idmap.startsWith('{')) {
      idmap = JSON.parse(idmap)
    }

    return { client, calls, live, idmap }
  }

  const mockFetch = async (url, init) => {
    calls.push({ url, init })
    return {
      status: 200,
      statusText: 'OK',
      headers: {},
      json: async () => (null != mockres ? mockres : { id: 'direct01' }),
    }
  }

  const client = new BluefinDecryptxP2peSDK({
    base: 'http://localhost:8080',
    system: { fetch: mockFetch },
  })

  return { client, calls, live, idmap: {} }
}
  

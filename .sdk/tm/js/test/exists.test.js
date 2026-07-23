
const { test, describe } = require('node:test')
const { equal } = require('node:assert')


const { BluefinDecryptxP2peSDK } = require('..')


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await BluefinDecryptxP2peSDK.test()
    equal(null !== testsdk, true)
  })

})

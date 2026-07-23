
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { BluefinDecryptxP2peSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await BluefinDecryptxP2peSDK.test()
    equal(null !== testsdk, true)
  })

})


import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { BluefinDecryptxP2peSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    equal(testsdk instanceof BluefinDecryptxP2peSDK, true,
      'BluefinDecryptxP2peSDK.test() must return a client synchronously')
  })

})

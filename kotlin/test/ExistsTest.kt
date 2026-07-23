package voxgig.bluefindecryptxp2pesdk.sdktest

import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Test

import voxgig.bluefindecryptxp2pesdk.core.BluefinDecryptxP2peSDK

class ExistsTest {

  @Test
  fun testMode() {
    val testsdk = BluefinDecryptxP2peSDK.testSDK()
    assertNotNull(testsdk, "expected non-nil SDK")
  }
}

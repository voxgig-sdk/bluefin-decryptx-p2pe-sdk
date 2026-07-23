package KOTLINPACKAGE.sdktest

import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Test

import KOTLINPACKAGE.core.BluefinDecryptxP2peSDK

class ExistsTest {

  @Test
  fun testMode() {
    val testsdk = BluefinDecryptxP2peSDK.testSDK()
    assertNotNull(testsdk, "expected non-nil SDK")
  }
}

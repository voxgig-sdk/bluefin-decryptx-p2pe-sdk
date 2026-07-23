package voxgig.bluefindecryptxp2pesdk.sdktest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;

import voxgig.bluefindecryptxp2pesdk.core.BluefinDecryptxP2peSDK;

public class ExistsTest {

  @Test
  public void testMode() {
    BluefinDecryptxP2peSDK testsdk = BluefinDecryptxP2peSDK.testSDK();
    assertNotNull(testsdk, "expected non-nil SDK");
  }
}

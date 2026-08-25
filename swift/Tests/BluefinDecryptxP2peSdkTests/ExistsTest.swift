// BluefinDecryptxP2pe SDK exists test.

import XCTest

@testable import BluefinDecryptxP2peSdk

final class ExistsTest: XCTestCase {
  func testMode() {
    let testsdk = BluefinDecryptxP2peSDK.testSDK(nil, nil)
    XCTAssertEqual(testsdk.mode, "test")
  }
}

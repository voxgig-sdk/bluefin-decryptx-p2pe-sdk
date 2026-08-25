// success entity test (generated from the API model).

import XCTest

@testable import BluefinDecryptxP2peSdk

final class SuccessEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinDecryptxP2peSDK.testSDK(nil, nil)
    let ent = sdk.Success()
    XCTAssertEqual(ent.getName(), "success")
  }
}

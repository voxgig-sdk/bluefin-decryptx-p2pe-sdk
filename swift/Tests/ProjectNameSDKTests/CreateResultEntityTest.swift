// create_result entity test (generated from the API model).

import XCTest

@testable import BluefinDecryptxP2peSdk

final class CreateResultEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinDecryptxP2peSDK.testSDK(nil, nil)
    let ent = sdk.CreateResult()
    XCTAssertEqual(ent.getName(), "create_result")
  }
}

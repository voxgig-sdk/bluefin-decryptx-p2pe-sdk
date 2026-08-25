// user entity test (generated from the API model).

import XCTest

@testable import BluefinDecryptxP2peSdk

final class UserEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinDecryptxP2peSDK.testSDK(nil, nil)
    let ent = sdk.User()
    XCTAssertEqual(ent.getName(), "user")
  }
}

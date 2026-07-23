// decryption entity test (generated from the API model).

import XCTest

@testable import BluefinDecryptxP2peSdk

final class DecryptionEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinDecryptxP2peSDK.testSDK(nil, nil)
    let ent = sdk.Decryption()
    XCTAssertEqual(ent.getName(), "decryption")
  }
}

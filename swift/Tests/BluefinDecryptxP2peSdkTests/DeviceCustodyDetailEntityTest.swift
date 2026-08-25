// device_custody_detail entity test (generated from the API model).

import XCTest

@testable import BluefinDecryptxP2peSdk

final class DeviceCustodyDetailEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinDecryptxP2peSDK.testSDK(nil, nil)
    let ent = sdk.DeviceCustodyDetail()
    XCTAssertEqual(ent.getName(), "device_custody_detail")
  }
}

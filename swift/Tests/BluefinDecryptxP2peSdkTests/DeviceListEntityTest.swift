// device_list entity test (generated from the API model).

import XCTest

@testable import BluefinDecryptxP2peSdk

final class DeviceListEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinDecryptxP2peSDK.testSDK(nil, nil)
    let ent = sdk.DeviceList()
    XCTAssertEqual(ent.getName(), "device_list")
  }
}

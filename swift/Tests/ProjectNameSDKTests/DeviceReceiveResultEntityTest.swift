// device_receive_result entity test (generated from the API model).

import XCTest

@testable import BluefinDecryptxP2peSdk

final class DeviceReceiveResultEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinDecryptxP2peSDK.testSDK(nil, nil)
    let ent = sdk.DeviceReceiveResult()
    XCTAssertEqual(ent.getName(), "device_receive_result")
  }
}

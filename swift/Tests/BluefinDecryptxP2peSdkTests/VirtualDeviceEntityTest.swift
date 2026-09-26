// virtual_device entity test (generated from the API model).

import XCTest

@testable import BluefinDecryptxP2peSdk

final class VirtualDeviceEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinDecryptxP2peSDK.testSDK(nil, nil)
    let ent = sdk.VirtualDevice()
    XCTAssertEqual(ent.getName(), "virtual_device")
  }
}

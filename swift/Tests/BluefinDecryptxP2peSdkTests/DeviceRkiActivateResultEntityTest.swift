// device_rki_activate_result entity test (generated from the API model).

import XCTest

@testable import BluefinDecryptxP2peSdk

final class DeviceRkiActivateResultEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinDecryptxP2peSDK.testSDK(nil, nil)
    let ent = sdk.DeviceRkiActivateResult()
    XCTAssertEqual(ent.getName(), "device_rki_activate_result")
  }
}

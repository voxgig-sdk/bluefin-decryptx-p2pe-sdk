// success entity test (generated from the API model).

import XCTest

@testable import BluefinDecryptxP2peSdk

final class SuccessEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinDecryptxP2peSDK.testSDK(nil, nil)
    let ent = sdk.Success()
    XCTAssertEqual(ent.getName(), "success")
  }

  // An invalid request fails with validate's own error, before it is sent.
  func testValidate() throws {
    try XCTSkipUnless(SuccessEntityTest.hasFeature("validate"), "feature not present in this SDK: validate")
    let client = BluefinDecryptxP2peSDK.testSDK(nil, vm(("feature", .map(vm(("validate", .map(vm(("active", .bool(true))))))))))
    var err: Error? = nil
    do { _ = try client.Success().create(vm(("share_partner_to", .int(1)), ("devices", .string("x")), ("sharePartnerFrom", .string("x"))), nil) } catch { err = error }
    XCTAssertEqual((err as? BluefinDecryptxP2peError)?.code, "validate_failed",
      "expected validate_failed, got \(String(describing: err))")
  }

  // True when this SDK was generated with the named feature.
  static func hasFeature(_ name: String) -> Bool {
    gp(SdkConfig.makeConfig(), "feature").asMap?.entries[name] != nil
  }
}

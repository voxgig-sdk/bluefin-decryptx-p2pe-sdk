// create_result entity test (generated from the API model).

import XCTest

@testable import BluefinDecryptxP2peSdk

final class CreateResultEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinDecryptxP2peSDK.testSDK(nil, nil)
    let ent = sdk.CreateResult()
    XCTAssertEqual(ent.getName(), "create_result")
  }

  // An invalid request fails with validate's own error, before it is sent.
  func testValidate() throws {
    try XCTSkipUnless(CreateResultEntityTest.hasFeature("validate"), "feature not present in this SDK: validate")
    let client = BluefinDecryptxP2peSDK.testSDK(nil, vm(("feature", .map(vm(("validate", .map(vm(("active", .bool(true))))))))))
    var err: Error? = nil
    do { _ = try client.CreateResult().create(vm(("device_type", .int(1)), ("serial_number", .string("x")), ("custodian", .string("x")), ("location", .string("x"))), nil) } catch { err = error }
    XCTAssertEqual((err as? BluefinDecryptxP2peError)?.code, "validate_failed",
      "expected validate_failed, got \(String(describing: err))")
  }

  // True when this SDK was generated with the named feature.
  static func hasFeature(_ name: String) -> Bool {
    gp(SdkConfig.makeConfig(), "feature").asMap?.entries[name] != nil
  }
}

package voxgig.bluefindecryptxp2pesdk.core

import java.util.{Map => JMap}

// BluefinDecryptxP2pe SDK client. All transport and pipeline behaviour lives in the
// SdkClient base (core/SdkClient.scala); this class binds the API-specific
// entity accessors and the test-mode constructor.
class BluefinDecryptxP2peSDK(options: JMap[String, Object]) extends SdkClient(options) {

  def this() = this(null)


  /**
   * Returns a attestation entity bound to this client.
   * Idiomatic usage: client.attestation(null).list(null, null) or
   * client.attestation(null).load(java.util.Map.of("id", ...), null).
   */
  def attestation(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.AttestationEntity(this, entopts)

  /**
   * Returns a client entity bound to this client.
   * Idiomatic usage: client.client(null).list(null, null) or
   * client.client(null).load(java.util.Map.of("id", ...), null).
   */
  def client(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.ClientEntity(this, entopts)

  /**
   * Returns a create_result entity bound to this client.
   * Idiomatic usage: client.createResult(null).list(null, null) or
   * client.createResult(null).load(java.util.Map.of("id", ...), null).
   */
  def createResult(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.CreateResultEntity(this, entopts)

  /**
   * Returns a decryption entity bound to this client.
   * Idiomatic usage: client.decryption(null).list(null, null) or
   * client.decryption(null).load(java.util.Map.of("id", ...), null).
   */
  def decryption(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.DecryptionEntity(this, entopts)

  /**
   * Returns a device entity bound to this client.
   * Idiomatic usage: client.device(null).list(null, null) or
   * client.device(null).load(java.util.Map.of("id", ...), null).
   */
  def device(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.DeviceEntity(this, entopts)

  /**
   * Returns a device_build entity bound to this client.
   * Idiomatic usage: client.deviceBuild(null).list(null, null) or
   * client.deviceBuild(null).load(java.util.Map.of("id", ...), null).
   */
  def deviceBuild(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.DeviceBuildEntity(this, entopts)

  /**
   * Returns a device_custody_detail entity bound to this client.
   * Idiomatic usage: client.deviceCustodyDetail(null).list(null, null) or
   * client.deviceCustodyDetail(null).load(java.util.Map.of("id", ...), null).
   */
  def deviceCustodyDetail(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.DeviceCustodyDetailEntity(this, entopts)

  /**
   * Returns a device_custody_list entity bound to this client.
   * Idiomatic usage: client.deviceCustodyList(null).list(null, null) or
   * client.deviceCustodyList(null).load(java.util.Map.of("id", ...), null).
   */
  def deviceCustodyList(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.DeviceCustodyListEntity(this, entopts)

  /**
   * Returns a device_list entity bound to this client.
   * Idiomatic usage: client.deviceList(null).list(null, null) or
   * client.deviceList(null).load(java.util.Map.of("id", ...), null).
   */
  def deviceList(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.DeviceListEntity(this, entopts)

  /**
   * Returns a device_receive_result entity bound to this client.
   * Idiomatic usage: client.deviceReceiveResult(null).list(null, null) or
   * client.deviceReceiveResult(null).load(java.util.Map.of("id", ...), null).
   */
  def deviceReceiveResult(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.DeviceReceiveResultEntity(this, entopts)

  /**
   * Returns a device_rki_activate_result entity bound to this client.
   * Idiomatic usage: client.deviceRkiActivateResult(null).list(null, null) or
   * client.deviceRkiActivateResult(null).load(java.util.Map.of("id", ...), null).
   */
  def deviceRkiActivateResult(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.DeviceRkiActivateResultEntity(this, entopts)

  /**
   * Returns a device_state entity bound to this client.
   * Idiomatic usage: client.deviceState(null).list(null, null) or
   * client.deviceState(null).load(java.util.Map.of("id", ...), null).
   */
  def deviceState(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.DeviceStateEntity(this, entopts)

  /**
   * Returns a device_type entity bound to this client.
   * Idiomatic usage: client.deviceType(null).list(null, null) or
   * client.deviceType(null).load(java.util.Map.of("id", ...), null).
   */
  def deviceType(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.DeviceTypeEntity(this, entopts)

  /**
   * Returns a inject_key entity bound to this client.
   * Idiomatic usage: client.injectKey(null).list(null, null) or
   * client.injectKey(null).load(java.util.Map.of("id", ...), null).
   */
  def injectKey(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.InjectKeyEntity(this, entopts)

  /**
   * Returns a kif entity bound to this client.
   * Idiomatic usage: client.kif(null).list(null, null) or
   * client.kif(null).load(java.util.Map.of("id", ...), null).
   */
  def kif(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.KifEntity(this, entopts)

  /**
   * Returns a location entity bound to this client.
   * Idiomatic usage: client.location(null).list(null, null) or
   * client.location(null).load(java.util.Map.of("id", ...), null).
   */
  def location(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.LocationEntity(this, entopts)

  /**
   * Returns a partner entity bound to this client.
   * Idiomatic usage: client.partner(null).list(null, null) or
   * client.partner(null).load(java.util.Map.of("id", ...), null).
   */
  def partner(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.PartnerEntity(this, entopts)

  /**
   * Returns a shipment entity bound to this client.
   * Idiomatic usage: client.shipment(null).list(null, null) or
   * client.shipment(null).load(java.util.Map.of("id", ...), null).
   */
  def shipment(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.ShipmentEntity(this, entopts)

  /**
   * Returns a success entity bound to this client.
   * Idiomatic usage: client.success(null).list(null, null) or
   * client.success(null).load(java.util.Map.of("id", ...), null).
   */
  def success(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.SuccessEntity(this, entopts)

  /**
   * Returns a transaction entity bound to this client.
   * Idiomatic usage: client.transaction(null).list(null, null) or
   * client.transaction(null).load(java.util.Map.of("id", ...), null).
   */
  def transaction(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.TransactionEntity(this, entopts)

  /**
   * Returns a update_result entity bound to this client.
   * Idiomatic usage: client.updateResult(null).list(null, null) or
   * client.updateResult(null).load(java.util.Map.of("id", ...), null).
   */
  def updateResult(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.UpdateResultEntity(this, entopts)

  /**
   * Returns a user entity bound to this client.
   * Idiomatic usage: client.user(null).list(null, null) or
   * client.user(null).load(java.util.Map.of("id", ...), null).
   */
  def user(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefindecryptxp2pesdk.entity.UserEntity(this, entopts)


}

object BluefinDecryptxP2peSDK {

  // testSDK builds a client in test mode: the test feature is activated,
  // installing the in-memory mock transport (no network activity).
  def testSDK(): BluefinDecryptxP2peSDK = testSDK(null, null)

  def testSDK(testopts: JMap[String, Object], sdkopts: JMap[String, Object]): BluefinDecryptxP2peSDK = {
    val sdk = new BluefinDecryptxP2peSDK(SdkClient.testOptions(testopts, sdkopts))
    sdk.mode = "test"
    sdk
  }
}

package voxgig.bluefindecryptxp2pesdk.core;

import java.util.Map;

/**
 * BluefinDecryptxP2pe SDK client. All transport and pipeline behaviour lives in
 * the SdkClient base (core/SdkClient.java); this class binds the
 * API-specific entity accessors and the test-mode constructor.
 */
public class BluefinDecryptxP2peSDK extends SdkClient {

  public BluefinDecryptxP2peSDK() {
    this(null);
  }

  public BluefinDecryptxP2peSDK(Map<String, Object> options) {
    super(options);
  }


  /**
   * Returns a attestation entity bound to this client.
   * Idiomatic usage: client.attestation(null).list(null, null) or
   * client.attestation(null).load(Map.of("id", ...), null).
   */
  public SdkEntity attestation(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.AttestationEntity(this, entopts);
  }

  /**
   * Returns a client entity bound to this client.
   * Idiomatic usage: client.client(null).list(null, null) or
   * client.client(null).load(Map.of("id", ...), null).
   */
  public SdkEntity client(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.ClientEntity(this, entopts);
  }

  /**
   * Returns a create_result entity bound to this client.
   * Idiomatic usage: client.createResult(null).list(null, null) or
   * client.createResult(null).load(Map.of("id", ...), null).
   */
  public SdkEntity createResult(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.CreateResultEntity(this, entopts);
  }

  /**
   * Returns a decryption entity bound to this client.
   * Idiomatic usage: client.decryption(null).list(null, null) or
   * client.decryption(null).load(Map.of("id", ...), null).
   */
  public SdkEntity decryption(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.DecryptionEntity(this, entopts);
  }

  /**
   * Returns a device entity bound to this client.
   * Idiomatic usage: client.device(null).list(null, null) or
   * client.device(null).load(Map.of("id", ...), null).
   */
  public SdkEntity device(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.DeviceEntity(this, entopts);
  }

  /**
   * Returns a device_build entity bound to this client.
   * Idiomatic usage: client.deviceBuild(null).list(null, null) or
   * client.deviceBuild(null).load(Map.of("id", ...), null).
   */
  public SdkEntity deviceBuild(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.DeviceBuildEntity(this, entopts);
  }

  /**
   * Returns a device_custody_detail entity bound to this client.
   * Idiomatic usage: client.deviceCustodyDetail(null).list(null, null) or
   * client.deviceCustodyDetail(null).load(Map.of("id", ...), null).
   */
  public SdkEntity deviceCustodyDetail(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.DeviceCustodyDetailEntity(this, entopts);
  }

  /**
   * Returns a device_custody_list entity bound to this client.
   * Idiomatic usage: client.deviceCustodyList(null).list(null, null) or
   * client.deviceCustodyList(null).load(Map.of("id", ...), null).
   */
  public SdkEntity deviceCustodyList(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.DeviceCustodyListEntity(this, entopts);
  }

  /**
   * Returns a device_list entity bound to this client.
   * Idiomatic usage: client.deviceList(null).list(null, null) or
   * client.deviceList(null).load(Map.of("id", ...), null).
   */
  public SdkEntity deviceList(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.DeviceListEntity(this, entopts);
  }

  /**
   * Returns a device_receive_result entity bound to this client.
   * Idiomatic usage: client.deviceReceiveResult(null).list(null, null) or
   * client.deviceReceiveResult(null).load(Map.of("id", ...), null).
   */
  public SdkEntity deviceReceiveResult(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.DeviceReceiveResultEntity(this, entopts);
  }

  /**
   * Returns a device_rki_activate_result entity bound to this client.
   * Idiomatic usage: client.deviceRkiActivateResult(null).list(null, null) or
   * client.deviceRkiActivateResult(null).load(Map.of("id", ...), null).
   */
  public SdkEntity deviceRkiActivateResult(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.DeviceRkiActivateResultEntity(this, entopts);
  }

  /**
   * Returns a device_state entity bound to this client.
   * Idiomatic usage: client.deviceState(null).list(null, null) or
   * client.deviceState(null).load(Map.of("id", ...), null).
   */
  public SdkEntity deviceState(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.DeviceStateEntity(this, entopts);
  }

  /**
   * Returns a device_type entity bound to this client.
   * Idiomatic usage: client.deviceType(null).list(null, null) or
   * client.deviceType(null).load(Map.of("id", ...), null).
   */
  public SdkEntity deviceType(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.DeviceTypeEntity(this, entopts);
  }

  /**
   * Returns a inject_key entity bound to this client.
   * Idiomatic usage: client.injectKey(null).list(null, null) or
   * client.injectKey(null).load(Map.of("id", ...), null).
   */
  public SdkEntity injectKey(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.InjectKeyEntity(this, entopts);
  }

  /**
   * Returns a kif entity bound to this client.
   * Idiomatic usage: client.kif(null).list(null, null) or
   * client.kif(null).load(Map.of("id", ...), null).
   */
  public SdkEntity kif(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.KifEntity(this, entopts);
  }

  /**
   * Returns a location entity bound to this client.
   * Idiomatic usage: client.location(null).list(null, null) or
   * client.location(null).load(Map.of("id", ...), null).
   */
  public SdkEntity location(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.LocationEntity(this, entopts);
  }

  /**
   * Returns a partner entity bound to this client.
   * Idiomatic usage: client.partner(null).list(null, null) or
   * client.partner(null).load(Map.of("id", ...), null).
   */
  public SdkEntity partner(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.PartnerEntity(this, entopts);
  }

  /**
   * Returns a shipment entity bound to this client.
   * Idiomatic usage: client.shipment(null).list(null, null) or
   * client.shipment(null).load(Map.of("id", ...), null).
   */
  public SdkEntity shipment(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.ShipmentEntity(this, entopts);
  }

  /**
   * Returns a success entity bound to this client.
   * Idiomatic usage: client.success(null).list(null, null) or
   * client.success(null).load(Map.of("id", ...), null).
   */
  public SdkEntity success(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.SuccessEntity(this, entopts);
  }

  /**
   * Returns a transaction entity bound to this client.
   * Idiomatic usage: client.transaction(null).list(null, null) or
   * client.transaction(null).load(Map.of("id", ...), null).
   */
  public SdkEntity transaction(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.TransactionEntity(this, entopts);
  }

  /**
   * Returns a update_result entity bound to this client.
   * Idiomatic usage: client.updateResult(null).list(null, null) or
   * client.updateResult(null).load(Map.of("id", ...), null).
   */
  public SdkEntity updateResult(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.UpdateResultEntity(this, entopts);
  }

  /**
   * Returns a user entity bound to this client.
   * Idiomatic usage: client.user(null).list(null, null) or
   * client.user(null).load(Map.of("id", ...), null).
   */
  public SdkEntity user(Map<String, Object> entopts) {
    return new voxgig.bluefindecryptxp2pesdk.entity.UserEntity(this, entopts);
  }


  // testSDK builds a client in test mode: the test feature is activated,
  // installing the in-memory mock transport (no network activity).
  public static BluefinDecryptxP2peSDK testSDK() {
    return testSDK(null, null);
  }

  public static BluefinDecryptxP2peSDK testSDK(
      Map<String, Object> testopts, Map<String, Object> sdkopts) {
    BluefinDecryptxP2peSDK sdk = new BluefinDecryptxP2peSDK(SdkClient.testOptions(testopts, sdkopts));
    sdk.mode = "test";
    return sdk;
  }
}

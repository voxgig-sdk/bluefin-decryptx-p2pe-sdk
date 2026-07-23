package voxgig.bluefindecryptxp2pesdk.core

/**
 * BluefinDecryptxP2pe SDK client. All transport and pipeline behaviour lives in the
 * SdkClient base (core/SdkClient.kt); this class binds the API-specific
 * entity accessors and the test-mode constructor.
 */
class BluefinDecryptxP2peSDK(options: MutableMap<String, Any?>?) : SdkClient(options) {

  constructor() : this(null)


  /**
   * Returns a attestation entity bound to this client.
   * Idiomatic usage: client.attestation(null).list(null, null) or
   * client.attestation(null).load(mutableMapOf("id" to ...), null).
   */
  fun attestation(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.AttestationEntity(this, entopts)
  }

  /**
   * Returns a client entity bound to this client.
   * Idiomatic usage: client.client(null).list(null, null) or
   * client.client(null).load(mutableMapOf("id" to ...), null).
   */
  fun client(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.ClientEntity(this, entopts)
  }

  /**
   * Returns a create_result entity bound to this client.
   * Idiomatic usage: client.createResult(null).list(null, null) or
   * client.createResult(null).load(mutableMapOf("id" to ...), null).
   */
  fun createResult(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.CreateResultEntity(this, entopts)
  }

  /**
   * Returns a decryption entity bound to this client.
   * Idiomatic usage: client.decryption(null).list(null, null) or
   * client.decryption(null).load(mutableMapOf("id" to ...), null).
   */
  fun decryption(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.DecryptionEntity(this, entopts)
  }

  /**
   * Returns a device entity bound to this client.
   * Idiomatic usage: client.device(null).list(null, null) or
   * client.device(null).load(mutableMapOf("id" to ...), null).
   */
  fun device(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.DeviceEntity(this, entopts)
  }

  /**
   * Returns a device_build entity bound to this client.
   * Idiomatic usage: client.deviceBuild(null).list(null, null) or
   * client.deviceBuild(null).load(mutableMapOf("id" to ...), null).
   */
  fun deviceBuild(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.DeviceBuildEntity(this, entopts)
  }

  /**
   * Returns a device_custody_detail entity bound to this client.
   * Idiomatic usage: client.deviceCustodyDetail(null).list(null, null) or
   * client.deviceCustodyDetail(null).load(mutableMapOf("id" to ...), null).
   */
  fun deviceCustodyDetail(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.DeviceCustodyDetailEntity(this, entopts)
  }

  /**
   * Returns a device_custody_list entity bound to this client.
   * Idiomatic usage: client.deviceCustodyList(null).list(null, null) or
   * client.deviceCustodyList(null).load(mutableMapOf("id" to ...), null).
   */
  fun deviceCustodyList(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.DeviceCustodyListEntity(this, entopts)
  }

  /**
   * Returns a device_list entity bound to this client.
   * Idiomatic usage: client.deviceList(null).list(null, null) or
   * client.deviceList(null).load(mutableMapOf("id" to ...), null).
   */
  fun deviceList(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.DeviceListEntity(this, entopts)
  }

  /**
   * Returns a device_receive_result entity bound to this client.
   * Idiomatic usage: client.deviceReceiveResult(null).list(null, null) or
   * client.deviceReceiveResult(null).load(mutableMapOf("id" to ...), null).
   */
  fun deviceReceiveResult(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.DeviceReceiveResultEntity(this, entopts)
  }

  /**
   * Returns a device_rki_activate_result entity bound to this client.
   * Idiomatic usage: client.deviceRkiActivateResult(null).list(null, null) or
   * client.deviceRkiActivateResult(null).load(mutableMapOf("id" to ...), null).
   */
  fun deviceRkiActivateResult(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.DeviceRkiActivateResultEntity(this, entopts)
  }

  /**
   * Returns a device_state entity bound to this client.
   * Idiomatic usage: client.deviceState(null).list(null, null) or
   * client.deviceState(null).load(mutableMapOf("id" to ...), null).
   */
  fun deviceState(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.DeviceStateEntity(this, entopts)
  }

  /**
   * Returns a device_type entity bound to this client.
   * Idiomatic usage: client.deviceType(null).list(null, null) or
   * client.deviceType(null).load(mutableMapOf("id" to ...), null).
   */
  fun deviceType(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.DeviceTypeEntity(this, entopts)
  }

  /**
   * Returns a inject_key entity bound to this client.
   * Idiomatic usage: client.injectKey(null).list(null, null) or
   * client.injectKey(null).load(mutableMapOf("id" to ...), null).
   */
  fun injectKey(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.InjectKeyEntity(this, entopts)
  }

  /**
   * Returns a kif entity bound to this client.
   * Idiomatic usage: client.kif(null).list(null, null) or
   * client.kif(null).load(mutableMapOf("id" to ...), null).
   */
  fun kif(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.KifEntity(this, entopts)
  }

  /**
   * Returns a location entity bound to this client.
   * Idiomatic usage: client.location(null).list(null, null) or
   * client.location(null).load(mutableMapOf("id" to ...), null).
   */
  fun location(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.LocationEntity(this, entopts)
  }

  /**
   * Returns a partner entity bound to this client.
   * Idiomatic usage: client.partner(null).list(null, null) or
   * client.partner(null).load(mutableMapOf("id" to ...), null).
   */
  fun partner(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.PartnerEntity(this, entopts)
  }

  /**
   * Returns a shipment entity bound to this client.
   * Idiomatic usage: client.shipment(null).list(null, null) or
   * client.shipment(null).load(mutableMapOf("id" to ...), null).
   */
  fun shipment(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.ShipmentEntity(this, entopts)
  }

  /**
   * Returns a success entity bound to this client.
   * Idiomatic usage: client.success(null).list(null, null) or
   * client.success(null).load(mutableMapOf("id" to ...), null).
   */
  fun success(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.SuccessEntity(this, entopts)
  }

  /**
   * Returns a transaction entity bound to this client.
   * Idiomatic usage: client.transaction(null).list(null, null) or
   * client.transaction(null).load(mutableMapOf("id" to ...), null).
   */
  fun transaction(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.TransactionEntity(this, entopts)
  }

  /**
   * Returns a update_result entity bound to this client.
   * Idiomatic usage: client.updateResult(null).list(null, null) or
   * client.updateResult(null).load(mutableMapOf("id" to ...), null).
   */
  fun updateResult(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.UpdateResultEntity(this, entopts)
  }

  /**
   * Returns a user entity bound to this client.
   * Idiomatic usage: client.user(null).list(null, null) or
   * client.user(null).load(mutableMapOf("id" to ...), null).
   */
  fun user(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefindecryptxp2pesdk.entity.UserEntity(this, entopts)
  }


  companion object {
    // testSDK builds a client in test mode: the test feature is activated,
    // installing the in-memory mock transport (no network activity).
    fun testSDK(): BluefinDecryptxP2peSDK = testSDK(null, null)

    fun testSDK(
      testopts: MutableMap<String, Any?>?,
      sdkopts: MutableMap<String, Any?>?,
    ): BluefinDecryptxP2peSDK {
      val sdk = BluefinDecryptxP2peSDK(testOptions(testopts, sdkopts))
      sdk.mode = "test"
      return sdk
    }
  }
}

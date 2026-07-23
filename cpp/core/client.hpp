// BluefinDecryptxP2pe SDK client. All transport and pipeline behaviour lives in the
// SdkClient base (core/types.hpp); this class binds the API-specific entity
// accessors and the test-mode constructor.

#ifndef SDK_CORE_CLIENT_HPP
#define SDK_CORE_CLIENT_HPP

#include <memory>

#include "../core/types.hpp"
#include "../entity/entities.hpp"

namespace sdk {

class BluefinDecryptxP2peSDK : public SdkClient {
public:
  explicit BluefinDecryptxP2peSDK(Value options = Value::undef()) : SdkClient(options) {}


  // Attestation entity bound to this client.
  std::shared_ptr<AttestationEntity> attestation(Value entopts = Value::undef()) {
    return std::make_shared<AttestationEntity>(this, entopts);
  }

  // Client entity bound to this client.
  std::shared_ptr<ClientEntity> client(Value entopts = Value::undef()) {
    return std::make_shared<ClientEntity>(this, entopts);
  }

  // CreateResult entity bound to this client.
  std::shared_ptr<CreateResultEntity> create_result(Value entopts = Value::undef()) {
    return std::make_shared<CreateResultEntity>(this, entopts);
  }

  // Decryption entity bound to this client.
  std::shared_ptr<DecryptionEntity> decryption(Value entopts = Value::undef()) {
    return std::make_shared<DecryptionEntity>(this, entopts);
  }

  // Device entity bound to this client.
  std::shared_ptr<DeviceEntity> device(Value entopts = Value::undef()) {
    return std::make_shared<DeviceEntity>(this, entopts);
  }

  // DeviceBuild entity bound to this client.
  std::shared_ptr<DeviceBuildEntity> device_build(Value entopts = Value::undef()) {
    return std::make_shared<DeviceBuildEntity>(this, entopts);
  }

  // DeviceCustodyDetail entity bound to this client.
  std::shared_ptr<DeviceCustodyDetailEntity> device_custody_detail(Value entopts = Value::undef()) {
    return std::make_shared<DeviceCustodyDetailEntity>(this, entopts);
  }

  // DeviceCustodyList entity bound to this client.
  std::shared_ptr<DeviceCustodyListEntity> device_custody_list(Value entopts = Value::undef()) {
    return std::make_shared<DeviceCustodyListEntity>(this, entopts);
  }

  // DeviceList entity bound to this client.
  std::shared_ptr<DeviceListEntity> device_list(Value entopts = Value::undef()) {
    return std::make_shared<DeviceListEntity>(this, entopts);
  }

  // DeviceReceiveResult entity bound to this client.
  std::shared_ptr<DeviceReceiveResultEntity> device_receive_result(Value entopts = Value::undef()) {
    return std::make_shared<DeviceReceiveResultEntity>(this, entopts);
  }

  // DeviceRkiActivateResult entity bound to this client.
  std::shared_ptr<DeviceRkiActivateResultEntity> device_rki_activate_result(Value entopts = Value::undef()) {
    return std::make_shared<DeviceRkiActivateResultEntity>(this, entopts);
  }

  // DeviceState entity bound to this client.
  std::shared_ptr<DeviceStateEntity> device_state(Value entopts = Value::undef()) {
    return std::make_shared<DeviceStateEntity>(this, entopts);
  }

  // DeviceType entity bound to this client.
  std::shared_ptr<DeviceTypeEntity> device_type(Value entopts = Value::undef()) {
    return std::make_shared<DeviceTypeEntity>(this, entopts);
  }

  // InjectKey entity bound to this client.
  std::shared_ptr<InjectKeyEntity> inject_key(Value entopts = Value::undef()) {
    return std::make_shared<InjectKeyEntity>(this, entopts);
  }

  // Kif entity bound to this client.
  std::shared_ptr<KifEntity> kif(Value entopts = Value::undef()) {
    return std::make_shared<KifEntity>(this, entopts);
  }

  // Location entity bound to this client.
  std::shared_ptr<LocationEntity> location(Value entopts = Value::undef()) {
    return std::make_shared<LocationEntity>(this, entopts);
  }

  // Partner entity bound to this client.
  std::shared_ptr<PartnerEntity> partner(Value entopts = Value::undef()) {
    return std::make_shared<PartnerEntity>(this, entopts);
  }

  // Shipment entity bound to this client.
  std::shared_ptr<ShipmentEntity> shipment(Value entopts = Value::undef()) {
    return std::make_shared<ShipmentEntity>(this, entopts);
  }

  // Success entity bound to this client.
  std::shared_ptr<SuccessEntity> success(Value entopts = Value::undef()) {
    return std::make_shared<SuccessEntity>(this, entopts);
  }

  // Transaction entity bound to this client.
  std::shared_ptr<TransactionEntity> transaction(Value entopts = Value::undef()) {
    return std::make_shared<TransactionEntity>(this, entopts);
  }

  // UpdateResult entity bound to this client.
  std::shared_ptr<UpdateResultEntity> update_result(Value entopts = Value::undef()) {
    return std::make_shared<UpdateResultEntity>(this, entopts);
  }

  // User entity bound to this client.
  std::shared_ptr<UserEntity> user(Value entopts = Value::undef()) {
    return std::make_shared<UserEntity>(this, entopts);
  }


  // testSDK builds a client in test mode: the test feature is activated,
  // installing the in-memory mock transport (no network activity).
  static std::shared_ptr<BluefinDecryptxP2peSDK> testSDK() {
    return testSDK(Value::undef(), Value::undef());
  }

  static std::shared_ptr<BluefinDecryptxP2peSDK> testSDK(Value testopts, Value sdkopts) {
    auto sdk = std::make_shared<BluefinDecryptxP2peSDK>(SdkClient::testOptions(testopts, sdkopts));
    sdk->mode = "test";
    return sdk;
  }

  // Convenience no-arg constructor.
  static std::shared_ptr<BluefinDecryptxP2peSDK> create() {
    return std::make_shared<BluefinDecryptxP2peSDK>(Value::undef());
  }
};

using BluefinDecryptxP2peSDKPtr = std::shared_ptr<BluefinDecryptxP2peSDK>;

} // namespace sdk

#endif // SDK_CORE_CLIENT_HPP

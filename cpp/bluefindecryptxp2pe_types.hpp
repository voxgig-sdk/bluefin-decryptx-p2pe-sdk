// Typed reference models for the BluefinDecryptxP2pe SDK (C++).
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params. The C++ SDK runtime is Value-based, so these structs are
// DOCUMENTATION / convenience types only — the SDK neither includes nor
// requires this header. Array fields surface as std::vector<Value>, object
// fields as std::map<std::string, Value>, and any/null fields as sdk::Value.
// Optional (req:false) members are flagged with a trailing "// optional"
// comment. Do not edit by hand.

#ifndef SDK_BLUEFINDECRYPTXP2PE_TYPES_HPP
#define SDK_BLUEFINDECRYPTXP2PE_TYPES_HPP

#include <cstdint>
#include <map>
#include <string>
#include <vector>

#include "core/types.hpp"

namespace sdk {
namespace types {

struct Attestation {
  std::map<std::string, Value> client;  // optional
  std::string completeDate;  // optional
  std::string created;  // optional
  std::map<std::string, Value> device;  // optional
  std::vector<Value> devices;
  std::string id;  // optional
  std::string name;  // optional
  std::string notes;  // optional
};

struct AttestationLoadMatch {
  std::string id;
};

struct AttestationListMatch {
  std::string client;
  int64_t skip;  // optional
  int64_t take;  // optional
};

struct AttestationCreateData {
  std::map<std::string, Value> client;  // optional
  std::string completeDate;  // optional
  std::string created;  // optional
  std::map<std::string, Value> device;  // optional
  std::vector<Value> devices;
  std::string id;  // optional
  std::string name;  // optional
  std::string notes;  // optional
};

struct Client {
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  std::map<std::string, Value> directPartner;  // optional
  std::string id;  // optional
  bool isActive;  // optional
  std::map<std::string, Value> location;
  std::string mid;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::map<std::string, Value> partner;  // optional
  int64_t version;  // optional
};

struct ClientLoadMatch {
  std::string id;
};

struct ClientListMatch {
  std::string partner;
  int64_t skip;  // optional
  int64_t take;  // optional
};

struct ClientCreateData {
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  std::map<std::string, Value> directPartner;  // optional
  std::string id;  // optional
  bool isActive;  // optional
  std::map<std::string, Value> location;
  std::string mid;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::map<std::string, Value> partner;  // optional
  int64_t version;  // optional
};

struct ClientRemoveMatch {
  std::string id;
};

struct CreateResult {
  std::string completeDate;  // optional
  std::map<std::string, Value> custodian;
  std::map<std::string, Value> location;
  std::string notes;  // optional
};

struct CreateResultCreateData {
  std::string device_type;
  std::string serial_number;
  std::string completeDate;  // optional
  std::map<std::string, Value> custodian;
  std::map<std::string, Value> location;
  std::string notes;  // optional
};

struct Decryption {
  std::string cbcVector;  // optional
  std::string deviceType;
  std::string encoding;  // optional
  std::vector<Value> encrypted;
  std::string hasCcData;  // optional
  std::string reference;  // optional
  std::string sequenceNumber;  // optional
  std::string serialNumber;
  bool success;  // optional
};

struct DecryptionCreateData {
  std::string cbcVector;  // optional
  std::string deviceType;
  std::string encoding;  // optional
  std::vector<Value> encrypted;
  std::string hasCcData;  // optional
  std::string reference;  // optional
  std::string sequenceNumber;  // optional
  std::string serialNumber;
  bool success;  // optional
};

struct Device {
  std::map<std::string, Value> activatedBy;
  std::string activationDate;  // optional
  std::string alternateKey;  // optional
  std::string auditNextDate;  // optional
  std::string auditNotificationDate;  // optional
  std::map<std::string, Value> client;  // optional
  std::string created;  // optional
  std::map<std::string, Value> createdBy;
  std::map<std::string, Value> deviceBuild;  // optional
  std::map<std::string, Value> deviceState;  // optional
  std::map<std::string, Value> deviceType;  // optional
  int64_t errorCounter;  // optional
  std::string errorLastDate;  // optional
  std::string id;  // optional
  std::map<std::string, Value> initializedBy;
  std::string initializedDate;  // optional
  std::map<std::string, Value> injectKey;  // optional
  bool isVirtual;  // optional
  std::map<std::string, Value> kif;  // optional
  std::string lastActivityDate;  // optional
  std::map<std::string, Value> location;
  std::string modified;  // optional
  std::map<std::string, Value> modifiedBy;
  std::string name;  // optional
  std::string notes;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string serialNumber;  // optional
  int64_t version;  // optional
};

struct DeviceLoadMatch {
  std::string id;
};

struct DeviceListMatch {
  std::string client;  // optional
  std::string device_state;  // optional
  std::string kif;  // optional
  std::string partner;  // optional
  std::string serial_number;  // optional
  int64_t skip;  // optional
  std::string sorting_direction;  // optional
  std::string sorting_field;  // optional
  int64_t take;  // optional
};

struct DeviceCreateData {
  std::map<std::string, Value> activatedBy;
  std::string activationDate;  // optional
  std::string alternateKey;  // optional
  std::string auditNextDate;  // optional
  std::string auditNotificationDate;  // optional
  std::map<std::string, Value> client;  // optional
  std::string created;  // optional
  std::map<std::string, Value> createdBy;
  std::map<std::string, Value> deviceBuild;  // optional
  std::map<std::string, Value> deviceState;  // optional
  std::map<std::string, Value> deviceType;  // optional
  int64_t errorCounter;  // optional
  std::string errorLastDate;  // optional
  std::string id;  // optional
  std::map<std::string, Value> initializedBy;
  std::string initializedDate;  // optional
  std::map<std::string, Value> injectKey;  // optional
  bool isVirtual;  // optional
  std::map<std::string, Value> kif;  // optional
  std::string lastActivityDate;  // optional
  std::map<std::string, Value> location;
  std::string modified;  // optional
  std::map<std::string, Value> modifiedBy;
  std::string name;  // optional
  std::string notes;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string serialNumber;  // optional
  int64_t version;  // optional
};

struct DeviceBuild {
  std::string appVersion;  // optional
  std::string buildNumber;  // optional
  std::string configFileName;  // optional
  std::string created;  // optional
  std::string deviceType;  // optional
  std::string firmwareVersion;  // optional
  std::string hardwareVersion;  // optional
  int64_t id;  // optional
  bool isActive;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::string notes;  // optional
  int64_t version;  // optional
  std::string whiteListingBinRanges;  // optional
  bool whiteListingUsed;  // optional
};

struct DeviceBuildLoadMatch {
  std::string id;
};

struct DeviceBuildListMatch {
  std::string device_type;  // optional
  int64_t skip;  // optional
  int64_t take;  // optional
};

struct DeviceCustodyDetail {
  std::string completeDate;  // optional
  std::string created;  // optional
  std::map<std::string, Value> createdBy;
  std::map<std::string, Value> custodian;
  std::map<std::string, Value> device;  // optional
  int64_t id;  // optional
  std::map<std::string, Value> location;
  std::string modified;  // optional
  std::map<std::string, Value> modifiedBy;
  std::string notes;  // optional
  std::map<std::string, Value> status;  // optional
  std::map<std::string, Value> transferMethod;  // optional
  int64_t version;  // optional
};

struct DeviceCustodyDetailLoadMatch {
  std::string device_type;
  std::string id;
  std::string serial_number;
};

struct DeviceCustodyListItem {
  std::string completeDate;  // optional
  std::string created;  // optional
  std::map<std::string, Value> createdBy;
  std::map<std::string, Value> custodian;
  std::map<std::string, Value> device;  // optional
  int64_t id;  // optional
  std::map<std::string, Value> location;
  std::string modified;  // optional
  std::map<std::string, Value> modifiedBy;
  std::string notes;  // optional
  std::map<std::string, Value> status;  // optional
  std::map<std::string, Value> transferMethod;  // optional
  int64_t version;  // optional
};

struct DeviceCustodyListItemListMatch {
  std::string device_type;
  std::string serial_number;
  int64_t skip;  // optional
  int64_t take;  // optional
};

struct DeviceReceiveResult {
  std::string serialNumber;
  bool success;
  std::string tamperLabel;
};

struct DeviceReceiveResultCreateData {
  std::string serialNumber;
  bool success;
  std::string tamperLabel;
};

struct DeviceRkiActivateResult {
  std::string appVersion;  // optional
  std::string buildName;  // optional
  std::string buildNumber;  // optional
  std::string configFile;  // optional
  std::string firmwareVersion;  // optional
  std::string hardwareVersion;  // optional
  std::string serialNumber;
  bool success;
  std::string whiteListingBinRanges;  // optional
};

struct DeviceRkiActivateResultCreateData {
  std::string appVersion;  // optional
  std::string buildName;  // optional
  std::string buildNumber;  // optional
  std::string configFile;  // optional
  std::string firmwareVersion;  // optional
  std::string hardwareVersion;  // optional
  std::string serialNumber;
  bool success;
  std::string whiteListingBinRanges;  // optional
};

struct DeviceState {
  int64_t id;  // optional
  std::string name;  // optional
};

struct DeviceStateListMatch {
  int64_t id;  // optional
  std::string name;  // optional
};

struct DeviceType {
  std::string created;  // optional
  std::string deviceTypeMode;  // optional
  std::string hardwareVersion;  // optional
  std::string id;  // optional
  bool isActive;  // optional
  std::string manufacturer;  // optional
  std::string model;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::string photoUrl;  // optional
  std::string productName;  // optional
  int64_t version;  // optional
};

struct DeviceTypeLoadMatch {
  std::string id;
};

struct DeviceTypeListMatch {
  std::string created;  // optional
  std::string deviceTypeMode;  // optional
  std::string hardwareVersion;  // optional
  std::string id;  // optional
  bool isActive;  // optional
  std::string manufacturer;  // optional
  std::string model;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::string photoUrl;  // optional
  std::string productName;  // optional
  int64_t version;  // optional
};

struct InjectKey {
  std::string created;  // optional
  std::string id;  // optional
  bool isActive;  // optional
  bool isP2PE;  // optional
  std::string keyType;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  int64_t version;  // optional
};

struct InjectKeyLoadMatch {
  std::string id;
};

struct InjectKeyListMatch {
  std::string created;  // optional
  std::string id;  // optional
  bool isActive;  // optional
  bool isP2PE;  // optional
  std::string keyType;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  int64_t version;  // optional
};

struct Kif {
  int64_t id;  // optional
  std::string name;  // optional
};

struct KifListMatch {
  int64_t id;  // optional
  std::string name;  // optional
};

struct Location {
  std::string address1;  // optional
  std::string address2;  // optional
  std::string billingId;  // optional
  std::string city;  // optional
  std::map<std::string, Value> client;  // optional
  std::string country;  // optional
  std::string created;  // optional
  std::string customReference;  // optional
  std::string id;  // optional
  std::string locationType;  // optional
  std::string mailAddress1;  // optional
  std::string mailAddress2;  // optional
  std::string mailCity;  // optional
  std::string mailCountry;  // optional
  std::string mailPostalCode;  // optional
  std::string mailStateProvince;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::string nameOfBusiness;  // optional
  std::string notes;  // optional
  std::string postalCode;  // optional
  std::string stateProvince;  // optional
  std::string uniqueId;  // optional
  int64_t version;  // optional
};

struct LocationLoadMatch {
  std::string id;
};

struct LocationListMatch {
  std::string client;
  int64_t skip;  // optional
  int64_t take;  // optional
};

struct LocationCreateData {
  std::string address1;  // optional
  std::string address2;  // optional
  std::string billingId;  // optional
  std::string city;  // optional
  std::map<std::string, Value> client;  // optional
  std::string country;  // optional
  std::string created;  // optional
  std::string customReference;  // optional
  std::string id;  // optional
  std::string locationType;  // optional
  std::string mailAddress1;  // optional
  std::string mailAddress2;  // optional
  std::string mailCity;  // optional
  std::string mailCountry;  // optional
  std::string mailPostalCode;  // optional
  std::string mailStateProvince;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::string nameOfBusiness;  // optional
  std::string notes;  // optional
  std::string postalCode;  // optional
  std::string stateProvince;  // optional
  std::string uniqueId;  // optional
  int64_t version;  // optional
};

struct LocationRemoveMatch {
  std::string id;
};

struct Partner {
  std::string billingId;  // optional
  bool clientCanOrderEquipment;  // optional
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  std::string id;  // optional
  bool isActive;  // optional
  std::map<std::string, Value> location;
  std::string modified;  // optional
  std::string name;  // optional
  std::map<std::string, Value> parent;  // optional
  std::string partnerId;  // optional
  std::string reference;  // optional
  std::string verificationPhrase;  // optional
  int64_t version;  // optional
};

struct PartnerLoadMatch {
  std::string id;
};

struct PartnerListMatch {
  std::string partner;  // optional
  int64_t skip;  // optional
  int64_t take;  // optional
};

struct PartnerCreateData {
  std::string billingId;  // optional
  bool clientCanOrderEquipment;  // optional
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  std::string id;  // optional
  bool isActive;  // optional
  std::map<std::string, Value> location;
  std::string modified;  // optional
  std::string name;  // optional
  std::map<std::string, Value> parent;  // optional
  std::string partnerId;  // optional
  std::string reference;  // optional
  std::string verificationPhrase;  // optional
  int64_t version;  // optional
};

struct Shipment {
  std::string carrier;  // optional
  std::map<std::string, Value> client;  // optional
  std::string created;  // optional
  std::string dateReceived;  // optional
  std::string dateShipped;  // optional
  std::map<std::string, Value> dcKif;  // optional
  std::string id;  // optional
  std::vector<Value> items;  // optional
  std::map<std::string, Value> kif;  // optional
  std::map<std::string, Value> location;
  std::string modified;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string shipmentType;  // optional
  std::string tracking;  // optional
  int64_t version;  // optional
};

struct ShipmentLoadMatch {
  std::string id;
};

struct ShipmentListMatch {
  std::string kif;
  std::string mode;  // optional
  int64_t skip;  // optional
  int64_t take;  // optional
};

struct ShipmentCreateData {
  std::string carrier;  // optional
  std::map<std::string, Value> client;  // optional
  std::string created;  // optional
  std::string dateReceived;  // optional
  std::string dateShipped;  // optional
  std::map<std::string, Value> dcKif;  // optional
  std::string id;  // optional
  std::vector<Value> items;  // optional
  std::map<std::string, Value> kif;  // optional
  std::map<std::string, Value> location;
  std::string modified;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string shipmentType;  // optional
  std::string tracking;  // optional
  int64_t version;  // optional
};

struct Success {
  std::vector<Value> devices;
  std::map<std::string, Value> sharePartnerFrom;
  bool success;  // optional
};

struct SuccessCreateData {
  std::string share_partner_to;
  std::vector<Value> devices;
  std::map<std::string, Value> sharePartnerFrom;
  bool success;  // optional
};

struct SuccessRemoveMatch {
  std::string share_partner_to;
};

struct Transaction {
  std::string alternateKey;  // optional
  std::map<std::string, Value> client;  // optional
  std::string clientRef;  // optional
  std::string created;  // optional
  int64_t decrypted;  // optional
  std::map<std::string, Value> device;
  std::string deviceName;  // optional
  std::map<std::string, Value> directPartner;  // optional
  int64_t encrypted;  // optional
  std::string endDate;  // optional
  std::string errCode;  // optional
  std::string errMessage;  // optional
  std::string id;  // optional
  std::string ipAddress;  // optional
  bool isVirtual;  // optional
  std::string keyType;  // optional
  std::map<std::string, Value> location;
  std::string messageId;  // optional
  std::string method;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string reference;  // optional
  std::string serialNumber;  // optional
  std::string startDate;  // optional
  bool success;  // optional
  std::string transactionSource;  // optional
};

struct TransactionLoadMatch {
  std::string id;
};

struct TransactionListMatch {
  std::string client;  // optional
  std::string client_ref;  // optional
  std::string date_from;  // optional
  std::string date_to;  // optional
  std::string location;  // optional
  std::string message_id;  // optional
  std::string paging_mode;  // optional
  std::string partner;  // optional
  std::string reference;  // optional
  std::string serial_number;  // optional
  int64_t skip;  // optional
  bool success;  // optional
  int64_t take;  // optional
};

struct TransactionCreateData {
  std::string alternateKey;  // optional
  std::map<std::string, Value> client;  // optional
  std::string clientRef;  // optional
  std::string created;  // optional
  int64_t decrypted;  // optional
  std::map<std::string, Value> device;
  std::string deviceName;  // optional
  std::map<std::string, Value> directPartner;  // optional
  int64_t encrypted;  // optional
  std::string endDate;  // optional
  std::string errCode;  // optional
  std::string errMessage;  // optional
  std::string id;  // optional
  std::string ipAddress;  // optional
  bool isVirtual;  // optional
  std::string keyType;  // optional
  std::map<std::string, Value> location;
  std::string messageId;  // optional
  std::string method;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string reference;  // optional
  std::string serialNumber;  // optional
  std::string startDate;  // optional
  bool success;  // optional
  std::string transactionSource;  // optional
};

struct UpdateResult {
  std::string address1;  // optional
  std::string address2;  // optional
  std::string alternateKey;  // optional
  std::string auditNextDate;  // optional
  std::string billingId;  // optional
  std::string city;  // optional
  std::map<std::string, Value> client;  // optional
  bool clientCanOrderEquipment;  // optional
  std::string clientRef;  // optional
  std::map<std::string, Value> contact;
  std::map<std::string, Value> country;  // optional
  std::string customReference;  // optional
  std::string dateShipped;  // optional
  int64_t decrypted;  // optional
  std::map<std::string, Value> device;  // optional
  std::map<std::string, Value> deviceBuild;  // optional
  std::map<std::string, Value> deviceType;  // optional
  std::map<std::string, Value> directPartner;  // optional
  std::string email;
  int64_t encrypted;  // optional
  std::string endDate;  // optional
  std::string errCode;  // optional
  std::string errMessage;  // optional
  std::string firstName;
  std::string id;  // optional
  std::map<std::string, Value> injectKey;  // optional
  std::string ipAddress;  // optional
  bool isActive;
  std::vector<Value> items;  // optional
  std::string keyType;  // optional
  std::map<std::string, Value> kif;  // optional
  std::string lastName;
  std::map<std::string, Value> location;
  std::string locationType;  // optional
  std::string mailAddress1;  // optional
  std::string mailAddress2;  // optional
  std::string mailCity;  // optional
  std::string mailCountry;  // optional
  std::string mailPostalCode;  // optional
  std::string mailStateProvince;  // optional
  std::string messageId;  // optional
  std::string method;  // optional
  std::string mid;  // optional
  std::string name;  // optional
  std::string nameOfBusiness;  // optional
  std::string notes;  // optional
  std::map<std::string, Value> parent;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string partnerId;  // optional
  std::string phone;
  std::string postalCode;  // optional
  std::string reference;  // optional
  bool sendWelcomeEmail;  // optional
  std::string serialNumber;  // optional
  std::string startDate;  // optional
  std::string stateProvince;  // optional
  bool success;  // optional
  std::string tracking;  // optional
  std::string uniqueId;  // optional
  std::string userName;
  std::map<std::string, Value> userRole;
  std::string verificationPhrase;  // optional
  int64_t version;  // optional
};

struct UpdateResultListMatch {
  std::string client;  // optional
  std::string kif;  // optional
  Value partner;  // optional
  int64_t skip;  // optional
  int64_t take;  // optional
};

struct UpdateResultCreateData {
  std::string address1;  // optional
  std::string address2;  // optional
  std::string alternateKey;  // optional
  std::string auditNextDate;  // optional
  std::string billingId;  // optional
  std::string city;  // optional
  std::map<std::string, Value> client;  // optional
  bool clientCanOrderEquipment;  // optional
  std::string clientRef;  // optional
  std::map<std::string, Value> contact;
  std::map<std::string, Value> country;  // optional
  std::string customReference;  // optional
  std::string dateShipped;  // optional
  int64_t decrypted;  // optional
  std::map<std::string, Value> device;  // optional
  std::map<std::string, Value> deviceBuild;  // optional
  std::map<std::string, Value> deviceType;  // optional
  std::map<std::string, Value> directPartner;  // optional
  std::string email;
  int64_t encrypted;  // optional
  std::string endDate;  // optional
  std::string errCode;  // optional
  std::string errMessage;  // optional
  std::string firstName;
  std::string id;  // optional
  std::map<std::string, Value> injectKey;  // optional
  std::string ipAddress;  // optional
  bool isActive;
  std::vector<Value> items;  // optional
  std::string keyType;  // optional
  std::map<std::string, Value> kif;  // optional
  std::string lastName;
  std::map<std::string, Value> location;
  std::string locationType;  // optional
  std::string mailAddress1;  // optional
  std::string mailAddress2;  // optional
  std::string mailCity;  // optional
  std::string mailCountry;  // optional
  std::string mailPostalCode;  // optional
  std::string mailStateProvince;  // optional
  std::string messageId;  // optional
  std::string method;  // optional
  std::string mid;  // optional
  std::string name;  // optional
  std::string nameOfBusiness;  // optional
  std::string notes;  // optional
  std::map<std::string, Value> parent;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string partnerId;  // optional
  std::string phone;
  std::string postalCode;  // optional
  std::string reference;  // optional
  bool sendWelcomeEmail;  // optional
  std::string serialNumber;  // optional
  std::string startDate;  // optional
  std::string stateProvince;  // optional
  bool success;  // optional
  std::string tracking;  // optional
  std::string uniqueId;  // optional
  std::string userName;
  std::map<std::string, Value> userRole;
  std::string verificationPhrase;  // optional
  int64_t version;  // optional
};

struct UpdateResultUpdateData {
  std::string id;
  std::string address1;  // optional
  std::string address2;  // optional
  std::string alternateKey;  // optional
  std::string auditNextDate;  // optional
  std::string billingId;  // optional
  std::string city;  // optional
  std::map<std::string, Value> client;  // optional
  bool clientCanOrderEquipment;  // optional
  std::string clientRef;  // optional
  std::map<std::string, Value> contact;  // optional
  std::map<std::string, Value> country;  // optional
  std::string customReference;  // optional
  std::string dateShipped;  // optional
  int64_t decrypted;  // optional
  std::map<std::string, Value> device;  // optional
  std::map<std::string, Value> deviceBuild;  // optional
  std::map<std::string, Value> deviceType;  // optional
  std::map<std::string, Value> directPartner;  // optional
  std::string email;  // optional
  int64_t encrypted;  // optional
  std::string endDate;  // optional
  std::string errCode;  // optional
  std::string errMessage;  // optional
  std::string firstName;  // optional
  std::map<std::string, Value> injectKey;  // optional
  std::string ipAddress;  // optional
  bool isActive;  // optional
  std::vector<Value> items;  // optional
  std::string keyType;  // optional
  std::map<std::string, Value> kif;  // optional
  std::string lastName;  // optional
  std::map<std::string, Value> location;  // optional
  std::string locationType;  // optional
  std::string mailAddress1;  // optional
  std::string mailAddress2;  // optional
  std::string mailCity;  // optional
  std::string mailCountry;  // optional
  std::string mailPostalCode;  // optional
  std::string mailStateProvince;  // optional
  std::string messageId;  // optional
  std::string method;  // optional
  std::string mid;  // optional
  std::string name;  // optional
  std::string nameOfBusiness;  // optional
  std::string notes;  // optional
  std::map<std::string, Value> parent;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string partnerId;  // optional
  std::string phone;  // optional
  std::string postalCode;  // optional
  std::string reference;  // optional
  bool sendWelcomeEmail;  // optional
  std::string serialNumber;  // optional
  std::string startDate;  // optional
  std::string stateProvince;  // optional
  bool success;  // optional
  std::string tracking;  // optional
  std::string uniqueId;  // optional
  std::string userName;  // optional
  std::map<std::string, Value> userRole;  // optional
  std::string verificationPhrase;  // optional
  int64_t version;  // optional
};

struct User {
  std::map<std::string, Value> client;  // optional
  std::string created;  // optional
  std::string email;  // optional
  std::string firstName;  // optional
  std::string id;  // optional
  bool isActive;  // optional
  std::map<std::string, Value> kif;  // optional
  std::string lastName;  // optional
  std::string modified;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string phone;  // optional
  std::string userName;  // optional
  std::map<std::string, Value> userRole;  // optional
  int64_t version;  // optional
};

struct UserLoadMatch {
  std::string id;
};

struct UserRemoveMatch {
  std::string id;
};

struct VirtualDevice {
  std::vector<Value> data;  // optional
  std::string id;  // optional
  int64_t total;  // optional
};

struct VirtualDeviceLoadMatch {
  std::string id;
  int64_t skip;  // optional
  std::string sorting_direction;  // optional
  std::string sorting_field;  // optional
  int64_t take;  // optional
};

} // namespace types
} // namespace sdk

#endif // SDK_BLUEFINDECRYPTXP2PE_TYPES_HPP

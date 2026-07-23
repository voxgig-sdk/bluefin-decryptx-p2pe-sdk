// Typed reference models for the BluefinDecryptxP2pe SDK (C++).
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
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
  std::string complete_date;  // optional
  std::string created;  // optional
  std::map<std::string, Value> device;  // optional
  std::string id;  // optional
  std::string name;  // optional
  std::string note;  // optional
};

struct AttestationLoadMatch {
  std::string id;
};

struct AttestationListMatch {
  std::map<std::string, Value> client;  // optional
  std::string complete_date;  // optional
  std::string created;  // optional
  std::map<std::string, Value> device;  // optional
  std::string id;  // optional
  std::string name;  // optional
  std::string note;  // optional
};

struct AttestationCreateData {
  std::map<std::string, Value> client;  // optional
  std::string complete_date;  // optional
  std::string created;  // optional
  std::map<std::string, Value> device;  // optional
  std::string id;  // optional
  std::string name;  // optional
  std::string note;  // optional
};

struct Client {
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  std::map<std::string, Value> direct_partner;  // optional
  std::string id;  // optional
  bool is_active;  // optional
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
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  std::map<std::string, Value> direct_partner;  // optional
  std::string id;  // optional
  bool is_active;  // optional
  std::map<std::string, Value> location;  // optional
  std::string mid;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::map<std::string, Value> partner;  // optional
  int64_t version;  // optional
};

struct ClientCreateData {
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  std::map<std::string, Value> direct_partner;  // optional
  std::string id;  // optional
  bool is_active;  // optional
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

struct CreateResult {};

struct CreateResultCreateData {
  std::string device_type;
  std::string serial_number;
};

struct Decryption {
  bool success;  // optional
};

struct DecryptionCreateData {
  bool success;  // optional
};

struct Device {
  std::map<std::string, Value> activated_by;
  std::string activation_date;  // optional
  std::string alternate_key;  // optional
  std::string audit_next_date;  // optional
  std::string audit_notification_date;  // optional
  std::map<std::string, Value> client;  // optional
  std::string created;  // optional
  std::map<std::string, Value> created_by;
  std::map<std::string, Value> device_build;  // optional
  std::map<std::string, Value> device_state;  // optional
  std::map<std::string, Value> device_type;  // optional
  int64_t error_counter;  // optional
  std::string error_last_date;  // optional
  std::string id;  // optional
  std::map<std::string, Value> initialized_by;
  std::string initialized_date;  // optional
  std::map<std::string, Value> inject_key;  // optional
  bool is_virtual;  // optional
  std::map<std::string, Value> kif;  // optional
  std::string last_activity_date;  // optional
  std::map<std::string, Value> location;
  std::string modified;  // optional
  std::map<std::string, Value> modified_by;
  std::string name;  // optional
  std::string note;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string serial_number;  // optional
  int64_t version;  // optional
};

struct DeviceLoadMatch {
  std::string device_type;  // optional
  std::string serial_number;  // optional
  std::string id;  // optional
};

struct DeviceListMatch {
  std::map<std::string, Value> activated_by;  // optional
  std::string activation_date;  // optional
  std::string alternate_key;  // optional
  std::string audit_next_date;  // optional
  std::string audit_notification_date;  // optional
  std::map<std::string, Value> client;  // optional
  std::string created;  // optional
  std::map<std::string, Value> created_by;  // optional
  std::map<std::string, Value> device_build;  // optional
  std::map<std::string, Value> device_state;  // optional
  std::map<std::string, Value> device_type;  // optional
  int64_t error_counter;  // optional
  std::string error_last_date;  // optional
  std::string id;  // optional
  std::map<std::string, Value> initialized_by;  // optional
  std::string initialized_date;  // optional
  std::map<std::string, Value> inject_key;  // optional
  bool is_virtual;  // optional
  std::map<std::string, Value> kif;  // optional
  std::string last_activity_date;  // optional
  std::map<std::string, Value> location;  // optional
  std::string modified;  // optional
  std::map<std::string, Value> modified_by;  // optional
  std::string name;  // optional
  std::string note;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string serial_number;  // optional
  int64_t version;  // optional
};

struct DeviceCreateData {
  std::map<std::string, Value> activated_by;
  std::string activation_date;  // optional
  std::string alternate_key;  // optional
  std::string audit_next_date;  // optional
  std::string audit_notification_date;  // optional
  std::map<std::string, Value> client;  // optional
  std::string created;  // optional
  std::map<std::string, Value> created_by;
  std::map<std::string, Value> device_build;  // optional
  std::map<std::string, Value> device_state;  // optional
  std::map<std::string, Value> device_type;  // optional
  int64_t error_counter;  // optional
  std::string error_last_date;  // optional
  std::string id;  // optional
  std::map<std::string, Value> initialized_by;
  std::string initialized_date;  // optional
  std::map<std::string, Value> inject_key;  // optional
  bool is_virtual;  // optional
  std::map<std::string, Value> kif;  // optional
  std::string last_activity_date;  // optional
  std::map<std::string, Value> location;
  std::string modified;  // optional
  std::map<std::string, Value> modified_by;
  std::string name;  // optional
  std::string note;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string serial_number;  // optional
  int64_t version;  // optional
};

struct DeviceBuild {
  std::string app_version;  // optional
  std::string build_number;  // optional
  std::string config_file_name;  // optional
  std::string created;  // optional
  std::string device_type;  // optional
  std::string firmware_version;  // optional
  std::string hardware_version;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::string note;  // optional
  int64_t version;  // optional
  std::string white_listing_bin_range;  // optional
  bool white_listing_used;  // optional
};

struct DeviceBuildLoadMatch {
  std::string id;
};

struct DeviceBuildListMatch {
  std::string app_version;  // optional
  std::string build_number;  // optional
  std::string config_file_name;  // optional
  std::string created;  // optional
  std::string device_type;  // optional
  std::string firmware_version;  // optional
  std::string hardware_version;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::string note;  // optional
  int64_t version;  // optional
  std::string white_listing_bin_range;  // optional
  bool white_listing_used;  // optional
};

struct DeviceCustodyDetail {
  std::string complete_date;  // optional
  std::string created;  // optional
  std::map<std::string, Value> created_by;
  std::map<std::string, Value> custodian;
  std::map<std::string, Value> device;  // optional
  int64_t id;  // optional
  std::map<std::string, Value> location;
  std::string modified;  // optional
  std::map<std::string, Value> modified_by;
  std::string note;  // optional
  std::map<std::string, Value> status;  // optional
  std::map<std::string, Value> transfer_method;  // optional
  int64_t version;  // optional
};

struct DeviceCustodyDetailLoadMatch {
  std::string device_type;
  std::string id;
  std::string serial_number;
};

struct DeviceCustodyList {
  std::string complete_date;  // optional
  std::string created;  // optional
  std::map<std::string, Value> created_by;
  std::map<std::string, Value> custodian;
  std::map<std::string, Value> device;  // optional
  int64_t id;  // optional
  std::map<std::string, Value> location;
  std::string modified;  // optional
  std::map<std::string, Value> modified_by;
  std::string note;  // optional
  std::map<std::string, Value> status;  // optional
  std::map<std::string, Value> transfer_method;  // optional
  int64_t version;  // optional
};

struct DeviceCustodyListListMatch {
  std::string device_type;
  std::string serial_number;
};

struct DeviceList {
  std::vector<Value> data;  // optional
  int64_t total;  // optional
};

struct DeviceListLoadMatch {
  std::string share_partner_to;
};

struct DeviceReceiveResult {
  bool success;
};

struct DeviceReceiveResultCreateData {
  bool success;
};

struct DeviceRkiActivateResult {
  bool success;
};

struct DeviceRkiActivateResultCreateData {
  bool success;
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
  std::string device_type_mode;  // optional
  std::string hardware_version;  // optional
  std::string id;  // optional
  bool is_active;  // optional
  std::string manufacturer;  // optional
  std::string model;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::string photo_url;  // optional
  std::string product_name;  // optional
  int64_t version;  // optional
};

struct DeviceTypeLoadMatch {
  std::string id;
};

struct DeviceTypeListMatch {
  std::string created;  // optional
  std::string device_type_mode;  // optional
  std::string hardware_version;  // optional
  std::string id;  // optional
  bool is_active;  // optional
  std::string manufacturer;  // optional
  std::string model;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::string photo_url;  // optional
  std::string product_name;  // optional
  int64_t version;  // optional
};

struct InjectKey {
  std::string created;  // optional
  std::string id;  // optional
  bool is_active;  // optional
  bool is_p2_pe;  // optional
  std::string key_type;  // optional
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
  bool is_active;  // optional
  bool is_p2_pe;  // optional
  std::string key_type;  // optional
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
  std::string billing_id;  // optional
  std::string city;  // optional
  std::string country;  // optional
  std::string created;  // optional
  std::string custom_reference;  // optional
  std::string id;  // optional
  std::string location_type;  // optional
  std::string mail_address1;  // optional
  std::string mail_address2;  // optional
  std::string mail_city;  // optional
  std::string mail_country;  // optional
  std::string mail_postal_code;  // optional
  std::string mail_state_province;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::string name_of_business;  // optional
  std::string note;  // optional
  std::string postal_code;  // optional
  std::string state_province;  // optional
  std::string unique_id;  // optional
  int64_t version;  // optional
};

struct LocationLoadMatch {
  std::string id;
};

struct LocationListMatch {
  std::string address1;  // optional
  std::string address2;  // optional
  std::string billing_id;  // optional
  std::string city;  // optional
  std::string country;  // optional
  std::string created;  // optional
  std::string custom_reference;  // optional
  std::string id;  // optional
  std::string location_type;  // optional
  std::string mail_address1;  // optional
  std::string mail_address2;  // optional
  std::string mail_city;  // optional
  std::string mail_country;  // optional
  std::string mail_postal_code;  // optional
  std::string mail_state_province;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::string name_of_business;  // optional
  std::string note;  // optional
  std::string postal_code;  // optional
  std::string state_province;  // optional
  std::string unique_id;  // optional
  int64_t version;  // optional
};

struct LocationCreateData {
  std::string address1;  // optional
  std::string address2;  // optional
  std::string billing_id;  // optional
  std::string city;  // optional
  std::string country;  // optional
  std::string created;  // optional
  std::string custom_reference;  // optional
  std::string id;  // optional
  std::string location_type;  // optional
  std::string mail_address1;  // optional
  std::string mail_address2;  // optional
  std::string mail_city;  // optional
  std::string mail_country;  // optional
  std::string mail_postal_code;  // optional
  std::string mail_state_province;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::string name_of_business;  // optional
  std::string note;  // optional
  std::string postal_code;  // optional
  std::string state_province;  // optional
  std::string unique_id;  // optional
  int64_t version;  // optional
};

struct LocationRemoveMatch {
  std::string id;
};

struct Partner {
  std::string billing_id;  // optional
  bool client_can_order_equipment;  // optional
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  std::string id;  // optional
  bool is_active;  // optional
  std::map<std::string, Value> location;
  std::string modified;  // optional
  std::string name;  // optional
  std::map<std::string, Value> parent;  // optional
  std::string partner_id;  // optional
  std::string reference;  // optional
  std::string verification_phrase;  // optional
  int64_t version;  // optional
};

struct PartnerLoadMatch {
  std::string id;
};

struct PartnerListMatch {
  std::string billing_id;  // optional
  bool client_can_order_equipment;  // optional
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  std::string id;  // optional
  bool is_active;  // optional
  std::map<std::string, Value> location;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::map<std::string, Value> parent;  // optional
  std::string partner_id;  // optional
  std::string reference;  // optional
  std::string verification_phrase;  // optional
  int64_t version;  // optional
};

struct PartnerCreateData {
  std::string billing_id;  // optional
  bool client_can_order_equipment;  // optional
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  std::string id;  // optional
  bool is_active;  // optional
  std::map<std::string, Value> location;
  std::string modified;  // optional
  std::string name;  // optional
  std::map<std::string, Value> parent;  // optional
  std::string partner_id;  // optional
  std::string reference;  // optional
  std::string verification_phrase;  // optional
  int64_t version;  // optional
};

struct Shipment {
  std::string carrier;  // optional
  std::map<std::string, Value> client;  // optional
  std::string created;  // optional
  std::string date_received;  // optional
  std::string date_shipped;  // optional
  std::map<std::string, Value> dc_kif;  // optional
  std::string id;  // optional
  std::vector<Value> item;  // optional
  std::map<std::string, Value> kif;  // optional
  std::string modified;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string shipment_type;  // optional
  std::string tracking;  // optional
  int64_t version;  // optional
};

struct ShipmentLoadMatch {
  std::string id;
};

struct ShipmentListMatch {
  std::string carrier;  // optional
  std::map<std::string, Value> client;  // optional
  std::string created;  // optional
  std::string date_received;  // optional
  std::string date_shipped;  // optional
  std::map<std::string, Value> dc_kif;  // optional
  std::string id;  // optional
  std::vector<Value> item;  // optional
  std::map<std::string, Value> kif;  // optional
  std::string modified;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string shipment_type;  // optional
  std::string tracking;  // optional
  int64_t version;  // optional
};

struct ShipmentCreateData {
  std::string carrier;  // optional
  std::map<std::string, Value> client;  // optional
  std::string created;  // optional
  std::string date_received;  // optional
  std::string date_shipped;  // optional
  std::map<std::string, Value> dc_kif;  // optional
  std::string id;  // optional
  std::vector<Value> item;  // optional
  std::map<std::string, Value> kif;  // optional
  std::string modified;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string shipment_type;  // optional
  std::string tracking;  // optional
  int64_t version;  // optional
};

struct Success {
  bool success;  // optional
};

struct SuccessCreateData {
  std::string share_partner_to;
};

struct SuccessRemoveMatch {
  std::string share_partner_to;
};

struct Transaction {
  std::string alternate_key;  // optional
  std::map<std::string, Value> client;  // optional
  std::string client_ref;  // optional
  std::string created;  // optional
  int64_t decrypted;  // optional
  std::string device_name;  // optional
  std::map<std::string, Value> direct_partner;  // optional
  int64_t encrypted;  // optional
  std::string end_date;  // optional
  std::string err_code;  // optional
  std::string err_message;  // optional
  std::string id;  // optional
  std::string ip_address;  // optional
  bool is_virtual;  // optional
  std::string key_type;  // optional
  std::map<std::string, Value> location;
  std::string message_id;  // optional
  std::string method;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string reference;  // optional
  std::string serial_number;  // optional
  std::string start_date;  // optional
  bool success;  // optional
  std::string transaction_source;  // optional
};

struct TransactionLoadMatch {
  std::string id;
};

struct TransactionListMatch {
  std::string alternate_key;  // optional
  std::map<std::string, Value> client;  // optional
  std::string client_ref;  // optional
  std::string created;  // optional
  int64_t decrypted;  // optional
  std::string device_name;  // optional
  std::map<std::string, Value> direct_partner;  // optional
  int64_t encrypted;  // optional
  std::string end_date;  // optional
  std::string err_code;  // optional
  std::string err_message;  // optional
  std::string id;  // optional
  std::string ip_address;  // optional
  bool is_virtual;  // optional
  std::string key_type;  // optional
  std::map<std::string, Value> location;  // optional
  std::string message_id;  // optional
  std::string method;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string reference;  // optional
  std::string serial_number;  // optional
  std::string start_date;  // optional
  bool success;  // optional
  std::string transaction_source;  // optional
};

struct TransactionCreateData {
  std::string alternate_key;  // optional
  std::map<std::string, Value> client;  // optional
  std::string client_ref;  // optional
  std::string created;  // optional
  int64_t decrypted;  // optional
  std::string device_name;  // optional
  std::map<std::string, Value> direct_partner;  // optional
  int64_t encrypted;  // optional
  std::string end_date;  // optional
  std::string err_code;  // optional
  std::string err_message;  // optional
  std::string id;  // optional
  std::string ip_address;  // optional
  bool is_virtual;  // optional
  std::string key_type;  // optional
  std::map<std::string, Value> location;
  std::string message_id;  // optional
  std::string method;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string reference;  // optional
  std::string serial_number;  // optional
  std::string start_date;  // optional
  bool success;  // optional
  std::string transaction_source;  // optional
};

struct UpdateResult {
  std::map<std::string, Value> client;  // optional
  std::string email;  // optional
  std::string first_name;  // optional
  std::string id;  // optional
  bool is_active;  // optional
  std::map<std::string, Value> kif;  // optional
  std::string last_name;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string phone;  // optional
  std::string user_name;  // optional
  std::map<std::string, Value> user_role;  // optional
  int64_t version;  // optional
};

struct UpdateResultListMatch {
  std::map<std::string, Value> client;  // optional
  std::string email;  // optional
  std::string first_name;  // optional
  std::string id;  // optional
  bool is_active;  // optional
  std::map<std::string, Value> kif;  // optional
  std::string last_name;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string phone;  // optional
  std::string user_name;  // optional
  std::map<std::string, Value> user_role;  // optional
  int64_t version;  // optional
};

struct UpdateResultCreateData {
  std::map<std::string, Value> client;  // optional
  std::string email;  // optional
  std::string first_name;  // optional
  std::string id;  // optional
  bool is_active;  // optional
  std::map<std::string, Value> kif;  // optional
  std::string last_name;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string phone;  // optional
  std::string user_name;  // optional
  std::map<std::string, Value> user_role;  // optional
  int64_t version;  // optional
};

struct UpdateResultUpdateData {
  std::string id;
};

struct User {
  std::map<std::string, Value> client;  // optional
  std::string created;  // optional
  std::string email;  // optional
  std::string first_name;  // optional
  std::string id;  // optional
  bool is_active;  // optional
  std::map<std::string, Value> kif;  // optional
  std::string last_name;  // optional
  std::string modified;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string phone;  // optional
  std::string user_name;  // optional
  std::map<std::string, Value> user_role;  // optional
  int64_t version;  // optional
};

struct UserLoadMatch {
  std::string id;
};

struct UserRemoveMatch {
  std::string id;
};

} // namespace types
} // namespace sdk

#endif // SDK_BLUEFINDECRYPTXP2PE_TYPES_HPP

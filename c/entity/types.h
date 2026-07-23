// Typed models for the BluefinDecryptxP2pe SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types are mapped
// from the canonical type sentinels. Do not edit by hand.
//
// These are DOCUMENTARY: the SDK runtime is dynamic (ops take/return
// `voxgig_value*`), so nothing consumes these structs yet — they mirror the
// entity/op shapes for reference and IDE support. This header is standalone
// and is not #included by any generated .c.

#ifndef BLUEFINDECRYPTXP2PE_ENTITY_TYPES_H
#define BLUEFINDECRYPTXP2PE_ENTITY_TYPES_H

#include "sdk.h"

// Attestation is the typed data model for the attestation entity.
typedef struct {
  voxgig_value*client;  // optional
  char*complete_date;  // optional
  char*created;  // optional
  voxgig_value*device;  // optional
  char*id;  // optional
  char*name;  // optional
  char*note;  // optional
} Attestation;

// AttestationLoadMatch is the typed request payload for Attestation.load.
typedef struct {
  char*id;
} AttestationLoadMatch;

// AttestationListMatch is the typed request payload for Attestation.list.
typedef struct {
  voxgig_value*client;  // optional
  char*complete_date;  // optional
  char*created;  // optional
  voxgig_value*device;  // optional
  char*id;  // optional
  char*name;  // optional
  char*note;  // optional
} AttestationListMatch;

// AttestationCreateData is the typed request payload for Attestation.create.
typedef struct {
  voxgig_value*client;  // optional
  char*complete_date;  // optional
  char*created;  // optional
  voxgig_value*device;  // optional
  char*id;  // optional
  char*name;  // optional
  char*note;  // optional
} AttestationCreateData;

// Client is the typed data model for the client entity.
typedef struct {
  voxgig_value*contact;  // optional
  char*created;  // optional
  voxgig_value*direct_partner;  // optional
  char*id;  // optional
  bool is_active;  // optional
  voxgig_value*location;
  char*mid;  // optional
  char*modified;  // optional
  char*name;  // optional
  voxgig_value*partner;  // optional
  int64_t version;  // optional
} Client;

// ClientLoadMatch is the typed request payload for Client.load.
typedef struct {
  char*id;
} ClientLoadMatch;

// ClientListMatch is the typed request payload for Client.list.
typedef struct {
  voxgig_value*contact;  // optional
  char*created;  // optional
  voxgig_value*direct_partner;  // optional
  char*id;  // optional
  bool is_active;  // optional
  voxgig_value*location;  // optional
  char*mid;  // optional
  char*modified;  // optional
  char*name;  // optional
  voxgig_value*partner;  // optional
  int64_t version;  // optional
} ClientListMatch;

// ClientCreateData is the typed request payload for Client.create.
typedef struct {
  voxgig_value*contact;  // optional
  char*created;  // optional
  voxgig_value*direct_partner;  // optional
  char*id;  // optional
  bool is_active;  // optional
  voxgig_value*location;
  char*mid;  // optional
  char*modified;  // optional
  char*name;  // optional
  voxgig_value*partner;  // optional
  int64_t version;  // optional
} ClientCreateData;

// ClientRemoveMatch is the typed request payload for Client.remove.
typedef struct {
  char*id;
} ClientRemoveMatch;

// CreateResult is the typed data model for the create_result entity.
typedef struct {
  char _unused;  // placeholder: no modelled members
} CreateResult;

// CreateResultCreateData is the typed request payload for CreateResult.create.
typedef struct {
  char*device_type;
  char*serial_number;
} CreateResultCreateData;

// Decryption is the typed data model for the decryption entity.
typedef struct {
  bool success;  // optional
} Decryption;

// DecryptionCreateData is the typed request payload for Decryption.create.
typedef struct {
  bool success;  // optional
} DecryptionCreateData;

// Device is the typed data model for the device entity.
typedef struct {
  voxgig_value*activated_by;
  char*activation_date;  // optional
  char*alternate_key;  // optional
  char*audit_next_date;  // optional
  char*audit_notification_date;  // optional
  voxgig_value*client;  // optional
  char*created;  // optional
  voxgig_value*created_by;
  voxgig_value*device_build;  // optional
  voxgig_value*device_state;  // optional
  voxgig_value*device_type;  // optional
  int64_t error_counter;  // optional
  char*error_last_date;  // optional
  char*id;  // optional
  voxgig_value*initialized_by;
  char*initialized_date;  // optional
  voxgig_value*inject_key;  // optional
  bool is_virtual;  // optional
  voxgig_value*kif;  // optional
  char*last_activity_date;  // optional
  voxgig_value*location;
  char*modified;  // optional
  voxgig_value*modified_by;
  char*name;  // optional
  char*note;  // optional
  voxgig_value*partner;  // optional
  char*serial_number;  // optional
  int64_t version;  // optional
} Device;

// DeviceLoadMatch is the typed request payload for Device.load.
typedef struct {
  char*device_type;  // optional
  char*serial_number;  // optional
  char*id;  // optional
} DeviceLoadMatch;

// DeviceListMatch is the typed request payload for Device.list.
typedef struct {
  voxgig_value*activated_by;  // optional
  char*activation_date;  // optional
  char*alternate_key;  // optional
  char*audit_next_date;  // optional
  char*audit_notification_date;  // optional
  voxgig_value*client;  // optional
  char*created;  // optional
  voxgig_value*created_by;  // optional
  voxgig_value*device_build;  // optional
  voxgig_value*device_state;  // optional
  voxgig_value*device_type;  // optional
  int64_t error_counter;  // optional
  char*error_last_date;  // optional
  char*id;  // optional
  voxgig_value*initialized_by;  // optional
  char*initialized_date;  // optional
  voxgig_value*inject_key;  // optional
  bool is_virtual;  // optional
  voxgig_value*kif;  // optional
  char*last_activity_date;  // optional
  voxgig_value*location;  // optional
  char*modified;  // optional
  voxgig_value*modified_by;  // optional
  char*name;  // optional
  char*note;  // optional
  voxgig_value*partner;  // optional
  char*serial_number;  // optional
  int64_t version;  // optional
} DeviceListMatch;

// DeviceCreateData is the typed request payload for Device.create.
typedef struct {
  voxgig_value*activated_by;
  char*activation_date;  // optional
  char*alternate_key;  // optional
  char*audit_next_date;  // optional
  char*audit_notification_date;  // optional
  voxgig_value*client;  // optional
  char*created;  // optional
  voxgig_value*created_by;
  voxgig_value*device_build;  // optional
  voxgig_value*device_state;  // optional
  voxgig_value*device_type;  // optional
  int64_t error_counter;  // optional
  char*error_last_date;  // optional
  char*id;  // optional
  voxgig_value*initialized_by;
  char*initialized_date;  // optional
  voxgig_value*inject_key;  // optional
  bool is_virtual;  // optional
  voxgig_value*kif;  // optional
  char*last_activity_date;  // optional
  voxgig_value*location;
  char*modified;  // optional
  voxgig_value*modified_by;
  char*name;  // optional
  char*note;  // optional
  voxgig_value*partner;  // optional
  char*serial_number;  // optional
  int64_t version;  // optional
} DeviceCreateData;

// DeviceBuild is the typed data model for the device_build entity.
typedef struct {
  char*app_version;  // optional
  char*build_number;  // optional
  char*config_file_name;  // optional
  char*created;  // optional
  char*device_type;  // optional
  char*firmware_version;  // optional
  char*hardware_version;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  char*modified;  // optional
  char*name;  // optional
  char*note;  // optional
  int64_t version;  // optional
  char*white_listing_bin_range;  // optional
  bool white_listing_used;  // optional
} DeviceBuild;

// DeviceBuildLoadMatch is the typed request payload for DeviceBuild.load.
typedef struct {
  char*id;
} DeviceBuildLoadMatch;

// DeviceBuildListMatch is the typed request payload for DeviceBuild.list.
typedef struct {
  char*app_version;  // optional
  char*build_number;  // optional
  char*config_file_name;  // optional
  char*created;  // optional
  char*device_type;  // optional
  char*firmware_version;  // optional
  char*hardware_version;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  char*modified;  // optional
  char*name;  // optional
  char*note;  // optional
  int64_t version;  // optional
  char*white_listing_bin_range;  // optional
  bool white_listing_used;  // optional
} DeviceBuildListMatch;

// DeviceCustodyDetail is the typed data model for the device_custody_detail entity.
typedef struct {
  char*complete_date;  // optional
  char*created;  // optional
  voxgig_value*created_by;
  voxgig_value*custodian;
  voxgig_value*device;  // optional
  int64_t id;  // optional
  voxgig_value*location;
  char*modified;  // optional
  voxgig_value*modified_by;
  char*note;  // optional
  voxgig_value*status;  // optional
  voxgig_value*transfer_method;  // optional
  int64_t version;  // optional
} DeviceCustodyDetail;

// DeviceCustodyDetailLoadMatch is the typed request payload for DeviceCustodyDetail.load.
typedef struct {
  char*device_type;
  char*id;
  char*serial_number;
} DeviceCustodyDetailLoadMatch;

// DeviceCustodyList is the typed data model for the device_custody_list entity.
typedef struct {
  char*complete_date;  // optional
  char*created;  // optional
  voxgig_value*created_by;
  voxgig_value*custodian;
  voxgig_value*device;  // optional
  int64_t id;  // optional
  voxgig_value*location;
  char*modified;  // optional
  voxgig_value*modified_by;
  char*note;  // optional
  voxgig_value*status;  // optional
  voxgig_value*transfer_method;  // optional
  int64_t version;  // optional
} DeviceCustodyList;

// DeviceCustodyListListMatch is the typed request payload for DeviceCustodyList.list.
typedef struct {
  char*device_type;
  char*serial_number;
} DeviceCustodyListListMatch;

// DeviceList is the typed data model for the device_list entity.
typedef struct {
  voxgig_value*data;  // optional
  int64_t total;  // optional
} DeviceList;

// DeviceListLoadMatch is the typed request payload for DeviceList.load.
typedef struct {
  char*share_partner_to;
} DeviceListLoadMatch;

// DeviceReceiveResult is the typed data model for the device_receive_result entity.
typedef struct {
  bool success;
} DeviceReceiveResult;

// DeviceReceiveResultCreateData is the typed request payload for DeviceReceiveResult.create.
typedef struct {
  bool success;
} DeviceReceiveResultCreateData;

// DeviceRkiActivateResult is the typed data model for the device_rki_activate_result entity.
typedef struct {
  bool success;
} DeviceRkiActivateResult;

// DeviceRkiActivateResultCreateData is the typed request payload for DeviceRkiActivateResult.create.
typedef struct {
  bool success;
} DeviceRkiActivateResultCreateData;

// DeviceState is the typed data model for the device_state entity.
typedef struct {
  int64_t id;  // optional
  char*name;  // optional
} DeviceState;

// DeviceStateListMatch is the typed request payload for DeviceState.list.
typedef struct {
  int64_t id;  // optional
  char*name;  // optional
} DeviceStateListMatch;

// DeviceType is the typed data model for the device_type entity.
typedef struct {
  char*created;  // optional
  char*device_type_mode;  // optional
  char*hardware_version;  // optional
  char*id;  // optional
  bool is_active;  // optional
  char*manufacturer;  // optional
  char*model;  // optional
  char*modified;  // optional
  char*name;  // optional
  char*photo_url;  // optional
  char*product_name;  // optional
  int64_t version;  // optional
} DeviceType;

// DeviceTypeLoadMatch is the typed request payload for DeviceType.load.
typedef struct {
  char*id;
} DeviceTypeLoadMatch;

// DeviceTypeListMatch is the typed request payload for DeviceType.list.
typedef struct {
  char*created;  // optional
  char*device_type_mode;  // optional
  char*hardware_version;  // optional
  char*id;  // optional
  bool is_active;  // optional
  char*manufacturer;  // optional
  char*model;  // optional
  char*modified;  // optional
  char*name;  // optional
  char*photo_url;  // optional
  char*product_name;  // optional
  int64_t version;  // optional
} DeviceTypeListMatch;

// InjectKey is the typed data model for the inject_key entity.
typedef struct {
  char*created;  // optional
  char*id;  // optional
  bool is_active;  // optional
  bool is_p2_pe;  // optional
  char*key_type;  // optional
  char*modified;  // optional
  char*name;  // optional
  int64_t version;  // optional
} InjectKey;

// InjectKeyLoadMatch is the typed request payload for InjectKey.load.
typedef struct {
  char*id;
} InjectKeyLoadMatch;

// InjectKeyListMatch is the typed request payload for InjectKey.list.
typedef struct {
  char*created;  // optional
  char*id;  // optional
  bool is_active;  // optional
  bool is_p2_pe;  // optional
  char*key_type;  // optional
  char*modified;  // optional
  char*name;  // optional
  int64_t version;  // optional
} InjectKeyListMatch;

// Kif is the typed data model for the kif entity.
typedef struct {
  int64_t id;  // optional
  char*name;  // optional
} Kif;

// KifListMatch is the typed request payload for Kif.list.
typedef struct {
  int64_t id;  // optional
  char*name;  // optional
} KifListMatch;

// Location is the typed data model for the location entity.
typedef struct {
  char*address1;  // optional
  char*address2;  // optional
  char*billing_id;  // optional
  char*city;  // optional
  char*country;  // optional
  char*created;  // optional
  char*custom_reference;  // optional
  char*id;  // optional
  char*location_type;  // optional
  char*mail_address1;  // optional
  char*mail_address2;  // optional
  char*mail_city;  // optional
  char*mail_country;  // optional
  char*mail_postal_code;  // optional
  char*mail_state_province;  // optional
  char*modified;  // optional
  char*name;  // optional
  char*name_of_business;  // optional
  char*note;  // optional
  char*postal_code;  // optional
  char*state_province;  // optional
  char*unique_id;  // optional
  int64_t version;  // optional
} Location;

// LocationLoadMatch is the typed request payload for Location.load.
typedef struct {
  char*id;
} LocationLoadMatch;

// LocationListMatch is the typed request payload for Location.list.
typedef struct {
  char*address1;  // optional
  char*address2;  // optional
  char*billing_id;  // optional
  char*city;  // optional
  char*country;  // optional
  char*created;  // optional
  char*custom_reference;  // optional
  char*id;  // optional
  char*location_type;  // optional
  char*mail_address1;  // optional
  char*mail_address2;  // optional
  char*mail_city;  // optional
  char*mail_country;  // optional
  char*mail_postal_code;  // optional
  char*mail_state_province;  // optional
  char*modified;  // optional
  char*name;  // optional
  char*name_of_business;  // optional
  char*note;  // optional
  char*postal_code;  // optional
  char*state_province;  // optional
  char*unique_id;  // optional
  int64_t version;  // optional
} LocationListMatch;

// LocationCreateData is the typed request payload for Location.create.
typedef struct {
  char*address1;  // optional
  char*address2;  // optional
  char*billing_id;  // optional
  char*city;  // optional
  char*country;  // optional
  char*created;  // optional
  char*custom_reference;  // optional
  char*id;  // optional
  char*location_type;  // optional
  char*mail_address1;  // optional
  char*mail_address2;  // optional
  char*mail_city;  // optional
  char*mail_country;  // optional
  char*mail_postal_code;  // optional
  char*mail_state_province;  // optional
  char*modified;  // optional
  char*name;  // optional
  char*name_of_business;  // optional
  char*note;  // optional
  char*postal_code;  // optional
  char*state_province;  // optional
  char*unique_id;  // optional
  int64_t version;  // optional
} LocationCreateData;

// LocationRemoveMatch is the typed request payload for Location.remove.
typedef struct {
  char*id;
} LocationRemoveMatch;

// Partner is the typed data model for the partner entity.
typedef struct {
  char*billing_id;  // optional
  bool client_can_order_equipment;  // optional
  voxgig_value*contact;  // optional
  char*created;  // optional
  char*id;  // optional
  bool is_active;  // optional
  voxgig_value*location;
  char*modified;  // optional
  char*name;  // optional
  voxgig_value*parent;  // optional
  char*partner_id;  // optional
  char*reference;  // optional
  char*verification_phrase;  // optional
  int64_t version;  // optional
} Partner;

// PartnerLoadMatch is the typed request payload for Partner.load.
typedef struct {
  char*id;
} PartnerLoadMatch;

// PartnerListMatch is the typed request payload for Partner.list.
typedef struct {
  char*billing_id;  // optional
  bool client_can_order_equipment;  // optional
  voxgig_value*contact;  // optional
  char*created;  // optional
  char*id;  // optional
  bool is_active;  // optional
  voxgig_value*location;  // optional
  char*modified;  // optional
  char*name;  // optional
  voxgig_value*parent;  // optional
  char*partner_id;  // optional
  char*reference;  // optional
  char*verification_phrase;  // optional
  int64_t version;  // optional
} PartnerListMatch;

// PartnerCreateData is the typed request payload for Partner.create.
typedef struct {
  char*billing_id;  // optional
  bool client_can_order_equipment;  // optional
  voxgig_value*contact;  // optional
  char*created;  // optional
  char*id;  // optional
  bool is_active;  // optional
  voxgig_value*location;
  char*modified;  // optional
  char*name;  // optional
  voxgig_value*parent;  // optional
  char*partner_id;  // optional
  char*reference;  // optional
  char*verification_phrase;  // optional
  int64_t version;  // optional
} PartnerCreateData;

// Shipment is the typed data model for the shipment entity.
typedef struct {
  char*carrier;  // optional
  voxgig_value*client;  // optional
  char*created;  // optional
  char*date_received;  // optional
  char*date_shipped;  // optional
  voxgig_value*dc_kif;  // optional
  char*id;  // optional
  voxgig_value*item;  // optional
  voxgig_value*kif;  // optional
  char*modified;  // optional
  voxgig_value*partner;  // optional
  char*shipment_type;  // optional
  char*tracking;  // optional
  int64_t version;  // optional
} Shipment;

// ShipmentLoadMatch is the typed request payload for Shipment.load.
typedef struct {
  char*id;
} ShipmentLoadMatch;

// ShipmentListMatch is the typed request payload for Shipment.list.
typedef struct {
  char*carrier;  // optional
  voxgig_value*client;  // optional
  char*created;  // optional
  char*date_received;  // optional
  char*date_shipped;  // optional
  voxgig_value*dc_kif;  // optional
  char*id;  // optional
  voxgig_value*item;  // optional
  voxgig_value*kif;  // optional
  char*modified;  // optional
  voxgig_value*partner;  // optional
  char*shipment_type;  // optional
  char*tracking;  // optional
  int64_t version;  // optional
} ShipmentListMatch;

// ShipmentCreateData is the typed request payload for Shipment.create.
typedef struct {
  char*carrier;  // optional
  voxgig_value*client;  // optional
  char*created;  // optional
  char*date_received;  // optional
  char*date_shipped;  // optional
  voxgig_value*dc_kif;  // optional
  char*id;  // optional
  voxgig_value*item;  // optional
  voxgig_value*kif;  // optional
  char*modified;  // optional
  voxgig_value*partner;  // optional
  char*shipment_type;  // optional
  char*tracking;  // optional
  int64_t version;  // optional
} ShipmentCreateData;

// Success is the typed data model for the success entity.
typedef struct {
  bool success;  // optional
} Success;

// SuccessCreateData is the typed request payload for Success.create.
typedef struct {
  char*share_partner_to;
} SuccessCreateData;

// SuccessRemoveMatch is the typed request payload for Success.remove.
typedef struct {
  char*share_partner_to;
} SuccessRemoveMatch;

// Transaction is the typed data model for the transaction entity.
typedef struct {
  char*alternate_key;  // optional
  voxgig_value*client;  // optional
  char*client_ref;  // optional
  char*created;  // optional
  int64_t decrypted;  // optional
  char*device_name;  // optional
  voxgig_value*direct_partner;  // optional
  int64_t encrypted;  // optional
  char*end_date;  // optional
  char*err_code;  // optional
  char*err_message;  // optional
  char*id;  // optional
  char*ip_address;  // optional
  bool is_virtual;  // optional
  char*key_type;  // optional
  voxgig_value*location;
  char*message_id;  // optional
  char*method;  // optional
  voxgig_value*partner;  // optional
  char*reference;  // optional
  char*serial_number;  // optional
  char*start_date;  // optional
  bool success;  // optional
  char*transaction_source;  // optional
} Transaction;

// TransactionLoadMatch is the typed request payload for Transaction.load.
typedef struct {
  char*id;
} TransactionLoadMatch;

// TransactionListMatch is the typed request payload for Transaction.list.
typedef struct {
  char*alternate_key;  // optional
  voxgig_value*client;  // optional
  char*client_ref;  // optional
  char*created;  // optional
  int64_t decrypted;  // optional
  char*device_name;  // optional
  voxgig_value*direct_partner;  // optional
  int64_t encrypted;  // optional
  char*end_date;  // optional
  char*err_code;  // optional
  char*err_message;  // optional
  char*id;  // optional
  char*ip_address;  // optional
  bool is_virtual;  // optional
  char*key_type;  // optional
  voxgig_value*location;  // optional
  char*message_id;  // optional
  char*method;  // optional
  voxgig_value*partner;  // optional
  char*reference;  // optional
  char*serial_number;  // optional
  char*start_date;  // optional
  bool success;  // optional
  char*transaction_source;  // optional
} TransactionListMatch;

// TransactionCreateData is the typed request payload for Transaction.create.
typedef struct {
  char*alternate_key;  // optional
  voxgig_value*client;  // optional
  char*client_ref;  // optional
  char*created;  // optional
  int64_t decrypted;  // optional
  char*device_name;  // optional
  voxgig_value*direct_partner;  // optional
  int64_t encrypted;  // optional
  char*end_date;  // optional
  char*err_code;  // optional
  char*err_message;  // optional
  char*id;  // optional
  char*ip_address;  // optional
  bool is_virtual;  // optional
  char*key_type;  // optional
  voxgig_value*location;
  char*message_id;  // optional
  char*method;  // optional
  voxgig_value*partner;  // optional
  char*reference;  // optional
  char*serial_number;  // optional
  char*start_date;  // optional
  bool success;  // optional
  char*transaction_source;  // optional
} TransactionCreateData;

// UpdateResult is the typed data model for the update_result entity.
typedef struct {
  voxgig_value*client;  // optional
  char*email;  // optional
  char*first_name;  // optional
  char*id;  // optional
  bool is_active;  // optional
  voxgig_value*kif;  // optional
  char*last_name;  // optional
  voxgig_value*partner;  // optional
  char*phone;  // optional
  char*user_name;  // optional
  voxgig_value*user_role;  // optional
  int64_t version;  // optional
} UpdateResult;

// UpdateResultListMatch is the typed request payload for UpdateResult.list.
typedef struct {
  voxgig_value*client;  // optional
  char*email;  // optional
  char*first_name;  // optional
  char*id;  // optional
  bool is_active;  // optional
  voxgig_value*kif;  // optional
  char*last_name;  // optional
  voxgig_value*partner;  // optional
  char*phone;  // optional
  char*user_name;  // optional
  voxgig_value*user_role;  // optional
  int64_t version;  // optional
} UpdateResultListMatch;

// UpdateResultCreateData is the typed request payload for UpdateResult.create.
typedef struct {
  voxgig_value*client;  // optional
  char*email;  // optional
  char*first_name;  // optional
  char*id;  // optional
  bool is_active;  // optional
  voxgig_value*kif;  // optional
  char*last_name;  // optional
  voxgig_value*partner;  // optional
  char*phone;  // optional
  char*user_name;  // optional
  voxgig_value*user_role;  // optional
  int64_t version;  // optional
} UpdateResultCreateData;

// UpdateResultUpdateData is the typed request payload for UpdateResult.update.
typedef struct {
  char*id;
} UpdateResultUpdateData;

// User is the typed data model for the user entity.
typedef struct {
  voxgig_value*client;  // optional
  char*created;  // optional
  char*email;  // optional
  char*first_name;  // optional
  char*id;  // optional
  bool is_active;  // optional
  voxgig_value*kif;  // optional
  char*last_name;  // optional
  char*modified;  // optional
  voxgig_value*partner;  // optional
  char*phone;  // optional
  char*user_name;  // optional
  voxgig_value*user_role;  // optional
  int64_t version;  // optional
} User;

// UserLoadMatch is the typed request payload for User.load.
typedef struct {
  char*id;
} UserLoadMatch;

// UserRemoveMatch is the typed request payload for User.remove.
typedef struct {
  char*id;
} UserRemoveMatch;

#endif // BLUEFINDECRYPTXP2PE_ENTITY_TYPES_H

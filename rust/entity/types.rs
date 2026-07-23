// Typed models for the BluefinDecryptxP2pe SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types are mapped
// from the canonical type sentinels. Do not edit by hand.
//
// These are DOCUMENTARY: the SDK runtime is dynamic (ops take/return the
// `Value` enum), so nothing consumes these structs yet — they mirror the
// entity/op shapes for reference and IDE support.
#![allow(dead_code, non_snake_case, unused_imports)]

use crate::utility::voxgigstruct::Value;

/// Attestation is the typed data model for the attestation entity.
#[derive(Debug, Clone)]
pub struct Attestation {
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub complete_date: Option<String>,
    pub created: Option<String>,
    pub device: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<String>,
    pub name: Option<String>,
    pub note: Option<String>,
}

/// AttestationLoadMatch is the typed request payload for Attestation.load.
#[derive(Debug, Clone)]
pub struct AttestationLoadMatch {
    pub id: String,
}

/// AttestationListMatch is the typed request payload for Attestation.list.
#[derive(Debug, Clone)]
pub struct AttestationListMatch {
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub complete_date: Option<String>,
    pub created: Option<String>,
    pub device: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<String>,
    pub name: Option<String>,
    pub note: Option<String>,
}

/// AttestationCreateData is the typed request payload for Attestation.create.
#[derive(Debug, Clone)]
pub struct AttestationCreateData {
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub complete_date: Option<String>,
    pub created: Option<String>,
    pub device: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<String>,
    pub name: Option<String>,
    pub note: Option<String>,
}

/// Client is the typed data model for the client entity.
#[derive(Debug, Clone)]
pub struct Client {
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub direct_partner: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<String>,
    pub is_active: Option<bool>,
    pub location: std::collections::HashMap<String, Value>,
    pub mid: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// ClientLoadMatch is the typed request payload for Client.load.
#[derive(Debug, Clone)]
pub struct ClientLoadMatch {
    pub id: String,
}

/// ClientListMatch is the typed request payload for Client.list.
#[derive(Debug, Clone)]
pub struct ClientListMatch {
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub direct_partner: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<String>,
    pub is_active: Option<bool>,
    pub location: Option<std::collections::HashMap<String, Value>>,
    pub mid: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// ClientCreateData is the typed request payload for Client.create.
#[derive(Debug, Clone)]
pub struct ClientCreateData {
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub direct_partner: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<String>,
    pub is_active: Option<bool>,
    pub location: std::collections::HashMap<String, Value>,
    pub mid: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// ClientRemoveMatch is the typed request payload for Client.remove.
#[derive(Debug, Clone)]
pub struct ClientRemoveMatch {
    pub id: String,
}

/// CreateResult is the typed data model for the create_result entity.
#[derive(Debug, Clone)]
pub struct CreateResult {
}

/// CreateResultCreateData is the typed request payload for CreateResult.create.
#[derive(Debug, Clone)]
pub struct CreateResultCreateData {
    pub device_type: String,
    pub serial_number: String,
}

/// Decryption is the typed data model for the decryption entity.
#[derive(Debug, Clone)]
pub struct Decryption {
    pub success: Option<bool>,
}

/// DecryptionCreateData is the typed request payload for Decryption.create.
#[derive(Debug, Clone)]
pub struct DecryptionCreateData {
    pub success: Option<bool>,
}

/// Device is the typed data model for the device entity.
#[derive(Debug, Clone)]
pub struct Device {
    pub activated_by: std::collections::HashMap<String, Value>,
    pub activation_date: Option<String>,
    pub alternate_key: Option<String>,
    pub audit_next_date: Option<String>,
    pub audit_notification_date: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub created_by: std::collections::HashMap<String, Value>,
    pub device_build: Option<std::collections::HashMap<String, Value>>,
    pub device_state: Option<std::collections::HashMap<String, Value>>,
    pub device_type: Option<std::collections::HashMap<String, Value>>,
    pub error_counter: Option<i64>,
    pub error_last_date: Option<String>,
    pub id: Option<String>,
    pub initialized_by: std::collections::HashMap<String, Value>,
    pub initialized_date: Option<String>,
    pub inject_key: Option<std::collections::HashMap<String, Value>>,
    pub is_virtual: Option<bool>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub last_activity_date: Option<String>,
    pub location: std::collections::HashMap<String, Value>,
    pub modified: Option<String>,
    pub modified_by: std::collections::HashMap<String, Value>,
    pub name: Option<String>,
    pub note: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub serial_number: Option<String>,
    pub version: Option<i64>,
}

/// DeviceLoadMatch is the typed request payload for Device.load.
#[derive(Debug, Clone)]
pub struct DeviceLoadMatch {
    pub device_type: Option<String>,
    pub serial_number: Option<String>,
    pub id: Option<String>,
}

/// DeviceListMatch is the typed request payload for Device.list.
#[derive(Debug, Clone)]
pub struct DeviceListMatch {
    pub activated_by: Option<std::collections::HashMap<String, Value>>,
    pub activation_date: Option<String>,
    pub alternate_key: Option<String>,
    pub audit_next_date: Option<String>,
    pub audit_notification_date: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub created_by: Option<std::collections::HashMap<String, Value>>,
    pub device_build: Option<std::collections::HashMap<String, Value>>,
    pub device_state: Option<std::collections::HashMap<String, Value>>,
    pub device_type: Option<std::collections::HashMap<String, Value>>,
    pub error_counter: Option<i64>,
    pub error_last_date: Option<String>,
    pub id: Option<String>,
    pub initialized_by: Option<std::collections::HashMap<String, Value>>,
    pub initialized_date: Option<String>,
    pub inject_key: Option<std::collections::HashMap<String, Value>>,
    pub is_virtual: Option<bool>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub last_activity_date: Option<String>,
    pub location: Option<std::collections::HashMap<String, Value>>,
    pub modified: Option<String>,
    pub modified_by: Option<std::collections::HashMap<String, Value>>,
    pub name: Option<String>,
    pub note: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub serial_number: Option<String>,
    pub version: Option<i64>,
}

/// DeviceCreateData is the typed request payload for Device.create.
#[derive(Debug, Clone)]
pub struct DeviceCreateData {
    pub activated_by: std::collections::HashMap<String, Value>,
    pub activation_date: Option<String>,
    pub alternate_key: Option<String>,
    pub audit_next_date: Option<String>,
    pub audit_notification_date: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub created_by: std::collections::HashMap<String, Value>,
    pub device_build: Option<std::collections::HashMap<String, Value>>,
    pub device_state: Option<std::collections::HashMap<String, Value>>,
    pub device_type: Option<std::collections::HashMap<String, Value>>,
    pub error_counter: Option<i64>,
    pub error_last_date: Option<String>,
    pub id: Option<String>,
    pub initialized_by: std::collections::HashMap<String, Value>,
    pub initialized_date: Option<String>,
    pub inject_key: Option<std::collections::HashMap<String, Value>>,
    pub is_virtual: Option<bool>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub last_activity_date: Option<String>,
    pub location: std::collections::HashMap<String, Value>,
    pub modified: Option<String>,
    pub modified_by: std::collections::HashMap<String, Value>,
    pub name: Option<String>,
    pub note: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub serial_number: Option<String>,
    pub version: Option<i64>,
}

/// DeviceBuild is the typed data model for the device_build entity.
#[derive(Debug, Clone)]
pub struct DeviceBuild {
    pub app_version: Option<String>,
    pub build_number: Option<String>,
    pub config_file_name: Option<String>,
    pub created: Option<String>,
    pub device_type: Option<String>,
    pub firmware_version: Option<String>,
    pub hardware_version: Option<String>,
    pub id: Option<i64>,
    pub is_active: Option<bool>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub note: Option<String>,
    pub version: Option<i64>,
    pub white_listing_bin_range: Option<String>,
    pub white_listing_used: Option<bool>,
}

/// DeviceBuildLoadMatch is the typed request payload for DeviceBuild.load.
#[derive(Debug, Clone)]
pub struct DeviceBuildLoadMatch {
    pub id: String,
}

/// DeviceBuildListMatch is the typed request payload for DeviceBuild.list.
#[derive(Debug, Clone)]
pub struct DeviceBuildListMatch {
    pub app_version: Option<String>,
    pub build_number: Option<String>,
    pub config_file_name: Option<String>,
    pub created: Option<String>,
    pub device_type: Option<String>,
    pub firmware_version: Option<String>,
    pub hardware_version: Option<String>,
    pub id: Option<i64>,
    pub is_active: Option<bool>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub note: Option<String>,
    pub version: Option<i64>,
    pub white_listing_bin_range: Option<String>,
    pub white_listing_used: Option<bool>,
}

/// DeviceCustodyDetail is the typed data model for the device_custody_detail entity.
#[derive(Debug, Clone)]
pub struct DeviceCustodyDetail {
    pub complete_date: Option<String>,
    pub created: Option<String>,
    pub created_by: std::collections::HashMap<String, Value>,
    pub custodian: std::collections::HashMap<String, Value>,
    pub device: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<i64>,
    pub location: std::collections::HashMap<String, Value>,
    pub modified: Option<String>,
    pub modified_by: std::collections::HashMap<String, Value>,
    pub note: Option<String>,
    pub status: Option<std::collections::HashMap<String, Value>>,
    pub transfer_method: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// DeviceCustodyDetailLoadMatch is the typed request payload for DeviceCustodyDetail.load.
#[derive(Debug, Clone)]
pub struct DeviceCustodyDetailLoadMatch {
    pub device_type: String,
    pub id: String,
    pub serial_number: String,
}

/// DeviceCustodyList is the typed data model for the device_custody_list entity.
#[derive(Debug, Clone)]
pub struct DeviceCustodyList {
    pub complete_date: Option<String>,
    pub created: Option<String>,
    pub created_by: std::collections::HashMap<String, Value>,
    pub custodian: std::collections::HashMap<String, Value>,
    pub device: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<i64>,
    pub location: std::collections::HashMap<String, Value>,
    pub modified: Option<String>,
    pub modified_by: std::collections::HashMap<String, Value>,
    pub note: Option<String>,
    pub status: Option<std::collections::HashMap<String, Value>>,
    pub transfer_method: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// DeviceCustodyListListMatch is the typed request payload for DeviceCustodyList.list.
#[derive(Debug, Clone)]
pub struct DeviceCustodyListListMatch {
    pub device_type: String,
    pub serial_number: String,
}

/// DeviceList is the typed data model for the device_list entity.
#[derive(Debug, Clone)]
pub struct DeviceList {
    pub data: Option<Vec<Value>>,
    pub total: Option<i64>,
}

/// DeviceListLoadMatch is the typed request payload for DeviceList.load.
#[derive(Debug, Clone)]
pub struct DeviceListLoadMatch {
    pub share_partner_to: String,
}

/// DeviceReceiveResult is the typed data model for the device_receive_result entity.
#[derive(Debug, Clone)]
pub struct DeviceReceiveResult {
    pub success: bool,
}

/// DeviceReceiveResultCreateData is the typed request payload for DeviceReceiveResult.create.
#[derive(Debug, Clone)]
pub struct DeviceReceiveResultCreateData {
    pub success: bool,
}

/// DeviceRkiActivateResult is the typed data model for the device_rki_activate_result entity.
#[derive(Debug, Clone)]
pub struct DeviceRkiActivateResult {
    pub success: bool,
}

/// DeviceRkiActivateResultCreateData is the typed request payload for DeviceRkiActivateResult.create.
#[derive(Debug, Clone)]
pub struct DeviceRkiActivateResultCreateData {
    pub success: bool,
}

/// DeviceState is the typed data model for the device_state entity.
#[derive(Debug, Clone)]
pub struct DeviceState {
    pub id: Option<i64>,
    pub name: Option<String>,
}

/// DeviceStateListMatch is the typed request payload for DeviceState.list.
#[derive(Debug, Clone)]
pub struct DeviceStateListMatch {
    pub id: Option<i64>,
    pub name: Option<String>,
}

/// DeviceType is the typed data model for the device_type entity.
#[derive(Debug, Clone)]
pub struct DeviceType {
    pub created: Option<String>,
    pub device_type_mode: Option<String>,
    pub hardware_version: Option<String>,
    pub id: Option<String>,
    pub is_active: Option<bool>,
    pub manufacturer: Option<String>,
    pub model: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub photo_url: Option<String>,
    pub product_name: Option<String>,
    pub version: Option<i64>,
}

/// DeviceTypeLoadMatch is the typed request payload for DeviceType.load.
#[derive(Debug, Clone)]
pub struct DeviceTypeLoadMatch {
    pub id: String,
}

/// DeviceTypeListMatch is the typed request payload for DeviceType.list.
#[derive(Debug, Clone)]
pub struct DeviceTypeListMatch {
    pub created: Option<String>,
    pub device_type_mode: Option<String>,
    pub hardware_version: Option<String>,
    pub id: Option<String>,
    pub is_active: Option<bool>,
    pub manufacturer: Option<String>,
    pub model: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub photo_url: Option<String>,
    pub product_name: Option<String>,
    pub version: Option<i64>,
}

/// InjectKey is the typed data model for the inject_key entity.
#[derive(Debug, Clone)]
pub struct InjectKey {
    pub created: Option<String>,
    pub id: Option<String>,
    pub is_active: Option<bool>,
    pub is_p2_pe: Option<bool>,
    pub key_type: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub version: Option<i64>,
}

/// InjectKeyLoadMatch is the typed request payload for InjectKey.load.
#[derive(Debug, Clone)]
pub struct InjectKeyLoadMatch {
    pub id: String,
}

/// InjectKeyListMatch is the typed request payload for InjectKey.list.
#[derive(Debug, Clone)]
pub struct InjectKeyListMatch {
    pub created: Option<String>,
    pub id: Option<String>,
    pub is_active: Option<bool>,
    pub is_p2_pe: Option<bool>,
    pub key_type: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub version: Option<i64>,
}

/// Kif is the typed data model for the kif entity.
#[derive(Debug, Clone)]
pub struct Kif {
    pub id: Option<i64>,
    pub name: Option<String>,
}

/// KifListMatch is the typed request payload for Kif.list.
#[derive(Debug, Clone)]
pub struct KifListMatch {
    pub id: Option<i64>,
    pub name: Option<String>,
}

/// Location is the typed data model for the location entity.
#[derive(Debug, Clone)]
pub struct Location {
    pub address1: Option<String>,
    pub address2: Option<String>,
    pub billing_id: Option<String>,
    pub city: Option<String>,
    pub country: Option<String>,
    pub created: Option<String>,
    pub custom_reference: Option<String>,
    pub id: Option<String>,
    pub location_type: Option<String>,
    pub mail_address1: Option<String>,
    pub mail_address2: Option<String>,
    pub mail_city: Option<String>,
    pub mail_country: Option<String>,
    pub mail_postal_code: Option<String>,
    pub mail_state_province: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub name_of_business: Option<String>,
    pub note: Option<String>,
    pub postal_code: Option<String>,
    pub state_province: Option<String>,
    pub unique_id: Option<String>,
    pub version: Option<i64>,
}

/// LocationLoadMatch is the typed request payload for Location.load.
#[derive(Debug, Clone)]
pub struct LocationLoadMatch {
    pub id: String,
}

/// LocationListMatch is the typed request payload for Location.list.
#[derive(Debug, Clone)]
pub struct LocationListMatch {
    pub address1: Option<String>,
    pub address2: Option<String>,
    pub billing_id: Option<String>,
    pub city: Option<String>,
    pub country: Option<String>,
    pub created: Option<String>,
    pub custom_reference: Option<String>,
    pub id: Option<String>,
    pub location_type: Option<String>,
    pub mail_address1: Option<String>,
    pub mail_address2: Option<String>,
    pub mail_city: Option<String>,
    pub mail_country: Option<String>,
    pub mail_postal_code: Option<String>,
    pub mail_state_province: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub name_of_business: Option<String>,
    pub note: Option<String>,
    pub postal_code: Option<String>,
    pub state_province: Option<String>,
    pub unique_id: Option<String>,
    pub version: Option<i64>,
}

/// LocationCreateData is the typed request payload for Location.create.
#[derive(Debug, Clone)]
pub struct LocationCreateData {
    pub address1: Option<String>,
    pub address2: Option<String>,
    pub billing_id: Option<String>,
    pub city: Option<String>,
    pub country: Option<String>,
    pub created: Option<String>,
    pub custom_reference: Option<String>,
    pub id: Option<String>,
    pub location_type: Option<String>,
    pub mail_address1: Option<String>,
    pub mail_address2: Option<String>,
    pub mail_city: Option<String>,
    pub mail_country: Option<String>,
    pub mail_postal_code: Option<String>,
    pub mail_state_province: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub name_of_business: Option<String>,
    pub note: Option<String>,
    pub postal_code: Option<String>,
    pub state_province: Option<String>,
    pub unique_id: Option<String>,
    pub version: Option<i64>,
}

/// LocationRemoveMatch is the typed request payload for Location.remove.
#[derive(Debug, Clone)]
pub struct LocationRemoveMatch {
    pub id: String,
}

/// Partner is the typed data model for the partner entity.
#[derive(Debug, Clone)]
pub struct Partner {
    pub billing_id: Option<String>,
    pub client_can_order_equipment: Option<bool>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub id: Option<String>,
    pub is_active: Option<bool>,
    pub location: std::collections::HashMap<String, Value>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub partner_id: Option<String>,
    pub reference: Option<String>,
    pub verification_phrase: Option<String>,
    pub version: Option<i64>,
}

/// PartnerLoadMatch is the typed request payload for Partner.load.
#[derive(Debug, Clone)]
pub struct PartnerLoadMatch {
    pub id: String,
}

/// PartnerListMatch is the typed request payload for Partner.list.
#[derive(Debug, Clone)]
pub struct PartnerListMatch {
    pub billing_id: Option<String>,
    pub client_can_order_equipment: Option<bool>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub id: Option<String>,
    pub is_active: Option<bool>,
    pub location: Option<std::collections::HashMap<String, Value>>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub partner_id: Option<String>,
    pub reference: Option<String>,
    pub verification_phrase: Option<String>,
    pub version: Option<i64>,
}

/// PartnerCreateData is the typed request payload for Partner.create.
#[derive(Debug, Clone)]
pub struct PartnerCreateData {
    pub billing_id: Option<String>,
    pub client_can_order_equipment: Option<bool>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub id: Option<String>,
    pub is_active: Option<bool>,
    pub location: std::collections::HashMap<String, Value>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub partner_id: Option<String>,
    pub reference: Option<String>,
    pub verification_phrase: Option<String>,
    pub version: Option<i64>,
}

/// Shipment is the typed data model for the shipment entity.
#[derive(Debug, Clone)]
pub struct Shipment {
    pub carrier: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub date_received: Option<String>,
    pub date_shipped: Option<String>,
    pub dc_kif: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<String>,
    pub item: Option<Vec<Value>>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub modified: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub shipment_type: Option<String>,
    pub tracking: Option<String>,
    pub version: Option<i64>,
}

/// ShipmentLoadMatch is the typed request payload for Shipment.load.
#[derive(Debug, Clone)]
pub struct ShipmentLoadMatch {
    pub id: String,
}

/// ShipmentListMatch is the typed request payload for Shipment.list.
#[derive(Debug, Clone)]
pub struct ShipmentListMatch {
    pub carrier: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub date_received: Option<String>,
    pub date_shipped: Option<String>,
    pub dc_kif: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<String>,
    pub item: Option<Vec<Value>>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub modified: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub shipment_type: Option<String>,
    pub tracking: Option<String>,
    pub version: Option<i64>,
}

/// ShipmentCreateData is the typed request payload for Shipment.create.
#[derive(Debug, Clone)]
pub struct ShipmentCreateData {
    pub carrier: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub date_received: Option<String>,
    pub date_shipped: Option<String>,
    pub dc_kif: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<String>,
    pub item: Option<Vec<Value>>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub modified: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub shipment_type: Option<String>,
    pub tracking: Option<String>,
    pub version: Option<i64>,
}

/// Success is the typed data model for the success entity.
#[derive(Debug, Clone)]
pub struct Success {
    pub success: Option<bool>,
}

/// SuccessCreateData is the typed request payload for Success.create.
#[derive(Debug, Clone)]
pub struct SuccessCreateData {
    pub share_partner_to: String,
}

/// SuccessRemoveMatch is the typed request payload for Success.remove.
#[derive(Debug, Clone)]
pub struct SuccessRemoveMatch {
    pub share_partner_to: String,
}

/// Transaction is the typed data model for the transaction entity.
#[derive(Debug, Clone)]
pub struct Transaction {
    pub alternate_key: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub client_ref: Option<String>,
    pub created: Option<String>,
    pub decrypted: Option<i64>,
    pub device_name: Option<String>,
    pub direct_partner: Option<std::collections::HashMap<String, Value>>,
    pub encrypted: Option<i64>,
    pub end_date: Option<String>,
    pub err_code: Option<String>,
    pub err_message: Option<String>,
    pub id: Option<String>,
    pub ip_address: Option<String>,
    pub is_virtual: Option<bool>,
    pub key_type: Option<String>,
    pub location: std::collections::HashMap<String, Value>,
    pub message_id: Option<String>,
    pub method: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub serial_number: Option<String>,
    pub start_date: Option<String>,
    pub success: Option<bool>,
    pub transaction_source: Option<String>,
}

/// TransactionLoadMatch is the typed request payload for Transaction.load.
#[derive(Debug, Clone)]
pub struct TransactionLoadMatch {
    pub id: String,
}

/// TransactionListMatch is the typed request payload for Transaction.list.
#[derive(Debug, Clone)]
pub struct TransactionListMatch {
    pub alternate_key: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub client_ref: Option<String>,
    pub created: Option<String>,
    pub decrypted: Option<i64>,
    pub device_name: Option<String>,
    pub direct_partner: Option<std::collections::HashMap<String, Value>>,
    pub encrypted: Option<i64>,
    pub end_date: Option<String>,
    pub err_code: Option<String>,
    pub err_message: Option<String>,
    pub id: Option<String>,
    pub ip_address: Option<String>,
    pub is_virtual: Option<bool>,
    pub key_type: Option<String>,
    pub location: Option<std::collections::HashMap<String, Value>>,
    pub message_id: Option<String>,
    pub method: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub serial_number: Option<String>,
    pub start_date: Option<String>,
    pub success: Option<bool>,
    pub transaction_source: Option<String>,
}

/// TransactionCreateData is the typed request payload for Transaction.create.
#[derive(Debug, Clone)]
pub struct TransactionCreateData {
    pub alternate_key: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub client_ref: Option<String>,
    pub created: Option<String>,
    pub decrypted: Option<i64>,
    pub device_name: Option<String>,
    pub direct_partner: Option<std::collections::HashMap<String, Value>>,
    pub encrypted: Option<i64>,
    pub end_date: Option<String>,
    pub err_code: Option<String>,
    pub err_message: Option<String>,
    pub id: Option<String>,
    pub ip_address: Option<String>,
    pub is_virtual: Option<bool>,
    pub key_type: Option<String>,
    pub location: std::collections::HashMap<String, Value>,
    pub message_id: Option<String>,
    pub method: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub serial_number: Option<String>,
    pub start_date: Option<String>,
    pub success: Option<bool>,
    pub transaction_source: Option<String>,
}

/// UpdateResult is the typed data model for the update_result entity.
#[derive(Debug, Clone)]
pub struct UpdateResult {
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub email: Option<String>,
    pub first_name: Option<String>,
    pub id: Option<String>,
    pub is_active: Option<bool>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub last_name: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub phone: Option<String>,
    pub user_name: Option<String>,
    pub user_role: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// UpdateResultListMatch is the typed request payload for UpdateResult.list.
#[derive(Debug, Clone)]
pub struct UpdateResultListMatch {
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub email: Option<String>,
    pub first_name: Option<String>,
    pub id: Option<String>,
    pub is_active: Option<bool>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub last_name: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub phone: Option<String>,
    pub user_name: Option<String>,
    pub user_role: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// UpdateResultCreateData is the typed request payload for UpdateResult.create.
#[derive(Debug, Clone)]
pub struct UpdateResultCreateData {
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub email: Option<String>,
    pub first_name: Option<String>,
    pub id: Option<String>,
    pub is_active: Option<bool>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub last_name: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub phone: Option<String>,
    pub user_name: Option<String>,
    pub user_role: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// UpdateResultUpdateData is the typed request payload for UpdateResult.update.
#[derive(Debug, Clone)]
pub struct UpdateResultUpdateData {
    pub id: String,
}

/// User is the typed data model for the user entity.
#[derive(Debug, Clone)]
pub struct User {
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub email: Option<String>,
    pub first_name: Option<String>,
    pub id: Option<String>,
    pub is_active: Option<bool>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub last_name: Option<String>,
    pub modified: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub phone: Option<String>,
    pub user_name: Option<String>,
    pub user_role: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// UserLoadMatch is the typed request payload for User.load.
#[derive(Debug, Clone)]
pub struct UserLoadMatch {
    pub id: String,
}

/// UserRemoveMatch is the typed request payload for User.remove.
#[derive(Debug, Clone)]
pub struct UserRemoveMatch {
    pub id: String,
}


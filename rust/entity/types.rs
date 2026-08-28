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
    pub completedate: Option<String>,
    pub created: Option<String>,
    pub device: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<String>,
    pub name: Option<String>,
    pub notes: Option<String>,
}

/// AttestationLoadMatch is the typed request payload for Attestation.load.
#[derive(Debug, Clone)]
pub struct AttestationLoadMatch {
    pub id: String,
}

/// AttestationListMatch is the typed request payload for Attestation.list.
#[derive(Debug, Clone)]
pub struct AttestationListMatch {
    pub client: String,
    pub skip: Option<i64>,
    pub take: Option<i64>,
}

/// AttestationCreateData is the typed request payload for Attestation.create.
#[derive(Debug, Clone)]
pub struct AttestationCreateData {
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub completedate: Option<String>,
    pub created: Option<String>,
    pub device: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<String>,
    pub name: Option<String>,
    pub notes: Option<String>,
}

/// Client is the typed data model for the client entity.
#[derive(Debug, Clone)]
pub struct Client {
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub directpartner: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<String>,
    pub isactive: Option<bool>,
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
    pub partner: String,
    pub skip: Option<i64>,
    pub take: Option<i64>,
}

/// ClientCreateData is the typed request payload for Client.create.
#[derive(Debug, Clone)]
pub struct ClientCreateData {
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub directpartner: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<String>,
    pub isactive: Option<bool>,
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
    pub activatedby: std::collections::HashMap<String, Value>,
    pub activationdate: Option<String>,
    pub alternatekey: Option<String>,
    pub auditnextdate: Option<String>,
    pub auditnotificationdate: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub createdby: std::collections::HashMap<String, Value>,
    pub devicebuild: Option<std::collections::HashMap<String, Value>>,
    pub devicestate: Option<std::collections::HashMap<String, Value>>,
    pub devicetype: Option<std::collections::HashMap<String, Value>>,
    pub errorcounter: Option<i64>,
    pub errorlastdate: Option<String>,
    pub id: Option<String>,
    pub initializedby: std::collections::HashMap<String, Value>,
    pub initializeddate: Option<String>,
    pub injectkey: Option<std::collections::HashMap<String, Value>>,
    pub isvirtual: Option<bool>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub lastactivitydate: Option<String>,
    pub location: std::collections::HashMap<String, Value>,
    pub modified: Option<String>,
    pub modifiedby: std::collections::HashMap<String, Value>,
    pub name: Option<String>,
    pub notes: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub serialnumber: Option<String>,
    pub version: Option<i64>,
}

/// DeviceLoadMatch is the typed request payload for Device.load.
#[derive(Debug, Clone)]
pub struct DeviceLoadMatch {
    pub id: String,
}

/// DeviceListMatch is the typed request payload for Device.list.
#[derive(Debug, Clone)]
pub struct DeviceListMatch {
    pub client: Option<String>,
    pub device_state: Option<String>,
    pub kif: Option<String>,
    pub partner: Option<String>,
    pub serial_number: Option<String>,
    pub skip: Option<i64>,
    pub sorting_direction: Option<String>,
    pub sorting_field: Option<String>,
    pub take: Option<i64>,
}

/// DeviceCreateData is the typed request payload for Device.create.
#[derive(Debug, Clone)]
pub struct DeviceCreateData {
    pub activatedby: std::collections::HashMap<String, Value>,
    pub activationdate: Option<String>,
    pub alternatekey: Option<String>,
    pub auditnextdate: Option<String>,
    pub auditnotificationdate: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub createdby: std::collections::HashMap<String, Value>,
    pub devicebuild: Option<std::collections::HashMap<String, Value>>,
    pub devicestate: Option<std::collections::HashMap<String, Value>>,
    pub devicetype: Option<std::collections::HashMap<String, Value>>,
    pub errorcounter: Option<i64>,
    pub errorlastdate: Option<String>,
    pub id: Option<String>,
    pub initializedby: std::collections::HashMap<String, Value>,
    pub initializeddate: Option<String>,
    pub injectkey: Option<std::collections::HashMap<String, Value>>,
    pub isvirtual: Option<bool>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub lastactivitydate: Option<String>,
    pub location: std::collections::HashMap<String, Value>,
    pub modified: Option<String>,
    pub modifiedby: std::collections::HashMap<String, Value>,
    pub name: Option<String>,
    pub notes: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub serialnumber: Option<String>,
    pub version: Option<i64>,
}

/// DeviceBuild is the typed data model for the device_build entity.
#[derive(Debug, Clone)]
pub struct DeviceBuild {
    pub appversion: Option<String>,
    pub buildnumber: Option<String>,
    pub configfilename: Option<String>,
    pub created: Option<String>,
    pub devicetype: Option<String>,
    pub firmwareversion: Option<String>,
    pub hardwareversion: Option<String>,
    pub id: Option<i64>,
    pub isactive: Option<bool>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub notes: Option<String>,
    pub version: Option<i64>,
    pub whitelistingbinranges: Option<String>,
    pub whitelistingused: Option<bool>,
}

/// DeviceBuildLoadMatch is the typed request payload for DeviceBuild.load.
#[derive(Debug, Clone)]
pub struct DeviceBuildLoadMatch {
    pub id: String,
}

/// DeviceBuildListMatch is the typed request payload for DeviceBuild.list.
#[derive(Debug, Clone)]
pub struct DeviceBuildListMatch {
    pub device_type: Option<String>,
    pub skip: Option<i64>,
    pub take: Option<i64>,
}

/// DeviceCustodyDetail is the typed data model for the device_custody_detail entity.
#[derive(Debug, Clone)]
pub struct DeviceCustodyDetail {
    pub completedate: Option<String>,
    pub created: Option<String>,
    pub createdby: std::collections::HashMap<String, Value>,
    pub custodian: std::collections::HashMap<String, Value>,
    pub device: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<i64>,
    pub location: std::collections::HashMap<String, Value>,
    pub modified: Option<String>,
    pub modifiedby: std::collections::HashMap<String, Value>,
    pub notes: Option<String>,
    pub status: Option<std::collections::HashMap<String, Value>>,
    pub transfermethod: Option<std::collections::HashMap<String, Value>>,
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
    pub completedate: Option<String>,
    pub created: Option<String>,
    pub createdby: std::collections::HashMap<String, Value>,
    pub custodian: std::collections::HashMap<String, Value>,
    pub device: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<i64>,
    pub location: std::collections::HashMap<String, Value>,
    pub modified: Option<String>,
    pub modifiedby: std::collections::HashMap<String, Value>,
    pub notes: Option<String>,
    pub status: Option<std::collections::HashMap<String, Value>>,
    pub transfermethod: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// DeviceCustodyListListMatch is the typed request payload for DeviceCustodyList.list.
#[derive(Debug, Clone)]
pub struct DeviceCustodyListListMatch {
    pub device_type: String,
    pub serial_number: String,
    pub skip: Option<i64>,
    pub take: Option<i64>,
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
    pub skip: Option<i64>,
    pub sorting_direction: Option<String>,
    pub sorting_field: Option<String>,
    pub take: Option<i64>,
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
    pub devicetypemode: Option<String>,
    pub hardwareversion: Option<String>,
    pub id: Option<String>,
    pub isactive: Option<bool>,
    pub manufacturer: Option<String>,
    pub model: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub photourl: Option<String>,
    pub productname: Option<String>,
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
    pub devicetypemode: Option<String>,
    pub hardwareversion: Option<String>,
    pub id: Option<String>,
    pub isactive: Option<bool>,
    pub manufacturer: Option<String>,
    pub model: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub photourl: Option<String>,
    pub productname: Option<String>,
    pub version: Option<i64>,
}

/// InjectKey is the typed data model for the inject_key entity.
#[derive(Debug, Clone)]
pub struct InjectKey {
    pub created: Option<String>,
    pub id: Option<String>,
    pub isactive: Option<bool>,
    pub isp2pe: Option<bool>,
    pub keytype: Option<String>,
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
    pub isactive: Option<bool>,
    pub isp2pe: Option<bool>,
    pub keytype: Option<String>,
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
    pub billingid: Option<String>,
    pub city: Option<String>,
    pub country: Option<String>,
    pub created: Option<String>,
    pub customreference: Option<String>,
    pub id: Option<String>,
    pub locationtype: Option<String>,
    pub mailaddress1: Option<String>,
    pub mailaddress2: Option<String>,
    pub mailcity: Option<String>,
    pub mailcountry: Option<String>,
    pub mailpostalcode: Option<String>,
    pub mailstateprovince: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub nameofbusiness: Option<String>,
    pub notes: Option<String>,
    pub postalcode: Option<String>,
    pub stateprovince: Option<String>,
    pub uniqueid: Option<String>,
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
    pub client: String,
    pub skip: Option<i64>,
    pub take: Option<i64>,
}

/// LocationCreateData is the typed request payload for Location.create.
#[derive(Debug, Clone)]
pub struct LocationCreateData {
    pub address1: Option<String>,
    pub address2: Option<String>,
    pub billingid: Option<String>,
    pub city: Option<String>,
    pub country: Option<String>,
    pub created: Option<String>,
    pub customreference: Option<String>,
    pub id: Option<String>,
    pub locationtype: Option<String>,
    pub mailaddress1: Option<String>,
    pub mailaddress2: Option<String>,
    pub mailcity: Option<String>,
    pub mailcountry: Option<String>,
    pub mailpostalcode: Option<String>,
    pub mailstateprovince: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub nameofbusiness: Option<String>,
    pub notes: Option<String>,
    pub postalcode: Option<String>,
    pub stateprovince: Option<String>,
    pub uniqueid: Option<String>,
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
    pub billingid: Option<String>,
    pub clientcanorderequipment: Option<bool>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub id: Option<String>,
    pub isactive: Option<bool>,
    pub location: std::collections::HashMap<String, Value>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub partnerid: Option<String>,
    pub reference: Option<String>,
    pub verificationphrase: Option<String>,
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
    pub partner: Option<String>,
    pub skip: Option<i64>,
    pub take: Option<i64>,
}

/// PartnerCreateData is the typed request payload for Partner.create.
#[derive(Debug, Clone)]
pub struct PartnerCreateData {
    pub billingid: Option<String>,
    pub clientcanorderequipment: Option<bool>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub id: Option<String>,
    pub isactive: Option<bool>,
    pub location: std::collections::HashMap<String, Value>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub partnerid: Option<String>,
    pub reference: Option<String>,
    pub verificationphrase: Option<String>,
    pub version: Option<i64>,
}

/// Shipment is the typed data model for the shipment entity.
#[derive(Debug, Clone)]
pub struct Shipment {
    pub carrier: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub datereceived: Option<String>,
    pub dateshipped: Option<String>,
    pub dckif: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<String>,
    pub items: Option<Vec<Value>>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub modified: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub shipmenttype: Option<String>,
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
    pub kif: String,
    pub mode: Option<String>,
    pub skip: Option<i64>,
    pub take: Option<i64>,
}

/// ShipmentCreateData is the typed request payload for Shipment.create.
#[derive(Debug, Clone)]
pub struct ShipmentCreateData {
    pub carrier: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub datereceived: Option<String>,
    pub dateshipped: Option<String>,
    pub dckif: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<String>,
    pub items: Option<Vec<Value>>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub modified: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub shipmenttype: Option<String>,
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
    pub success: Option<bool>,
}

/// SuccessRemoveMatch is the typed request payload for Success.remove.
#[derive(Debug, Clone)]
pub struct SuccessRemoveMatch {
    pub share_partner_to: String,
}

/// Transaction is the typed data model for the transaction entity.
#[derive(Debug, Clone)]
pub struct Transaction {
    pub alternatekey: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub clientref: Option<String>,
    pub created: Option<String>,
    pub decrypted: Option<i64>,
    pub devicename: Option<String>,
    pub directpartner: Option<std::collections::HashMap<String, Value>>,
    pub encrypted: Option<i64>,
    pub enddate: Option<String>,
    pub errcode: Option<String>,
    pub errmessage: Option<String>,
    pub id: Option<String>,
    pub ipaddress: Option<String>,
    pub isvirtual: Option<bool>,
    pub keytype: Option<String>,
    pub location: std::collections::HashMap<String, Value>,
    pub messageid: Option<String>,
    pub method: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub serialnumber: Option<String>,
    pub startdate: Option<String>,
    pub success: Option<bool>,
    pub transactionsource: Option<String>,
}

/// TransactionLoadMatch is the typed request payload for Transaction.load.
#[derive(Debug, Clone)]
pub struct TransactionLoadMatch {
    pub id: String,
}

/// TransactionListMatch is the typed request payload for Transaction.list.
#[derive(Debug, Clone)]
pub struct TransactionListMatch {
    pub client: Option<String>,
    pub client_ref: Option<String>,
    pub date_from: Option<String>,
    pub date_to: Option<String>,
    pub location: Option<String>,
    pub message_id: Option<String>,
    pub paging_mode: Option<String>,
    pub partner: Option<String>,
    pub reference: Option<String>,
    pub serial_number: Option<String>,
    pub skip: Option<i64>,
    pub success: Option<bool>,
    pub take: Option<i64>,
}

/// TransactionCreateData is the typed request payload for Transaction.create.
#[derive(Debug, Clone)]
pub struct TransactionCreateData {
    pub alternatekey: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub clientref: Option<String>,
    pub created: Option<String>,
    pub decrypted: Option<i64>,
    pub devicename: Option<String>,
    pub directpartner: Option<std::collections::HashMap<String, Value>>,
    pub encrypted: Option<i64>,
    pub enddate: Option<String>,
    pub errcode: Option<String>,
    pub errmessage: Option<String>,
    pub id: Option<String>,
    pub ipaddress: Option<String>,
    pub isvirtual: Option<bool>,
    pub keytype: Option<String>,
    pub location: std::collections::HashMap<String, Value>,
    pub messageid: Option<String>,
    pub method: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub serialnumber: Option<String>,
    pub startdate: Option<String>,
    pub success: Option<bool>,
    pub transactionsource: Option<String>,
}

/// UpdateResult is the typed data model for the update_result entity.
#[derive(Debug, Clone)]
pub struct UpdateResult {
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub email: Option<String>,
    pub firstname: Option<String>,
    pub id: Option<String>,
    pub isactive: Option<bool>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub lastname: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub phone: Option<String>,
    pub username: Option<String>,
    pub userrole: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// UpdateResultListMatch is the typed request payload for UpdateResult.list.
#[derive(Debug, Clone)]
pub struct UpdateResultListMatch {
    pub client: Option<String>,
    pub kif: Option<String>,
    pub partner: Option<Value>,
    pub skip: Option<i64>,
    pub take: Option<i64>,
}

/// UpdateResultCreateData is the typed request payload for UpdateResult.create.
#[derive(Debug, Clone)]
pub struct UpdateResultCreateData {
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub email: Option<String>,
    pub firstname: Option<String>,
    pub id: Option<String>,
    pub isactive: Option<bool>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub lastname: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub phone: Option<String>,
    pub username: Option<String>,
    pub userrole: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// UpdateResultUpdateData is the typed request payload for UpdateResult.update.
#[derive(Debug, Clone)]
pub struct UpdateResultUpdateData {
    pub id: String,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub email: Option<String>,
    pub firstname: Option<String>,
    pub isactive: Option<bool>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub lastname: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub phone: Option<String>,
    pub username: Option<String>,
    pub userrole: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// User is the typed data model for the user entity.
#[derive(Debug, Clone)]
pub struct User {
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub email: Option<String>,
    pub firstname: Option<String>,
    pub id: Option<String>,
    pub isactive: Option<bool>,
    pub kif: Option<std::collections::HashMap<String, Value>>,
    pub lastname: Option<String>,
    pub modified: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub phone: Option<String>,
    pub username: Option<String>,
    pub userrole: Option<std::collections::HashMap<String, Value>>,
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


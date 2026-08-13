// Typed models for the BluefinDecryptxP2pe SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types are mapped
// from the canonical type sentinels. Do not edit by hand.
//
// These are DOCUMENTARY: the SDK runtime is dynamic (ops take/return the
// `Value` enum), so nothing consumes these structs yet — they mirror the
// entity/op shapes for reference and IDE support.

import Foundation

/// Attestation is the typed data model for the attestation entity.
public struct Attestation {
  public var client: VMap?
  public var completeDate: String?
  public var created: String?
  public var device: VMap?
  public var id: String?
  public var name: String?
  public var notes: String?
}

/// AttestationLoadMatch is the typed request payload for Attestation.load.
public struct AttestationLoadMatch {
  public var id: String
}

/// AttestationListMatch is the typed request payload for Attestation.list.
public struct AttestationListMatch {
  public var client: VMap?
  public var completeDate: String?
  public var created: String?
  public var device: VMap?
  public var id: String?
  public var name: String?
  public var notes: String?
}

/// AttestationCreateData is the typed request payload for Attestation.create.
public struct AttestationCreateData {
  public var client: VMap?
  public var completeDate: String?
  public var created: String?
  public var device: VMap?
  public var id: String?
  public var name: String?
  public var notes: String?
}

/// Client is the typed data model for the client entity.
public struct Client {
  public var contact: VMap?
  public var created: String?
  public var directPartner: VMap?
  public var id: String?
  public var isActive: Bool?
  public var location: VMap
  public var mid: String?
  public var modified: String?
  public var name: String?
  public var partner: VMap?
  public var version: Int?
}

/// ClientLoadMatch is the typed request payload for Client.load.
public struct ClientLoadMatch {
  public var id: String
}

/// ClientListMatch is the typed request payload for Client.list.
public struct ClientListMatch {
  public var contact: VMap?
  public var created: String?
  public var directPartner: VMap?
  public var id: String?
  public var isActive: Bool?
  public var location: VMap?
  public var mid: String?
  public var modified: String?
  public var name: String?
  public var partner: VMap?
  public var version: Int?
}

/// ClientCreateData is the typed request payload for Client.create.
public struct ClientCreateData {
  public var contact: VMap?
  public var created: String?
  public var directPartner: VMap?
  public var id: String?
  public var isActive: Bool?
  public var location: VMap
  public var mid: String?
  public var modified: String?
  public var name: String?
  public var partner: VMap?
  public var version: Int?
}

/// ClientRemoveMatch is the typed request payload for Client.remove.
public struct ClientRemoveMatch {
  public var id: String
}

/// CreateResult is the typed data model for the create_result entity.
public struct CreateResult {
}

/// CreateResultCreateData is the typed request payload for CreateResult.create.
public struct CreateResultCreateData {
  public var deviceType: String
  public var serialNumber: String
}

/// Decryption is the typed data model for the decryption entity.
public struct Decryption {
  public var success: Bool?
}

/// DecryptionCreateData is the typed request payload for Decryption.create.
public struct DecryptionCreateData {
  public var success: Bool?
}

/// Device is the typed data model for the device entity.
public struct Device {
  public var activatedBy: VMap
  public var activationDate: String?
  public var alternateKey: String?
  public var auditNextDate: String?
  public var auditNotificationDate: String?
  public var client: VMap?
  public var created: String?
  public var createdBy: VMap
  public var deviceBuild: VMap?
  public var deviceState: VMap?
  public var deviceType: VMap?
  public var errorCounter: Int?
  public var errorLastDate: String?
  public var id: String?
  public var initializedBy: VMap
  public var initializedDate: String?
  public var injectKey: VMap?
  public var isVirtual: Bool?
  public var kif: VMap?
  public var lastActivityDate: String?
  public var location: VMap
  public var modified: String?
  public var modifiedBy: VMap
  public var name: String?
  public var notes: String?
  public var partner: VMap?
  public var serialNumber: String?
  public var version: Int?
}

/// DeviceLoadMatch is the typed request payload for Device.load.
public struct DeviceLoadMatch {
  public var deviceType: String?
  public var serialNumber: String?
  public var id: String?
}

/// DeviceListMatch is the typed request payload for Device.list.
public struct DeviceListMatch {
  public var activatedBy: VMap?
  public var activationDate: String?
  public var alternateKey: String?
  public var auditNextDate: String?
  public var auditNotificationDate: String?
  public var client: VMap?
  public var created: String?
  public var createdBy: VMap?
  public var deviceBuild: VMap?
  public var deviceState: VMap?
  public var deviceType: VMap?
  public var errorCounter: Int?
  public var errorLastDate: String?
  public var id: String?
  public var initializedBy: VMap?
  public var initializedDate: String?
  public var injectKey: VMap?
  public var isVirtual: Bool?
  public var kif: VMap?
  public var lastActivityDate: String?
  public var location: VMap?
  public var modified: String?
  public var modifiedBy: VMap?
  public var name: String?
  public var notes: String?
  public var partner: VMap?
  public var serialNumber: String?
  public var version: Int?
}

/// DeviceCreateData is the typed request payload for Device.create.
public struct DeviceCreateData {
  public var activatedBy: VMap
  public var activationDate: String?
  public var alternateKey: String?
  public var auditNextDate: String?
  public var auditNotificationDate: String?
  public var client: VMap?
  public var created: String?
  public var createdBy: VMap
  public var deviceBuild: VMap?
  public var deviceState: VMap?
  public var deviceType: VMap?
  public var errorCounter: Int?
  public var errorLastDate: String?
  public var id: String?
  public var initializedBy: VMap
  public var initializedDate: String?
  public var injectKey: VMap?
  public var isVirtual: Bool?
  public var kif: VMap?
  public var lastActivityDate: String?
  public var location: VMap
  public var modified: String?
  public var modifiedBy: VMap
  public var name: String?
  public var notes: String?
  public var partner: VMap?
  public var serialNumber: String?
  public var version: Int?
}

/// DeviceBuild is the typed data model for the device_build entity.
public struct DeviceBuild {
  public var appVersion: String?
  public var buildNumber: String?
  public var configFileName: String?
  public var created: String?
  public var deviceType: String?
  public var firmwareVersion: String?
  public var hardwareVersion: String?
  public var id: Int?
  public var isActive: Bool?
  public var modified: String?
  public var name: String?
  public var notes: String?
  public var version: Int?
  public var whiteListingBinRanges: String?
  public var whiteListingUsed: Bool?
}

/// DeviceBuildLoadMatch is the typed request payload for DeviceBuild.load.
public struct DeviceBuildLoadMatch {
  public var id: String
}

/// DeviceBuildListMatch is the typed request payload for DeviceBuild.list.
public struct DeviceBuildListMatch {
  public var appVersion: String?
  public var buildNumber: String?
  public var configFileName: String?
  public var created: String?
  public var deviceType: String?
  public var firmwareVersion: String?
  public var hardwareVersion: String?
  public var id: Int?
  public var isActive: Bool?
  public var modified: String?
  public var name: String?
  public var notes: String?
  public var version: Int?
  public var whiteListingBinRanges: String?
  public var whiteListingUsed: Bool?
}

/// DeviceCustodyDetail is the typed data model for the device_custody_detail entity.
public struct DeviceCustodyDetail {
  public var completeDate: String?
  public var created: String?
  public var createdBy: VMap
  public var custodian: VMap
  public var device: VMap?
  public var id: Int?
  public var location: VMap
  public var modified: String?
  public var modifiedBy: VMap
  public var notes: String?
  public var status: VMap?
  public var transferMethod: VMap?
  public var version: Int?
}

/// DeviceCustodyDetailLoadMatch is the typed request payload for DeviceCustodyDetail.load.
public struct DeviceCustodyDetailLoadMatch {
  public var deviceType: String
  public var id: String
  public var serialNumber: String
}

/// DeviceCustodyList is the typed data model for the device_custody_list entity.
public struct DeviceCustodyList {
  public var completeDate: String?
  public var created: String?
  public var createdBy: VMap
  public var custodian: VMap
  public var device: VMap?
  public var id: Int?
  public var location: VMap
  public var modified: String?
  public var modifiedBy: VMap
  public var notes: String?
  public var status: VMap?
  public var transferMethod: VMap?
  public var version: Int?
}

/// DeviceCustodyListListMatch is the typed request payload for DeviceCustodyList.list.
public struct DeviceCustodyListListMatch {
  public var deviceType: String
  public var serialNumber: String
}

/// DeviceList is the typed data model for the device_list entity.
public struct DeviceList {
  public var data: [Value]?
  public var total: Int?
}

/// DeviceListLoadMatch is the typed request payload for DeviceList.load.
public struct DeviceListLoadMatch {
  public var sharePartnerTo: String
}

/// DeviceReceiveResult is the typed data model for the device_receive_result entity.
public struct DeviceReceiveResult {
  public var success: Bool
}

/// DeviceReceiveResultCreateData is the typed request payload for DeviceReceiveResult.create.
public struct DeviceReceiveResultCreateData {
  public var success: Bool
}

/// DeviceRkiActivateResult is the typed data model for the device_rki_activate_result entity.
public struct DeviceRkiActivateResult {
  public var success: Bool
}

/// DeviceRkiActivateResultCreateData is the typed request payload for DeviceRkiActivateResult.create.
public struct DeviceRkiActivateResultCreateData {
  public var success: Bool
}

/// DeviceState is the typed data model for the device_state entity.
public struct DeviceState {
  public var id: Int?
  public var name: String?
}

/// DeviceStateListMatch is the typed request payload for DeviceState.list.
public struct DeviceStateListMatch {
  public var id: Int?
  public var name: String?
}

/// DeviceType is the typed data model for the device_type entity.
public struct DeviceType {
  public var created: String?
  public var deviceTypeMode: String?
  public var hardwareVersion: String?
  public var id: String?
  public var isActive: Bool?
  public var manufacturer: String?
  public var model: String?
  public var modified: String?
  public var name: String?
  public var photoUrl: String?
  public var productName: String?
  public var version: Int?
}

/// DeviceTypeLoadMatch is the typed request payload for DeviceType.load.
public struct DeviceTypeLoadMatch {
  public var id: String
}

/// DeviceTypeListMatch is the typed request payload for DeviceType.list.
public struct DeviceTypeListMatch {
  public var created: String?
  public var deviceTypeMode: String?
  public var hardwareVersion: String?
  public var id: String?
  public var isActive: Bool?
  public var manufacturer: String?
  public var model: String?
  public var modified: String?
  public var name: String?
  public var photoUrl: String?
  public var productName: String?
  public var version: Int?
}

/// InjectKey is the typed data model for the inject_key entity.
public struct InjectKey {
  public var created: String?
  public var id: String?
  public var isActive: Bool?
  public var isP2Pe: Bool?
  public var keyType: String?
  public var modified: String?
  public var name: String?
  public var version: Int?
}

/// InjectKeyLoadMatch is the typed request payload for InjectKey.load.
public struct InjectKeyLoadMatch {
  public var id: String
}

/// InjectKeyListMatch is the typed request payload for InjectKey.list.
public struct InjectKeyListMatch {
  public var created: String?
  public var id: String?
  public var isActive: Bool?
  public var isP2Pe: Bool?
  public var keyType: String?
  public var modified: String?
  public var name: String?
  public var version: Int?
}

/// Kif is the typed data model for the kif entity.
public struct Kif {
  public var id: Int?
  public var name: String?
}

/// KifListMatch is the typed request payload for Kif.list.
public struct KifListMatch {
  public var id: Int?
  public var name: String?
}

/// Location is the typed data model for the location entity.
public struct Location {
  public var address1: String?
  public var address2: String?
  public var billingId: String?
  public var city: String?
  public var country: String?
  public var created: String?
  public var customReference: String?
  public var id: String?
  public var locationType: String?
  public var mailAddress1: String?
  public var mailAddress2: String?
  public var mailCity: String?
  public var mailCountry: String?
  public var mailPostalCode: String?
  public var mailStateProvince: String?
  public var modified: String?
  public var name: String?
  public var nameOfBusiness: String?
  public var notes: String?
  public var postalCode: String?
  public var stateProvince: String?
  public var uniqueId: String?
  public var version: Int?
}

/// LocationLoadMatch is the typed request payload for Location.load.
public struct LocationLoadMatch {
  public var id: String
}

/// LocationListMatch is the typed request payload for Location.list.
public struct LocationListMatch {
  public var address1: String?
  public var address2: String?
  public var billingId: String?
  public var city: String?
  public var country: String?
  public var created: String?
  public var customReference: String?
  public var id: String?
  public var locationType: String?
  public var mailAddress1: String?
  public var mailAddress2: String?
  public var mailCity: String?
  public var mailCountry: String?
  public var mailPostalCode: String?
  public var mailStateProvince: String?
  public var modified: String?
  public var name: String?
  public var nameOfBusiness: String?
  public var notes: String?
  public var postalCode: String?
  public var stateProvince: String?
  public var uniqueId: String?
  public var version: Int?
}

/// LocationCreateData is the typed request payload for Location.create.
public struct LocationCreateData {
  public var address1: String?
  public var address2: String?
  public var billingId: String?
  public var city: String?
  public var country: String?
  public var created: String?
  public var customReference: String?
  public var id: String?
  public var locationType: String?
  public var mailAddress1: String?
  public var mailAddress2: String?
  public var mailCity: String?
  public var mailCountry: String?
  public var mailPostalCode: String?
  public var mailStateProvince: String?
  public var modified: String?
  public var name: String?
  public var nameOfBusiness: String?
  public var notes: String?
  public var postalCode: String?
  public var stateProvince: String?
  public var uniqueId: String?
  public var version: Int?
}

/// LocationRemoveMatch is the typed request payload for Location.remove.
public struct LocationRemoveMatch {
  public var id: String
}

/// Partner is the typed data model for the partner entity.
public struct Partner {
  public var billingId: String?
  public var clientCanOrderEquipment: Bool?
  public var contact: VMap?
  public var created: String?
  public var id: String?
  public var isActive: Bool?
  public var location: VMap
  public var modified: String?
  public var name: String?
  public var parent: VMap?
  public var partnerId: String?
  public var reference: String?
  public var verificationPhrase: String?
  public var version: Int?
}

/// PartnerLoadMatch is the typed request payload for Partner.load.
public struct PartnerLoadMatch {
  public var id: String
}

/// PartnerListMatch is the typed request payload for Partner.list.
public struct PartnerListMatch {
  public var billingId: String?
  public var clientCanOrderEquipment: Bool?
  public var contact: VMap?
  public var created: String?
  public var id: String?
  public var isActive: Bool?
  public var location: VMap?
  public var modified: String?
  public var name: String?
  public var parent: VMap?
  public var partnerId: String?
  public var reference: String?
  public var verificationPhrase: String?
  public var version: Int?
}

/// PartnerCreateData is the typed request payload for Partner.create.
public struct PartnerCreateData {
  public var billingId: String?
  public var clientCanOrderEquipment: Bool?
  public var contact: VMap?
  public var created: String?
  public var id: String?
  public var isActive: Bool?
  public var location: VMap
  public var modified: String?
  public var name: String?
  public var parent: VMap?
  public var partnerId: String?
  public var reference: String?
  public var verificationPhrase: String?
  public var version: Int?
}

/// Shipment is the typed data model for the shipment entity.
public struct Shipment {
  public var carrier: String?
  public var client: VMap?
  public var created: String?
  public var dateReceived: String?
  public var dateShipped: String?
  public var dcKif: VMap?
  public var id: String?
  public var items: [Value]?
  public var kif: VMap?
  public var modified: String?
  public var partner: VMap?
  public var shipmentType: String?
  public var tracking: String?
  public var version: Int?
}

/// ShipmentLoadMatch is the typed request payload for Shipment.load.
public struct ShipmentLoadMatch {
  public var id: String
}

/// ShipmentListMatch is the typed request payload for Shipment.list.
public struct ShipmentListMatch {
  public var carrier: String?
  public var client: VMap?
  public var created: String?
  public var dateReceived: String?
  public var dateShipped: String?
  public var dcKif: VMap?
  public var id: String?
  public var items: [Value]?
  public var kif: VMap?
  public var modified: String?
  public var partner: VMap?
  public var shipmentType: String?
  public var tracking: String?
  public var version: Int?
}

/// ShipmentCreateData is the typed request payload for Shipment.create.
public struct ShipmentCreateData {
  public var carrier: String?
  public var client: VMap?
  public var created: String?
  public var dateReceived: String?
  public var dateShipped: String?
  public var dcKif: VMap?
  public var id: String?
  public var items: [Value]?
  public var kif: VMap?
  public var modified: String?
  public var partner: VMap?
  public var shipmentType: String?
  public var tracking: String?
  public var version: Int?
}

/// Success is the typed data model for the success entity.
public struct Success {
  public var success: Bool?
}

/// SuccessCreateData is the typed request payload for Success.create.
public struct SuccessCreateData {
  public var sharePartnerTo: String
  public var success: Bool?
}

/// SuccessRemoveMatch is the typed request payload for Success.remove.
public struct SuccessRemoveMatch {
  public var sharePartnerTo: String
}

/// Transaction is the typed data model for the transaction entity.
public struct Transaction {
  public var alternateKey: String?
  public var client: VMap?
  public var clientRef: String?
  public var created: String?
  public var decrypted: Int?
  public var deviceName: String?
  public var directPartner: VMap?
  public var encrypted: Int?
  public var endDate: String?
  public var errCode: String?
  public var errMessage: String?
  public var id: String?
  public var ipAddress: String?
  public var isVirtual: Bool?
  public var keyType: String?
  public var location: VMap
  public var messageId: String?
  public var method: String?
  public var partner: VMap?
  public var reference: String?
  public var serialNumber: String?
  public var startDate: String?
  public var success: Bool?
  public var transactionSource: String?
}

/// TransactionLoadMatch is the typed request payload for Transaction.load.
public struct TransactionLoadMatch {
  public var id: String
}

/// TransactionListMatch is the typed request payload for Transaction.list.
public struct TransactionListMatch {
  public var alternateKey: String?
  public var client: VMap?
  public var clientRef: String?
  public var created: String?
  public var decrypted: Int?
  public var deviceName: String?
  public var directPartner: VMap?
  public var encrypted: Int?
  public var endDate: String?
  public var errCode: String?
  public var errMessage: String?
  public var id: String?
  public var ipAddress: String?
  public var isVirtual: Bool?
  public var keyType: String?
  public var location: VMap?
  public var messageId: String?
  public var method: String?
  public var partner: VMap?
  public var reference: String?
  public var serialNumber: String?
  public var startDate: String?
  public var success: Bool?
  public var transactionSource: String?
}

/// TransactionCreateData is the typed request payload for Transaction.create.
public struct TransactionCreateData {
  public var alternateKey: String?
  public var client: VMap?
  public var clientRef: String?
  public var created: String?
  public var decrypted: Int?
  public var deviceName: String?
  public var directPartner: VMap?
  public var encrypted: Int?
  public var endDate: String?
  public var errCode: String?
  public var errMessage: String?
  public var id: String?
  public var ipAddress: String?
  public var isVirtual: Bool?
  public var keyType: String?
  public var location: VMap
  public var messageId: String?
  public var method: String?
  public var partner: VMap?
  public var reference: String?
  public var serialNumber: String?
  public var startDate: String?
  public var success: Bool?
  public var transactionSource: String?
}

/// UpdateResult is the typed data model for the update_result entity.
public struct UpdateResult {
  public var client: VMap?
  public var email: String?
  public var firstName: String?
  public var id: String?
  public var isActive: Bool?
  public var kif: VMap?
  public var lastName: String?
  public var partner: VMap?
  public var phone: String?
  public var userName: String?
  public var userRole: VMap?
  public var version: Int?
}

/// UpdateResultListMatch is the typed request payload for UpdateResult.list.
public struct UpdateResultListMatch {
  public var client: VMap?
  public var email: String?
  public var firstName: String?
  public var id: String?
  public var isActive: Bool?
  public var kif: VMap?
  public var lastName: String?
  public var partner: VMap?
  public var phone: String?
  public var userName: String?
  public var userRole: VMap?
  public var version: Int?
}

/// UpdateResultCreateData is the typed request payload for UpdateResult.create.
public struct UpdateResultCreateData {
  public var client: VMap?
  public var email: String?
  public var firstName: String?
  public var id: String?
  public var isActive: Bool?
  public var kif: VMap?
  public var lastName: String?
  public var partner: VMap?
  public var phone: String?
  public var userName: String?
  public var userRole: VMap?
  public var version: Int?
}

/// UpdateResultUpdateData is the typed request payload for UpdateResult.update.
public struct UpdateResultUpdateData {
  public var id: String
  public var client: VMap?
  public var email: String?
  public var firstName: String?
  public var isActive: Bool?
  public var kif: VMap?
  public var lastName: String?
  public var partner: VMap?
  public var phone: String?
  public var userName: String?
  public var userRole: VMap?
  public var version: Int?
}

/// User is the typed data model for the user entity.
public struct User {
  public var client: VMap?
  public var created: String?
  public var email: String?
  public var firstName: String?
  public var id: String?
  public var isActive: Bool?
  public var kif: VMap?
  public var lastName: String?
  public var modified: String?
  public var partner: VMap?
  public var phone: String?
  public var userName: String?
  public var userRole: VMap?
  public var version: Int?
}

/// UserLoadMatch is the typed request payload for User.load.
public struct UserLoadMatch {
  public var id: String
}

/// UserRemoveMatch is the typed request payload for User.remove.
public struct UserRemoveMatch {
  public var id: String
}


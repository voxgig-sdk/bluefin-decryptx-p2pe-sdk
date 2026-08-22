package voxgig.bluefindecryptxp2pesdk.core

// Typed reference models for the BluefinDecryptxP2pe SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These case classes are documentation/DX reference shapes ONLY. The SDK ops
// take and return the loose object model (java.util.Map[String, Object] /
// Object) at runtime, so these types are not wired into the op signatures —
// use them to describe a payload before converting it to a map. Every
// component is a boxed (nullable) type, so an optional (req:false) key needs
// no distinct rendering.

object BluefinDecryptxP2peTypes {

  final case class Attestation(client: java.util.Map[String, Object], completeDate: String, created: String, device: java.util.Map[String, Object], id: String, name: String, notes: String)

  final case class AttestationLoadMatch(id: String)

  final case class AttestationListMatch(client: java.util.Map[String, Object], completeDate: String, created: String, device: java.util.Map[String, Object], id: String, name: String, notes: String)

  final case class AttestationCreateData(client: java.util.Map[String, Object], completeDate: String, created: String, device: java.util.Map[String, Object], id: String, name: String, notes: String)

  final case class Client(contact: java.util.Map[String, Object], created: String, directPartner: java.util.Map[String, Object], id: String, isActive: java.lang.Boolean, location: java.util.Map[String, Object], mid: String, modified: String, name: String, partner: java.util.Map[String, Object], version: java.lang.Long)

  final case class ClientLoadMatch(id: String)

  final case class ClientListMatch(contact: java.util.Map[String, Object], created: String, directPartner: java.util.Map[String, Object], id: String, isActive: java.lang.Boolean, location: java.util.Map[String, Object], mid: String, modified: String, name: String, partner: java.util.Map[String, Object], version: java.lang.Long)

  final case class ClientCreateData(contact: java.util.Map[String, Object], created: String, directPartner: java.util.Map[String, Object], id: String, isActive: java.lang.Boolean, location: java.util.Map[String, Object], mid: String, modified: String, name: String, partner: java.util.Map[String, Object], version: java.lang.Long)

  final case class ClientRemoveMatch(id: String)

  final case class CreateResult()

  final case class CreateResultCreateData(device_type: String, serial_number: String)

  final case class Decryption(success: java.lang.Boolean)

  final case class DecryptionCreateData(success: java.lang.Boolean)

  final case class Device(activatedBy: java.util.Map[String, Object], activationDate: String, alternateKey: String, auditNextDate: String, auditNotificationDate: String, client: java.util.Map[String, Object], created: String, createdBy: java.util.Map[String, Object], deviceBuild: java.util.Map[String, Object], deviceState: java.util.Map[String, Object], deviceType: java.util.Map[String, Object], errorCounter: java.lang.Long, errorLastDate: String, id: String, initializedBy: java.util.Map[String, Object], initializedDate: String, injectKey: java.util.Map[String, Object], isVirtual: java.lang.Boolean, kif: java.util.Map[String, Object], lastActivityDate: String, location: java.util.Map[String, Object], modified: String, modifiedBy: java.util.Map[String, Object], name: String, notes: String, partner: java.util.Map[String, Object], serialNumber: String, version: java.lang.Long)

  final case class DeviceLoadMatch(id: String)

  final case class DeviceListMatch(activatedBy: java.util.Map[String, Object], activationDate: String, alternateKey: String, auditNextDate: String, auditNotificationDate: String, client: java.util.Map[String, Object], created: String, createdBy: java.util.Map[String, Object], deviceBuild: java.util.Map[String, Object], deviceState: java.util.Map[String, Object], deviceType: java.util.Map[String, Object], errorCounter: java.lang.Long, errorLastDate: String, id: String, initializedBy: java.util.Map[String, Object], initializedDate: String, injectKey: java.util.Map[String, Object], isVirtual: java.lang.Boolean, kif: java.util.Map[String, Object], lastActivityDate: String, location: java.util.Map[String, Object], modified: String, modifiedBy: java.util.Map[String, Object], name: String, notes: String, partner: java.util.Map[String, Object], serialNumber: String, version: java.lang.Long)

  final case class DeviceCreateData(activatedBy: java.util.Map[String, Object], activationDate: String, alternateKey: String, auditNextDate: String, auditNotificationDate: String, client: java.util.Map[String, Object], created: String, createdBy: java.util.Map[String, Object], deviceBuild: java.util.Map[String, Object], deviceState: java.util.Map[String, Object], deviceType: java.util.Map[String, Object], errorCounter: java.lang.Long, errorLastDate: String, id: String, initializedBy: java.util.Map[String, Object], initializedDate: String, injectKey: java.util.Map[String, Object], isVirtual: java.lang.Boolean, kif: java.util.Map[String, Object], lastActivityDate: String, location: java.util.Map[String, Object], modified: String, modifiedBy: java.util.Map[String, Object], name: String, notes: String, partner: java.util.Map[String, Object], serialNumber: String, version: java.lang.Long)

  final case class DeviceBuild(appVersion: String, buildNumber: String, configFileName: String, created: String, deviceType: String, firmwareVersion: String, hardwareVersion: String, id: java.lang.Long, isActive: java.lang.Boolean, modified: String, name: String, notes: String, version: java.lang.Long, whiteListingBinRanges: String, whiteListingUsed: java.lang.Boolean)

  final case class DeviceBuildLoadMatch(id: String)

  final case class DeviceBuildListMatch(appVersion: String, buildNumber: String, configFileName: String, created: String, deviceType: String, firmwareVersion: String, hardwareVersion: String, id: java.lang.Long, isActive: java.lang.Boolean, modified: String, name: String, notes: String, version: java.lang.Long, whiteListingBinRanges: String, whiteListingUsed: java.lang.Boolean)

  final case class DeviceCustodyDetail(completeDate: String, created: String, createdBy: java.util.Map[String, Object], custodian: java.util.Map[String, Object], device: java.util.Map[String, Object], id: java.lang.Long, location: java.util.Map[String, Object], modified: String, modifiedBy: java.util.Map[String, Object], notes: String, status: java.util.Map[String, Object], transferMethod: java.util.Map[String, Object], version: java.lang.Long)

  final case class DeviceCustodyDetailLoadMatch(device_type: String, id: String, serial_number: String)

  final case class DeviceCustodyList(completeDate: String, created: String, createdBy: java.util.Map[String, Object], custodian: java.util.Map[String, Object], device: java.util.Map[String, Object], id: java.lang.Long, location: java.util.Map[String, Object], modified: String, modifiedBy: java.util.Map[String, Object], notes: String, status: java.util.Map[String, Object], transferMethod: java.util.Map[String, Object], version: java.lang.Long)

  final case class DeviceCustodyListListMatch(device_type: String, serial_number: String)

  final case class DeviceList(data: java.util.List[Object], total: java.lang.Long)

  final case class DeviceListLoadMatch(share_partner_to: String)

  final case class DeviceReceiveResult(success: java.lang.Boolean)

  final case class DeviceReceiveResultCreateData(success: java.lang.Boolean)

  final case class DeviceRkiActivateResult(success: java.lang.Boolean)

  final case class DeviceRkiActivateResultCreateData(success: java.lang.Boolean)

  final case class DeviceState(id: java.lang.Long, name: String)

  final case class DeviceStateListMatch(id: java.lang.Long, name: String)

  final case class DeviceType(created: String, deviceTypeMode: String, hardwareVersion: String, id: String, isActive: java.lang.Boolean, manufacturer: String, model: String, modified: String, name: String, photoUrl: String, productName: String, version: java.lang.Long)

  final case class DeviceTypeLoadMatch(id: String)

  final case class DeviceTypeListMatch(created: String, deviceTypeMode: String, hardwareVersion: String, id: String, isActive: java.lang.Boolean, manufacturer: String, model: String, modified: String, name: String, photoUrl: String, productName: String, version: java.lang.Long)

  final case class InjectKey(created: String, id: String, isActive: java.lang.Boolean, isP2PE: java.lang.Boolean, keyType: String, modified: String, name: String, version: java.lang.Long)

  final case class InjectKeyLoadMatch(id: String)

  final case class InjectKeyListMatch(created: String, id: String, isActive: java.lang.Boolean, isP2PE: java.lang.Boolean, keyType: String, modified: String, name: String, version: java.lang.Long)

  final case class Kif(id: java.lang.Long, name: String)

  final case class KifListMatch(id: java.lang.Long, name: String)

  final case class Location(address1: String, address2: String, billingId: String, city: String, country: String, created: String, customReference: String, id: String, locationType: String, mailAddress1: String, mailAddress2: String, mailCity: String, mailCountry: String, mailPostalCode: String, mailStateProvince: String, modified: String, name: String, nameOfBusiness: String, notes: String, postalCode: String, stateProvince: String, uniqueId: String, version: java.lang.Long)

  final case class LocationLoadMatch(id: String)

  final case class LocationListMatch(address1: String, address2: String, billingId: String, city: String, country: String, created: String, customReference: String, id: String, locationType: String, mailAddress1: String, mailAddress2: String, mailCity: String, mailCountry: String, mailPostalCode: String, mailStateProvince: String, modified: String, name: String, nameOfBusiness: String, notes: String, postalCode: String, stateProvince: String, uniqueId: String, version: java.lang.Long)

  final case class LocationCreateData(address1: String, address2: String, billingId: String, city: String, country: String, created: String, customReference: String, id: String, locationType: String, mailAddress1: String, mailAddress2: String, mailCity: String, mailCountry: String, mailPostalCode: String, mailStateProvince: String, modified: String, name: String, nameOfBusiness: String, notes: String, postalCode: String, stateProvince: String, uniqueId: String, version: java.lang.Long)

  final case class LocationRemoveMatch(id: String)

  final case class Partner(billingId: String, clientCanOrderEquipment: java.lang.Boolean, contact: java.util.Map[String, Object], created: String, id: String, isActive: java.lang.Boolean, location: java.util.Map[String, Object], modified: String, name: String, parent: java.util.Map[String, Object], partnerId: String, reference: String, verificationPhrase: String, version: java.lang.Long)

  final case class PartnerLoadMatch(id: String)

  final case class PartnerListMatch(billingId: String, clientCanOrderEquipment: java.lang.Boolean, contact: java.util.Map[String, Object], created: String, id: String, isActive: java.lang.Boolean, location: java.util.Map[String, Object], modified: String, name: String, parent: java.util.Map[String, Object], partnerId: String, reference: String, verificationPhrase: String, version: java.lang.Long)

  final case class PartnerCreateData(billingId: String, clientCanOrderEquipment: java.lang.Boolean, contact: java.util.Map[String, Object], created: String, id: String, isActive: java.lang.Boolean, location: java.util.Map[String, Object], modified: String, name: String, parent: java.util.Map[String, Object], partnerId: String, reference: String, verificationPhrase: String, version: java.lang.Long)

  final case class Shipment(carrier: String, client: java.util.Map[String, Object], created: String, dateReceived: String, dateShipped: String, dcKif: java.util.Map[String, Object], id: String, items: java.util.List[Object], kif: java.util.Map[String, Object], modified: String, partner: java.util.Map[String, Object], shipmentType: String, tracking: String, version: java.lang.Long)

  final case class ShipmentLoadMatch(id: String)

  final case class ShipmentListMatch(carrier: String, client: java.util.Map[String, Object], created: String, dateReceived: String, dateShipped: String, dcKif: java.util.Map[String, Object], id: String, items: java.util.List[Object], kif: java.util.Map[String, Object], modified: String, partner: java.util.Map[String, Object], shipmentType: String, tracking: String, version: java.lang.Long)

  final case class ShipmentCreateData(carrier: String, client: java.util.Map[String, Object], created: String, dateReceived: String, dateShipped: String, dcKif: java.util.Map[String, Object], id: String, items: java.util.List[Object], kif: java.util.Map[String, Object], modified: String, partner: java.util.Map[String, Object], shipmentType: String, tracking: String, version: java.lang.Long)

  final case class Success(success: java.lang.Boolean)

  final case class SuccessCreateData(share_partner_to: String, success: java.lang.Boolean)

  final case class SuccessRemoveMatch(share_partner_to: String)

  final case class Transaction(alternateKey: String, client: java.util.Map[String, Object], clientRef: String, created: String, decrypted: java.lang.Long, deviceName: String, directPartner: java.util.Map[String, Object], encrypted: java.lang.Long, endDate: String, errCode: String, errMessage: String, id: String, ipAddress: String, isVirtual: java.lang.Boolean, keyType: String, location: java.util.Map[String, Object], messageId: String, method: String, partner: java.util.Map[String, Object], reference: String, serialNumber: String, startDate: String, success: java.lang.Boolean, transactionSource: String)

  final case class TransactionLoadMatch(id: String)

  final case class TransactionListMatch(alternateKey: String, client: java.util.Map[String, Object], clientRef: String, created: String, decrypted: java.lang.Long, deviceName: String, directPartner: java.util.Map[String, Object], encrypted: java.lang.Long, endDate: String, errCode: String, errMessage: String, id: String, ipAddress: String, isVirtual: java.lang.Boolean, keyType: String, location: java.util.Map[String, Object], messageId: String, method: String, partner: java.util.Map[String, Object], reference: String, serialNumber: String, startDate: String, success: java.lang.Boolean, transactionSource: String)

  final case class TransactionCreateData(alternateKey: String, client: java.util.Map[String, Object], clientRef: String, created: String, decrypted: java.lang.Long, deviceName: String, directPartner: java.util.Map[String, Object], encrypted: java.lang.Long, endDate: String, errCode: String, errMessage: String, id: String, ipAddress: String, isVirtual: java.lang.Boolean, keyType: String, location: java.util.Map[String, Object], messageId: String, method: String, partner: java.util.Map[String, Object], reference: String, serialNumber: String, startDate: String, success: java.lang.Boolean, transactionSource: String)

  final case class UpdateResult(client: java.util.Map[String, Object], email: String, firstName: String, id: String, isActive: java.lang.Boolean, kif: java.util.Map[String, Object], lastName: String, partner: java.util.Map[String, Object], phone: String, userName: String, userRole: java.util.Map[String, Object], version: java.lang.Long)

  final case class UpdateResultListMatch(client: java.util.Map[String, Object], email: String, firstName: String, id: String, isActive: java.lang.Boolean, kif: java.util.Map[String, Object], lastName: String, partner: java.util.Map[String, Object], phone: String, userName: String, userRole: java.util.Map[String, Object], version: java.lang.Long)

  final case class UpdateResultCreateData(client: java.util.Map[String, Object], email: String, firstName: String, id: String, isActive: java.lang.Boolean, kif: java.util.Map[String, Object], lastName: String, partner: java.util.Map[String, Object], phone: String, userName: String, userRole: java.util.Map[String, Object], version: java.lang.Long)

  final case class UpdateResultUpdateData(id: String, client: java.util.Map[String, Object], email: String, firstName: String, isActive: java.lang.Boolean, kif: java.util.Map[String, Object], lastName: String, partner: java.util.Map[String, Object], phone: String, userName: String, userRole: java.util.Map[String, Object], version: java.lang.Long)

  final case class User(client: java.util.Map[String, Object], created: String, email: String, firstName: String, id: String, isActive: java.lang.Boolean, kif: java.util.Map[String, Object], lastName: String, modified: String, partner: java.util.Map[String, Object], phone: String, userName: String, userRole: java.util.Map[String, Object], version: java.lang.Long)

  final case class UserLoadMatch(id: String)

  final case class UserRemoveMatch(id: String)

}

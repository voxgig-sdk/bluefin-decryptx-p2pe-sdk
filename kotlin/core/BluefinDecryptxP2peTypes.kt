package voxgig.bluefindecryptxp2pesdk.core

// Typed reference models for the BluefinDecryptxP2pe SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These types are documentation/DX reference shapes ONLY. The SDK ops take and
// return the loose object model (MutableMap<String, Any?> / Any?) at runtime,
// so these types are not wired into the op signatures — use them to describe a
// payload before converting it to a map. Every component is a nullable type, so
// an optional (req:false) key needs no distinct rendering.

@Suppress("unused")
object BluefinDecryptxP2peTypes {

  data class Attestation(val client: Map<String, Any?>?, val completeDate: String?, val created: String?, val device: Map<String, Any?>?, val id: String?, val name: String?, val notes: String?)

  data class AttestationLoadMatch(val id: String?)

  data class AttestationListMatch(val client: Map<String, Any?>?, val completeDate: String?, val created: String?, val device: Map<String, Any?>?, val id: String?, val name: String?, val notes: String?)

  data class AttestationCreateData(val client: Map<String, Any?>?, val completeDate: String?, val created: String?, val device: Map<String, Any?>?, val id: String?, val name: String?, val notes: String?)

  data class Client(val contact: Map<String, Any?>?, val created: String?, val directPartner: Map<String, Any?>?, val id: String?, val isActive: Boolean?, val location: Map<String, Any?>?, val mid: String?, val modified: String?, val name: String?, val partner: Map<String, Any?>?, val version: Long?)

  data class ClientLoadMatch(val id: String?)

  data class ClientListMatch(val contact: Map<String, Any?>?, val created: String?, val directPartner: Map<String, Any?>?, val id: String?, val isActive: Boolean?, val location: Map<String, Any?>?, val mid: String?, val modified: String?, val name: String?, val partner: Map<String, Any?>?, val version: Long?)

  data class ClientCreateData(val contact: Map<String, Any?>?, val created: String?, val directPartner: Map<String, Any?>?, val id: String?, val isActive: Boolean?, val location: Map<String, Any?>?, val mid: String?, val modified: String?, val name: String?, val partner: Map<String, Any?>?, val version: Long?)

  data class ClientRemoveMatch(val id: String?)

  class CreateResult

  data class CreateResultCreateData(val device_type: String?, val serial_number: String?)

  data class Decryption(val success: Boolean?)

  data class DecryptionCreateData(val success: Boolean?)

  data class Device(val activatedBy: Map<String, Any?>?, val activationDate: String?, val alternateKey: String?, val auditNextDate: String?, val auditNotificationDate: String?, val client: Map<String, Any?>?, val created: String?, val createdBy: Map<String, Any?>?, val deviceBuild: Map<String, Any?>?, val deviceState: Map<String, Any?>?, val deviceType: Map<String, Any?>?, val errorCounter: Long?, val errorLastDate: String?, val id: String?, val initializedBy: Map<String, Any?>?, val initializedDate: String?, val injectKey: Map<String, Any?>?, val isVirtual: Boolean?, val kif: Map<String, Any?>?, val lastActivityDate: String?, val location: Map<String, Any?>?, val modified: String?, val modifiedBy: Map<String, Any?>?, val name: String?, val notes: String?, val partner: Map<String, Any?>?, val serialNumber: String?, val version: Long?)

  data class DeviceLoadMatch(val id: String?)

  data class DeviceListMatch(val activatedBy: Map<String, Any?>?, val activationDate: String?, val alternateKey: String?, val auditNextDate: String?, val auditNotificationDate: String?, val client: Map<String, Any?>?, val created: String?, val createdBy: Map<String, Any?>?, val deviceBuild: Map<String, Any?>?, val deviceState: Map<String, Any?>?, val deviceType: Map<String, Any?>?, val errorCounter: Long?, val errorLastDate: String?, val id: String?, val initializedBy: Map<String, Any?>?, val initializedDate: String?, val injectKey: Map<String, Any?>?, val isVirtual: Boolean?, val kif: Map<String, Any?>?, val lastActivityDate: String?, val location: Map<String, Any?>?, val modified: String?, val modifiedBy: Map<String, Any?>?, val name: String?, val notes: String?, val partner: Map<String, Any?>?, val serialNumber: String?, val version: Long?)

  data class DeviceCreateData(val activatedBy: Map<String, Any?>?, val activationDate: String?, val alternateKey: String?, val auditNextDate: String?, val auditNotificationDate: String?, val client: Map<String, Any?>?, val created: String?, val createdBy: Map<String, Any?>?, val deviceBuild: Map<String, Any?>?, val deviceState: Map<String, Any?>?, val deviceType: Map<String, Any?>?, val errorCounter: Long?, val errorLastDate: String?, val id: String?, val initializedBy: Map<String, Any?>?, val initializedDate: String?, val injectKey: Map<String, Any?>?, val isVirtual: Boolean?, val kif: Map<String, Any?>?, val lastActivityDate: String?, val location: Map<String, Any?>?, val modified: String?, val modifiedBy: Map<String, Any?>?, val name: String?, val notes: String?, val partner: Map<String, Any?>?, val serialNumber: String?, val version: Long?)

  data class DeviceBuild(val appVersion: String?, val buildNumber: String?, val configFileName: String?, val created: String?, val deviceType: String?, val firmwareVersion: String?, val hardwareVersion: String?, val id: Long?, val isActive: Boolean?, val modified: String?, val name: String?, val notes: String?, val version: Long?, val whiteListingBinRanges: String?, val whiteListingUsed: Boolean?)

  data class DeviceBuildLoadMatch(val id: String?)

  data class DeviceBuildListMatch(val appVersion: String?, val buildNumber: String?, val configFileName: String?, val created: String?, val deviceType: String?, val firmwareVersion: String?, val hardwareVersion: String?, val id: Long?, val isActive: Boolean?, val modified: String?, val name: String?, val notes: String?, val version: Long?, val whiteListingBinRanges: String?, val whiteListingUsed: Boolean?)

  data class DeviceCustodyDetail(val completeDate: String?, val created: String?, val createdBy: Map<String, Any?>?, val custodian: Map<String, Any?>?, val device: Map<String, Any?>?, val id: Long?, val location: Map<String, Any?>?, val modified: String?, val modifiedBy: Map<String, Any?>?, val notes: String?, val status: Map<String, Any?>?, val transferMethod: Map<String, Any?>?, val version: Long?)

  data class DeviceCustodyDetailLoadMatch(val device_type: String?, val id: String?, val serial_number: String?)

  data class DeviceCustodyList(val completeDate: String?, val created: String?, val createdBy: Map<String, Any?>?, val custodian: Map<String, Any?>?, val device: Map<String, Any?>?, val id: Long?, val location: Map<String, Any?>?, val modified: String?, val modifiedBy: Map<String, Any?>?, val notes: String?, val status: Map<String, Any?>?, val transferMethod: Map<String, Any?>?, val version: Long?)

  data class DeviceCustodyListListMatch(val device_type: String?, val serial_number: String?)

  data class DeviceList(val data: List<Any?>?, val total: Long?)

  data class DeviceListLoadMatch(val share_partner_to: String?)

  data class DeviceReceiveResult(val success: Boolean?)

  data class DeviceReceiveResultCreateData(val success: Boolean?)

  data class DeviceRkiActivateResult(val success: Boolean?)

  data class DeviceRkiActivateResultCreateData(val success: Boolean?)

  data class DeviceState(val id: Long?, val name: String?)

  data class DeviceStateListMatch(val id: Long?, val name: String?)

  data class DeviceType(val created: String?, val deviceTypeMode: String?, val hardwareVersion: String?, val id: String?, val isActive: Boolean?, val manufacturer: String?, val model: String?, val modified: String?, val name: String?, val photoUrl: String?, val productName: String?, val version: Long?)

  data class DeviceTypeLoadMatch(val id: String?)

  data class DeviceTypeListMatch(val created: String?, val deviceTypeMode: String?, val hardwareVersion: String?, val id: String?, val isActive: Boolean?, val manufacturer: String?, val model: String?, val modified: String?, val name: String?, val photoUrl: String?, val productName: String?, val version: Long?)

  data class InjectKey(val created: String?, val id: String?, val isActive: Boolean?, val isP2PE: Boolean?, val keyType: String?, val modified: String?, val name: String?, val version: Long?)

  data class InjectKeyLoadMatch(val id: String?)

  data class InjectKeyListMatch(val created: String?, val id: String?, val isActive: Boolean?, val isP2PE: Boolean?, val keyType: String?, val modified: String?, val name: String?, val version: Long?)

  data class Kif(val id: Long?, val name: String?)

  data class KifListMatch(val id: Long?, val name: String?)

  data class Location(val address1: String?, val address2: String?, val billingId: String?, val city: String?, val country: String?, val created: String?, val customReference: String?, val id: String?, val locationType: String?, val mailAddress1: String?, val mailAddress2: String?, val mailCity: String?, val mailCountry: String?, val mailPostalCode: String?, val mailStateProvince: String?, val modified: String?, val name: String?, val nameOfBusiness: String?, val notes: String?, val postalCode: String?, val stateProvince: String?, val uniqueId: String?, val version: Long?)

  data class LocationLoadMatch(val id: String?)

  data class LocationListMatch(val address1: String?, val address2: String?, val billingId: String?, val city: String?, val country: String?, val created: String?, val customReference: String?, val id: String?, val locationType: String?, val mailAddress1: String?, val mailAddress2: String?, val mailCity: String?, val mailCountry: String?, val mailPostalCode: String?, val mailStateProvince: String?, val modified: String?, val name: String?, val nameOfBusiness: String?, val notes: String?, val postalCode: String?, val stateProvince: String?, val uniqueId: String?, val version: Long?)

  data class LocationCreateData(val address1: String?, val address2: String?, val billingId: String?, val city: String?, val country: String?, val created: String?, val customReference: String?, val id: String?, val locationType: String?, val mailAddress1: String?, val mailAddress2: String?, val mailCity: String?, val mailCountry: String?, val mailPostalCode: String?, val mailStateProvince: String?, val modified: String?, val name: String?, val nameOfBusiness: String?, val notes: String?, val postalCode: String?, val stateProvince: String?, val uniqueId: String?, val version: Long?)

  data class LocationRemoveMatch(val id: String?)

  data class Partner(val billingId: String?, val clientCanOrderEquipment: Boolean?, val contact: Map<String, Any?>?, val created: String?, val id: String?, val isActive: Boolean?, val location: Map<String, Any?>?, val modified: String?, val name: String?, val parent: Map<String, Any?>?, val partnerId: String?, val reference: String?, val verificationPhrase: String?, val version: Long?)

  data class PartnerLoadMatch(val id: String?)

  data class PartnerListMatch(val billingId: String?, val clientCanOrderEquipment: Boolean?, val contact: Map<String, Any?>?, val created: String?, val id: String?, val isActive: Boolean?, val location: Map<String, Any?>?, val modified: String?, val name: String?, val parent: Map<String, Any?>?, val partnerId: String?, val reference: String?, val verificationPhrase: String?, val version: Long?)

  data class PartnerCreateData(val billingId: String?, val clientCanOrderEquipment: Boolean?, val contact: Map<String, Any?>?, val created: String?, val id: String?, val isActive: Boolean?, val location: Map<String, Any?>?, val modified: String?, val name: String?, val parent: Map<String, Any?>?, val partnerId: String?, val reference: String?, val verificationPhrase: String?, val version: Long?)

  data class Shipment(val carrier: String?, val client: Map<String, Any?>?, val created: String?, val dateReceived: String?, val dateShipped: String?, val dcKif: Map<String, Any?>?, val id: String?, val items: List<Any?>?, val kif: Map<String, Any?>?, val modified: String?, val partner: Map<String, Any?>?, val shipmentType: String?, val tracking: String?, val version: Long?)

  data class ShipmentLoadMatch(val id: String?)

  data class ShipmentListMatch(val carrier: String?, val client: Map<String, Any?>?, val created: String?, val dateReceived: String?, val dateShipped: String?, val dcKif: Map<String, Any?>?, val id: String?, val items: List<Any?>?, val kif: Map<String, Any?>?, val modified: String?, val partner: Map<String, Any?>?, val shipmentType: String?, val tracking: String?, val version: Long?)

  data class ShipmentCreateData(val carrier: String?, val client: Map<String, Any?>?, val created: String?, val dateReceived: String?, val dateShipped: String?, val dcKif: Map<String, Any?>?, val id: String?, val items: List<Any?>?, val kif: Map<String, Any?>?, val modified: String?, val partner: Map<String, Any?>?, val shipmentType: String?, val tracking: String?, val version: Long?)

  data class Success(val success: Boolean?)

  data class SuccessCreateData(val share_partner_to: String?, val success: Boolean?)

  data class SuccessRemoveMatch(val share_partner_to: String?)

  data class Transaction(val alternateKey: String?, val client: Map<String, Any?>?, val clientRef: String?, val created: String?, val decrypted: Long?, val deviceName: String?, val directPartner: Map<String, Any?>?, val encrypted: Long?, val endDate: String?, val errCode: String?, val errMessage: String?, val id: String?, val ipAddress: String?, val isVirtual: Boolean?, val keyType: String?, val location: Map<String, Any?>?, val messageId: String?, val method: String?, val partner: Map<String, Any?>?, val reference: String?, val serialNumber: String?, val startDate: String?, val success: Boolean?, val transactionSource: String?)

  data class TransactionLoadMatch(val id: String?)

  data class TransactionListMatch(val alternateKey: String?, val client: Map<String, Any?>?, val clientRef: String?, val created: String?, val decrypted: Long?, val deviceName: String?, val directPartner: Map<String, Any?>?, val encrypted: Long?, val endDate: String?, val errCode: String?, val errMessage: String?, val id: String?, val ipAddress: String?, val isVirtual: Boolean?, val keyType: String?, val location: Map<String, Any?>?, val messageId: String?, val method: String?, val partner: Map<String, Any?>?, val reference: String?, val serialNumber: String?, val startDate: String?, val success: Boolean?, val transactionSource: String?)

  data class TransactionCreateData(val alternateKey: String?, val client: Map<String, Any?>?, val clientRef: String?, val created: String?, val decrypted: Long?, val deviceName: String?, val directPartner: Map<String, Any?>?, val encrypted: Long?, val endDate: String?, val errCode: String?, val errMessage: String?, val id: String?, val ipAddress: String?, val isVirtual: Boolean?, val keyType: String?, val location: Map<String, Any?>?, val messageId: String?, val method: String?, val partner: Map<String, Any?>?, val reference: String?, val serialNumber: String?, val startDate: String?, val success: Boolean?, val transactionSource: String?)

  data class UpdateResult(val client: Map<String, Any?>?, val email: String?, val firstName: String?, val id: String?, val isActive: Boolean?, val kif: Map<String, Any?>?, val lastName: String?, val partner: Map<String, Any?>?, val phone: String?, val userName: String?, val userRole: Map<String, Any?>?, val version: Long?)

  data class UpdateResultListMatch(val client: Map<String, Any?>?, val email: String?, val firstName: String?, val id: String?, val isActive: Boolean?, val kif: Map<String, Any?>?, val lastName: String?, val partner: Map<String, Any?>?, val phone: String?, val userName: String?, val userRole: Map<String, Any?>?, val version: Long?)

  data class UpdateResultCreateData(val client: Map<String, Any?>?, val email: String?, val firstName: String?, val id: String?, val isActive: Boolean?, val kif: Map<String, Any?>?, val lastName: String?, val partner: Map<String, Any?>?, val phone: String?, val userName: String?, val userRole: Map<String, Any?>?, val version: Long?)

  data class UpdateResultUpdateData(val id: String?, val client: Map<String, Any?>?, val email: String?, val firstName: String?, val isActive: Boolean?, val kif: Map<String, Any?>?, val lastName: String?, val partner: Map<String, Any?>?, val phone: String?, val userName: String?, val userRole: Map<String, Any?>?, val version: Long?)

  data class User(val client: Map<String, Any?>?, val created: String?, val email: String?, val firstName: String?, val id: String?, val isActive: Boolean?, val kif: Map<String, Any?>?, val lastName: String?, val modified: String?, val partner: Map<String, Any?>?, val phone: String?, val userName: String?, val userRole: Map<String, Any?>?, val version: Long?)

  data class UserLoadMatch(val id: String?)

  data class UserRemoveMatch(val id: String?)

}

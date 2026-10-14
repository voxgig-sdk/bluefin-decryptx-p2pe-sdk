package voxgig.bluefindecryptxp2pesdk.core

// Typed reference models for the BluefinDecryptxP2pe SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
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

  data class Attestation(val client: Map<String, Any?>?, val completeDate: String?, val created: String?, val device: Map<String, Any?>?, val devices: List<Any?>?, val id: String?, val name: String?, val notes: String?)

  data class AttestationLoadMatch(val id: String?)

  data class AttestationListMatch(val client: String?, val skip: Long?, val take: Long?)

  data class AttestationCreateData(val client: Map<String, Any?>?, val completeDate: String?, val created: String?, val device: Map<String, Any?>?, val devices: List<Any?>?, val id: String?, val name: String?, val notes: String?)

  data class Client(val contact: Map<String, Any?>?, val created: String?, val directPartner: Map<String, Any?>?, val id: String?, val isActive: Boolean?, val location: Map<String, Any?>?, val mid: String?, val modified: String?, val name: String?, val partner: Map<String, Any?>?, val version: Long?)

  data class ClientLoadMatch(val id: String?)

  data class ClientListMatch(val partner: String?, val skip: Long?, val take: Long?)

  data class ClientCreateData(val contact: Map<String, Any?>?, val created: String?, val directPartner: Map<String, Any?>?, val id: String?, val isActive: Boolean?, val location: Map<String, Any?>?, val mid: String?, val modified: String?, val name: String?, val partner: Map<String, Any?>?, val version: Long?)

  data class ClientRemoveMatch(val id: String?)

  data class CreateResult(val completeDate: String?, val custodian: Map<String, Any?>?, val location: Map<String, Any?>?, val notes: String?)

  data class CreateResultCreateData(val device_type: String?, val serial_number: String?, val completeDate: String?, val custodian: Map<String, Any?>?, val location: Map<String, Any?>?, val notes: String?)

  data class Decryption(val cbcVector: String?, val deviceType: String?, val encoding: String?, val encrypted: List<Any?>?, val hasCcData: String?, val reference: String?, val sequenceNumber: String?, val serialNumber: String?, val success: Boolean?)

  data class DecryptionCreateData(val cbcVector: String?, val deviceType: String?, val encoding: String?, val encrypted: List<Any?>?, val hasCcData: String?, val reference: String?, val sequenceNumber: String?, val serialNumber: String?, val success: Boolean?)

  data class Device(val activatedBy: Map<String, Any?>?, val activationDate: String?, val alternateKey: String?, val auditNextDate: String?, val auditNotificationDate: String?, val client: Map<String, Any?>?, val created: String?, val createdBy: Map<String, Any?>?, val deviceBuild: Map<String, Any?>?, val deviceState: Map<String, Any?>?, val deviceType: Map<String, Any?>?, val errorCounter: Long?, val errorLastDate: String?, val id: String?, val initializedBy: Map<String, Any?>?, val initializedDate: String?, val injectKey: Map<String, Any?>?, val isVirtual: Boolean?, val kif: Map<String, Any?>?, val lastActivityDate: String?, val location: Map<String, Any?>?, val modified: String?, val modifiedBy: Map<String, Any?>?, val name: String?, val notes: String?, val partner: Map<String, Any?>?, val serialNumber: String?, val version: Long?)

  data class DeviceLoadMatch(val id: String?)

  data class DeviceListMatch(val client: String?, val device_state: String?, val kif: String?, val partner: String?, val serial_number: String?, val skip: Long?, val sorting_direction: String?, val sorting_field: String?, val take: Long?)

  data class DeviceCreateData(val activatedBy: Map<String, Any?>?, val activationDate: String?, val alternateKey: String?, val auditNextDate: String?, val auditNotificationDate: String?, val client: Map<String, Any?>?, val created: String?, val createdBy: Map<String, Any?>?, val deviceBuild: Map<String, Any?>?, val deviceState: Map<String, Any?>?, val deviceType: Map<String, Any?>?, val errorCounter: Long?, val errorLastDate: String?, val id: String?, val initializedBy: Map<String, Any?>?, val initializedDate: String?, val injectKey: Map<String, Any?>?, val isVirtual: Boolean?, val kif: Map<String, Any?>?, val lastActivityDate: String?, val location: Map<String, Any?>?, val modified: String?, val modifiedBy: Map<String, Any?>?, val name: String?, val notes: String?, val partner: Map<String, Any?>?, val serialNumber: String?, val version: Long?)

  data class DeviceBuild(val appVersion: String?, val buildNumber: String?, val configFileName: String?, val created: String?, val deviceType: String?, val firmwareVersion: String?, val hardwareVersion: String?, val id: Long?, val isActive: Boolean?, val modified: String?, val name: String?, val notes: String?, val version: Long?, val whiteListingBinRanges: String?, val whiteListingUsed: Boolean?)

  data class DeviceBuildLoadMatch(val id: String?)

  data class DeviceBuildListMatch(val device_type: String?, val skip: Long?, val take: Long?)

  data class DeviceCustodyDetail(val completeDate: String?, val created: String?, val createdBy: Map<String, Any?>?, val custodian: Map<String, Any?>?, val device: Map<String, Any?>?, val id: Long?, val location: Map<String, Any?>?, val modified: String?, val modifiedBy: Map<String, Any?>?, val notes: String?, val status: Map<String, Any?>?, val transferMethod: Map<String, Any?>?, val version: Long?)

  data class DeviceCustodyDetailLoadMatch(val device_type: String?, val id: String?, val serial_number: String?)

  data class DeviceCustodyListItem(val completeDate: String?, val created: String?, val createdBy: Map<String, Any?>?, val custodian: Map<String, Any?>?, val device: Map<String, Any?>?, val id: Long?, val location: Map<String, Any?>?, val modified: String?, val modifiedBy: Map<String, Any?>?, val notes: String?, val status: Map<String, Any?>?, val transferMethod: Map<String, Any?>?, val version: Long?)

  data class DeviceCustodyListItemListMatch(val device_type: String?, val serial_number: String?, val skip: Long?, val take: Long?)

  data class DeviceReceiveResult(val serialNumber: String?, val success: Boolean?, val tamperLabel: String?)

  data class DeviceReceiveResultCreateData(val serialNumber: String?, val success: Boolean?, val tamperLabel: String?)

  data class DeviceRkiActivateResult(val appVersion: String?, val buildName: String?, val buildNumber: String?, val configFile: String?, val firmwareVersion: String?, val hardwareVersion: String?, val serialNumber: String?, val success: Boolean?, val whiteListingBinRanges: String?)

  data class DeviceRkiActivateResultCreateData(val appVersion: String?, val buildName: String?, val buildNumber: String?, val configFile: String?, val firmwareVersion: String?, val hardwareVersion: String?, val serialNumber: String?, val success: Boolean?, val whiteListingBinRanges: String?)

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

  data class Location(val address1: String?, val address2: String?, val billingId: String?, val city: String?, val client: Map<String, Any?>?, val country: String?, val created: String?, val customReference: String?, val id: String?, val locationType: String?, val mailAddress1: String?, val mailAddress2: String?, val mailCity: String?, val mailCountry: String?, val mailPostalCode: String?, val mailStateProvince: String?, val modified: String?, val name: String?, val nameOfBusiness: String?, val notes: String?, val postalCode: String?, val stateProvince: String?, val uniqueId: String?, val version: Long?)

  data class LocationLoadMatch(val id: String?)

  data class LocationListMatch(val client: String?, val skip: Long?, val take: Long?)

  data class LocationCreateData(val address1: String?, val address2: String?, val billingId: String?, val city: String?, val client: Map<String, Any?>?, val country: String?, val created: String?, val customReference: String?, val id: String?, val locationType: String?, val mailAddress1: String?, val mailAddress2: String?, val mailCity: String?, val mailCountry: String?, val mailPostalCode: String?, val mailStateProvince: String?, val modified: String?, val name: String?, val nameOfBusiness: String?, val notes: String?, val postalCode: String?, val stateProvince: String?, val uniqueId: String?, val version: Long?)

  data class LocationRemoveMatch(val id: String?)

  data class Partner(val billingId: String?, val clientCanOrderEquipment: Boolean?, val contact: Map<String, Any?>?, val created: String?, val id: String?, val isActive: Boolean?, val location: Map<String, Any?>?, val modified: String?, val name: String?, val parent: Map<String, Any?>?, val partnerId: String?, val reference: String?, val verificationPhrase: String?, val version: Long?)

  data class PartnerLoadMatch(val id: String?)

  data class PartnerListMatch(val partner: String?, val skip: Long?, val take: Long?)

  data class PartnerCreateData(val billingId: String?, val clientCanOrderEquipment: Boolean?, val contact: Map<String, Any?>?, val created: String?, val id: String?, val isActive: Boolean?, val location: Map<String, Any?>?, val modified: String?, val name: String?, val parent: Map<String, Any?>?, val partnerId: String?, val reference: String?, val verificationPhrase: String?, val version: Long?)

  data class Shipment(val carrier: String?, val client: Map<String, Any?>?, val created: String?, val dateReceived: String?, val dateShipped: String?, val dcKif: Map<String, Any?>?, val id: String?, val items: List<Any?>?, val kif: Map<String, Any?>?, val location: Map<String, Any?>?, val modified: String?, val partner: Map<String, Any?>?, val shipmentType: String?, val tracking: String?, val version: Long?)

  data class ShipmentLoadMatch(val id: String?)

  data class ShipmentListMatch(val kif: String?, val mode: String?, val skip: Long?, val take: Long?)

  data class ShipmentCreateData(val carrier: String?, val client: Map<String, Any?>?, val created: String?, val dateReceived: String?, val dateShipped: String?, val dcKif: Map<String, Any?>?, val id: String?, val items: List<Any?>?, val kif: Map<String, Any?>?, val location: Map<String, Any?>?, val modified: String?, val partner: Map<String, Any?>?, val shipmentType: String?, val tracking: String?, val version: Long?)

  data class Success(val devices: List<Any?>?, val sharePartnerFrom: Map<String, Any?>?, val success: Boolean?)

  data class SuccessCreateData(val share_partner_to: String?, val devices: List<Any?>?, val sharePartnerFrom: Map<String, Any?>?, val success: Boolean?)

  data class SuccessRemoveMatch(val share_partner_to: String?)

  data class Transaction(val alternateKey: String?, val client: Map<String, Any?>?, val clientRef: String?, val created: String?, val decrypted: Long?, val device: Map<String, Any?>?, val deviceName: String?, val directPartner: Map<String, Any?>?, val encrypted: Long?, val endDate: String?, val errCode: String?, val errMessage: String?, val id: String?, val ipAddress: String?, val isVirtual: Boolean?, val keyType: String?, val location: Map<String, Any?>?, val messageId: String?, val method: String?, val partner: Map<String, Any?>?, val reference: String?, val serialNumber: String?, val startDate: String?, val success: Boolean?, val transactionSource: String?)

  data class TransactionLoadMatch(val id: String?)

  data class TransactionListMatch(val client: String?, val client_ref: String?, val date_from: String?, val date_to: String?, val location: String?, val message_id: String?, val paging_mode: String?, val partner: String?, val reference: String?, val serial_number: String?, val skip: Long?, val success: Boolean?, val take: Long?)

  data class TransactionCreateData(val alternateKey: String?, val client: Map<String, Any?>?, val clientRef: String?, val created: String?, val decrypted: Long?, val device: Map<String, Any?>?, val deviceName: String?, val directPartner: Map<String, Any?>?, val encrypted: Long?, val endDate: String?, val errCode: String?, val errMessage: String?, val id: String?, val ipAddress: String?, val isVirtual: Boolean?, val keyType: String?, val location: Map<String, Any?>?, val messageId: String?, val method: String?, val partner: Map<String, Any?>?, val reference: String?, val serialNumber: String?, val startDate: String?, val success: Boolean?, val transactionSource: String?)

  data class UpdateResult(val address1: String?, val address2: String?, val alternateKey: String?, val auditNextDate: String?, val billingId: String?, val city: String?, val client: Map<String, Any?>?, val clientCanOrderEquipment: Boolean?, val clientRef: String?, val contact: Map<String, Any?>?, val country: Map<String, Any?>?, val customReference: String?, val dateShipped: String?, val decrypted: Long?, val device: Map<String, Any?>?, val deviceBuild: Map<String, Any?>?, val deviceType: Map<String, Any?>?, val directPartner: Map<String, Any?>?, val email: String?, val encrypted: Long?, val endDate: String?, val errCode: String?, val errMessage: String?, val firstName: String?, val id: String?, val injectKey: Map<String, Any?>?, val ipAddress: String?, val isActive: Boolean?, val items: List<Any?>?, val keyType: String?, val kif: Map<String, Any?>?, val lastName: String?, val location: Map<String, Any?>?, val locationType: String?, val mailAddress1: String?, val mailAddress2: String?, val mailCity: String?, val mailCountry: String?, val mailPostalCode: String?, val mailStateProvince: String?, val messageId: String?, val method: String?, val mid: String?, val name: String?, val nameOfBusiness: String?, val notes: String?, val parent: Map<String, Any?>?, val partner: Map<String, Any?>?, val partnerId: String?, val phone: String?, val postalCode: String?, val reference: String?, val sendWelcomeEmail: Boolean?, val serialNumber: String?, val startDate: String?, val stateProvince: String?, val success: Boolean?, val tracking: String?, val uniqueId: String?, val userName: String?, val userRole: Map<String, Any?>?, val verificationPhrase: String?, val version: Long?)

  data class UpdateResultListMatch(val client: String?, val kif: String?, val partner: Any?, val skip: Long?, val take: Long?)

  data class UpdateResultCreateData(val address1: String?, val address2: String?, val alternateKey: String?, val auditNextDate: String?, val billingId: String?, val city: String?, val client: Map<String, Any?>?, val clientCanOrderEquipment: Boolean?, val clientRef: String?, val contact: Map<String, Any?>?, val country: Map<String, Any?>?, val customReference: String?, val dateShipped: String?, val decrypted: Long?, val device: Map<String, Any?>?, val deviceBuild: Map<String, Any?>?, val deviceType: Map<String, Any?>?, val directPartner: Map<String, Any?>?, val email: String?, val encrypted: Long?, val endDate: String?, val errCode: String?, val errMessage: String?, val firstName: String?, val id: String?, val injectKey: Map<String, Any?>?, val ipAddress: String?, val isActive: Boolean?, val items: List<Any?>?, val keyType: String?, val kif: Map<String, Any?>?, val lastName: String?, val location: Map<String, Any?>?, val locationType: String?, val mailAddress1: String?, val mailAddress2: String?, val mailCity: String?, val mailCountry: String?, val mailPostalCode: String?, val mailStateProvince: String?, val messageId: String?, val method: String?, val mid: String?, val name: String?, val nameOfBusiness: String?, val notes: String?, val parent: Map<String, Any?>?, val partner: Map<String, Any?>?, val partnerId: String?, val phone: String?, val postalCode: String?, val reference: String?, val sendWelcomeEmail: Boolean?, val serialNumber: String?, val startDate: String?, val stateProvince: String?, val success: Boolean?, val tracking: String?, val uniqueId: String?, val userName: String?, val userRole: Map<String, Any?>?, val verificationPhrase: String?, val version: Long?)

  data class UpdateResultUpdateData(val id: String?, val address1: String?, val address2: String?, val alternateKey: String?, val auditNextDate: String?, val billingId: String?, val city: String?, val client: Map<String, Any?>?, val clientCanOrderEquipment: Boolean?, val clientRef: String?, val contact: Map<String, Any?>?, val country: Map<String, Any?>?, val customReference: String?, val dateShipped: String?, val decrypted: Long?, val device: Map<String, Any?>?, val deviceBuild: Map<String, Any?>?, val deviceType: Map<String, Any?>?, val directPartner: Map<String, Any?>?, val email: String?, val encrypted: Long?, val endDate: String?, val errCode: String?, val errMessage: String?, val firstName: String?, val injectKey: Map<String, Any?>?, val ipAddress: String?, val isActive: Boolean?, val items: List<Any?>?, val keyType: String?, val kif: Map<String, Any?>?, val lastName: String?, val location: Map<String, Any?>?, val locationType: String?, val mailAddress1: String?, val mailAddress2: String?, val mailCity: String?, val mailCountry: String?, val mailPostalCode: String?, val mailStateProvince: String?, val messageId: String?, val method: String?, val mid: String?, val name: String?, val nameOfBusiness: String?, val notes: String?, val parent: Map<String, Any?>?, val partner: Map<String, Any?>?, val partnerId: String?, val phone: String?, val postalCode: String?, val reference: String?, val sendWelcomeEmail: Boolean?, val serialNumber: String?, val startDate: String?, val stateProvince: String?, val success: Boolean?, val tracking: String?, val uniqueId: String?, val userName: String?, val userRole: Map<String, Any?>?, val verificationPhrase: String?, val version: Long?)

  data class User(val client: Map<String, Any?>?, val created: String?, val email: String?, val firstName: String?, val id: String?, val isActive: Boolean?, val kif: Map<String, Any?>?, val lastName: String?, val modified: String?, val partner: Map<String, Any?>?, val phone: String?, val userName: String?, val userRole: Map<String, Any?>?, val version: Long?)

  data class UserLoadMatch(val id: String?)

  data class UserRemoveMatch(val id: String?)

  data class VirtualDevice(val data: List<Any?>?, val id: String?, val total: Long?)

  data class VirtualDeviceLoadMatch(val id: String?, val skip: Long?, val sorting_direction: String?, val sorting_field: String?, val take: Long?)

}

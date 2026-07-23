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

  data class Attestation(val client: Map<String, Any?>?, val complete_date: String?, val created: String?, val device: Map<String, Any?>?, val id: String?, val name: String?, val note: String?)

  data class AttestationLoadMatch(val id: String?)

  data class AttestationListMatch(val client: Map<String, Any?>?, val complete_date: String?, val created: String?, val device: Map<String, Any?>?, val id: String?, val name: String?, val note: String?)

  data class AttestationCreateData(val client: Map<String, Any?>?, val complete_date: String?, val created: String?, val device: Map<String, Any?>?, val id: String?, val name: String?, val note: String?)

  data class Client(val contact: Map<String, Any?>?, val created: String?, val direct_partner: Map<String, Any?>?, val id: String?, val is_active: Boolean?, val location: Map<String, Any?>?, val mid: String?, val modified: String?, val name: String?, val partner: Map<String, Any?>?, val version: Long?)

  data class ClientLoadMatch(val id: String?)

  data class ClientListMatch(val contact: Map<String, Any?>?, val created: String?, val direct_partner: Map<String, Any?>?, val id: String?, val is_active: Boolean?, val location: Map<String, Any?>?, val mid: String?, val modified: String?, val name: String?, val partner: Map<String, Any?>?, val version: Long?)

  data class ClientCreateData(val contact: Map<String, Any?>?, val created: String?, val direct_partner: Map<String, Any?>?, val id: String?, val is_active: Boolean?, val location: Map<String, Any?>?, val mid: String?, val modified: String?, val name: String?, val partner: Map<String, Any?>?, val version: Long?)

  data class ClientRemoveMatch(val id: String?)

  class CreateResult

  data class CreateResultCreateData(val device_type: String?, val serial_number: String?)

  data class Decryption(val success: Boolean?)

  data class DecryptionCreateData(val success: Boolean?)

  data class Device(val activated_by: Map<String, Any?>?, val activation_date: String?, val alternate_key: String?, val audit_next_date: String?, val audit_notification_date: String?, val client: Map<String, Any?>?, val created: String?, val created_by: Map<String, Any?>?, val device_build: Map<String, Any?>?, val device_state: Map<String, Any?>?, val device_type: Map<String, Any?>?, val error_counter: Long?, val error_last_date: String?, val id: String?, val initialized_by: Map<String, Any?>?, val initialized_date: String?, val inject_key: Map<String, Any?>?, val is_virtual: Boolean?, val kif: Map<String, Any?>?, val last_activity_date: String?, val location: Map<String, Any?>?, val modified: String?, val modified_by: Map<String, Any?>?, val name: String?, val note: String?, val partner: Map<String, Any?>?, val serial_number: String?, val version: Long?)

  data class DeviceLoadMatch(val device_type: String?, val serial_number: String?, val id: String?)

  data class DeviceListMatch(val activated_by: Map<String, Any?>?, val activation_date: String?, val alternate_key: String?, val audit_next_date: String?, val audit_notification_date: String?, val client: Map<String, Any?>?, val created: String?, val created_by: Map<String, Any?>?, val device_build: Map<String, Any?>?, val device_state: Map<String, Any?>?, val device_type: Map<String, Any?>?, val error_counter: Long?, val error_last_date: String?, val id: String?, val initialized_by: Map<String, Any?>?, val initialized_date: String?, val inject_key: Map<String, Any?>?, val is_virtual: Boolean?, val kif: Map<String, Any?>?, val last_activity_date: String?, val location: Map<String, Any?>?, val modified: String?, val modified_by: Map<String, Any?>?, val name: String?, val note: String?, val partner: Map<String, Any?>?, val serial_number: String?, val version: Long?)

  data class DeviceCreateData(val activated_by: Map<String, Any?>?, val activation_date: String?, val alternate_key: String?, val audit_next_date: String?, val audit_notification_date: String?, val client: Map<String, Any?>?, val created: String?, val created_by: Map<String, Any?>?, val device_build: Map<String, Any?>?, val device_state: Map<String, Any?>?, val device_type: Map<String, Any?>?, val error_counter: Long?, val error_last_date: String?, val id: String?, val initialized_by: Map<String, Any?>?, val initialized_date: String?, val inject_key: Map<String, Any?>?, val is_virtual: Boolean?, val kif: Map<String, Any?>?, val last_activity_date: String?, val location: Map<String, Any?>?, val modified: String?, val modified_by: Map<String, Any?>?, val name: String?, val note: String?, val partner: Map<String, Any?>?, val serial_number: String?, val version: Long?)

  data class DeviceBuild(val app_version: String?, val build_number: String?, val config_file_name: String?, val created: String?, val device_type: String?, val firmware_version: String?, val hardware_version: String?, val id: Long?, val is_active: Boolean?, val modified: String?, val name: String?, val note: String?, val version: Long?, val white_listing_bin_range: String?, val white_listing_used: Boolean?)

  data class DeviceBuildLoadMatch(val id: String?)

  data class DeviceBuildListMatch(val app_version: String?, val build_number: String?, val config_file_name: String?, val created: String?, val device_type: String?, val firmware_version: String?, val hardware_version: String?, val id: Long?, val is_active: Boolean?, val modified: String?, val name: String?, val note: String?, val version: Long?, val white_listing_bin_range: String?, val white_listing_used: Boolean?)

  data class DeviceCustodyDetail(val complete_date: String?, val created: String?, val created_by: Map<String, Any?>?, val custodian: Map<String, Any?>?, val device: Map<String, Any?>?, val id: Long?, val location: Map<String, Any?>?, val modified: String?, val modified_by: Map<String, Any?>?, val note: String?, val status: Map<String, Any?>?, val transfer_method: Map<String, Any?>?, val version: Long?)

  data class DeviceCustodyDetailLoadMatch(val device_type: String?, val id: String?, val serial_number: String?)

  data class DeviceCustodyList(val complete_date: String?, val created: String?, val created_by: Map<String, Any?>?, val custodian: Map<String, Any?>?, val device: Map<String, Any?>?, val id: Long?, val location: Map<String, Any?>?, val modified: String?, val modified_by: Map<String, Any?>?, val note: String?, val status: Map<String, Any?>?, val transfer_method: Map<String, Any?>?, val version: Long?)

  data class DeviceCustodyListListMatch(val device_type: String?, val serial_number: String?)

  data class DeviceList(val data: List<Any?>?, val total: Long?)

  data class DeviceListLoadMatch(val share_partner_to: String?)

  data class DeviceReceiveResult(val success: Boolean?)

  data class DeviceReceiveResultCreateData(val success: Boolean?)

  data class DeviceRkiActivateResult(val success: Boolean?)

  data class DeviceRkiActivateResultCreateData(val success: Boolean?)

  data class DeviceState(val id: Long?, val name: String?)

  data class DeviceStateListMatch(val id: Long?, val name: String?)

  data class DeviceType(val created: String?, val device_type_mode: String?, val hardware_version: String?, val id: String?, val is_active: Boolean?, val manufacturer: String?, val model: String?, val modified: String?, val name: String?, val photo_url: String?, val product_name: String?, val version: Long?)

  data class DeviceTypeLoadMatch(val id: String?)

  data class DeviceTypeListMatch(val created: String?, val device_type_mode: String?, val hardware_version: String?, val id: String?, val is_active: Boolean?, val manufacturer: String?, val model: String?, val modified: String?, val name: String?, val photo_url: String?, val product_name: String?, val version: Long?)

  data class InjectKey(val created: String?, val id: String?, val is_active: Boolean?, val is_p2_pe: Boolean?, val key_type: String?, val modified: String?, val name: String?, val version: Long?)

  data class InjectKeyLoadMatch(val id: String?)

  data class InjectKeyListMatch(val created: String?, val id: String?, val is_active: Boolean?, val is_p2_pe: Boolean?, val key_type: String?, val modified: String?, val name: String?, val version: Long?)

  data class Kif(val id: Long?, val name: String?)

  data class KifListMatch(val id: Long?, val name: String?)

  data class Location(val address1: String?, val address2: String?, val billing_id: String?, val city: String?, val country: String?, val created: String?, val custom_reference: String?, val id: String?, val location_type: String?, val mail_address1: String?, val mail_address2: String?, val mail_city: String?, val mail_country: String?, val mail_postal_code: String?, val mail_state_province: String?, val modified: String?, val name: String?, val name_of_business: String?, val note: String?, val postal_code: String?, val state_province: String?, val unique_id: String?, val version: Long?)

  data class LocationLoadMatch(val id: String?)

  data class LocationListMatch(val address1: String?, val address2: String?, val billing_id: String?, val city: String?, val country: String?, val created: String?, val custom_reference: String?, val id: String?, val location_type: String?, val mail_address1: String?, val mail_address2: String?, val mail_city: String?, val mail_country: String?, val mail_postal_code: String?, val mail_state_province: String?, val modified: String?, val name: String?, val name_of_business: String?, val note: String?, val postal_code: String?, val state_province: String?, val unique_id: String?, val version: Long?)

  data class LocationCreateData(val address1: String?, val address2: String?, val billing_id: String?, val city: String?, val country: String?, val created: String?, val custom_reference: String?, val id: String?, val location_type: String?, val mail_address1: String?, val mail_address2: String?, val mail_city: String?, val mail_country: String?, val mail_postal_code: String?, val mail_state_province: String?, val modified: String?, val name: String?, val name_of_business: String?, val note: String?, val postal_code: String?, val state_province: String?, val unique_id: String?, val version: Long?)

  data class LocationRemoveMatch(val id: String?)

  data class Partner(val billing_id: String?, val client_can_order_equipment: Boolean?, val contact: Map<String, Any?>?, val created: String?, val id: String?, val is_active: Boolean?, val location: Map<String, Any?>?, val modified: String?, val name: String?, val parent: Map<String, Any?>?, val partner_id: String?, val reference: String?, val verification_phrase: String?, val version: Long?)

  data class PartnerLoadMatch(val id: String?)

  data class PartnerListMatch(val billing_id: String?, val client_can_order_equipment: Boolean?, val contact: Map<String, Any?>?, val created: String?, val id: String?, val is_active: Boolean?, val location: Map<String, Any?>?, val modified: String?, val name: String?, val parent: Map<String, Any?>?, val partner_id: String?, val reference: String?, val verification_phrase: String?, val version: Long?)

  data class PartnerCreateData(val billing_id: String?, val client_can_order_equipment: Boolean?, val contact: Map<String, Any?>?, val created: String?, val id: String?, val is_active: Boolean?, val location: Map<String, Any?>?, val modified: String?, val name: String?, val parent: Map<String, Any?>?, val partner_id: String?, val reference: String?, val verification_phrase: String?, val version: Long?)

  data class Shipment(val carrier: String?, val client: Map<String, Any?>?, val created: String?, val date_received: String?, val date_shipped: String?, val dc_kif: Map<String, Any?>?, val id: String?, val item: List<Any?>?, val kif: Map<String, Any?>?, val modified: String?, val partner: Map<String, Any?>?, val shipment_type: String?, val tracking: String?, val version: Long?)

  data class ShipmentLoadMatch(val id: String?)

  data class ShipmentListMatch(val carrier: String?, val client: Map<String, Any?>?, val created: String?, val date_received: String?, val date_shipped: String?, val dc_kif: Map<String, Any?>?, val id: String?, val item: List<Any?>?, val kif: Map<String, Any?>?, val modified: String?, val partner: Map<String, Any?>?, val shipment_type: String?, val tracking: String?, val version: Long?)

  data class ShipmentCreateData(val carrier: String?, val client: Map<String, Any?>?, val created: String?, val date_received: String?, val date_shipped: String?, val dc_kif: Map<String, Any?>?, val id: String?, val item: List<Any?>?, val kif: Map<String, Any?>?, val modified: String?, val partner: Map<String, Any?>?, val shipment_type: String?, val tracking: String?, val version: Long?)

  data class Success(val success: Boolean?)

  data class SuccessCreateData(val share_partner_to: String?)

  data class SuccessRemoveMatch(val share_partner_to: String?)

  data class Transaction(val alternate_key: String?, val client: Map<String, Any?>?, val client_ref: String?, val created: String?, val decrypted: Long?, val device_name: String?, val direct_partner: Map<String, Any?>?, val encrypted: Long?, val end_date: String?, val err_code: String?, val err_message: String?, val id: String?, val ip_address: String?, val is_virtual: Boolean?, val key_type: String?, val location: Map<String, Any?>?, val message_id: String?, val method: String?, val partner: Map<String, Any?>?, val reference: String?, val serial_number: String?, val start_date: String?, val success: Boolean?, val transaction_source: String?)

  data class TransactionLoadMatch(val id: String?)

  data class TransactionListMatch(val alternate_key: String?, val client: Map<String, Any?>?, val client_ref: String?, val created: String?, val decrypted: Long?, val device_name: String?, val direct_partner: Map<String, Any?>?, val encrypted: Long?, val end_date: String?, val err_code: String?, val err_message: String?, val id: String?, val ip_address: String?, val is_virtual: Boolean?, val key_type: String?, val location: Map<String, Any?>?, val message_id: String?, val method: String?, val partner: Map<String, Any?>?, val reference: String?, val serial_number: String?, val start_date: String?, val success: Boolean?, val transaction_source: String?)

  data class TransactionCreateData(val alternate_key: String?, val client: Map<String, Any?>?, val client_ref: String?, val created: String?, val decrypted: Long?, val device_name: String?, val direct_partner: Map<String, Any?>?, val encrypted: Long?, val end_date: String?, val err_code: String?, val err_message: String?, val id: String?, val ip_address: String?, val is_virtual: Boolean?, val key_type: String?, val location: Map<String, Any?>?, val message_id: String?, val method: String?, val partner: Map<String, Any?>?, val reference: String?, val serial_number: String?, val start_date: String?, val success: Boolean?, val transaction_source: String?)

  data class UpdateResult(val client: Map<String, Any?>?, val email: String?, val first_name: String?, val id: String?, val is_active: Boolean?, val kif: Map<String, Any?>?, val last_name: String?, val partner: Map<String, Any?>?, val phone: String?, val user_name: String?, val user_role: Map<String, Any?>?, val version: Long?)

  data class UpdateResultListMatch(val client: Map<String, Any?>?, val email: String?, val first_name: String?, val id: String?, val is_active: Boolean?, val kif: Map<String, Any?>?, val last_name: String?, val partner: Map<String, Any?>?, val phone: String?, val user_name: String?, val user_role: Map<String, Any?>?, val version: Long?)

  data class UpdateResultCreateData(val client: Map<String, Any?>?, val email: String?, val first_name: String?, val id: String?, val is_active: Boolean?, val kif: Map<String, Any?>?, val last_name: String?, val partner: Map<String, Any?>?, val phone: String?, val user_name: String?, val user_role: Map<String, Any?>?, val version: Long?)

  data class UpdateResultUpdateData(val id: String?)

  data class User(val client: Map<String, Any?>?, val created: String?, val email: String?, val first_name: String?, val id: String?, val is_active: Boolean?, val kif: Map<String, Any?>?, val last_name: String?, val modified: String?, val partner: Map<String, Any?>?, val phone: String?, val user_name: String?, val user_role: Map<String, Any?>?, val version: Long?)

  data class UserLoadMatch(val id: String?)

  data class UserRemoveMatch(val id: String?)

}

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

  final case class Attestation(client: java.util.Map[String, Object], complete_date: String, created: String, device: java.util.Map[String, Object], id: String, name: String, note: String)

  final case class AttestationLoadMatch(id: String)

  final case class AttestationListMatch(client: java.util.Map[String, Object], complete_date: String, created: String, device: java.util.Map[String, Object], id: String, name: String, note: String)

  final case class AttestationCreateData(client: java.util.Map[String, Object], complete_date: String, created: String, device: java.util.Map[String, Object], id: String, name: String, note: String)

  final case class Client(contact: java.util.Map[String, Object], created: String, direct_partner: java.util.Map[String, Object], id: String, is_active: java.lang.Boolean, location: java.util.Map[String, Object], mid: String, modified: String, name: String, partner: java.util.Map[String, Object], version: java.lang.Long)

  final case class ClientLoadMatch(id: String)

  final case class ClientListMatch(contact: java.util.Map[String, Object], created: String, direct_partner: java.util.Map[String, Object], id: String, is_active: java.lang.Boolean, location: java.util.Map[String, Object], mid: String, modified: String, name: String, partner: java.util.Map[String, Object], version: java.lang.Long)

  final case class ClientCreateData(contact: java.util.Map[String, Object], created: String, direct_partner: java.util.Map[String, Object], id: String, is_active: java.lang.Boolean, location: java.util.Map[String, Object], mid: String, modified: String, name: String, partner: java.util.Map[String, Object], version: java.lang.Long)

  final case class ClientRemoveMatch(id: String)

  final case class CreateResult()

  final case class CreateResultCreateData(device_type: String, serial_number: String)

  final case class Decryption(success: java.lang.Boolean)

  final case class DecryptionCreateData(success: java.lang.Boolean)

  final case class Device(activated_by: java.util.Map[String, Object], activation_date: String, alternate_key: String, audit_next_date: String, audit_notification_date: String, client: java.util.Map[String, Object], created: String, created_by: java.util.Map[String, Object], device_build: java.util.Map[String, Object], device_state: java.util.Map[String, Object], device_type: java.util.Map[String, Object], error_counter: java.lang.Long, error_last_date: String, id: String, initialized_by: java.util.Map[String, Object], initialized_date: String, inject_key: java.util.Map[String, Object], is_virtual: java.lang.Boolean, kif: java.util.Map[String, Object], last_activity_date: String, location: java.util.Map[String, Object], modified: String, modified_by: java.util.Map[String, Object], name: String, note: String, partner: java.util.Map[String, Object], serial_number: String, version: java.lang.Long)

  final case class DeviceLoadMatch(device_type: String, serial_number: String, id: String)

  final case class DeviceListMatch(activated_by: java.util.Map[String, Object], activation_date: String, alternate_key: String, audit_next_date: String, audit_notification_date: String, client: java.util.Map[String, Object], created: String, created_by: java.util.Map[String, Object], device_build: java.util.Map[String, Object], device_state: java.util.Map[String, Object], device_type: java.util.Map[String, Object], error_counter: java.lang.Long, error_last_date: String, id: String, initialized_by: java.util.Map[String, Object], initialized_date: String, inject_key: java.util.Map[String, Object], is_virtual: java.lang.Boolean, kif: java.util.Map[String, Object], last_activity_date: String, location: java.util.Map[String, Object], modified: String, modified_by: java.util.Map[String, Object], name: String, note: String, partner: java.util.Map[String, Object], serial_number: String, version: java.lang.Long)

  final case class DeviceCreateData(activated_by: java.util.Map[String, Object], activation_date: String, alternate_key: String, audit_next_date: String, audit_notification_date: String, client: java.util.Map[String, Object], created: String, created_by: java.util.Map[String, Object], device_build: java.util.Map[String, Object], device_state: java.util.Map[String, Object], device_type: java.util.Map[String, Object], error_counter: java.lang.Long, error_last_date: String, id: String, initialized_by: java.util.Map[String, Object], initialized_date: String, inject_key: java.util.Map[String, Object], is_virtual: java.lang.Boolean, kif: java.util.Map[String, Object], last_activity_date: String, location: java.util.Map[String, Object], modified: String, modified_by: java.util.Map[String, Object], name: String, note: String, partner: java.util.Map[String, Object], serial_number: String, version: java.lang.Long)

  final case class DeviceBuild(app_version: String, build_number: String, config_file_name: String, created: String, device_type: String, firmware_version: String, hardware_version: String, id: java.lang.Long, is_active: java.lang.Boolean, modified: String, name: String, note: String, version: java.lang.Long, white_listing_bin_range: String, white_listing_used: java.lang.Boolean)

  final case class DeviceBuildLoadMatch(id: String)

  final case class DeviceBuildListMatch(app_version: String, build_number: String, config_file_name: String, created: String, device_type: String, firmware_version: String, hardware_version: String, id: java.lang.Long, is_active: java.lang.Boolean, modified: String, name: String, note: String, version: java.lang.Long, white_listing_bin_range: String, white_listing_used: java.lang.Boolean)

  final case class DeviceCustodyDetail(complete_date: String, created: String, created_by: java.util.Map[String, Object], custodian: java.util.Map[String, Object], device: java.util.Map[String, Object], id: java.lang.Long, location: java.util.Map[String, Object], modified: String, modified_by: java.util.Map[String, Object], note: String, status: java.util.Map[String, Object], transfer_method: java.util.Map[String, Object], version: java.lang.Long)

  final case class DeviceCustodyDetailLoadMatch(device_type: String, id: String, serial_number: String)

  final case class DeviceCustodyList(complete_date: String, created: String, created_by: java.util.Map[String, Object], custodian: java.util.Map[String, Object], device: java.util.Map[String, Object], id: java.lang.Long, location: java.util.Map[String, Object], modified: String, modified_by: java.util.Map[String, Object], note: String, status: java.util.Map[String, Object], transfer_method: java.util.Map[String, Object], version: java.lang.Long)

  final case class DeviceCustodyListListMatch(device_type: String, serial_number: String)

  final case class DeviceList(data: java.util.List[Object], total: java.lang.Long)

  final case class DeviceListLoadMatch(share_partner_to: String)

  final case class DeviceReceiveResult(success: java.lang.Boolean)

  final case class DeviceReceiveResultCreateData(success: java.lang.Boolean)

  final case class DeviceRkiActivateResult(success: java.lang.Boolean)

  final case class DeviceRkiActivateResultCreateData(success: java.lang.Boolean)

  final case class DeviceState(id: java.lang.Long, name: String)

  final case class DeviceStateListMatch(id: java.lang.Long, name: String)

  final case class DeviceType(created: String, device_type_mode: String, hardware_version: String, id: String, is_active: java.lang.Boolean, manufacturer: String, model: String, modified: String, name: String, photo_url: String, product_name: String, version: java.lang.Long)

  final case class DeviceTypeLoadMatch(id: String)

  final case class DeviceTypeListMatch(created: String, device_type_mode: String, hardware_version: String, id: String, is_active: java.lang.Boolean, manufacturer: String, model: String, modified: String, name: String, photo_url: String, product_name: String, version: java.lang.Long)

  final case class InjectKey(created: String, id: String, is_active: java.lang.Boolean, is_p2_pe: java.lang.Boolean, key_type: String, modified: String, name: String, version: java.lang.Long)

  final case class InjectKeyLoadMatch(id: String)

  final case class InjectKeyListMatch(created: String, id: String, is_active: java.lang.Boolean, is_p2_pe: java.lang.Boolean, key_type: String, modified: String, name: String, version: java.lang.Long)

  final case class Kif(id: java.lang.Long, name: String)

  final case class KifListMatch(id: java.lang.Long, name: String)

  final case class Location(address1: String, address2: String, billing_id: String, city: String, country: String, created: String, custom_reference: String, id: String, location_type: String, mail_address1: String, mail_address2: String, mail_city: String, mail_country: String, mail_postal_code: String, mail_state_province: String, modified: String, name: String, name_of_business: String, note: String, postal_code: String, state_province: String, unique_id: String, version: java.lang.Long)

  final case class LocationLoadMatch(id: String)

  final case class LocationListMatch(address1: String, address2: String, billing_id: String, city: String, country: String, created: String, custom_reference: String, id: String, location_type: String, mail_address1: String, mail_address2: String, mail_city: String, mail_country: String, mail_postal_code: String, mail_state_province: String, modified: String, name: String, name_of_business: String, note: String, postal_code: String, state_province: String, unique_id: String, version: java.lang.Long)

  final case class LocationCreateData(address1: String, address2: String, billing_id: String, city: String, country: String, created: String, custom_reference: String, id: String, location_type: String, mail_address1: String, mail_address2: String, mail_city: String, mail_country: String, mail_postal_code: String, mail_state_province: String, modified: String, name: String, name_of_business: String, note: String, postal_code: String, state_province: String, unique_id: String, version: java.lang.Long)

  final case class LocationRemoveMatch(id: String)

  final case class Partner(billing_id: String, client_can_order_equipment: java.lang.Boolean, contact: java.util.Map[String, Object], created: String, id: String, is_active: java.lang.Boolean, location: java.util.Map[String, Object], modified: String, name: String, parent: java.util.Map[String, Object], partner_id: String, reference: String, verification_phrase: String, version: java.lang.Long)

  final case class PartnerLoadMatch(id: String)

  final case class PartnerListMatch(billing_id: String, client_can_order_equipment: java.lang.Boolean, contact: java.util.Map[String, Object], created: String, id: String, is_active: java.lang.Boolean, location: java.util.Map[String, Object], modified: String, name: String, parent: java.util.Map[String, Object], partner_id: String, reference: String, verification_phrase: String, version: java.lang.Long)

  final case class PartnerCreateData(billing_id: String, client_can_order_equipment: java.lang.Boolean, contact: java.util.Map[String, Object], created: String, id: String, is_active: java.lang.Boolean, location: java.util.Map[String, Object], modified: String, name: String, parent: java.util.Map[String, Object], partner_id: String, reference: String, verification_phrase: String, version: java.lang.Long)

  final case class Shipment(carrier: String, client: java.util.Map[String, Object], created: String, date_received: String, date_shipped: String, dc_kif: java.util.Map[String, Object], id: String, item: java.util.List[Object], kif: java.util.Map[String, Object], modified: String, partner: java.util.Map[String, Object], shipment_type: String, tracking: String, version: java.lang.Long)

  final case class ShipmentLoadMatch(id: String)

  final case class ShipmentListMatch(carrier: String, client: java.util.Map[String, Object], created: String, date_received: String, date_shipped: String, dc_kif: java.util.Map[String, Object], id: String, item: java.util.List[Object], kif: java.util.Map[String, Object], modified: String, partner: java.util.Map[String, Object], shipment_type: String, tracking: String, version: java.lang.Long)

  final case class ShipmentCreateData(carrier: String, client: java.util.Map[String, Object], created: String, date_received: String, date_shipped: String, dc_kif: java.util.Map[String, Object], id: String, item: java.util.List[Object], kif: java.util.Map[String, Object], modified: String, partner: java.util.Map[String, Object], shipment_type: String, tracking: String, version: java.lang.Long)

  final case class Success(success: java.lang.Boolean)

  final case class SuccessCreateData(share_partner_to: String)

  final case class SuccessRemoveMatch(share_partner_to: String)

  final case class Transaction(alternate_key: String, client: java.util.Map[String, Object], client_ref: String, created: String, decrypted: java.lang.Long, device_name: String, direct_partner: java.util.Map[String, Object], encrypted: java.lang.Long, end_date: String, err_code: String, err_message: String, id: String, ip_address: String, is_virtual: java.lang.Boolean, key_type: String, location: java.util.Map[String, Object], message_id: String, method: String, partner: java.util.Map[String, Object], reference: String, serial_number: String, start_date: String, success: java.lang.Boolean, transaction_source: String)

  final case class TransactionLoadMatch(id: String)

  final case class TransactionListMatch(alternate_key: String, client: java.util.Map[String, Object], client_ref: String, created: String, decrypted: java.lang.Long, device_name: String, direct_partner: java.util.Map[String, Object], encrypted: java.lang.Long, end_date: String, err_code: String, err_message: String, id: String, ip_address: String, is_virtual: java.lang.Boolean, key_type: String, location: java.util.Map[String, Object], message_id: String, method: String, partner: java.util.Map[String, Object], reference: String, serial_number: String, start_date: String, success: java.lang.Boolean, transaction_source: String)

  final case class TransactionCreateData(alternate_key: String, client: java.util.Map[String, Object], client_ref: String, created: String, decrypted: java.lang.Long, device_name: String, direct_partner: java.util.Map[String, Object], encrypted: java.lang.Long, end_date: String, err_code: String, err_message: String, id: String, ip_address: String, is_virtual: java.lang.Boolean, key_type: String, location: java.util.Map[String, Object], message_id: String, method: String, partner: java.util.Map[String, Object], reference: String, serial_number: String, start_date: String, success: java.lang.Boolean, transaction_source: String)

  final case class UpdateResult(client: java.util.Map[String, Object], email: String, first_name: String, id: String, is_active: java.lang.Boolean, kif: java.util.Map[String, Object], last_name: String, partner: java.util.Map[String, Object], phone: String, user_name: String, user_role: java.util.Map[String, Object], version: java.lang.Long)

  final case class UpdateResultListMatch(client: java.util.Map[String, Object], email: String, first_name: String, id: String, is_active: java.lang.Boolean, kif: java.util.Map[String, Object], last_name: String, partner: java.util.Map[String, Object], phone: String, user_name: String, user_role: java.util.Map[String, Object], version: java.lang.Long)

  final case class UpdateResultCreateData(client: java.util.Map[String, Object], email: String, first_name: String, id: String, is_active: java.lang.Boolean, kif: java.util.Map[String, Object], last_name: String, partner: java.util.Map[String, Object], phone: String, user_name: String, user_role: java.util.Map[String, Object], version: java.lang.Long)

  final case class UpdateResultUpdateData(id: String)

  final case class User(client: java.util.Map[String, Object], created: String, email: String, first_name: String, id: String, is_active: java.lang.Boolean, kif: java.util.Map[String, Object], last_name: String, modified: String, partner: java.util.Map[String, Object], phone: String, user_name: String, user_role: java.util.Map[String, Object], version: java.lang.Long)

  final case class UserLoadMatch(id: String)

  final case class UserRemoveMatch(id: String)

}

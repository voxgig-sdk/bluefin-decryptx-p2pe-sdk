package voxgig.bluefindecryptxp2pesdk.core;

// Typed reference models for the BluefinDecryptxP2pe SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These records are documentation/DX reference shapes ONLY. The SDK ops take
// and return the loose object model (Map<String, Object> / Object) at runtime,
// so these types are not wired into the op signatures — use them to describe a
// payload before converting it to a map. Every component is a boxed (nullable)
// type, so an optional (req:false) key needs no distinct rendering.

import java.util.List;
import java.util.Map;

public final class BluefinDecryptxP2peTypes {

  private BluefinDecryptxP2peTypes() {}

  public record Attestation(Map<String, Object> client, String complete_date, String created, Map<String, Object> device, String id, String name, String note) {}

  public record AttestationLoadMatch(String id) {}

  public record AttestationListMatch(Map<String, Object> client, String complete_date, String created, Map<String, Object> device, String id, String name, String note) {}

  public record AttestationCreateData(Map<String, Object> client, String complete_date, String created, Map<String, Object> device, String id, String name, String note) {}

  public record Client(Map<String, Object> contact, String created, Map<String, Object> direct_partner, String id, Boolean is_active, Map<String, Object> location, String mid, String modified, String name, Map<String, Object> partner, Long version) {}

  public record ClientLoadMatch(String id) {}

  public record ClientListMatch(Map<String, Object> contact, String created, Map<String, Object> direct_partner, String id, Boolean is_active, Map<String, Object> location, String mid, String modified, String name, Map<String, Object> partner, Long version) {}

  public record ClientCreateData(Map<String, Object> contact, String created, Map<String, Object> direct_partner, String id, Boolean is_active, Map<String, Object> location, String mid, String modified, String name, Map<String, Object> partner, Long version) {}

  public record ClientRemoveMatch(String id) {}

  public record CreateResult() {}

  public record CreateResultCreateData(String device_type, String serial_number) {}

  public record Decryption(Boolean success) {}

  public record DecryptionCreateData(Boolean success) {}

  public record Device(Map<String, Object> activated_by, String activation_date, String alternate_key, String audit_next_date, String audit_notification_date, Map<String, Object> client, String created, Map<String, Object> created_by, Map<String, Object> device_build, Map<String, Object> device_state, Map<String, Object> device_type, Long error_counter, String error_last_date, String id, Map<String, Object> initialized_by, String initialized_date, Map<String, Object> inject_key, Boolean is_virtual, Map<String, Object> kif, String last_activity_date, Map<String, Object> location, String modified, Map<String, Object> modified_by, String name, String note, Map<String, Object> partner, String serial_number, Long version) {}

  public record DeviceLoadMatch(String device_type, String serial_number, String id) {}

  public record DeviceListMatch(Map<String, Object> activated_by, String activation_date, String alternate_key, String audit_next_date, String audit_notification_date, Map<String, Object> client, String created, Map<String, Object> created_by, Map<String, Object> device_build, Map<String, Object> device_state, Map<String, Object> device_type, Long error_counter, String error_last_date, String id, Map<String, Object> initialized_by, String initialized_date, Map<String, Object> inject_key, Boolean is_virtual, Map<String, Object> kif, String last_activity_date, Map<String, Object> location, String modified, Map<String, Object> modified_by, String name, String note, Map<String, Object> partner, String serial_number, Long version) {}

  public record DeviceCreateData(Map<String, Object> activated_by, String activation_date, String alternate_key, String audit_next_date, String audit_notification_date, Map<String, Object> client, String created, Map<String, Object> created_by, Map<String, Object> device_build, Map<String, Object> device_state, Map<String, Object> device_type, Long error_counter, String error_last_date, String id, Map<String, Object> initialized_by, String initialized_date, Map<String, Object> inject_key, Boolean is_virtual, Map<String, Object> kif, String last_activity_date, Map<String, Object> location, String modified, Map<String, Object> modified_by, String name, String note, Map<String, Object> partner, String serial_number, Long version) {}

  public record DeviceBuild(String app_version, String build_number, String config_file_name, String created, String device_type, String firmware_version, String hardware_version, Long id, Boolean is_active, String modified, String name, String note, Long version, String white_listing_bin_range, Boolean white_listing_used) {}

  public record DeviceBuildLoadMatch(String id) {}

  public record DeviceBuildListMatch(String app_version, String build_number, String config_file_name, String created, String device_type, String firmware_version, String hardware_version, Long id, Boolean is_active, String modified, String name, String note, Long version, String white_listing_bin_range, Boolean white_listing_used) {}

  public record DeviceCustodyDetail(String complete_date, String created, Map<String, Object> created_by, Map<String, Object> custodian, Map<String, Object> device, Long id, Map<String, Object> location, String modified, Map<String, Object> modified_by, String note, Map<String, Object> status, Map<String, Object> transfer_method, Long version) {}

  public record DeviceCustodyDetailLoadMatch(String device_type, String id, String serial_number) {}

  public record DeviceCustodyList(String complete_date, String created, Map<String, Object> created_by, Map<String, Object> custodian, Map<String, Object> device, Long id, Map<String, Object> location, String modified, Map<String, Object> modified_by, String note, Map<String, Object> status, Map<String, Object> transfer_method, Long version) {}

  public record DeviceCustodyListListMatch(String device_type, String serial_number) {}

  public record DeviceList(List<Object> data, Long total) {}

  public record DeviceListLoadMatch(String share_partner_to) {}

  public record DeviceReceiveResult(Boolean success) {}

  public record DeviceReceiveResultCreateData(Boolean success) {}

  public record DeviceRkiActivateResult(Boolean success) {}

  public record DeviceRkiActivateResultCreateData(Boolean success) {}

  public record DeviceState(Long id, String name) {}

  public record DeviceStateListMatch(Long id, String name) {}

  public record DeviceType(String created, String device_type_mode, String hardware_version, String id, Boolean is_active, String manufacturer, String model, String modified, String name, String photo_url, String product_name, Long version) {}

  public record DeviceTypeLoadMatch(String id) {}

  public record DeviceTypeListMatch(String created, String device_type_mode, String hardware_version, String id, Boolean is_active, String manufacturer, String model, String modified, String name, String photo_url, String product_name, Long version) {}

  public record InjectKey(String created, String id, Boolean is_active, Boolean is_p2_pe, String key_type, String modified, String name, Long version) {}

  public record InjectKeyLoadMatch(String id) {}

  public record InjectKeyListMatch(String created, String id, Boolean is_active, Boolean is_p2_pe, String key_type, String modified, String name, Long version) {}

  public record Kif(Long id, String name) {}

  public record KifListMatch(Long id, String name) {}

  public record Location(String address1, String address2, String billing_id, String city, String country, String created, String custom_reference, String id, String location_type, String mail_address1, String mail_address2, String mail_city, String mail_country, String mail_postal_code, String mail_state_province, String modified, String name, String name_of_business, String note, String postal_code, String state_province, String unique_id, Long version) {}

  public record LocationLoadMatch(String id) {}

  public record LocationListMatch(String address1, String address2, String billing_id, String city, String country, String created, String custom_reference, String id, String location_type, String mail_address1, String mail_address2, String mail_city, String mail_country, String mail_postal_code, String mail_state_province, String modified, String name, String name_of_business, String note, String postal_code, String state_province, String unique_id, Long version) {}

  public record LocationCreateData(String address1, String address2, String billing_id, String city, String country, String created, String custom_reference, String id, String location_type, String mail_address1, String mail_address2, String mail_city, String mail_country, String mail_postal_code, String mail_state_province, String modified, String name, String name_of_business, String note, String postal_code, String state_province, String unique_id, Long version) {}

  public record LocationRemoveMatch(String id) {}

  public record Partner(String billing_id, Boolean client_can_order_equipment, Map<String, Object> contact, String created, String id, Boolean is_active, Map<String, Object> location, String modified, String name, Map<String, Object> parent, String partner_id, String reference, String verification_phrase, Long version) {}

  public record PartnerLoadMatch(String id) {}

  public record PartnerListMatch(String billing_id, Boolean client_can_order_equipment, Map<String, Object> contact, String created, String id, Boolean is_active, Map<String, Object> location, String modified, String name, Map<String, Object> parent, String partner_id, String reference, String verification_phrase, Long version) {}

  public record PartnerCreateData(String billing_id, Boolean client_can_order_equipment, Map<String, Object> contact, String created, String id, Boolean is_active, Map<String, Object> location, String modified, String name, Map<String, Object> parent, String partner_id, String reference, String verification_phrase, Long version) {}

  public record Shipment(String carrier, Map<String, Object> client, String created, String date_received, String date_shipped, Map<String, Object> dc_kif, String id, List<Object> item, Map<String, Object> kif, String modified, Map<String, Object> partner, String shipment_type, String tracking, Long version) {}

  public record ShipmentLoadMatch(String id) {}

  public record ShipmentListMatch(String carrier, Map<String, Object> client, String created, String date_received, String date_shipped, Map<String, Object> dc_kif, String id, List<Object> item, Map<String, Object> kif, String modified, Map<String, Object> partner, String shipment_type, String tracking, Long version) {}

  public record ShipmentCreateData(String carrier, Map<String, Object> client, String created, String date_received, String date_shipped, Map<String, Object> dc_kif, String id, List<Object> item, Map<String, Object> kif, String modified, Map<String, Object> partner, String shipment_type, String tracking, Long version) {}

  public record Success(Boolean success) {}

  public record SuccessCreateData(String share_partner_to) {}

  public record SuccessRemoveMatch(String share_partner_to) {}

  public record Transaction(String alternate_key, Map<String, Object> client, String client_ref, String created, Long decrypted, String device_name, Map<String, Object> direct_partner, Long encrypted, String end_date, String err_code, String err_message, String id, String ip_address, Boolean is_virtual, String key_type, Map<String, Object> location, String message_id, String method, Map<String, Object> partner, String reference, String serial_number, String start_date, Boolean success, String transaction_source) {}

  public record TransactionLoadMatch(String id) {}

  public record TransactionListMatch(String alternate_key, Map<String, Object> client, String client_ref, String created, Long decrypted, String device_name, Map<String, Object> direct_partner, Long encrypted, String end_date, String err_code, String err_message, String id, String ip_address, Boolean is_virtual, String key_type, Map<String, Object> location, String message_id, String method, Map<String, Object> partner, String reference, String serial_number, String start_date, Boolean success, String transaction_source) {}

  public record TransactionCreateData(String alternate_key, Map<String, Object> client, String client_ref, String created, Long decrypted, String device_name, Map<String, Object> direct_partner, Long encrypted, String end_date, String err_code, String err_message, String id, String ip_address, Boolean is_virtual, String key_type, Map<String, Object> location, String message_id, String method, Map<String, Object> partner, String reference, String serial_number, String start_date, Boolean success, String transaction_source) {}

  public record UpdateResult(Map<String, Object> client, String email, String first_name, String id, Boolean is_active, Map<String, Object> kif, String last_name, Map<String, Object> partner, String phone, String user_name, Map<String, Object> user_role, Long version) {}

  public record UpdateResultListMatch(Map<String, Object> client, String email, String first_name, String id, Boolean is_active, Map<String, Object> kif, String last_name, Map<String, Object> partner, String phone, String user_name, Map<String, Object> user_role, Long version) {}

  public record UpdateResultCreateData(Map<String, Object> client, String email, String first_name, String id, Boolean is_active, Map<String, Object> kif, String last_name, Map<String, Object> partner, String phone, String user_name, Map<String, Object> user_role, Long version) {}

  public record UpdateResultUpdateData(String id) {}

  public record User(Map<String, Object> client, String created, String email, String first_name, String id, Boolean is_active, Map<String, Object> kif, String last_name, String modified, Map<String, Object> partner, String phone, String user_name, Map<String, Object> user_role, Long version) {}

  public record UserLoadMatch(String id) {}

  public record UserRemoveMatch(String id) {}

}

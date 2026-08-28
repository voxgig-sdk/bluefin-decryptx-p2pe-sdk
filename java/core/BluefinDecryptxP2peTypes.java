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

  public record Attestation(Map<String, Object> client, String completeDate, String created, Map<String, Object> device, String id, String name, String notes) {}

  public record AttestationLoadMatch(String id) {}

  public record AttestationListMatch(String client, Long skip, Long take) {}

  public record AttestationCreateData(Map<String, Object> client, String completeDate, String created, Map<String, Object> device, String id, String name, String notes) {}

  public record Client(Map<String, Object> contact, String created, Map<String, Object> directPartner, String id, Boolean isActive, Map<String, Object> location, String mid, String modified, String name, Map<String, Object> partner, Long version) {}

  public record ClientLoadMatch(String id) {}

  public record ClientListMatch(String partner, Long skip, Long take) {}

  public record ClientCreateData(Map<String, Object> contact, String created, Map<String, Object> directPartner, String id, Boolean isActive, Map<String, Object> location, String mid, String modified, String name, Map<String, Object> partner, Long version) {}

  public record ClientRemoveMatch(String id) {}

  public record CreateResult() {}

  public record CreateResultCreateData(String device_type, String serial_number) {}

  public record Decryption(Boolean success) {}

  public record DecryptionCreateData(Boolean success) {}

  public record Device(Map<String, Object> activatedBy, String activationDate, String alternateKey, String auditNextDate, String auditNotificationDate, Map<String, Object> client, String created, Map<String, Object> createdBy, Map<String, Object> deviceBuild, Map<String, Object> deviceState, Map<String, Object> deviceType, Long errorCounter, String errorLastDate, String id, Map<String, Object> initializedBy, String initializedDate, Map<String, Object> injectKey, Boolean isVirtual, Map<String, Object> kif, String lastActivityDate, Map<String, Object> location, String modified, Map<String, Object> modifiedBy, String name, String notes, Map<String, Object> partner, String serialNumber, Long version) {}

  public record DeviceLoadMatch(String id) {}

  public record DeviceListMatch(String client, String device_state, String kif, String partner, String serial_number, Long skip, String sorting_direction, String sorting_field, Long take) {}

  public record DeviceCreateData(Map<String, Object> activatedBy, String activationDate, String alternateKey, String auditNextDate, String auditNotificationDate, Map<String, Object> client, String created, Map<String, Object> createdBy, Map<String, Object> deviceBuild, Map<String, Object> deviceState, Map<String, Object> deviceType, Long errorCounter, String errorLastDate, String id, Map<String, Object> initializedBy, String initializedDate, Map<String, Object> injectKey, Boolean isVirtual, Map<String, Object> kif, String lastActivityDate, Map<String, Object> location, String modified, Map<String, Object> modifiedBy, String name, String notes, Map<String, Object> partner, String serialNumber, Long version) {}

  public record DeviceBuild(String appVersion, String buildNumber, String configFileName, String created, String deviceType, String firmwareVersion, String hardwareVersion, Long id, Boolean isActive, String modified, String name, String notes, Long version, String whiteListingBinRanges, Boolean whiteListingUsed) {}

  public record DeviceBuildLoadMatch(String id) {}

  public record DeviceBuildListMatch(String device_type, Long skip, Long take) {}

  public record DeviceCustodyDetail(String completeDate, String created, Map<String, Object> createdBy, Map<String, Object> custodian, Map<String, Object> device, Long id, Map<String, Object> location, String modified, Map<String, Object> modifiedBy, String notes, Map<String, Object> status, Map<String, Object> transferMethod, Long version) {}

  public record DeviceCustodyDetailLoadMatch(String device_type, String id, String serial_number) {}

  public record DeviceCustodyList(String completeDate, String created, Map<String, Object> createdBy, Map<String, Object> custodian, Map<String, Object> device, Long id, Map<String, Object> location, String modified, Map<String, Object> modifiedBy, String notes, Map<String, Object> status, Map<String, Object> transferMethod, Long version) {}

  public record DeviceCustodyListListMatch(String device_type, String serial_number, Long skip, Long take) {}

  public record DeviceList(List<Object> data, Long total) {}

  public record DeviceListLoadMatch(String share_partner_to, Long skip, String sorting_direction, String sorting_field, Long take) {}

  public record DeviceReceiveResult(Boolean success) {}

  public record DeviceReceiveResultCreateData(Boolean success) {}

  public record DeviceRkiActivateResult(Boolean success) {}

  public record DeviceRkiActivateResultCreateData(Boolean success) {}

  public record DeviceState(Long id, String name) {}

  public record DeviceStateListMatch(Long id, String name) {}

  public record DeviceType(String created, String deviceTypeMode, String hardwareVersion, String id, Boolean isActive, String manufacturer, String model, String modified, String name, String photoUrl, String productName, Long version) {}

  public record DeviceTypeLoadMatch(String id) {}

  public record DeviceTypeListMatch(String created, String deviceTypeMode, String hardwareVersion, String id, Boolean isActive, String manufacturer, String model, String modified, String name, String photoUrl, String productName, Long version) {}

  public record InjectKey(String created, String id, Boolean isActive, Boolean isP2PE, String keyType, String modified, String name, Long version) {}

  public record InjectKeyLoadMatch(String id) {}

  public record InjectKeyListMatch(String created, String id, Boolean isActive, Boolean isP2PE, String keyType, String modified, String name, Long version) {}

  public record Kif(Long id, String name) {}

  public record KifListMatch(Long id, String name) {}

  public record Location(String address1, String address2, String billingId, String city, String country, String created, String customReference, String id, String locationType, String mailAddress1, String mailAddress2, String mailCity, String mailCountry, String mailPostalCode, String mailStateProvince, String modified, String name, String nameOfBusiness, String notes, String postalCode, String stateProvince, String uniqueId, Long version) {}

  public record LocationLoadMatch(String id) {}

  public record LocationListMatch(String client, Long skip, Long take) {}

  public record LocationCreateData(String address1, String address2, String billingId, String city, String country, String created, String customReference, String id, String locationType, String mailAddress1, String mailAddress2, String mailCity, String mailCountry, String mailPostalCode, String mailStateProvince, String modified, String name, String nameOfBusiness, String notes, String postalCode, String stateProvince, String uniqueId, Long version) {}

  public record LocationRemoveMatch(String id) {}

  public record Partner(String billingId, Boolean clientCanOrderEquipment, Map<String, Object> contact, String created, String id, Boolean isActive, Map<String, Object> location, String modified, String name, Map<String, Object> parent, String partnerId, String reference, String verificationPhrase, Long version) {}

  public record PartnerLoadMatch(String id) {}

  public record PartnerListMatch(String partner, Long skip, Long take) {}

  public record PartnerCreateData(String billingId, Boolean clientCanOrderEquipment, Map<String, Object> contact, String created, String id, Boolean isActive, Map<String, Object> location, String modified, String name, Map<String, Object> parent, String partnerId, String reference, String verificationPhrase, Long version) {}

  public record Shipment(String carrier, Map<String, Object> client, String created, String dateReceived, String dateShipped, Map<String, Object> dcKif, String id, List<Object> items, Map<String, Object> kif, String modified, Map<String, Object> partner, String shipmentType, String tracking, Long version) {}

  public record ShipmentLoadMatch(String id) {}

  public record ShipmentListMatch(String kif, String mode, Long skip, Long take) {}

  public record ShipmentCreateData(String carrier, Map<String, Object> client, String created, String dateReceived, String dateShipped, Map<String, Object> dcKif, String id, List<Object> items, Map<String, Object> kif, String modified, Map<String, Object> partner, String shipmentType, String tracking, Long version) {}

  public record Success(Boolean success) {}

  public record SuccessCreateData(String share_partner_to, Boolean success) {}

  public record SuccessRemoveMatch(String share_partner_to) {}

  public record Transaction(String alternateKey, Map<String, Object> client, String clientRef, String created, Long decrypted, String deviceName, Map<String, Object> directPartner, Long encrypted, String endDate, String errCode, String errMessage, String id, String ipAddress, Boolean isVirtual, String keyType, Map<String, Object> location, String messageId, String method, Map<String, Object> partner, String reference, String serialNumber, String startDate, Boolean success, String transactionSource) {}

  public record TransactionLoadMatch(String id) {}

  public record TransactionListMatch(String client, String client_ref, String date_from, String date_to, String location, String message_id, String paging_mode, String partner, String reference, String serial_number, Long skip, Boolean success, Long take) {}

  public record TransactionCreateData(String alternateKey, Map<String, Object> client, String clientRef, String created, Long decrypted, String deviceName, Map<String, Object> directPartner, Long encrypted, String endDate, String errCode, String errMessage, String id, String ipAddress, Boolean isVirtual, String keyType, Map<String, Object> location, String messageId, String method, Map<String, Object> partner, String reference, String serialNumber, String startDate, Boolean success, String transactionSource) {}

  public record UpdateResult(Map<String, Object> client, String email, String firstName, String id, Boolean isActive, Map<String, Object> kif, String lastName, Map<String, Object> partner, String phone, String userName, Map<String, Object> userRole, Long version) {}

  public record UpdateResultListMatch(String client, String kif, Object partner, Long skip, Long take) {}

  public record UpdateResultCreateData(Map<String, Object> client, String email, String firstName, String id, Boolean isActive, Map<String, Object> kif, String lastName, Map<String, Object> partner, String phone, String userName, Map<String, Object> userRole, Long version) {}

  public record UpdateResultUpdateData(String id, Map<String, Object> client, String email, String firstName, Boolean isActive, Map<String, Object> kif, String lastName, Map<String, Object> partner, String phone, String userName, Map<String, Object> userRole, Long version) {}

  public record User(Map<String, Object> client, String created, String email, String firstName, String id, Boolean isActive, Map<String, Object> kif, String lastName, String modified, Map<String, Object> partner, String phone, String userName, Map<String, Object> userRole, Long version) {}

  public record UserLoadMatch(String id) {}

  public record UserRemoveMatch(String id) {}

}

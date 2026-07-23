<?php
declare(strict_types=1);

// Typed models for the BluefinDecryptxP2pe SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Attestation entity data model. */
class Attestation
{
    public ?array $client = null;
    public ?string $complete_date = null;
    public ?string $created = null;
    public ?array $device = null;
    public ?string $id = null;
    public ?string $name = null;
    public ?string $note = null;
}

/** Request payload for Attestation#load. */
class AttestationLoadMatch
{
    public string $id;
}

/** Request payload for Attestation#list. */
class AttestationListMatch
{
    public ?array $client = null;
    public ?string $complete_date = null;
    public ?string $created = null;
    public ?array $device = null;
    public ?string $id = null;
    public ?string $name = null;
    public ?string $note = null;
}

/** Request payload for Attestation#create. */
class AttestationCreateData
{
    public ?array $client = null;
    public ?string $complete_date = null;
    public ?string $created = null;
    public ?array $device = null;
    public ?string $id = null;
    public ?string $name = null;
    public ?string $note = null;
}

/** Client entity data model. */
class Client
{
    public ?array $contact = null;
    public ?string $created = null;
    public ?array $direct_partner = null;
    public ?string $id = null;
    public ?bool $is_active = null;
    public array $location;
    public ?string $mid = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $partner = null;
    public ?int $version = null;
}

/** Request payload for Client#load. */
class ClientLoadMatch
{
    public string $id;
}

/** Request payload for Client#list. */
class ClientListMatch
{
    public ?array $contact = null;
    public ?string $created = null;
    public ?array $direct_partner = null;
    public ?string $id = null;
    public ?bool $is_active = null;
    public ?array $location = null;
    public ?string $mid = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $partner = null;
    public ?int $version = null;
}

/** Request payload for Client#create. */
class ClientCreateData
{
    public ?array $contact = null;
    public ?string $created = null;
    public ?array $direct_partner = null;
    public ?string $id = null;
    public ?bool $is_active = null;
    public array $location;
    public ?string $mid = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $partner = null;
    public ?int $version = null;
}

/** Request payload for Client#remove. */
class ClientRemoveMatch
{
    public string $id;
}

/** CreateResult entity data model. */
class CreateResult
{
}

/** Request payload for CreateResult#create. */
class CreateResultCreateData
{
    public string $device_type;
    public string $serial_number;
}

/** Decryption entity data model. */
class Decryption
{
    public ?bool $success = null;
}

/** Request payload for Decryption#create. */
class DecryptionCreateData
{
    public ?bool $success = null;
}

/** Device entity data model. */
class Device
{
    public array $activated_by;
    public ?string $activation_date = null;
    public ?string $alternate_key = null;
    public ?string $audit_next_date = null;
    public ?string $audit_notification_date = null;
    public ?array $client = null;
    public ?string $created = null;
    public array $created_by;
    public ?array $device_build = null;
    public ?array $device_state = null;
    public ?array $device_type = null;
    public ?int $error_counter = null;
    public ?string $error_last_date = null;
    public ?string $id = null;
    public array $initialized_by;
    public ?string $initialized_date = null;
    public ?array $inject_key = null;
    public ?bool $is_virtual = null;
    public ?array $kif = null;
    public ?string $last_activity_date = null;
    public array $location;
    public ?string $modified = null;
    public array $modified_by;
    public ?string $name = null;
    public ?string $note = null;
    public ?array $partner = null;
    public ?string $serial_number = null;
    public ?int $version = null;
}

/** Request payload for Device#load. */
class DeviceLoadMatch
{
    public ?string $device_type = null;
    public ?string $serial_number = null;
    public ?string $id = null;
}

/** Request payload for Device#list. */
class DeviceListMatch
{
    public ?array $activated_by = null;
    public ?string $activation_date = null;
    public ?string $alternate_key = null;
    public ?string $audit_next_date = null;
    public ?string $audit_notification_date = null;
    public ?array $client = null;
    public ?string $created = null;
    public ?array $created_by = null;
    public ?array $device_build = null;
    public ?array $device_state = null;
    public ?array $device_type = null;
    public ?int $error_counter = null;
    public ?string $error_last_date = null;
    public ?string $id = null;
    public ?array $initialized_by = null;
    public ?string $initialized_date = null;
    public ?array $inject_key = null;
    public ?bool $is_virtual = null;
    public ?array $kif = null;
    public ?string $last_activity_date = null;
    public ?array $location = null;
    public ?string $modified = null;
    public ?array $modified_by = null;
    public ?string $name = null;
    public ?string $note = null;
    public ?array $partner = null;
    public ?string $serial_number = null;
    public ?int $version = null;
}

/** Request payload for Device#create. */
class DeviceCreateData
{
    public array $activated_by;
    public ?string $activation_date = null;
    public ?string $alternate_key = null;
    public ?string $audit_next_date = null;
    public ?string $audit_notification_date = null;
    public ?array $client = null;
    public ?string $created = null;
    public array $created_by;
    public ?array $device_build = null;
    public ?array $device_state = null;
    public ?array $device_type = null;
    public ?int $error_counter = null;
    public ?string $error_last_date = null;
    public ?string $id = null;
    public array $initialized_by;
    public ?string $initialized_date = null;
    public ?array $inject_key = null;
    public ?bool $is_virtual = null;
    public ?array $kif = null;
    public ?string $last_activity_date = null;
    public array $location;
    public ?string $modified = null;
    public array $modified_by;
    public ?string $name = null;
    public ?string $note = null;
    public ?array $partner = null;
    public ?string $serial_number = null;
    public ?int $version = null;
}

/** DeviceBuild entity data model. */
class DeviceBuild
{
    public ?string $app_version = null;
    public ?string $build_number = null;
    public ?string $config_file_name = null;
    public ?string $created = null;
    public ?string $device_type = null;
    public ?string $firmware_version = null;
    public ?string $hardware_version = null;
    public ?int $id = null;
    public ?bool $is_active = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?string $note = null;
    public ?int $version = null;
    public ?string $white_listing_bin_range = null;
    public ?bool $white_listing_used = null;
}

/** Request payload for DeviceBuild#load. */
class DeviceBuildLoadMatch
{
    public string $id;
}

/** Request payload for DeviceBuild#list. */
class DeviceBuildListMatch
{
    public ?string $app_version = null;
    public ?string $build_number = null;
    public ?string $config_file_name = null;
    public ?string $created = null;
    public ?string $device_type = null;
    public ?string $firmware_version = null;
    public ?string $hardware_version = null;
    public ?int $id = null;
    public ?bool $is_active = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?string $note = null;
    public ?int $version = null;
    public ?string $white_listing_bin_range = null;
    public ?bool $white_listing_used = null;
}

/** DeviceCustodyDetail entity data model. */
class DeviceCustodyDetail
{
    public ?string $complete_date = null;
    public ?string $created = null;
    public array $created_by;
    public array $custodian;
    public ?array $device = null;
    public ?int $id = null;
    public array $location;
    public ?string $modified = null;
    public array $modified_by;
    public ?string $note = null;
    public ?array $status = null;
    public ?array $transfer_method = null;
    public ?int $version = null;
}

/** Request payload for DeviceCustodyDetail#load. */
class DeviceCustodyDetailLoadMatch
{
    public string $device_type;
    public string $id;
    public string $serial_number;
}

/** DeviceCustodyList entity data model. */
class DeviceCustodyList
{
    public ?string $complete_date = null;
    public ?string $created = null;
    public array $created_by;
    public array $custodian;
    public ?array $device = null;
    public ?int $id = null;
    public array $location;
    public ?string $modified = null;
    public array $modified_by;
    public ?string $note = null;
    public ?array $status = null;
    public ?array $transfer_method = null;
    public ?int $version = null;
}

/** Request payload for DeviceCustodyList#list. */
class DeviceCustodyListListMatch
{
    public string $device_type;
    public string $serial_number;
}

/** DeviceList entity data model. */
class DeviceList
{
    public ?array $data = null;
    public ?int $total = null;
}

/** Request payload for DeviceList#load. */
class DeviceListLoadMatch
{
    public string $share_partner_to;
}

/** DeviceReceiveResult entity data model. */
class DeviceReceiveResult
{
    public bool $success;
}

/** Request payload for DeviceReceiveResult#create. */
class DeviceReceiveResultCreateData
{
    public bool $success;
}

/** DeviceRkiActivateResult entity data model. */
class DeviceRkiActivateResult
{
    public bool $success;
}

/** Request payload for DeviceRkiActivateResult#create. */
class DeviceRkiActivateResultCreateData
{
    public bool $success;
}

/** DeviceState entity data model. */
class DeviceState
{
    public ?int $id = null;
    public ?string $name = null;
}

/** Request payload for DeviceState#list. */
class DeviceStateListMatch
{
    public ?int $id = null;
    public ?string $name = null;
}

/** DeviceType entity data model. */
class DeviceType
{
    public ?string $created = null;
    public ?string $device_type_mode = null;
    public ?string $hardware_version = null;
    public ?string $id = null;
    public ?bool $is_active = null;
    public ?string $manufacturer = null;
    public ?string $model = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?string $photo_url = null;
    public ?string $product_name = null;
    public ?int $version = null;
}

/** Request payload for DeviceType#load. */
class DeviceTypeLoadMatch
{
    public string $id;
}

/** Request payload for DeviceType#list. */
class DeviceTypeListMatch
{
    public ?string $created = null;
    public ?string $device_type_mode = null;
    public ?string $hardware_version = null;
    public ?string $id = null;
    public ?bool $is_active = null;
    public ?string $manufacturer = null;
    public ?string $model = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?string $photo_url = null;
    public ?string $product_name = null;
    public ?int $version = null;
}

/** InjectKey entity data model. */
class InjectKey
{
    public ?string $created = null;
    public ?string $id = null;
    public ?bool $is_active = null;
    public ?bool $is_p2_pe = null;
    public ?string $key_type = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?int $version = null;
}

/** Request payload for InjectKey#load. */
class InjectKeyLoadMatch
{
    public string $id;
}

/** Request payload for InjectKey#list. */
class InjectKeyListMatch
{
    public ?string $created = null;
    public ?string $id = null;
    public ?bool $is_active = null;
    public ?bool $is_p2_pe = null;
    public ?string $key_type = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?int $version = null;
}

/** Kif entity data model. */
class Kif
{
    public ?int $id = null;
    public ?string $name = null;
}

/** Request payload for Kif#list. */
class KifListMatch
{
    public ?int $id = null;
    public ?string $name = null;
}

/** Location entity data model. */
class Location
{
    public ?string $address1 = null;
    public ?string $address2 = null;
    public ?string $billing_id = null;
    public ?string $city = null;
    public ?string $country = null;
    public ?string $created = null;
    public ?string $custom_reference = null;
    public ?string $id = null;
    public ?string $location_type = null;
    public ?string $mail_address1 = null;
    public ?string $mail_address2 = null;
    public ?string $mail_city = null;
    public ?string $mail_country = null;
    public ?string $mail_postal_code = null;
    public ?string $mail_state_province = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?string $name_of_business = null;
    public ?string $note = null;
    public ?string $postal_code = null;
    public ?string $state_province = null;
    public ?string $unique_id = null;
    public ?int $version = null;
}

/** Request payload for Location#load. */
class LocationLoadMatch
{
    public string $id;
}

/** Request payload for Location#list. */
class LocationListMatch
{
    public ?string $address1 = null;
    public ?string $address2 = null;
    public ?string $billing_id = null;
    public ?string $city = null;
    public ?string $country = null;
    public ?string $created = null;
    public ?string $custom_reference = null;
    public ?string $id = null;
    public ?string $location_type = null;
    public ?string $mail_address1 = null;
    public ?string $mail_address2 = null;
    public ?string $mail_city = null;
    public ?string $mail_country = null;
    public ?string $mail_postal_code = null;
    public ?string $mail_state_province = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?string $name_of_business = null;
    public ?string $note = null;
    public ?string $postal_code = null;
    public ?string $state_province = null;
    public ?string $unique_id = null;
    public ?int $version = null;
}

/** Request payload for Location#create. */
class LocationCreateData
{
    public ?string $address1 = null;
    public ?string $address2 = null;
    public ?string $billing_id = null;
    public ?string $city = null;
    public ?string $country = null;
    public ?string $created = null;
    public ?string $custom_reference = null;
    public ?string $id = null;
    public ?string $location_type = null;
    public ?string $mail_address1 = null;
    public ?string $mail_address2 = null;
    public ?string $mail_city = null;
    public ?string $mail_country = null;
    public ?string $mail_postal_code = null;
    public ?string $mail_state_province = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?string $name_of_business = null;
    public ?string $note = null;
    public ?string $postal_code = null;
    public ?string $state_province = null;
    public ?string $unique_id = null;
    public ?int $version = null;
}

/** Request payload for Location#remove. */
class LocationRemoveMatch
{
    public string $id;
}

/** Partner entity data model. */
class Partner
{
    public ?string $billing_id = null;
    public ?bool $client_can_order_equipment = null;
    public ?array $contact = null;
    public ?string $created = null;
    public ?string $id = null;
    public ?bool $is_active = null;
    public array $location;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $parent = null;
    public ?string $partner_id = null;
    public ?string $reference = null;
    public ?string $verification_phrase = null;
    public ?int $version = null;
}

/** Request payload for Partner#load. */
class PartnerLoadMatch
{
    public string $id;
}

/** Request payload for Partner#list. */
class PartnerListMatch
{
    public ?string $billing_id = null;
    public ?bool $client_can_order_equipment = null;
    public ?array $contact = null;
    public ?string $created = null;
    public ?string $id = null;
    public ?bool $is_active = null;
    public ?array $location = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $parent = null;
    public ?string $partner_id = null;
    public ?string $reference = null;
    public ?string $verification_phrase = null;
    public ?int $version = null;
}

/** Request payload for Partner#create. */
class PartnerCreateData
{
    public ?string $billing_id = null;
    public ?bool $client_can_order_equipment = null;
    public ?array $contact = null;
    public ?string $created = null;
    public ?string $id = null;
    public ?bool $is_active = null;
    public array $location;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $parent = null;
    public ?string $partner_id = null;
    public ?string $reference = null;
    public ?string $verification_phrase = null;
    public ?int $version = null;
}

/** Shipment entity data model. */
class Shipment
{
    public ?string $carrier = null;
    public ?array $client = null;
    public ?string $created = null;
    public ?string $date_received = null;
    public ?string $date_shipped = null;
    public ?array $dc_kif = null;
    public ?string $id = null;
    public ?array $item = null;
    public ?array $kif = null;
    public ?string $modified = null;
    public ?array $partner = null;
    public ?string $shipment_type = null;
    public ?string $tracking = null;
    public ?int $version = null;
}

/** Request payload for Shipment#load. */
class ShipmentLoadMatch
{
    public string $id;
}

/** Request payload for Shipment#list. */
class ShipmentListMatch
{
    public ?string $carrier = null;
    public ?array $client = null;
    public ?string $created = null;
    public ?string $date_received = null;
    public ?string $date_shipped = null;
    public ?array $dc_kif = null;
    public ?string $id = null;
    public ?array $item = null;
    public ?array $kif = null;
    public ?string $modified = null;
    public ?array $partner = null;
    public ?string $shipment_type = null;
    public ?string $tracking = null;
    public ?int $version = null;
}

/** Request payload for Shipment#create. */
class ShipmentCreateData
{
    public ?string $carrier = null;
    public ?array $client = null;
    public ?string $created = null;
    public ?string $date_received = null;
    public ?string $date_shipped = null;
    public ?array $dc_kif = null;
    public ?string $id = null;
    public ?array $item = null;
    public ?array $kif = null;
    public ?string $modified = null;
    public ?array $partner = null;
    public ?string $shipment_type = null;
    public ?string $tracking = null;
    public ?int $version = null;
}

/** Success entity data model. */
class Success
{
    public ?bool $success = null;
}

/** Request payload for Success#create. */
class SuccessCreateData
{
    public string $share_partner_to;
}

/** Request payload for Success#remove. */
class SuccessRemoveMatch
{
    public string $share_partner_to;
}

/** Transaction entity data model. */
class Transaction
{
    public ?string $alternate_key = null;
    public ?array $client = null;
    public ?string $client_ref = null;
    public ?string $created = null;
    public ?int $decrypted = null;
    public ?string $device_name = null;
    public ?array $direct_partner = null;
    public ?int $encrypted = null;
    public ?string $end_date = null;
    public ?string $err_code = null;
    public ?string $err_message = null;
    public ?string $id = null;
    public ?string $ip_address = null;
    public ?bool $is_virtual = null;
    public ?string $key_type = null;
    public array $location;
    public ?string $message_id = null;
    public ?string $method = null;
    public ?array $partner = null;
    public ?string $reference = null;
    public ?string $serial_number = null;
    public ?string $start_date = null;
    public ?bool $success = null;
    public ?string $transaction_source = null;
}

/** Request payload for Transaction#load. */
class TransactionLoadMatch
{
    public string $id;
}

/** Request payload for Transaction#list. */
class TransactionListMatch
{
    public ?string $alternate_key = null;
    public ?array $client = null;
    public ?string $client_ref = null;
    public ?string $created = null;
    public ?int $decrypted = null;
    public ?string $device_name = null;
    public ?array $direct_partner = null;
    public ?int $encrypted = null;
    public ?string $end_date = null;
    public ?string $err_code = null;
    public ?string $err_message = null;
    public ?string $id = null;
    public ?string $ip_address = null;
    public ?bool $is_virtual = null;
    public ?string $key_type = null;
    public ?array $location = null;
    public ?string $message_id = null;
    public ?string $method = null;
    public ?array $partner = null;
    public ?string $reference = null;
    public ?string $serial_number = null;
    public ?string $start_date = null;
    public ?bool $success = null;
    public ?string $transaction_source = null;
}

/** Request payload for Transaction#create. */
class TransactionCreateData
{
    public ?string $alternate_key = null;
    public ?array $client = null;
    public ?string $client_ref = null;
    public ?string $created = null;
    public ?int $decrypted = null;
    public ?string $device_name = null;
    public ?array $direct_partner = null;
    public ?int $encrypted = null;
    public ?string $end_date = null;
    public ?string $err_code = null;
    public ?string $err_message = null;
    public ?string $id = null;
    public ?string $ip_address = null;
    public ?bool $is_virtual = null;
    public ?string $key_type = null;
    public array $location;
    public ?string $message_id = null;
    public ?string $method = null;
    public ?array $partner = null;
    public ?string $reference = null;
    public ?string $serial_number = null;
    public ?string $start_date = null;
    public ?bool $success = null;
    public ?string $transaction_source = null;
}

/** UpdateResult entity data model. */
class UpdateResult
{
    public ?array $client = null;
    public ?string $email = null;
    public ?string $first_name = null;
    public ?string $id = null;
    public ?bool $is_active = null;
    public ?array $kif = null;
    public ?string $last_name = null;
    public ?array $partner = null;
    public ?string $phone = null;
    public ?string $user_name = null;
    public ?array $user_role = null;
    public ?int $version = null;
}

/** Request payload for UpdateResult#list. */
class UpdateResultListMatch
{
    public ?array $client = null;
    public ?string $email = null;
    public ?string $first_name = null;
    public ?string $id = null;
    public ?bool $is_active = null;
    public ?array $kif = null;
    public ?string $last_name = null;
    public ?array $partner = null;
    public ?string $phone = null;
    public ?string $user_name = null;
    public ?array $user_role = null;
    public ?int $version = null;
}

/** Request payload for UpdateResult#create. */
class UpdateResultCreateData
{
    public ?array $client = null;
    public ?string $email = null;
    public ?string $first_name = null;
    public ?string $id = null;
    public ?bool $is_active = null;
    public ?array $kif = null;
    public ?string $last_name = null;
    public ?array $partner = null;
    public ?string $phone = null;
    public ?string $user_name = null;
    public ?array $user_role = null;
    public ?int $version = null;
}

/** Request payload for UpdateResult#update. */
class UpdateResultUpdateData
{
    public string $id;
}

/** User entity data model. */
class User
{
    public ?array $client = null;
    public ?string $created = null;
    public ?string $email = null;
    public ?string $first_name = null;
    public ?string $id = null;
    public ?bool $is_active = null;
    public ?array $kif = null;
    public ?string $last_name = null;
    public ?string $modified = null;
    public ?array $partner = null;
    public ?string $phone = null;
    public ?string $user_name = null;
    public ?array $user_role = null;
    public ?int $version = null;
}

/** Request payload for User#load. */
class UserLoadMatch
{
    public string $id;
}

/** Request payload for User#remove. */
class UserRemoveMatch
{
    public string $id;
}


// Typed reference models for the BluefinDecryptxP2pe SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These records are documentation/DX reference shapes ONLY. The SDK ops take
// and return the loose object model (Dictionary<string, object?> / object?) at
// runtime, so these types are not wired into the op signatures — use them to
// describe a payload before converting it to a dictionary. Optional (req:false)
// keys are modelled as nullable properties.

namespace BluefinDecryptxP2peSdk.Types;

public record Attestation
{
    public Dictionary<string, object?>? client { get; init; }
    public string? complete_date { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?>? device { get; init; }
    public string? id { get; init; }
    public string? name { get; init; }
    public string? note { get; init; }
}

public record AttestationLoadMatch
{
    public string id { get; init; }
}

public record AttestationListMatch
{
    public Dictionary<string, object?>? client { get; init; }
    public string? complete_date { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?>? device { get; init; }
    public string? id { get; init; }
    public string? name { get; init; }
    public string? note { get; init; }
}

public record AttestationCreateData
{
    public Dictionary<string, object?>? client { get; init; }
    public string? complete_date { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?>? device { get; init; }
    public string? id { get; init; }
    public string? name { get; init; }
    public string? note { get; init; }
}

public record Client
{
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?>? direct_partner { get; init; }
    public string? id { get; init; }
    public bool? is_active { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? mid { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public long? version { get; init; }
}

public record ClientLoadMatch
{
    public string id { get; init; }
}

public record ClientListMatch
{
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?>? direct_partner { get; init; }
    public string? id { get; init; }
    public bool? is_active { get; init; }
    public Dictionary<string, object?>? location { get; init; }
    public string? mid { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public long? version { get; init; }
}

public record ClientCreateData
{
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?>? direct_partner { get; init; }
    public string? id { get; init; }
    public bool? is_active { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? mid { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public long? version { get; init; }
}

public record ClientRemoveMatch
{
    public string id { get; init; }
}

public record CreateResult();

public record CreateResultCreateData
{
    public string device_type { get; init; }
    public string serial_number { get; init; }
}

public record Decryption
{
    public bool? success { get; init; }
}

public record DecryptionCreateData
{
    public bool? success { get; init; }
}

public record Device
{
    public Dictionary<string, object?> activated_by { get; init; }
    public string? activation_date { get; init; }
    public string? alternate_key { get; init; }
    public string? audit_next_date { get; init; }
    public string? audit_notification_date { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?> created_by { get; init; }
    public Dictionary<string, object?>? device_build { get; init; }
    public Dictionary<string, object?>? device_state { get; init; }
    public Dictionary<string, object?>? device_type { get; init; }
    public long? error_counter { get; init; }
    public string? error_last_date { get; init; }
    public string? id { get; init; }
    public Dictionary<string, object?> initialized_by { get; init; }
    public string? initialized_date { get; init; }
    public Dictionary<string, object?>? inject_key { get; init; }
    public bool? is_virtual { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? last_activity_date { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?> modified_by { get; init; }
    public string? name { get; init; }
    public string? note { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? serial_number { get; init; }
    public long? version { get; init; }
}

public record DeviceLoadMatch
{
    public string? device_type { get; init; }
    public string? serial_number { get; init; }
    public string? id { get; init; }
}

public record DeviceListMatch
{
    public Dictionary<string, object?>? activated_by { get; init; }
    public string? activation_date { get; init; }
    public string? alternate_key { get; init; }
    public string? audit_next_date { get; init; }
    public string? audit_notification_date { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?>? created_by { get; init; }
    public Dictionary<string, object?>? device_build { get; init; }
    public Dictionary<string, object?>? device_state { get; init; }
    public Dictionary<string, object?>? device_type { get; init; }
    public long? error_counter { get; init; }
    public string? error_last_date { get; init; }
    public string? id { get; init; }
    public Dictionary<string, object?>? initialized_by { get; init; }
    public string? initialized_date { get; init; }
    public Dictionary<string, object?>? inject_key { get; init; }
    public bool? is_virtual { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? last_activity_date { get; init; }
    public Dictionary<string, object?>? location { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?>? modified_by { get; init; }
    public string? name { get; init; }
    public string? note { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? serial_number { get; init; }
    public long? version { get; init; }
}

public record DeviceCreateData
{
    public Dictionary<string, object?> activated_by { get; init; }
    public string? activation_date { get; init; }
    public string? alternate_key { get; init; }
    public string? audit_next_date { get; init; }
    public string? audit_notification_date { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?> created_by { get; init; }
    public Dictionary<string, object?>? device_build { get; init; }
    public Dictionary<string, object?>? device_state { get; init; }
    public Dictionary<string, object?>? device_type { get; init; }
    public long? error_counter { get; init; }
    public string? error_last_date { get; init; }
    public string? id { get; init; }
    public Dictionary<string, object?> initialized_by { get; init; }
    public string? initialized_date { get; init; }
    public Dictionary<string, object?>? inject_key { get; init; }
    public bool? is_virtual { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? last_activity_date { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?> modified_by { get; init; }
    public string? name { get; init; }
    public string? note { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? serial_number { get; init; }
    public long? version { get; init; }
}

public record DeviceBuild
{
    public string? app_version { get; init; }
    public string? build_number { get; init; }
    public string? config_file_name { get; init; }
    public string? created { get; init; }
    public string? device_type { get; init; }
    public string? firmware_version { get; init; }
    public string? hardware_version { get; init; }
    public long? id { get; init; }
    public bool? is_active { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public string? note { get; init; }
    public long? version { get; init; }
    public string? white_listing_bin_range { get; init; }
    public bool? white_listing_used { get; init; }
}

public record DeviceBuildLoadMatch
{
    public string id { get; init; }
}

public record DeviceBuildListMatch
{
    public string? app_version { get; init; }
    public string? build_number { get; init; }
    public string? config_file_name { get; init; }
    public string? created { get; init; }
    public string? device_type { get; init; }
    public string? firmware_version { get; init; }
    public string? hardware_version { get; init; }
    public long? id { get; init; }
    public bool? is_active { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public string? note { get; init; }
    public long? version { get; init; }
    public string? white_listing_bin_range { get; init; }
    public bool? white_listing_used { get; init; }
}

public record DeviceCustodyDetail
{
    public string? complete_date { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?> created_by { get; init; }
    public Dictionary<string, object?> custodian { get; init; }
    public Dictionary<string, object?>? device { get; init; }
    public long? id { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?> modified_by { get; init; }
    public string? note { get; init; }
    public Dictionary<string, object?>? status { get; init; }
    public Dictionary<string, object?>? transfer_method { get; init; }
    public long? version { get; init; }
}

public record DeviceCustodyDetailLoadMatch
{
    public string device_type { get; init; }
    public string id { get; init; }
    public string serial_number { get; init; }
}

public record DeviceCustodyList
{
    public string? complete_date { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?> created_by { get; init; }
    public Dictionary<string, object?> custodian { get; init; }
    public Dictionary<string, object?>? device { get; init; }
    public long? id { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?> modified_by { get; init; }
    public string? note { get; init; }
    public Dictionary<string, object?>? status { get; init; }
    public Dictionary<string, object?>? transfer_method { get; init; }
    public long? version { get; init; }
}

public record DeviceCustodyListListMatch
{
    public string device_type { get; init; }
    public string serial_number { get; init; }
}

public record DeviceList
{
    public List<object?>? data { get; init; }
    public long? total { get; init; }
}

public record DeviceListLoadMatch
{
    public string share_partner_to { get; init; }
}

public record DeviceReceiveResult
{
    public bool success { get; init; }
}

public record DeviceReceiveResultCreateData
{
    public bool success { get; init; }
}

public record DeviceRkiActivateResult
{
    public bool success { get; init; }
}

public record DeviceRkiActivateResultCreateData
{
    public bool success { get; init; }
}

public record DeviceState
{
    public long? id { get; init; }
    public string? name { get; init; }
}

public record DeviceStateListMatch
{
    public long? id { get; init; }
    public string? name { get; init; }
}

public record DeviceType
{
    public string? created { get; init; }
    public string? device_type_mode { get; init; }
    public string? hardware_version { get; init; }
    public string? id { get; init; }
    public bool? is_active { get; init; }
    public string? manufacturer { get; init; }
    public string? model { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public string? photo_url { get; init; }
    public string? product_name { get; init; }
    public long? version { get; init; }
}

public record DeviceTypeLoadMatch
{
    public string id { get; init; }
}

public record DeviceTypeListMatch
{
    public string? created { get; init; }
    public string? device_type_mode { get; init; }
    public string? hardware_version { get; init; }
    public string? id { get; init; }
    public bool? is_active { get; init; }
    public string? manufacturer { get; init; }
    public string? model { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public string? photo_url { get; init; }
    public string? product_name { get; init; }
    public long? version { get; init; }
}

public record InjectKey
{
    public string? created { get; init; }
    public string? id { get; init; }
    public bool? is_active { get; init; }
    public bool? is_p2_pe { get; init; }
    public string? key_type { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public long? version { get; init; }
}

public record InjectKeyLoadMatch
{
    public string id { get; init; }
}

public record InjectKeyListMatch
{
    public string? created { get; init; }
    public string? id { get; init; }
    public bool? is_active { get; init; }
    public bool? is_p2_pe { get; init; }
    public string? key_type { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public long? version { get; init; }
}

public record Kif
{
    public long? id { get; init; }
    public string? name { get; init; }
}

public record KifListMatch
{
    public long? id { get; init; }
    public string? name { get; init; }
}

public record Location
{
    public string? address1 { get; init; }
    public string? address2 { get; init; }
    public string? billing_id { get; init; }
    public string? city { get; init; }
    public string? country { get; init; }
    public string? created { get; init; }
    public string? custom_reference { get; init; }
    public string? id { get; init; }
    public string? location_type { get; init; }
    public string? mail_address1 { get; init; }
    public string? mail_address2 { get; init; }
    public string? mail_city { get; init; }
    public string? mail_country { get; init; }
    public string? mail_postal_code { get; init; }
    public string? mail_state_province { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public string? name_of_business { get; init; }
    public string? note { get; init; }
    public string? postal_code { get; init; }
    public string? state_province { get; init; }
    public string? unique_id { get; init; }
    public long? version { get; init; }
}

public record LocationLoadMatch
{
    public string id { get; init; }
}

public record LocationListMatch
{
    public string? address1 { get; init; }
    public string? address2 { get; init; }
    public string? billing_id { get; init; }
    public string? city { get; init; }
    public string? country { get; init; }
    public string? created { get; init; }
    public string? custom_reference { get; init; }
    public string? id { get; init; }
    public string? location_type { get; init; }
    public string? mail_address1 { get; init; }
    public string? mail_address2 { get; init; }
    public string? mail_city { get; init; }
    public string? mail_country { get; init; }
    public string? mail_postal_code { get; init; }
    public string? mail_state_province { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public string? name_of_business { get; init; }
    public string? note { get; init; }
    public string? postal_code { get; init; }
    public string? state_province { get; init; }
    public string? unique_id { get; init; }
    public long? version { get; init; }
}

public record LocationCreateData
{
    public string? address1 { get; init; }
    public string? address2 { get; init; }
    public string? billing_id { get; init; }
    public string? city { get; init; }
    public string? country { get; init; }
    public string? created { get; init; }
    public string? custom_reference { get; init; }
    public string? id { get; init; }
    public string? location_type { get; init; }
    public string? mail_address1 { get; init; }
    public string? mail_address2 { get; init; }
    public string? mail_city { get; init; }
    public string? mail_country { get; init; }
    public string? mail_postal_code { get; init; }
    public string? mail_state_province { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public string? name_of_business { get; init; }
    public string? note { get; init; }
    public string? postal_code { get; init; }
    public string? state_province { get; init; }
    public string? unique_id { get; init; }
    public long? version { get; init; }
}

public record LocationRemoveMatch
{
    public string id { get; init; }
}

public record Partner
{
    public string? billing_id { get; init; }
    public bool? client_can_order_equipment { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public string? id { get; init; }
    public bool? is_active { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public string? partner_id { get; init; }
    public string? reference { get; init; }
    public string? verification_phrase { get; init; }
    public long? version { get; init; }
}

public record PartnerLoadMatch
{
    public string id { get; init; }
}

public record PartnerListMatch
{
    public string? billing_id { get; init; }
    public bool? client_can_order_equipment { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public string? id { get; init; }
    public bool? is_active { get; init; }
    public Dictionary<string, object?>? location { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public string? partner_id { get; init; }
    public string? reference { get; init; }
    public string? verification_phrase { get; init; }
    public long? version { get; init; }
}

public record PartnerCreateData
{
    public string? billing_id { get; init; }
    public bool? client_can_order_equipment { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public string? id { get; init; }
    public bool? is_active { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public string? partner_id { get; init; }
    public string? reference { get; init; }
    public string? verification_phrase { get; init; }
    public long? version { get; init; }
}

public record Shipment
{
    public string? carrier { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? created { get; init; }
    public string? date_received { get; init; }
    public string? date_shipped { get; init; }
    public Dictionary<string, object?>? dc_kif { get; init; }
    public string? id { get; init; }
    public List<object?>? item { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? shipment_type { get; init; }
    public string? tracking { get; init; }
    public long? version { get; init; }
}

public record ShipmentLoadMatch
{
    public string id { get; init; }
}

public record ShipmentListMatch
{
    public string? carrier { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? created { get; init; }
    public string? date_received { get; init; }
    public string? date_shipped { get; init; }
    public Dictionary<string, object?>? dc_kif { get; init; }
    public string? id { get; init; }
    public List<object?>? item { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? shipment_type { get; init; }
    public string? tracking { get; init; }
    public long? version { get; init; }
}

public record ShipmentCreateData
{
    public string? carrier { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? created { get; init; }
    public string? date_received { get; init; }
    public string? date_shipped { get; init; }
    public Dictionary<string, object?>? dc_kif { get; init; }
    public string? id { get; init; }
    public List<object?>? item { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? shipment_type { get; init; }
    public string? tracking { get; init; }
    public long? version { get; init; }
}

public record Success
{
    public bool? success { get; init; }
}

public record SuccessCreateData
{
    public string share_partner_to { get; init; }
}

public record SuccessRemoveMatch
{
    public string share_partner_to { get; init; }
}

public record Transaction
{
    public string? alternate_key { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? client_ref { get; init; }
    public string? created { get; init; }
    public long? decrypted { get; init; }
    public string? device_name { get; init; }
    public Dictionary<string, object?>? direct_partner { get; init; }
    public long? encrypted { get; init; }
    public string? end_date { get; init; }
    public string? err_code { get; init; }
    public string? err_message { get; init; }
    public string? id { get; init; }
    public string? ip_address { get; init; }
    public bool? is_virtual { get; init; }
    public string? key_type { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? message_id { get; init; }
    public string? method { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? reference { get; init; }
    public string? serial_number { get; init; }
    public string? start_date { get; init; }
    public bool? success { get; init; }
    public string? transaction_source { get; init; }
}

public record TransactionLoadMatch
{
    public string id { get; init; }
}

public record TransactionListMatch
{
    public string? alternate_key { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? client_ref { get; init; }
    public string? created { get; init; }
    public long? decrypted { get; init; }
    public string? device_name { get; init; }
    public Dictionary<string, object?>? direct_partner { get; init; }
    public long? encrypted { get; init; }
    public string? end_date { get; init; }
    public string? err_code { get; init; }
    public string? err_message { get; init; }
    public string? id { get; init; }
    public string? ip_address { get; init; }
    public bool? is_virtual { get; init; }
    public string? key_type { get; init; }
    public Dictionary<string, object?>? location { get; init; }
    public string? message_id { get; init; }
    public string? method { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? reference { get; init; }
    public string? serial_number { get; init; }
    public string? start_date { get; init; }
    public bool? success { get; init; }
    public string? transaction_source { get; init; }
}

public record TransactionCreateData
{
    public string? alternate_key { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? client_ref { get; init; }
    public string? created { get; init; }
    public long? decrypted { get; init; }
    public string? device_name { get; init; }
    public Dictionary<string, object?>? direct_partner { get; init; }
    public long? encrypted { get; init; }
    public string? end_date { get; init; }
    public string? err_code { get; init; }
    public string? err_message { get; init; }
    public string? id { get; init; }
    public string? ip_address { get; init; }
    public bool? is_virtual { get; init; }
    public string? key_type { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? message_id { get; init; }
    public string? method { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? reference { get; init; }
    public string? serial_number { get; init; }
    public string? start_date { get; init; }
    public bool? success { get; init; }
    public string? transaction_source { get; init; }
}

public record UpdateResult
{
    public Dictionary<string, object?>? client { get; init; }
    public string? email { get; init; }
    public string? first_name { get; init; }
    public string? id { get; init; }
    public bool? is_active { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? last_name { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? phone { get; init; }
    public string? user_name { get; init; }
    public Dictionary<string, object?>? user_role { get; init; }
    public long? version { get; init; }
}

public record UpdateResultListMatch
{
    public Dictionary<string, object?>? client { get; init; }
    public string? email { get; init; }
    public string? first_name { get; init; }
    public string? id { get; init; }
    public bool? is_active { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? last_name { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? phone { get; init; }
    public string? user_name { get; init; }
    public Dictionary<string, object?>? user_role { get; init; }
    public long? version { get; init; }
}

public record UpdateResultCreateData
{
    public Dictionary<string, object?>? client { get; init; }
    public string? email { get; init; }
    public string? first_name { get; init; }
    public string? id { get; init; }
    public bool? is_active { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? last_name { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? phone { get; init; }
    public string? user_name { get; init; }
    public Dictionary<string, object?>? user_role { get; init; }
    public long? version { get; init; }
}

public record UpdateResultUpdateData
{
    public string id { get; init; }
}

public record User
{
    public Dictionary<string, object?>? client { get; init; }
    public string? created { get; init; }
    public string? email { get; init; }
    public string? first_name { get; init; }
    public string? id { get; init; }
    public bool? is_active { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? last_name { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? phone { get; init; }
    public string? user_name { get; init; }
    public Dictionary<string, object?>? user_role { get; init; }
    public long? version { get; init; }
}

public record UserLoadMatch
{
    public string id { get; init; }
}

public record UserRemoveMatch
{
    public string id { get; init; }
}


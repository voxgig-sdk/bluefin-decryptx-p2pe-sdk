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
    public string? completeDate { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?>? device { get; init; }
    public string? id { get; init; }
    public string? name { get; init; }
    public string? notes { get; init; }
}

public record AttestationLoadMatch
{
    public string id { get; init; }
}

public record AttestationListMatch
{
    public string client { get; init; }
    public long? skip { get; init; }
    public long? take { get; init; }
}

public record AttestationCreateData
{
    public Dictionary<string, object?>? client { get; init; }
    public string? completeDate { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?>? device { get; init; }
    public string? id { get; init; }
    public string? name { get; init; }
    public string? notes { get; init; }
}

public record Client
{
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?>? directPartner { get; init; }
    public string? id { get; init; }
    public bool? isActive { get; init; }
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
    public string partner { get; init; }
    public long? skip { get; init; }
    public long? take { get; init; }
}

public record ClientCreateData
{
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?>? directPartner { get; init; }
    public string? id { get; init; }
    public bool? isActive { get; init; }
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
    public Dictionary<string, object?> activatedBy { get; init; }
    public string? activationDate { get; init; }
    public string? alternateKey { get; init; }
    public string? auditNextDate { get; init; }
    public string? auditNotificationDate { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?> createdBy { get; init; }
    public Dictionary<string, object?>? deviceBuild { get; init; }
    public Dictionary<string, object?>? deviceState { get; init; }
    public Dictionary<string, object?>? deviceType { get; init; }
    public long? errorCounter { get; init; }
    public string? errorLastDate { get; init; }
    public string? id { get; init; }
    public Dictionary<string, object?> initializedBy { get; init; }
    public string? initializedDate { get; init; }
    public Dictionary<string, object?>? injectKey { get; init; }
    public bool? isVirtual { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? lastActivityDate { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?> modifiedBy { get; init; }
    public string? name { get; init; }
    public string? notes { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? serialNumber { get; init; }
    public long? version { get; init; }
}

public record DeviceLoadMatch
{
    public string id { get; init; }
}

public record DeviceListMatch
{
    public string? client { get; init; }
    public string? device_state { get; init; }
    public string? kif { get; init; }
    public string? partner { get; init; }
    public string? serial_number { get; init; }
    public long? skip { get; init; }
    public string? sorting_direction { get; init; }
    public string? sorting_field { get; init; }
    public long? take { get; init; }
}

public record DeviceCreateData
{
    public Dictionary<string, object?> activatedBy { get; init; }
    public string? activationDate { get; init; }
    public string? alternateKey { get; init; }
    public string? auditNextDate { get; init; }
    public string? auditNotificationDate { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?> createdBy { get; init; }
    public Dictionary<string, object?>? deviceBuild { get; init; }
    public Dictionary<string, object?>? deviceState { get; init; }
    public Dictionary<string, object?>? deviceType { get; init; }
    public long? errorCounter { get; init; }
    public string? errorLastDate { get; init; }
    public string? id { get; init; }
    public Dictionary<string, object?> initializedBy { get; init; }
    public string? initializedDate { get; init; }
    public Dictionary<string, object?>? injectKey { get; init; }
    public bool? isVirtual { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? lastActivityDate { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?> modifiedBy { get; init; }
    public string? name { get; init; }
    public string? notes { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? serialNumber { get; init; }
    public long? version { get; init; }
}

public record DeviceBuild
{
    public string? appVersion { get; init; }
    public string? buildNumber { get; init; }
    public string? configFileName { get; init; }
    public string? created { get; init; }
    public string? deviceType { get; init; }
    public string? firmwareVersion { get; init; }
    public string? hardwareVersion { get; init; }
    public long? id { get; init; }
    public bool? isActive { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public string? notes { get; init; }
    public long? version { get; init; }
    public string? whiteListingBinRanges { get; init; }
    public bool? whiteListingUsed { get; init; }
}

public record DeviceBuildLoadMatch
{
    public string id { get; init; }
}

public record DeviceBuildListMatch
{
    public string? device_type { get; init; }
    public long? skip { get; init; }
    public long? take { get; init; }
}

public record DeviceCustodyDetail
{
    public string? completeDate { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?> createdBy { get; init; }
    public Dictionary<string, object?> custodian { get; init; }
    public Dictionary<string, object?>? device { get; init; }
    public long? id { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?> modifiedBy { get; init; }
    public string? notes { get; init; }
    public Dictionary<string, object?>? status { get; init; }
    public Dictionary<string, object?>? transferMethod { get; init; }
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
    public string? completeDate { get; init; }
    public string? created { get; init; }
    public Dictionary<string, object?> createdBy { get; init; }
    public Dictionary<string, object?> custodian { get; init; }
    public Dictionary<string, object?>? device { get; init; }
    public long? id { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?> modifiedBy { get; init; }
    public string? notes { get; init; }
    public Dictionary<string, object?>? status { get; init; }
    public Dictionary<string, object?>? transferMethod { get; init; }
    public long? version { get; init; }
}

public record DeviceCustodyListListMatch
{
    public string device_type { get; init; }
    public string serial_number { get; init; }
    public long? skip { get; init; }
    public long? take { get; init; }
}

public record DeviceList
{
    public List<object?>? data { get; init; }
    public long? total { get; init; }
}

public record DeviceListLoadMatch
{
    public string share_partner_to { get; init; }
    public long? skip { get; init; }
    public string? sorting_direction { get; init; }
    public string? sorting_field { get; init; }
    public long? take { get; init; }
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
    public string? deviceTypeMode { get; init; }
    public string? hardwareVersion { get; init; }
    public string? id { get; init; }
    public bool? isActive { get; init; }
    public string? manufacturer { get; init; }
    public string? model { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public string? photoUrl { get; init; }
    public string? productName { get; init; }
    public long? version { get; init; }
}

public record DeviceTypeLoadMatch
{
    public string id { get; init; }
}

public record DeviceTypeListMatch
{
    public string? created { get; init; }
    public string? deviceTypeMode { get; init; }
    public string? hardwareVersion { get; init; }
    public string? id { get; init; }
    public bool? isActive { get; init; }
    public string? manufacturer { get; init; }
    public string? model { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public string? photoUrl { get; init; }
    public string? productName { get; init; }
    public long? version { get; init; }
}

public record InjectKey
{
    public string? created { get; init; }
    public string? id { get; init; }
    public bool? isActive { get; init; }
    public bool? isP2PE { get; init; }
    public string? keyType { get; init; }
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
    public bool? isActive { get; init; }
    public bool? isP2PE { get; init; }
    public string? keyType { get; init; }
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
    public string? billingId { get; init; }
    public string? city { get; init; }
    public string? country { get; init; }
    public string? created { get; init; }
    public string? customReference { get; init; }
    public string? id { get; init; }
    public string? locationType { get; init; }
    public string? mailAddress1 { get; init; }
    public string? mailAddress2 { get; init; }
    public string? mailCity { get; init; }
    public string? mailCountry { get; init; }
    public string? mailPostalCode { get; init; }
    public string? mailStateProvince { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public string? nameOfBusiness { get; init; }
    public string? notes { get; init; }
    public string? postalCode { get; init; }
    public string? stateProvince { get; init; }
    public string? uniqueId { get; init; }
    public long? version { get; init; }
}

public record LocationLoadMatch
{
    public string id { get; init; }
}

public record LocationListMatch
{
    public string client { get; init; }
    public long? skip { get; init; }
    public long? take { get; init; }
}

public record LocationCreateData
{
    public string? address1 { get; init; }
    public string? address2 { get; init; }
    public string? billingId { get; init; }
    public string? city { get; init; }
    public string? country { get; init; }
    public string? created { get; init; }
    public string? customReference { get; init; }
    public string? id { get; init; }
    public string? locationType { get; init; }
    public string? mailAddress1 { get; init; }
    public string? mailAddress2 { get; init; }
    public string? mailCity { get; init; }
    public string? mailCountry { get; init; }
    public string? mailPostalCode { get; init; }
    public string? mailStateProvince { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public string? nameOfBusiness { get; init; }
    public string? notes { get; init; }
    public string? postalCode { get; init; }
    public string? stateProvince { get; init; }
    public string? uniqueId { get; init; }
    public long? version { get; init; }
}

public record LocationRemoveMatch
{
    public string id { get; init; }
}

public record Partner
{
    public string? billingId { get; init; }
    public bool? clientCanOrderEquipment { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public string? id { get; init; }
    public bool? isActive { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public string? partnerId { get; init; }
    public string? reference { get; init; }
    public string? verificationPhrase { get; init; }
    public long? version { get; init; }
}

public record PartnerLoadMatch
{
    public string id { get; init; }
}

public record PartnerListMatch
{
    public string? partner { get; init; }
    public long? skip { get; init; }
    public long? take { get; init; }
}

public record PartnerCreateData
{
    public string? billingId { get; init; }
    public bool? clientCanOrderEquipment { get; init; }
    public Dictionary<string, object?>? contact { get; init; }
    public string? created { get; init; }
    public string? id { get; init; }
    public bool? isActive { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? modified { get; init; }
    public string? name { get; init; }
    public Dictionary<string, object?>? parent { get; init; }
    public string? partnerId { get; init; }
    public string? reference { get; init; }
    public string? verificationPhrase { get; init; }
    public long? version { get; init; }
}

public record Shipment
{
    public string? carrier { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? created { get; init; }
    public string? dateReceived { get; init; }
    public string? dateShipped { get; init; }
    public Dictionary<string, object?>? dcKif { get; init; }
    public string? id { get; init; }
    public List<object?>? items { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? shipmentType { get; init; }
    public string? tracking { get; init; }
    public long? version { get; init; }
}

public record ShipmentLoadMatch
{
    public string id { get; init; }
}

public record ShipmentListMatch
{
    public string kif { get; init; }
    public string? mode { get; init; }
    public long? skip { get; init; }
    public long? take { get; init; }
}

public record ShipmentCreateData
{
    public string? carrier { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? created { get; init; }
    public string? dateReceived { get; init; }
    public string? dateShipped { get; init; }
    public Dictionary<string, object?>? dcKif { get; init; }
    public string? id { get; init; }
    public List<object?>? items { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? shipmentType { get; init; }
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
    public bool? success { get; init; }
}

public record SuccessRemoveMatch
{
    public string share_partner_to { get; init; }
}

public record Transaction
{
    public string? alternateKey { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? clientRef { get; init; }
    public string? created { get; init; }
    public long? decrypted { get; init; }
    public string? deviceName { get; init; }
    public Dictionary<string, object?>? directPartner { get; init; }
    public long? encrypted { get; init; }
    public string? endDate { get; init; }
    public string? errCode { get; init; }
    public string? errMessage { get; init; }
    public string? id { get; init; }
    public string? ipAddress { get; init; }
    public bool? isVirtual { get; init; }
    public string? keyType { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? messageId { get; init; }
    public string? method { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? reference { get; init; }
    public string? serialNumber { get; init; }
    public string? startDate { get; init; }
    public bool? success { get; init; }
    public string? transactionSource { get; init; }
}

public record TransactionLoadMatch
{
    public string id { get; init; }
}

public record TransactionListMatch
{
    public string? client { get; init; }
    public string? client_ref { get; init; }
    public string? date_from { get; init; }
    public string? date_to { get; init; }
    public string? location { get; init; }
    public string? message_id { get; init; }
    public string? paging_mode { get; init; }
    public string? partner { get; init; }
    public string? reference { get; init; }
    public string? serial_number { get; init; }
    public long? skip { get; init; }
    public bool? success { get; init; }
    public long? take { get; init; }
}

public record TransactionCreateData
{
    public string? alternateKey { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? clientRef { get; init; }
    public string? created { get; init; }
    public long? decrypted { get; init; }
    public string? deviceName { get; init; }
    public Dictionary<string, object?>? directPartner { get; init; }
    public long? encrypted { get; init; }
    public string? endDate { get; init; }
    public string? errCode { get; init; }
    public string? errMessage { get; init; }
    public string? id { get; init; }
    public string? ipAddress { get; init; }
    public bool? isVirtual { get; init; }
    public string? keyType { get; init; }
    public Dictionary<string, object?> location { get; init; }
    public string? messageId { get; init; }
    public string? method { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? reference { get; init; }
    public string? serialNumber { get; init; }
    public string? startDate { get; init; }
    public bool? success { get; init; }
    public string? transactionSource { get; init; }
}

public record UpdateResult
{
    public Dictionary<string, object?>? client { get; init; }
    public string? email { get; init; }
    public string? firstName { get; init; }
    public string? id { get; init; }
    public bool? isActive { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? lastName { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? phone { get; init; }
    public string? userName { get; init; }
    public Dictionary<string, object?>? userRole { get; init; }
    public long? version { get; init; }
}

public record UpdateResultListMatch
{
    public string? client { get; init; }
    public string? kif { get; init; }
    public object? partner { get; init; }
    public long? skip { get; init; }
    public long? take { get; init; }
}

public record UpdateResultCreateData
{
    public Dictionary<string, object?>? client { get; init; }
    public string? email { get; init; }
    public string? firstName { get; init; }
    public string? id { get; init; }
    public bool? isActive { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? lastName { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? phone { get; init; }
    public string? userName { get; init; }
    public Dictionary<string, object?>? userRole { get; init; }
    public long? version { get; init; }
}

public record UpdateResultUpdateData
{
    public string id { get; init; }
    public Dictionary<string, object?>? client { get; init; }
    public string? email { get; init; }
    public string? firstName { get; init; }
    public bool? isActive { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? lastName { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? phone { get; init; }
    public string? userName { get; init; }
    public Dictionary<string, object?>? userRole { get; init; }
    public long? version { get; init; }
}

public record User
{
    public Dictionary<string, object?>? client { get; init; }
    public string? created { get; init; }
    public string? email { get; init; }
    public string? firstName { get; init; }
    public string? id { get; init; }
    public bool? isActive { get; init; }
    public Dictionary<string, object?>? kif { get; init; }
    public string? lastName { get; init; }
    public string? modified { get; init; }
    public Dictionary<string, object?>? partner { get; init; }
    public string? phone { get; init; }
    public string? userName { get; init; }
    public Dictionary<string, object?>? userRole { get; init; }
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


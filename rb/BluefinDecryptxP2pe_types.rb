# frozen_string_literal: true

# Typed models for the BluefinDecryptxP2pe SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Attestation entity data model.
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] completeDate
#   @return [String, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] device
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] notes
#   @return [String, nil]
Attestation = Struct.new(
  :client,
  :completeDate,
  :created,
  :device,
  :id,
  :name,
  :notes,
  keyword_init: true
)

# Request payload for Attestation#load.
#
# @!attribute [rw] id
#   @return [String]
AttestationLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Attestation#list.
#
# @!attribute [rw] client
#   @return [String]
#
# @!attribute [rw] skip
#   @return [Integer, nil]
#
# @!attribute [rw] take
#   @return [Integer, nil]
AttestationListMatch = Struct.new(
  :client,
  :skip,
  :take,
  keyword_init: true
)

# Request payload for Attestation#create.
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] completeDate
#   @return [String, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] device
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] notes
#   @return [String, nil]
AttestationCreateData = Struct.new(
  :client,
  :completeDate,
  :created,
  :device,
  :id,
  :name,
  :notes,
  keyword_init: true
)

# Client entity data model.
#
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] directPartner
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] location
#   @return [Hash]
#
# @!attribute [rw] mid
#   @return [String, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
Client = Struct.new(
  :contact,
  :created,
  :directPartner,
  :id,
  :isActive,
  :location,
  :mid,
  :modified,
  :name,
  :partner,
  :version,
  keyword_init: true
)

# Request payload for Client#load.
#
# @!attribute [rw] id
#   @return [String]
ClientLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Client#list.
#
# @!attribute [rw] partner
#   @return [String]
#
# @!attribute [rw] skip
#   @return [Integer, nil]
#
# @!attribute [rw] take
#   @return [Integer, nil]
ClientListMatch = Struct.new(
  :partner,
  :skip,
  :take,
  keyword_init: true
)

# Request payload for Client#create.
#
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] directPartner
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] location
#   @return [Hash]
#
# @!attribute [rw] mid
#   @return [String, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
ClientCreateData = Struct.new(
  :contact,
  :created,
  :directPartner,
  :id,
  :isActive,
  :location,
  :mid,
  :modified,
  :name,
  :partner,
  :version,
  keyword_init: true
)

# Request payload for Client#remove.
#
# @!attribute [rw] id
#   @return [String]
ClientRemoveMatch = Struct.new(
  :id,
  keyword_init: true
)

# CreateResult entity data model.
class CreateResult
end

# Request payload for CreateResult#create.
#
# @!attribute [rw] device_type
#   @return [String]
#
# @!attribute [rw] serial_number
#   @return [String]
CreateResultCreateData = Struct.new(
  :device_type,
  :serial_number,
  keyword_init: true
)

# Decryption entity data model.
#
# @!attribute [rw] success
#   @return [Boolean, nil]
Decryption = Struct.new(
  :success,
  keyword_init: true
)

# Request payload for Decryption#create.
#
# @!attribute [rw] success
#   @return [Boolean, nil]
DecryptionCreateData = Struct.new(
  :success,
  keyword_init: true
)

# Device entity data model.
#
# @!attribute [rw] activatedBy
#   @return [Hash]
#
# @!attribute [rw] activationDate
#   @return [String, nil]
#
# @!attribute [rw] alternateKey
#   @return [String, nil]
#
# @!attribute [rw] auditNextDate
#   @return [String, nil]
#
# @!attribute [rw] auditNotificationDate
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] createdBy
#   @return [Hash]
#
# @!attribute [rw] deviceBuild
#   @return [Hash, nil]
#
# @!attribute [rw] deviceState
#   @return [Hash, nil]
#
# @!attribute [rw] deviceType
#   @return [Hash, nil]
#
# @!attribute [rw] errorCounter
#   @return [Integer, nil]
#
# @!attribute [rw] errorLastDate
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] initializedBy
#   @return [Hash]
#
# @!attribute [rw] initializedDate
#   @return [String, nil]
#
# @!attribute [rw] injectKey
#   @return [Hash, nil]
#
# @!attribute [rw] isVirtual
#   @return [Boolean, nil]
#
# @!attribute [rw] kif
#   @return [Hash, nil]
#
# @!attribute [rw] lastActivityDate
#   @return [String, nil]
#
# @!attribute [rw] location
#   @return [Hash]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] modifiedBy
#   @return [Hash]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] notes
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] serialNumber
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
Device = Struct.new(
  :activatedBy,
  :activationDate,
  :alternateKey,
  :auditNextDate,
  :auditNotificationDate,
  :client,
  :created,
  :createdBy,
  :deviceBuild,
  :deviceState,
  :deviceType,
  :errorCounter,
  :errorLastDate,
  :id,
  :initializedBy,
  :initializedDate,
  :injectKey,
  :isVirtual,
  :kif,
  :lastActivityDate,
  :location,
  :modified,
  :modifiedBy,
  :name,
  :notes,
  :partner,
  :serialNumber,
  :version,
  keyword_init: true
)

# Request payload for Device#load.
#
# @!attribute [rw] id
#   @return [String]
DeviceLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Device#list.
#
# @!attribute [rw] client
#   @return [String, nil]
#
# @!attribute [rw] device_state
#   @return [String, nil]
#
# @!attribute [rw] kif
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [String, nil]
#
# @!attribute [rw] serial_number
#   @return [String, nil]
#
# @!attribute [rw] skip
#   @return [Integer, nil]
#
# @!attribute [rw] sorting_direction
#   @return [String, nil]
#
# @!attribute [rw] sorting_field
#   @return [String, nil]
#
# @!attribute [rw] take
#   @return [Integer, nil]
DeviceListMatch = Struct.new(
  :client,
  :device_state,
  :kif,
  :partner,
  :serial_number,
  :skip,
  :sorting_direction,
  :sorting_field,
  :take,
  keyword_init: true
)

# Request payload for Device#create.
#
# @!attribute [rw] activatedBy
#   @return [Hash]
#
# @!attribute [rw] activationDate
#   @return [String, nil]
#
# @!attribute [rw] alternateKey
#   @return [String, nil]
#
# @!attribute [rw] auditNextDate
#   @return [String, nil]
#
# @!attribute [rw] auditNotificationDate
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] createdBy
#   @return [Hash]
#
# @!attribute [rw] deviceBuild
#   @return [Hash, nil]
#
# @!attribute [rw] deviceState
#   @return [Hash, nil]
#
# @!attribute [rw] deviceType
#   @return [Hash, nil]
#
# @!attribute [rw] errorCounter
#   @return [Integer, nil]
#
# @!attribute [rw] errorLastDate
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] initializedBy
#   @return [Hash]
#
# @!attribute [rw] initializedDate
#   @return [String, nil]
#
# @!attribute [rw] injectKey
#   @return [Hash, nil]
#
# @!attribute [rw] isVirtual
#   @return [Boolean, nil]
#
# @!attribute [rw] kif
#   @return [Hash, nil]
#
# @!attribute [rw] lastActivityDate
#   @return [String, nil]
#
# @!attribute [rw] location
#   @return [Hash]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] modifiedBy
#   @return [Hash]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] notes
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] serialNumber
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
DeviceCreateData = Struct.new(
  :activatedBy,
  :activationDate,
  :alternateKey,
  :auditNextDate,
  :auditNotificationDate,
  :client,
  :created,
  :createdBy,
  :deviceBuild,
  :deviceState,
  :deviceType,
  :errorCounter,
  :errorLastDate,
  :id,
  :initializedBy,
  :initializedDate,
  :injectKey,
  :isVirtual,
  :kif,
  :lastActivityDate,
  :location,
  :modified,
  :modifiedBy,
  :name,
  :notes,
  :partner,
  :serialNumber,
  :version,
  keyword_init: true
)

# DeviceBuild entity data model.
#
# @!attribute [rw] appVersion
#   @return [String, nil]
#
# @!attribute [rw] buildNumber
#   @return [String, nil]
#
# @!attribute [rw] configFileName
#   @return [String, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] deviceType
#   @return [String, nil]
#
# @!attribute [rw] firmwareVersion
#   @return [String, nil]
#
# @!attribute [rw] hardwareVersion
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] notes
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
#
# @!attribute [rw] whiteListingBinRanges
#   @return [String, nil]
#
# @!attribute [rw] whiteListingUsed
#   @return [Boolean, nil]
DeviceBuild = Struct.new(
  :appVersion,
  :buildNumber,
  :configFileName,
  :created,
  :deviceType,
  :firmwareVersion,
  :hardwareVersion,
  :id,
  :isActive,
  :modified,
  :name,
  :notes,
  :version,
  :whiteListingBinRanges,
  :whiteListingUsed,
  keyword_init: true
)

# Request payload for DeviceBuild#load.
#
# @!attribute [rw] id
#   @return [String]
DeviceBuildLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for DeviceBuild#list.
#
# @!attribute [rw] device_type
#   @return [String, nil]
#
# @!attribute [rw] skip
#   @return [Integer, nil]
#
# @!attribute [rw] take
#   @return [Integer, nil]
DeviceBuildListMatch = Struct.new(
  :device_type,
  :skip,
  :take,
  keyword_init: true
)

# DeviceCustodyDetail entity data model.
#
# @!attribute [rw] completeDate
#   @return [String, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] createdBy
#   @return [Hash]
#
# @!attribute [rw] custodian
#   @return [Hash]
#
# @!attribute [rw] device
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] location
#   @return [Hash]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] modifiedBy
#   @return [Hash]
#
# @!attribute [rw] notes
#   @return [String, nil]
#
# @!attribute [rw] status
#   @return [Hash, nil]
#
# @!attribute [rw] transferMethod
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
DeviceCustodyDetail = Struct.new(
  :completeDate,
  :created,
  :createdBy,
  :custodian,
  :device,
  :id,
  :location,
  :modified,
  :modifiedBy,
  :notes,
  :status,
  :transferMethod,
  :version,
  keyword_init: true
)

# Request payload for DeviceCustodyDetail#load.
#
# @!attribute [rw] device_type
#   @return [String]
#
# @!attribute [rw] id
#   @return [String]
#
# @!attribute [rw] serial_number
#   @return [String]
DeviceCustodyDetailLoadMatch = Struct.new(
  :device_type,
  :id,
  :serial_number,
  keyword_init: true
)

# DeviceCustodyList entity data model.
#
# @!attribute [rw] completeDate
#   @return [String, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] createdBy
#   @return [Hash]
#
# @!attribute [rw] custodian
#   @return [Hash]
#
# @!attribute [rw] device
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] location
#   @return [Hash]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] modifiedBy
#   @return [Hash]
#
# @!attribute [rw] notes
#   @return [String, nil]
#
# @!attribute [rw] status
#   @return [Hash, nil]
#
# @!attribute [rw] transferMethod
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
DeviceCustodyList = Struct.new(
  :completeDate,
  :created,
  :createdBy,
  :custodian,
  :device,
  :id,
  :location,
  :modified,
  :modifiedBy,
  :notes,
  :status,
  :transferMethod,
  :version,
  keyword_init: true
)

# Request payload for DeviceCustodyList#list.
#
# @!attribute [rw] device_type
#   @return [String]
#
# @!attribute [rw] serial_number
#   @return [String]
#
# @!attribute [rw] skip
#   @return [Integer, nil]
#
# @!attribute [rw] take
#   @return [Integer, nil]
DeviceCustodyListListMatch = Struct.new(
  :device_type,
  :serial_number,
  :skip,
  :take,
  keyword_init: true
)

# DeviceList entity data model.
#
# @!attribute [rw] data
#   @return [Array, nil]
#
# @!attribute [rw] total
#   @return [Integer, nil]
DeviceList = Struct.new(
  :data,
  :total,
  keyword_init: true
)

# Request payload for DeviceList#load.
#
# @!attribute [rw] share_partner_to
#   @return [String]
#
# @!attribute [rw] skip
#   @return [Integer, nil]
#
# @!attribute [rw] sorting_direction
#   @return [String, nil]
#
# @!attribute [rw] sorting_field
#   @return [String, nil]
#
# @!attribute [rw] take
#   @return [Integer, nil]
DeviceListLoadMatch = Struct.new(
  :share_partner_to,
  :skip,
  :sorting_direction,
  :sorting_field,
  :take,
  keyword_init: true
)

# DeviceReceiveResult entity data model.
#
# @!attribute [rw] success
#   @return [Boolean]
DeviceReceiveResult = Struct.new(
  :success,
  keyword_init: true
)

# Request payload for DeviceReceiveResult#create.
#
# @!attribute [rw] success
#   @return [Boolean]
DeviceReceiveResultCreateData = Struct.new(
  :success,
  keyword_init: true
)

# DeviceRkiActivateResult entity data model.
#
# @!attribute [rw] success
#   @return [Boolean]
DeviceRkiActivateResult = Struct.new(
  :success,
  keyword_init: true
)

# Request payload for DeviceRkiActivateResult#create.
#
# @!attribute [rw] success
#   @return [Boolean]
DeviceRkiActivateResultCreateData = Struct.new(
  :success,
  keyword_init: true
)

# DeviceState entity data model.
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
DeviceState = Struct.new(
  :id,
  :name,
  keyword_init: true
)

# Request payload for DeviceState#list.
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
DeviceStateListMatch = Struct.new(
  :id,
  :name,
  keyword_init: true
)

# DeviceType entity data model.
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] deviceTypeMode
#   @return [String, nil]
#
# @!attribute [rw] hardwareVersion
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] manufacturer
#   @return [String, nil]
#
# @!attribute [rw] model
#   @return [String, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] photoUrl
#   @return [String, nil]
#
# @!attribute [rw] productName
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
DeviceType = Struct.new(
  :created,
  :deviceTypeMode,
  :hardwareVersion,
  :id,
  :isActive,
  :manufacturer,
  :model,
  :modified,
  :name,
  :photoUrl,
  :productName,
  :version,
  keyword_init: true
)

# Request payload for DeviceType#load.
#
# @!attribute [rw] id
#   @return [String]
DeviceTypeLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for DeviceType#list.
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] deviceTypeMode
#   @return [String, nil]
#
# @!attribute [rw] hardwareVersion
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] manufacturer
#   @return [String, nil]
#
# @!attribute [rw] model
#   @return [String, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] photoUrl
#   @return [String, nil]
#
# @!attribute [rw] productName
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
DeviceTypeListMatch = Struct.new(
  :created,
  :deviceTypeMode,
  :hardwareVersion,
  :id,
  :isActive,
  :manufacturer,
  :model,
  :modified,
  :name,
  :photoUrl,
  :productName,
  :version,
  keyword_init: true
)

# InjectKey entity data model.
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] isP2PE
#   @return [Boolean, nil]
#
# @!attribute [rw] keyType
#   @return [String, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
InjectKey = Struct.new(
  :created,
  :id,
  :isActive,
  :isP2PE,
  :keyType,
  :modified,
  :name,
  :version,
  keyword_init: true
)

# Request payload for InjectKey#load.
#
# @!attribute [rw] id
#   @return [String]
InjectKeyLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for InjectKey#list.
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] isP2PE
#   @return [Boolean, nil]
#
# @!attribute [rw] keyType
#   @return [String, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
InjectKeyListMatch = Struct.new(
  :created,
  :id,
  :isActive,
  :isP2PE,
  :keyType,
  :modified,
  :name,
  :version,
  keyword_init: true
)

# Kif entity data model.
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
Kif = Struct.new(
  :id,
  :name,
  keyword_init: true
)

# Request payload for Kif#list.
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
KifListMatch = Struct.new(
  :id,
  :name,
  keyword_init: true
)

# Location entity data model.
#
# @!attribute [rw] address1
#   @return [String, nil]
#
# @!attribute [rw] address2
#   @return [String, nil]
#
# @!attribute [rw] billingId
#   @return [String, nil]
#
# @!attribute [rw] city
#   @return [String, nil]
#
# @!attribute [rw] country
#   @return [String, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] customReference
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] locationType
#   @return [String, nil]
#
# @!attribute [rw] mailAddress1
#   @return [String, nil]
#
# @!attribute [rw] mailAddress2
#   @return [String, nil]
#
# @!attribute [rw] mailCity
#   @return [String, nil]
#
# @!attribute [rw] mailCountry
#   @return [String, nil]
#
# @!attribute [rw] mailPostalCode
#   @return [String, nil]
#
# @!attribute [rw] mailStateProvince
#   @return [String, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] nameOfBusiness
#   @return [String, nil]
#
# @!attribute [rw] notes
#   @return [String, nil]
#
# @!attribute [rw] postalCode
#   @return [String, nil]
#
# @!attribute [rw] stateProvince
#   @return [String, nil]
#
# @!attribute [rw] uniqueId
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
Location = Struct.new(
  :address1,
  :address2,
  :billingId,
  :city,
  :country,
  :created,
  :customReference,
  :id,
  :locationType,
  :mailAddress1,
  :mailAddress2,
  :mailCity,
  :mailCountry,
  :mailPostalCode,
  :mailStateProvince,
  :modified,
  :name,
  :nameOfBusiness,
  :notes,
  :postalCode,
  :stateProvince,
  :uniqueId,
  :version,
  keyword_init: true
)

# Request payload for Location#load.
#
# @!attribute [rw] id
#   @return [String]
LocationLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Location#list.
#
# @!attribute [rw] client
#   @return [String]
#
# @!attribute [rw] skip
#   @return [Integer, nil]
#
# @!attribute [rw] take
#   @return [Integer, nil]
LocationListMatch = Struct.new(
  :client,
  :skip,
  :take,
  keyword_init: true
)

# Request payload for Location#create.
#
# @!attribute [rw] address1
#   @return [String, nil]
#
# @!attribute [rw] address2
#   @return [String, nil]
#
# @!attribute [rw] billingId
#   @return [String, nil]
#
# @!attribute [rw] city
#   @return [String, nil]
#
# @!attribute [rw] country
#   @return [String, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] customReference
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] locationType
#   @return [String, nil]
#
# @!attribute [rw] mailAddress1
#   @return [String, nil]
#
# @!attribute [rw] mailAddress2
#   @return [String, nil]
#
# @!attribute [rw] mailCity
#   @return [String, nil]
#
# @!attribute [rw] mailCountry
#   @return [String, nil]
#
# @!attribute [rw] mailPostalCode
#   @return [String, nil]
#
# @!attribute [rw] mailStateProvince
#   @return [String, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] nameOfBusiness
#   @return [String, nil]
#
# @!attribute [rw] notes
#   @return [String, nil]
#
# @!attribute [rw] postalCode
#   @return [String, nil]
#
# @!attribute [rw] stateProvince
#   @return [String, nil]
#
# @!attribute [rw] uniqueId
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
LocationCreateData = Struct.new(
  :address1,
  :address2,
  :billingId,
  :city,
  :country,
  :created,
  :customReference,
  :id,
  :locationType,
  :mailAddress1,
  :mailAddress2,
  :mailCity,
  :mailCountry,
  :mailPostalCode,
  :mailStateProvince,
  :modified,
  :name,
  :nameOfBusiness,
  :notes,
  :postalCode,
  :stateProvince,
  :uniqueId,
  :version,
  keyword_init: true
)

# Request payload for Location#remove.
#
# @!attribute [rw] id
#   @return [String]
LocationRemoveMatch = Struct.new(
  :id,
  keyword_init: true
)

# Partner entity data model.
#
# @!attribute [rw] billingId
#   @return [String, nil]
#
# @!attribute [rw] clientCanOrderEquipment
#   @return [Boolean, nil]
#
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] location
#   @return [Hash]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] parent
#   @return [Hash, nil]
#
# @!attribute [rw] partnerId
#   @return [String, nil]
#
# @!attribute [rw] reference
#   @return [String, nil]
#
# @!attribute [rw] verificationPhrase
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
Partner = Struct.new(
  :billingId,
  :clientCanOrderEquipment,
  :contact,
  :created,
  :id,
  :isActive,
  :location,
  :modified,
  :name,
  :parent,
  :partnerId,
  :reference,
  :verificationPhrase,
  :version,
  keyword_init: true
)

# Request payload for Partner#load.
#
# @!attribute [rw] id
#   @return [String]
PartnerLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Partner#list.
#
# @!attribute [rw] partner
#   @return [String, nil]
#
# @!attribute [rw] skip
#   @return [Integer, nil]
#
# @!attribute [rw] take
#   @return [Integer, nil]
PartnerListMatch = Struct.new(
  :partner,
  :skip,
  :take,
  keyword_init: true
)

# Request payload for Partner#create.
#
# @!attribute [rw] billingId
#   @return [String, nil]
#
# @!attribute [rw] clientCanOrderEquipment
#   @return [Boolean, nil]
#
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] location
#   @return [Hash]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] parent
#   @return [Hash, nil]
#
# @!attribute [rw] partnerId
#   @return [String, nil]
#
# @!attribute [rw] reference
#   @return [String, nil]
#
# @!attribute [rw] verificationPhrase
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
PartnerCreateData = Struct.new(
  :billingId,
  :clientCanOrderEquipment,
  :contact,
  :created,
  :id,
  :isActive,
  :location,
  :modified,
  :name,
  :parent,
  :partnerId,
  :reference,
  :verificationPhrase,
  :version,
  keyword_init: true
)

# Shipment entity data model.
#
# @!attribute [rw] carrier
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] dateReceived
#   @return [String, nil]
#
# @!attribute [rw] dateShipped
#   @return [String, nil]
#
# @!attribute [rw] dcKif
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] items
#   @return [Array, nil]
#
# @!attribute [rw] kif
#   @return [Hash, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] shipmentType
#   @return [String, nil]
#
# @!attribute [rw] tracking
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
Shipment = Struct.new(
  :carrier,
  :client,
  :created,
  :dateReceived,
  :dateShipped,
  :dcKif,
  :id,
  :items,
  :kif,
  :modified,
  :partner,
  :shipmentType,
  :tracking,
  :version,
  keyword_init: true
)

# Request payload for Shipment#load.
#
# @!attribute [rw] id
#   @return [String]
ShipmentLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Shipment#list.
#
# @!attribute [rw] kif
#   @return [String]
#
# @!attribute [rw] mode
#   @return [String, nil]
#
# @!attribute [rw] skip
#   @return [Integer, nil]
#
# @!attribute [rw] take
#   @return [Integer, nil]
ShipmentListMatch = Struct.new(
  :kif,
  :mode,
  :skip,
  :take,
  keyword_init: true
)

# Request payload for Shipment#create.
#
# @!attribute [rw] carrier
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] dateReceived
#   @return [String, nil]
#
# @!attribute [rw] dateShipped
#   @return [String, nil]
#
# @!attribute [rw] dcKif
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] items
#   @return [Array, nil]
#
# @!attribute [rw] kif
#   @return [Hash, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] shipmentType
#   @return [String, nil]
#
# @!attribute [rw] tracking
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
ShipmentCreateData = Struct.new(
  :carrier,
  :client,
  :created,
  :dateReceived,
  :dateShipped,
  :dcKif,
  :id,
  :items,
  :kif,
  :modified,
  :partner,
  :shipmentType,
  :tracking,
  :version,
  keyword_init: true
)

# Success entity data model.
#
# @!attribute [rw] success
#   @return [Boolean, nil]
Success = Struct.new(
  :success,
  keyword_init: true
)

# Request payload for Success#create.
#
# @!attribute [rw] share_partner_to
#   @return [String]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
SuccessCreateData = Struct.new(
  :share_partner_to,
  :success,
  keyword_init: true
)

# Request payload for Success#remove.
#
# @!attribute [rw] share_partner_to
#   @return [String]
SuccessRemoveMatch = Struct.new(
  :share_partner_to,
  keyword_init: true
)

# Transaction entity data model.
#
# @!attribute [rw] alternateKey
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] clientRef
#   @return [String, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] decrypted
#   @return [Integer, nil]
#
# @!attribute [rw] deviceName
#   @return [String, nil]
#
# @!attribute [rw] directPartner
#   @return [Hash, nil]
#
# @!attribute [rw] encrypted
#   @return [Integer, nil]
#
# @!attribute [rw] endDate
#   @return [String, nil]
#
# @!attribute [rw] errCode
#   @return [String, nil]
#
# @!attribute [rw] errMessage
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] ipAddress
#   @return [String, nil]
#
# @!attribute [rw] isVirtual
#   @return [Boolean, nil]
#
# @!attribute [rw] keyType
#   @return [String, nil]
#
# @!attribute [rw] location
#   @return [Hash]
#
# @!attribute [rw] messageId
#   @return [String, nil]
#
# @!attribute [rw] method
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] reference
#   @return [String, nil]
#
# @!attribute [rw] serialNumber
#   @return [String, nil]
#
# @!attribute [rw] startDate
#   @return [String, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] transactionSource
#   @return [String, nil]
Transaction = Struct.new(
  :alternateKey,
  :client,
  :clientRef,
  :created,
  :decrypted,
  :deviceName,
  :directPartner,
  :encrypted,
  :endDate,
  :errCode,
  :errMessage,
  :id,
  :ipAddress,
  :isVirtual,
  :keyType,
  :location,
  :messageId,
  :method,
  :partner,
  :reference,
  :serialNumber,
  :startDate,
  :success,
  :transactionSource,
  keyword_init: true
)

# Request payload for Transaction#load.
#
# @!attribute [rw] id
#   @return [String]
TransactionLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Transaction#list.
#
# @!attribute [rw] client
#   @return [String, nil]
#
# @!attribute [rw] client_ref
#   @return [String, nil]
#
# @!attribute [rw] date_from
#   @return [String, nil]
#
# @!attribute [rw] date_to
#   @return [String, nil]
#
# @!attribute [rw] location
#   @return [String, nil]
#
# @!attribute [rw] message_id
#   @return [String, nil]
#
# @!attribute [rw] paging_mode
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [String, nil]
#
# @!attribute [rw] reference
#   @return [String, nil]
#
# @!attribute [rw] serial_number
#   @return [String, nil]
#
# @!attribute [rw] skip
#   @return [Integer, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] take
#   @return [Integer, nil]
TransactionListMatch = Struct.new(
  :client,
  :client_ref,
  :date_from,
  :date_to,
  :location,
  :message_id,
  :paging_mode,
  :partner,
  :reference,
  :serial_number,
  :skip,
  :success,
  :take,
  keyword_init: true
)

# Request payload for Transaction#create.
#
# @!attribute [rw] alternateKey
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] clientRef
#   @return [String, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] decrypted
#   @return [Integer, nil]
#
# @!attribute [rw] deviceName
#   @return [String, nil]
#
# @!attribute [rw] directPartner
#   @return [Hash, nil]
#
# @!attribute [rw] encrypted
#   @return [Integer, nil]
#
# @!attribute [rw] endDate
#   @return [String, nil]
#
# @!attribute [rw] errCode
#   @return [String, nil]
#
# @!attribute [rw] errMessage
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] ipAddress
#   @return [String, nil]
#
# @!attribute [rw] isVirtual
#   @return [Boolean, nil]
#
# @!attribute [rw] keyType
#   @return [String, nil]
#
# @!attribute [rw] location
#   @return [Hash]
#
# @!attribute [rw] messageId
#   @return [String, nil]
#
# @!attribute [rw] method
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] reference
#   @return [String, nil]
#
# @!attribute [rw] serialNumber
#   @return [String, nil]
#
# @!attribute [rw] startDate
#   @return [String, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] transactionSource
#   @return [String, nil]
TransactionCreateData = Struct.new(
  :alternateKey,
  :client,
  :clientRef,
  :created,
  :decrypted,
  :deviceName,
  :directPartner,
  :encrypted,
  :endDate,
  :errCode,
  :errMessage,
  :id,
  :ipAddress,
  :isVirtual,
  :keyType,
  :location,
  :messageId,
  :method,
  :partner,
  :reference,
  :serialNumber,
  :startDate,
  :success,
  :transactionSource,
  keyword_init: true
)

# UpdateResult entity data model.
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] email
#   @return [String, nil]
#
# @!attribute [rw] firstName
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] kif
#   @return [Hash, nil]
#
# @!attribute [rw] lastName
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] phone
#   @return [String, nil]
#
# @!attribute [rw] userName
#   @return [String, nil]
#
# @!attribute [rw] userRole
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
UpdateResult = Struct.new(
  :client,
  :email,
  :firstName,
  :id,
  :isActive,
  :kif,
  :lastName,
  :partner,
  :phone,
  :userName,
  :userRole,
  :version,
  keyword_init: true
)

# Request payload for UpdateResult#list.
#
# @!attribute [rw] client
#   @return [String, nil]
#
# @!attribute [rw] kif
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Object, nil]
#
# @!attribute [rw] skip
#   @return [Integer, nil]
#
# @!attribute [rw] take
#   @return [Integer, nil]
UpdateResultListMatch = Struct.new(
  :client,
  :kif,
  :partner,
  :skip,
  :take,
  keyword_init: true
)

# Request payload for UpdateResult#create.
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] email
#   @return [String, nil]
#
# @!attribute [rw] firstName
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] kif
#   @return [Hash, nil]
#
# @!attribute [rw] lastName
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] phone
#   @return [String, nil]
#
# @!attribute [rw] userName
#   @return [String, nil]
#
# @!attribute [rw] userRole
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
UpdateResultCreateData = Struct.new(
  :client,
  :email,
  :firstName,
  :id,
  :isActive,
  :kif,
  :lastName,
  :partner,
  :phone,
  :userName,
  :userRole,
  :version,
  keyword_init: true
)

# Request payload for UpdateResult#update.
#
# @!attribute [rw] id
#   @return [String]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] email
#   @return [String, nil]
#
# @!attribute [rw] firstName
#   @return [String, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] kif
#   @return [Hash, nil]
#
# @!attribute [rw] lastName
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] phone
#   @return [String, nil]
#
# @!attribute [rw] userName
#   @return [String, nil]
#
# @!attribute [rw] userRole
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
UpdateResultUpdateData = Struct.new(
  :id,
  :client,
  :email,
  :firstName,
  :isActive,
  :kif,
  :lastName,
  :partner,
  :phone,
  :userName,
  :userRole,
  :version,
  keyword_init: true
)

# User entity data model.
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] email
#   @return [String, nil]
#
# @!attribute [rw] firstName
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] kif
#   @return [Hash, nil]
#
# @!attribute [rw] lastName
#   @return [String, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] phone
#   @return [String, nil]
#
# @!attribute [rw] userName
#   @return [String, nil]
#
# @!attribute [rw] userRole
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
User = Struct.new(
  :client,
  :created,
  :email,
  :firstName,
  :id,
  :isActive,
  :kif,
  :lastName,
  :modified,
  :partner,
  :phone,
  :userName,
  :userRole,
  :version,
  keyword_init: true
)

# Request payload for User#load.
#
# @!attribute [rw] id
#   @return [String]
UserLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for User#remove.
#
# @!attribute [rw] id
#   @return [String]
UserRemoveMatch = Struct.new(
  :id,
  keyword_init: true
)


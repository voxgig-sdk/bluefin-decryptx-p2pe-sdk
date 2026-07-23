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
# @!attribute [rw] complete_date
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
# @!attribute [rw] note
#   @return [String, nil]
Attestation = Struct.new(
  :client,
  :complete_date,
  :created,
  :device,
  :id,
  :name,
  :note,
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
#   @return [Hash, nil]
#
# @!attribute [rw] complete_date
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
# @!attribute [rw] note
#   @return [String, nil]
AttestationListMatch = Struct.new(
  :client,
  :complete_date,
  :created,
  :device,
  :id,
  :name,
  :note,
  keyword_init: true
)

# Request payload for Attestation#create.
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] complete_date
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
# @!attribute [rw] note
#   @return [String, nil]
AttestationCreateData = Struct.new(
  :client,
  :complete_date,
  :created,
  :device,
  :id,
  :name,
  :note,
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
# @!attribute [rw] direct_partner
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] is_active
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
  :direct_partner,
  :id,
  :is_active,
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
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] direct_partner
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] is_active
#   @return [Boolean, nil]
#
# @!attribute [rw] location
#   @return [Hash, nil]
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
ClientListMatch = Struct.new(
  :contact,
  :created,
  :direct_partner,
  :id,
  :is_active,
  :location,
  :mid,
  :modified,
  :name,
  :partner,
  :version,
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
# @!attribute [rw] direct_partner
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] is_active
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
  :direct_partner,
  :id,
  :is_active,
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
# @!attribute [rw] activated_by
#   @return [Hash]
#
# @!attribute [rw] activation_date
#   @return [String, nil]
#
# @!attribute [rw] alternate_key
#   @return [String, nil]
#
# @!attribute [rw] audit_next_date
#   @return [String, nil]
#
# @!attribute [rw] audit_notification_date
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] created_by
#   @return [Hash]
#
# @!attribute [rw] device_build
#   @return [Hash, nil]
#
# @!attribute [rw] device_state
#   @return [Hash, nil]
#
# @!attribute [rw] device_type
#   @return [Hash, nil]
#
# @!attribute [rw] error_counter
#   @return [Integer, nil]
#
# @!attribute [rw] error_last_date
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] initialized_by
#   @return [Hash]
#
# @!attribute [rw] initialized_date
#   @return [String, nil]
#
# @!attribute [rw] inject_key
#   @return [Hash, nil]
#
# @!attribute [rw] is_virtual
#   @return [Boolean, nil]
#
# @!attribute [rw] kif
#   @return [Hash, nil]
#
# @!attribute [rw] last_activity_date
#   @return [String, nil]
#
# @!attribute [rw] location
#   @return [Hash]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] modified_by
#   @return [Hash]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] note
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] serial_number
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
Device = Struct.new(
  :activated_by,
  :activation_date,
  :alternate_key,
  :audit_next_date,
  :audit_notification_date,
  :client,
  :created,
  :created_by,
  :device_build,
  :device_state,
  :device_type,
  :error_counter,
  :error_last_date,
  :id,
  :initialized_by,
  :initialized_date,
  :inject_key,
  :is_virtual,
  :kif,
  :last_activity_date,
  :location,
  :modified,
  :modified_by,
  :name,
  :note,
  :partner,
  :serial_number,
  :version,
  keyword_init: true
)

# Request payload for Device#load.
#
# @!attribute [rw] device_type
#   @return [String, nil]
#
# @!attribute [rw] serial_number
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
DeviceLoadMatch = Struct.new(
  :device_type,
  :serial_number,
  :id,
  keyword_init: true
)

# Request payload for Device#list.
#
# @!attribute [rw] activated_by
#   @return [Hash, nil]
#
# @!attribute [rw] activation_date
#   @return [String, nil]
#
# @!attribute [rw] alternate_key
#   @return [String, nil]
#
# @!attribute [rw] audit_next_date
#   @return [String, nil]
#
# @!attribute [rw] audit_notification_date
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] created_by
#   @return [Hash, nil]
#
# @!attribute [rw] device_build
#   @return [Hash, nil]
#
# @!attribute [rw] device_state
#   @return [Hash, nil]
#
# @!attribute [rw] device_type
#   @return [Hash, nil]
#
# @!attribute [rw] error_counter
#   @return [Integer, nil]
#
# @!attribute [rw] error_last_date
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] initialized_by
#   @return [Hash, nil]
#
# @!attribute [rw] initialized_date
#   @return [String, nil]
#
# @!attribute [rw] inject_key
#   @return [Hash, nil]
#
# @!attribute [rw] is_virtual
#   @return [Boolean, nil]
#
# @!attribute [rw] kif
#   @return [Hash, nil]
#
# @!attribute [rw] last_activity_date
#   @return [String, nil]
#
# @!attribute [rw] location
#   @return [Hash, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] modified_by
#   @return [Hash, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] note
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] serial_number
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
DeviceListMatch = Struct.new(
  :activated_by,
  :activation_date,
  :alternate_key,
  :audit_next_date,
  :audit_notification_date,
  :client,
  :created,
  :created_by,
  :device_build,
  :device_state,
  :device_type,
  :error_counter,
  :error_last_date,
  :id,
  :initialized_by,
  :initialized_date,
  :inject_key,
  :is_virtual,
  :kif,
  :last_activity_date,
  :location,
  :modified,
  :modified_by,
  :name,
  :note,
  :partner,
  :serial_number,
  :version,
  keyword_init: true
)

# Request payload for Device#create.
#
# @!attribute [rw] activated_by
#   @return [Hash]
#
# @!attribute [rw] activation_date
#   @return [String, nil]
#
# @!attribute [rw] alternate_key
#   @return [String, nil]
#
# @!attribute [rw] audit_next_date
#   @return [String, nil]
#
# @!attribute [rw] audit_notification_date
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] created_by
#   @return [Hash]
#
# @!attribute [rw] device_build
#   @return [Hash, nil]
#
# @!attribute [rw] device_state
#   @return [Hash, nil]
#
# @!attribute [rw] device_type
#   @return [Hash, nil]
#
# @!attribute [rw] error_counter
#   @return [Integer, nil]
#
# @!attribute [rw] error_last_date
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] initialized_by
#   @return [Hash]
#
# @!attribute [rw] initialized_date
#   @return [String, nil]
#
# @!attribute [rw] inject_key
#   @return [Hash, nil]
#
# @!attribute [rw] is_virtual
#   @return [Boolean, nil]
#
# @!attribute [rw] kif
#   @return [Hash, nil]
#
# @!attribute [rw] last_activity_date
#   @return [String, nil]
#
# @!attribute [rw] location
#   @return [Hash]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] modified_by
#   @return [Hash]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] note
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] serial_number
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
DeviceCreateData = Struct.new(
  :activated_by,
  :activation_date,
  :alternate_key,
  :audit_next_date,
  :audit_notification_date,
  :client,
  :created,
  :created_by,
  :device_build,
  :device_state,
  :device_type,
  :error_counter,
  :error_last_date,
  :id,
  :initialized_by,
  :initialized_date,
  :inject_key,
  :is_virtual,
  :kif,
  :last_activity_date,
  :location,
  :modified,
  :modified_by,
  :name,
  :note,
  :partner,
  :serial_number,
  :version,
  keyword_init: true
)

# DeviceBuild entity data model.
#
# @!attribute [rw] app_version
#   @return [String, nil]
#
# @!attribute [rw] build_number
#   @return [String, nil]
#
# @!attribute [rw] config_file_name
#   @return [String, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] device_type
#   @return [String, nil]
#
# @!attribute [rw] firmware_version
#   @return [String, nil]
#
# @!attribute [rw] hardware_version
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] is_active
#   @return [Boolean, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] note
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
#
# @!attribute [rw] white_listing_bin_range
#   @return [String, nil]
#
# @!attribute [rw] white_listing_used
#   @return [Boolean, nil]
DeviceBuild = Struct.new(
  :app_version,
  :build_number,
  :config_file_name,
  :created,
  :device_type,
  :firmware_version,
  :hardware_version,
  :id,
  :is_active,
  :modified,
  :name,
  :note,
  :version,
  :white_listing_bin_range,
  :white_listing_used,
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
# @!attribute [rw] app_version
#   @return [String, nil]
#
# @!attribute [rw] build_number
#   @return [String, nil]
#
# @!attribute [rw] config_file_name
#   @return [String, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] device_type
#   @return [String, nil]
#
# @!attribute [rw] firmware_version
#   @return [String, nil]
#
# @!attribute [rw] hardware_version
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] is_active
#   @return [Boolean, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] note
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
#
# @!attribute [rw] white_listing_bin_range
#   @return [String, nil]
#
# @!attribute [rw] white_listing_used
#   @return [Boolean, nil]
DeviceBuildListMatch = Struct.new(
  :app_version,
  :build_number,
  :config_file_name,
  :created,
  :device_type,
  :firmware_version,
  :hardware_version,
  :id,
  :is_active,
  :modified,
  :name,
  :note,
  :version,
  :white_listing_bin_range,
  :white_listing_used,
  keyword_init: true
)

# DeviceCustodyDetail entity data model.
#
# @!attribute [rw] complete_date
#   @return [String, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] created_by
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
# @!attribute [rw] modified_by
#   @return [Hash]
#
# @!attribute [rw] note
#   @return [String, nil]
#
# @!attribute [rw] status
#   @return [Hash, nil]
#
# @!attribute [rw] transfer_method
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
DeviceCustodyDetail = Struct.new(
  :complete_date,
  :created,
  :created_by,
  :custodian,
  :device,
  :id,
  :location,
  :modified,
  :modified_by,
  :note,
  :status,
  :transfer_method,
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
# @!attribute [rw] complete_date
#   @return [String, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] created_by
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
# @!attribute [rw] modified_by
#   @return [Hash]
#
# @!attribute [rw] note
#   @return [String, nil]
#
# @!attribute [rw] status
#   @return [Hash, nil]
#
# @!attribute [rw] transfer_method
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
DeviceCustodyList = Struct.new(
  :complete_date,
  :created,
  :created_by,
  :custodian,
  :device,
  :id,
  :location,
  :modified,
  :modified_by,
  :note,
  :status,
  :transfer_method,
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
DeviceCustodyListListMatch = Struct.new(
  :device_type,
  :serial_number,
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
DeviceListLoadMatch = Struct.new(
  :share_partner_to,
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
# @!attribute [rw] device_type_mode
#   @return [String, nil]
#
# @!attribute [rw] hardware_version
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] is_active
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
# @!attribute [rw] photo_url
#   @return [String, nil]
#
# @!attribute [rw] product_name
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
DeviceType = Struct.new(
  :created,
  :device_type_mode,
  :hardware_version,
  :id,
  :is_active,
  :manufacturer,
  :model,
  :modified,
  :name,
  :photo_url,
  :product_name,
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
# @!attribute [rw] device_type_mode
#   @return [String, nil]
#
# @!attribute [rw] hardware_version
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] is_active
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
# @!attribute [rw] photo_url
#   @return [String, nil]
#
# @!attribute [rw] product_name
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
DeviceTypeListMatch = Struct.new(
  :created,
  :device_type_mode,
  :hardware_version,
  :id,
  :is_active,
  :manufacturer,
  :model,
  :modified,
  :name,
  :photo_url,
  :product_name,
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
# @!attribute [rw] is_active
#   @return [Boolean, nil]
#
# @!attribute [rw] is_p2_pe
#   @return [Boolean, nil]
#
# @!attribute [rw] key_type
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
  :is_active,
  :is_p2_pe,
  :key_type,
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
# @!attribute [rw] is_active
#   @return [Boolean, nil]
#
# @!attribute [rw] is_p2_pe
#   @return [Boolean, nil]
#
# @!attribute [rw] key_type
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
  :is_active,
  :is_p2_pe,
  :key_type,
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
# @!attribute [rw] billing_id
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
# @!attribute [rw] custom_reference
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] location_type
#   @return [String, nil]
#
# @!attribute [rw] mail_address1
#   @return [String, nil]
#
# @!attribute [rw] mail_address2
#   @return [String, nil]
#
# @!attribute [rw] mail_city
#   @return [String, nil]
#
# @!attribute [rw] mail_country
#   @return [String, nil]
#
# @!attribute [rw] mail_postal_code
#   @return [String, nil]
#
# @!attribute [rw] mail_state_province
#   @return [String, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] name_of_business
#   @return [String, nil]
#
# @!attribute [rw] note
#   @return [String, nil]
#
# @!attribute [rw] postal_code
#   @return [String, nil]
#
# @!attribute [rw] state_province
#   @return [String, nil]
#
# @!attribute [rw] unique_id
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
Location = Struct.new(
  :address1,
  :address2,
  :billing_id,
  :city,
  :country,
  :created,
  :custom_reference,
  :id,
  :location_type,
  :mail_address1,
  :mail_address2,
  :mail_city,
  :mail_country,
  :mail_postal_code,
  :mail_state_province,
  :modified,
  :name,
  :name_of_business,
  :note,
  :postal_code,
  :state_province,
  :unique_id,
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
# @!attribute [rw] address1
#   @return [String, nil]
#
# @!attribute [rw] address2
#   @return [String, nil]
#
# @!attribute [rw] billing_id
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
# @!attribute [rw] custom_reference
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] location_type
#   @return [String, nil]
#
# @!attribute [rw] mail_address1
#   @return [String, nil]
#
# @!attribute [rw] mail_address2
#   @return [String, nil]
#
# @!attribute [rw] mail_city
#   @return [String, nil]
#
# @!attribute [rw] mail_country
#   @return [String, nil]
#
# @!attribute [rw] mail_postal_code
#   @return [String, nil]
#
# @!attribute [rw] mail_state_province
#   @return [String, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] name_of_business
#   @return [String, nil]
#
# @!attribute [rw] note
#   @return [String, nil]
#
# @!attribute [rw] postal_code
#   @return [String, nil]
#
# @!attribute [rw] state_province
#   @return [String, nil]
#
# @!attribute [rw] unique_id
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
LocationListMatch = Struct.new(
  :address1,
  :address2,
  :billing_id,
  :city,
  :country,
  :created,
  :custom_reference,
  :id,
  :location_type,
  :mail_address1,
  :mail_address2,
  :mail_city,
  :mail_country,
  :mail_postal_code,
  :mail_state_province,
  :modified,
  :name,
  :name_of_business,
  :note,
  :postal_code,
  :state_province,
  :unique_id,
  :version,
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
# @!attribute [rw] billing_id
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
# @!attribute [rw] custom_reference
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] location_type
#   @return [String, nil]
#
# @!attribute [rw] mail_address1
#   @return [String, nil]
#
# @!attribute [rw] mail_address2
#   @return [String, nil]
#
# @!attribute [rw] mail_city
#   @return [String, nil]
#
# @!attribute [rw] mail_country
#   @return [String, nil]
#
# @!attribute [rw] mail_postal_code
#   @return [String, nil]
#
# @!attribute [rw] mail_state_province
#   @return [String, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] name_of_business
#   @return [String, nil]
#
# @!attribute [rw] note
#   @return [String, nil]
#
# @!attribute [rw] postal_code
#   @return [String, nil]
#
# @!attribute [rw] state_province
#   @return [String, nil]
#
# @!attribute [rw] unique_id
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
LocationCreateData = Struct.new(
  :address1,
  :address2,
  :billing_id,
  :city,
  :country,
  :created,
  :custom_reference,
  :id,
  :location_type,
  :mail_address1,
  :mail_address2,
  :mail_city,
  :mail_country,
  :mail_postal_code,
  :mail_state_province,
  :modified,
  :name,
  :name_of_business,
  :note,
  :postal_code,
  :state_province,
  :unique_id,
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
# @!attribute [rw] billing_id
#   @return [String, nil]
#
# @!attribute [rw] client_can_order_equipment
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
# @!attribute [rw] is_active
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
# @!attribute [rw] partner_id
#   @return [String, nil]
#
# @!attribute [rw] reference
#   @return [String, nil]
#
# @!attribute [rw] verification_phrase
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
Partner = Struct.new(
  :billing_id,
  :client_can_order_equipment,
  :contact,
  :created,
  :id,
  :is_active,
  :location,
  :modified,
  :name,
  :parent,
  :partner_id,
  :reference,
  :verification_phrase,
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
# @!attribute [rw] billing_id
#   @return [String, nil]
#
# @!attribute [rw] client_can_order_equipment
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
# @!attribute [rw] is_active
#   @return [Boolean, nil]
#
# @!attribute [rw] location
#   @return [Hash, nil]
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
# @!attribute [rw] partner_id
#   @return [String, nil]
#
# @!attribute [rw] reference
#   @return [String, nil]
#
# @!attribute [rw] verification_phrase
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
PartnerListMatch = Struct.new(
  :billing_id,
  :client_can_order_equipment,
  :contact,
  :created,
  :id,
  :is_active,
  :location,
  :modified,
  :name,
  :parent,
  :partner_id,
  :reference,
  :verification_phrase,
  :version,
  keyword_init: true
)

# Request payload for Partner#create.
#
# @!attribute [rw] billing_id
#   @return [String, nil]
#
# @!attribute [rw] client_can_order_equipment
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
# @!attribute [rw] is_active
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
# @!attribute [rw] partner_id
#   @return [String, nil]
#
# @!attribute [rw] reference
#   @return [String, nil]
#
# @!attribute [rw] verification_phrase
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
PartnerCreateData = Struct.new(
  :billing_id,
  :client_can_order_equipment,
  :contact,
  :created,
  :id,
  :is_active,
  :location,
  :modified,
  :name,
  :parent,
  :partner_id,
  :reference,
  :verification_phrase,
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
# @!attribute [rw] date_received
#   @return [String, nil]
#
# @!attribute [rw] date_shipped
#   @return [String, nil]
#
# @!attribute [rw] dc_kif
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] item
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
# @!attribute [rw] shipment_type
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
  :date_received,
  :date_shipped,
  :dc_kif,
  :id,
  :item,
  :kif,
  :modified,
  :partner,
  :shipment_type,
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
# @!attribute [rw] carrier
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] date_received
#   @return [String, nil]
#
# @!attribute [rw] date_shipped
#   @return [String, nil]
#
# @!attribute [rw] dc_kif
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] item
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
# @!attribute [rw] shipment_type
#   @return [String, nil]
#
# @!attribute [rw] tracking
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
ShipmentListMatch = Struct.new(
  :carrier,
  :client,
  :created,
  :date_received,
  :date_shipped,
  :dc_kif,
  :id,
  :item,
  :kif,
  :modified,
  :partner,
  :shipment_type,
  :tracking,
  :version,
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
# @!attribute [rw] date_received
#   @return [String, nil]
#
# @!attribute [rw] date_shipped
#   @return [String, nil]
#
# @!attribute [rw] dc_kif
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] item
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
# @!attribute [rw] shipment_type
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
  :date_received,
  :date_shipped,
  :dc_kif,
  :id,
  :item,
  :kif,
  :modified,
  :partner,
  :shipment_type,
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
SuccessCreateData = Struct.new(
  :share_partner_to,
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
# @!attribute [rw] alternate_key
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] client_ref
#   @return [String, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] decrypted
#   @return [Integer, nil]
#
# @!attribute [rw] device_name
#   @return [String, nil]
#
# @!attribute [rw] direct_partner
#   @return [Hash, nil]
#
# @!attribute [rw] encrypted
#   @return [Integer, nil]
#
# @!attribute [rw] end_date
#   @return [String, nil]
#
# @!attribute [rw] err_code
#   @return [String, nil]
#
# @!attribute [rw] err_message
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] ip_address
#   @return [String, nil]
#
# @!attribute [rw] is_virtual
#   @return [Boolean, nil]
#
# @!attribute [rw] key_type
#   @return [String, nil]
#
# @!attribute [rw] location
#   @return [Hash]
#
# @!attribute [rw] message_id
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
# @!attribute [rw] serial_number
#   @return [String, nil]
#
# @!attribute [rw] start_date
#   @return [String, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] transaction_source
#   @return [String, nil]
Transaction = Struct.new(
  :alternate_key,
  :client,
  :client_ref,
  :created,
  :decrypted,
  :device_name,
  :direct_partner,
  :encrypted,
  :end_date,
  :err_code,
  :err_message,
  :id,
  :ip_address,
  :is_virtual,
  :key_type,
  :location,
  :message_id,
  :method,
  :partner,
  :reference,
  :serial_number,
  :start_date,
  :success,
  :transaction_source,
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
# @!attribute [rw] alternate_key
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] client_ref
#   @return [String, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] decrypted
#   @return [Integer, nil]
#
# @!attribute [rw] device_name
#   @return [String, nil]
#
# @!attribute [rw] direct_partner
#   @return [Hash, nil]
#
# @!attribute [rw] encrypted
#   @return [Integer, nil]
#
# @!attribute [rw] end_date
#   @return [String, nil]
#
# @!attribute [rw] err_code
#   @return [String, nil]
#
# @!attribute [rw] err_message
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] ip_address
#   @return [String, nil]
#
# @!attribute [rw] is_virtual
#   @return [Boolean, nil]
#
# @!attribute [rw] key_type
#   @return [String, nil]
#
# @!attribute [rw] location
#   @return [Hash, nil]
#
# @!attribute [rw] message_id
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
# @!attribute [rw] serial_number
#   @return [String, nil]
#
# @!attribute [rw] start_date
#   @return [String, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] transaction_source
#   @return [String, nil]
TransactionListMatch = Struct.new(
  :alternate_key,
  :client,
  :client_ref,
  :created,
  :decrypted,
  :device_name,
  :direct_partner,
  :encrypted,
  :end_date,
  :err_code,
  :err_message,
  :id,
  :ip_address,
  :is_virtual,
  :key_type,
  :location,
  :message_id,
  :method,
  :partner,
  :reference,
  :serial_number,
  :start_date,
  :success,
  :transaction_source,
  keyword_init: true
)

# Request payload for Transaction#create.
#
# @!attribute [rw] alternate_key
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] client_ref
#   @return [String, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] decrypted
#   @return [Integer, nil]
#
# @!attribute [rw] device_name
#   @return [String, nil]
#
# @!attribute [rw] direct_partner
#   @return [Hash, nil]
#
# @!attribute [rw] encrypted
#   @return [Integer, nil]
#
# @!attribute [rw] end_date
#   @return [String, nil]
#
# @!attribute [rw] err_code
#   @return [String, nil]
#
# @!attribute [rw] err_message
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] ip_address
#   @return [String, nil]
#
# @!attribute [rw] is_virtual
#   @return [Boolean, nil]
#
# @!attribute [rw] key_type
#   @return [String, nil]
#
# @!attribute [rw] location
#   @return [Hash]
#
# @!attribute [rw] message_id
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
# @!attribute [rw] serial_number
#   @return [String, nil]
#
# @!attribute [rw] start_date
#   @return [String, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] transaction_source
#   @return [String, nil]
TransactionCreateData = Struct.new(
  :alternate_key,
  :client,
  :client_ref,
  :created,
  :decrypted,
  :device_name,
  :direct_partner,
  :encrypted,
  :end_date,
  :err_code,
  :err_message,
  :id,
  :ip_address,
  :is_virtual,
  :key_type,
  :location,
  :message_id,
  :method,
  :partner,
  :reference,
  :serial_number,
  :start_date,
  :success,
  :transaction_source,
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
# @!attribute [rw] first_name
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] is_active
#   @return [Boolean, nil]
#
# @!attribute [rw] kif
#   @return [Hash, nil]
#
# @!attribute [rw] last_name
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] phone
#   @return [String, nil]
#
# @!attribute [rw] user_name
#   @return [String, nil]
#
# @!attribute [rw] user_role
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
UpdateResult = Struct.new(
  :client,
  :email,
  :first_name,
  :id,
  :is_active,
  :kif,
  :last_name,
  :partner,
  :phone,
  :user_name,
  :user_role,
  :version,
  keyword_init: true
)

# Request payload for UpdateResult#list.
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] email
#   @return [String, nil]
#
# @!attribute [rw] first_name
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] is_active
#   @return [Boolean, nil]
#
# @!attribute [rw] kif
#   @return [Hash, nil]
#
# @!attribute [rw] last_name
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] phone
#   @return [String, nil]
#
# @!attribute [rw] user_name
#   @return [String, nil]
#
# @!attribute [rw] user_role
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
UpdateResultListMatch = Struct.new(
  :client,
  :email,
  :first_name,
  :id,
  :is_active,
  :kif,
  :last_name,
  :partner,
  :phone,
  :user_name,
  :user_role,
  :version,
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
# @!attribute [rw] first_name
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] is_active
#   @return [Boolean, nil]
#
# @!attribute [rw] kif
#   @return [Hash, nil]
#
# @!attribute [rw] last_name
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] phone
#   @return [String, nil]
#
# @!attribute [rw] user_name
#   @return [String, nil]
#
# @!attribute [rw] user_role
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
UpdateResultCreateData = Struct.new(
  :client,
  :email,
  :first_name,
  :id,
  :is_active,
  :kif,
  :last_name,
  :partner,
  :phone,
  :user_name,
  :user_role,
  :version,
  keyword_init: true
)

# Request payload for UpdateResult#update.
#
# @!attribute [rw] id
#   @return [String]
UpdateResultUpdateData = Struct.new(
  :id,
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
# @!attribute [rw] first_name
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] is_active
#   @return [Boolean, nil]
#
# @!attribute [rw] kif
#   @return [Hash, nil]
#
# @!attribute [rw] last_name
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
# @!attribute [rw] user_name
#   @return [String, nil]
#
# @!attribute [rw] user_role
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
User = Struct.new(
  :client,
  :created,
  :email,
  :first_name,
  :id,
  :is_active,
  :kif,
  :last_name,
  :modified,
  :partner,
  :phone,
  :user_name,
  :user_role,
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


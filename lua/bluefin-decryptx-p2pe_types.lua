-- Typed models for the BluefinDecryptxP2pe SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Attestation
---@field client? table
---@field complete_date? string
---@field created? string
---@field device? table
---@field id? string
---@field name? string
---@field note? string

---@class AttestationLoadMatch
---@field id string

---@class AttestationListMatch
---@field client? table
---@field complete_date? string
---@field created? string
---@field device? table
---@field id? string
---@field name? string
---@field note? string

---@class AttestationCreateData
---@field client? table
---@field complete_date? string
---@field created? string
---@field device? table
---@field id? string
---@field name? string
---@field note? string

---@class Client
---@field contact? table
---@field created? string
---@field direct_partner? table
---@field id? string
---@field is_active? boolean
---@field location table
---@field mid? string
---@field modified? string
---@field name? string
---@field partner? table
---@field version? number

---@class ClientLoadMatch
---@field id string

---@class ClientListMatch
---@field contact? table
---@field created? string
---@field direct_partner? table
---@field id? string
---@field is_active? boolean
---@field location? table
---@field mid? string
---@field modified? string
---@field name? string
---@field partner? table
---@field version? number

---@class ClientCreateData
---@field contact? table
---@field created? string
---@field direct_partner? table
---@field id? string
---@field is_active? boolean
---@field location table
---@field mid? string
---@field modified? string
---@field name? string
---@field partner? table
---@field version? number

---@class ClientRemoveMatch
---@field id string

---@class CreateResult

---@class CreateResultCreateData
---@field device_type string
---@field serial_number string

---@class Decryption
---@field success? boolean

---@class DecryptionCreateData
---@field success? boolean

---@class Device
---@field activated_by table
---@field activation_date? string
---@field alternate_key? string
---@field audit_next_date? string
---@field audit_notification_date? string
---@field client? table
---@field created? string
---@field created_by table
---@field device_build? table
---@field device_state? table
---@field device_type? table
---@field error_counter? number
---@field error_last_date? string
---@field id? string
---@field initialized_by table
---@field initialized_date? string
---@field inject_key? table
---@field is_virtual? boolean
---@field kif? table
---@field last_activity_date? string
---@field location table
---@field modified? string
---@field modified_by table
---@field name? string
---@field note? string
---@field partner? table
---@field serial_number? string
---@field version? number

---@class DeviceLoadMatch
---@field device_type? string
---@field serial_number? string
---@field id? string

---@class DeviceListMatch
---@field activated_by? table
---@field activation_date? string
---@field alternate_key? string
---@field audit_next_date? string
---@field audit_notification_date? string
---@field client? table
---@field created? string
---@field created_by? table
---@field device_build? table
---@field device_state? table
---@field device_type? table
---@field error_counter? number
---@field error_last_date? string
---@field id? string
---@field initialized_by? table
---@field initialized_date? string
---@field inject_key? table
---@field is_virtual? boolean
---@field kif? table
---@field last_activity_date? string
---@field location? table
---@field modified? string
---@field modified_by? table
---@field name? string
---@field note? string
---@field partner? table
---@field serial_number? string
---@field version? number

---@class DeviceCreateData
---@field activated_by table
---@field activation_date? string
---@field alternate_key? string
---@field audit_next_date? string
---@field audit_notification_date? string
---@field client? table
---@field created? string
---@field created_by table
---@field device_build? table
---@field device_state? table
---@field device_type? table
---@field error_counter? number
---@field error_last_date? string
---@field id? string
---@field initialized_by table
---@field initialized_date? string
---@field inject_key? table
---@field is_virtual? boolean
---@field kif? table
---@field last_activity_date? string
---@field location table
---@field modified? string
---@field modified_by table
---@field name? string
---@field note? string
---@field partner? table
---@field serial_number? string
---@field version? number

---@class DeviceBuild
---@field app_version? string
---@field build_number? string
---@field config_file_name? string
---@field created? string
---@field device_type? string
---@field firmware_version? string
---@field hardware_version? string
---@field id? number
---@field is_active? boolean
---@field modified? string
---@field name? string
---@field note? string
---@field version? number
---@field white_listing_bin_range? string
---@field white_listing_used? boolean

---@class DeviceBuildLoadMatch
---@field id string

---@class DeviceBuildListMatch
---@field app_version? string
---@field build_number? string
---@field config_file_name? string
---@field created? string
---@field device_type? string
---@field firmware_version? string
---@field hardware_version? string
---@field id? number
---@field is_active? boolean
---@field modified? string
---@field name? string
---@field note? string
---@field version? number
---@field white_listing_bin_range? string
---@field white_listing_used? boolean

---@class DeviceCustodyDetail
---@field complete_date? string
---@field created? string
---@field created_by table
---@field custodian table
---@field device? table
---@field id? number
---@field location table
---@field modified? string
---@field modified_by table
---@field note? string
---@field status? table
---@field transfer_method? table
---@field version? number

---@class DeviceCustodyDetailLoadMatch
---@field device_type string
---@field id string
---@field serial_number string

---@class DeviceCustodyList
---@field complete_date? string
---@field created? string
---@field created_by table
---@field custodian table
---@field device? table
---@field id? number
---@field location table
---@field modified? string
---@field modified_by table
---@field note? string
---@field status? table
---@field transfer_method? table
---@field version? number

---@class DeviceCustodyListListMatch
---@field device_type string
---@field serial_number string

---@class DeviceList
---@field data? table
---@field total? number

---@class DeviceListLoadMatch
---@field share_partner_to string

---@class DeviceReceiveResult
---@field success boolean

---@class DeviceReceiveResultCreateData
---@field success boolean

---@class DeviceRkiActivateResult
---@field success boolean

---@class DeviceRkiActivateResultCreateData
---@field success boolean

---@class DeviceState
---@field id? number
---@field name? string

---@class DeviceStateListMatch
---@field id? number
---@field name? string

---@class DeviceType
---@field created? string
---@field device_type_mode? string
---@field hardware_version? string
---@field id? string
---@field is_active? boolean
---@field manufacturer? string
---@field model? string
---@field modified? string
---@field name? string
---@field photo_url? string
---@field product_name? string
---@field version? number

---@class DeviceTypeLoadMatch
---@field id string

---@class DeviceTypeListMatch
---@field created? string
---@field device_type_mode? string
---@field hardware_version? string
---@field id? string
---@field is_active? boolean
---@field manufacturer? string
---@field model? string
---@field modified? string
---@field name? string
---@field photo_url? string
---@field product_name? string
---@field version? number

---@class InjectKey
---@field created? string
---@field id? string
---@field is_active? boolean
---@field is_p2_pe? boolean
---@field key_type? string
---@field modified? string
---@field name? string
---@field version? number

---@class InjectKeyLoadMatch
---@field id string

---@class InjectKeyListMatch
---@field created? string
---@field id? string
---@field is_active? boolean
---@field is_p2_pe? boolean
---@field key_type? string
---@field modified? string
---@field name? string
---@field version? number

---@class Kif
---@field id? number
---@field name? string

---@class KifListMatch
---@field id? number
---@field name? string

---@class Location
---@field address1? string
---@field address2? string
---@field billing_id? string
---@field city? string
---@field country? string
---@field created? string
---@field custom_reference? string
---@field id? string
---@field location_type? string
---@field mail_address1? string
---@field mail_address2? string
---@field mail_city? string
---@field mail_country? string
---@field mail_postal_code? string
---@field mail_state_province? string
---@field modified? string
---@field name? string
---@field name_of_business? string
---@field note? string
---@field postal_code? string
---@field state_province? string
---@field unique_id? string
---@field version? number

---@class LocationLoadMatch
---@field id string

---@class LocationListMatch
---@field address1? string
---@field address2? string
---@field billing_id? string
---@field city? string
---@field country? string
---@field created? string
---@field custom_reference? string
---@field id? string
---@field location_type? string
---@field mail_address1? string
---@field mail_address2? string
---@field mail_city? string
---@field mail_country? string
---@field mail_postal_code? string
---@field mail_state_province? string
---@field modified? string
---@field name? string
---@field name_of_business? string
---@field note? string
---@field postal_code? string
---@field state_province? string
---@field unique_id? string
---@field version? number

---@class LocationCreateData
---@field address1? string
---@field address2? string
---@field billing_id? string
---@field city? string
---@field country? string
---@field created? string
---@field custom_reference? string
---@field id? string
---@field location_type? string
---@field mail_address1? string
---@field mail_address2? string
---@field mail_city? string
---@field mail_country? string
---@field mail_postal_code? string
---@field mail_state_province? string
---@field modified? string
---@field name? string
---@field name_of_business? string
---@field note? string
---@field postal_code? string
---@field state_province? string
---@field unique_id? string
---@field version? number

---@class LocationRemoveMatch
---@field id string

---@class Partner
---@field billing_id? string
---@field client_can_order_equipment? boolean
---@field contact? table
---@field created? string
---@field id? string
---@field is_active? boolean
---@field location table
---@field modified? string
---@field name? string
---@field parent? table
---@field partner_id? string
---@field reference? string
---@field verification_phrase? string
---@field version? number

---@class PartnerLoadMatch
---@field id string

---@class PartnerListMatch
---@field billing_id? string
---@field client_can_order_equipment? boolean
---@field contact? table
---@field created? string
---@field id? string
---@field is_active? boolean
---@field location? table
---@field modified? string
---@field name? string
---@field parent? table
---@field partner_id? string
---@field reference? string
---@field verification_phrase? string
---@field version? number

---@class PartnerCreateData
---@field billing_id? string
---@field client_can_order_equipment? boolean
---@field contact? table
---@field created? string
---@field id? string
---@field is_active? boolean
---@field location table
---@field modified? string
---@field name? string
---@field parent? table
---@field partner_id? string
---@field reference? string
---@field verification_phrase? string
---@field version? number

---@class Shipment
---@field carrier? string
---@field client? table
---@field created? string
---@field date_received? string
---@field date_shipped? string
---@field dc_kif? table
---@field id? string
---@field item? table
---@field kif? table
---@field modified? string
---@field partner? table
---@field shipment_type? string
---@field tracking? string
---@field version? number

---@class ShipmentLoadMatch
---@field id string

---@class ShipmentListMatch
---@field carrier? string
---@field client? table
---@field created? string
---@field date_received? string
---@field date_shipped? string
---@field dc_kif? table
---@field id? string
---@field item? table
---@field kif? table
---@field modified? string
---@field partner? table
---@field shipment_type? string
---@field tracking? string
---@field version? number

---@class ShipmentCreateData
---@field carrier? string
---@field client? table
---@field created? string
---@field date_received? string
---@field date_shipped? string
---@field dc_kif? table
---@field id? string
---@field item? table
---@field kif? table
---@field modified? string
---@field partner? table
---@field shipment_type? string
---@field tracking? string
---@field version? number

---@class Success
---@field success? boolean

---@class SuccessCreateData
---@field share_partner_to string

---@class SuccessRemoveMatch
---@field share_partner_to string

---@class Transaction
---@field alternate_key? string
---@field client? table
---@field client_ref? string
---@field created? string
---@field decrypted? number
---@field device_name? string
---@field direct_partner? table
---@field encrypted? number
---@field end_date? string
---@field err_code? string
---@field err_message? string
---@field id? string
---@field ip_address? string
---@field is_virtual? boolean
---@field key_type? string
---@field location table
---@field message_id? string
---@field method? string
---@field partner? table
---@field reference? string
---@field serial_number? string
---@field start_date? string
---@field success? boolean
---@field transaction_source? string

---@class TransactionLoadMatch
---@field id string

---@class TransactionListMatch
---@field alternate_key? string
---@field client? table
---@field client_ref? string
---@field created? string
---@field decrypted? number
---@field device_name? string
---@field direct_partner? table
---@field encrypted? number
---@field end_date? string
---@field err_code? string
---@field err_message? string
---@field id? string
---@field ip_address? string
---@field is_virtual? boolean
---@field key_type? string
---@field location? table
---@field message_id? string
---@field method? string
---@field partner? table
---@field reference? string
---@field serial_number? string
---@field start_date? string
---@field success? boolean
---@field transaction_source? string

---@class TransactionCreateData
---@field alternate_key? string
---@field client? table
---@field client_ref? string
---@field created? string
---@field decrypted? number
---@field device_name? string
---@field direct_partner? table
---@field encrypted? number
---@field end_date? string
---@field err_code? string
---@field err_message? string
---@field id? string
---@field ip_address? string
---@field is_virtual? boolean
---@field key_type? string
---@field location table
---@field message_id? string
---@field method? string
---@field partner? table
---@field reference? string
---@field serial_number? string
---@field start_date? string
---@field success? boolean
---@field transaction_source? string

---@class UpdateResult
---@field client? table
---@field email? string
---@field first_name? string
---@field id? string
---@field is_active? boolean
---@field kif? table
---@field last_name? string
---@field partner? table
---@field phone? string
---@field user_name? string
---@field user_role? table
---@field version? number

---@class UpdateResultListMatch
---@field client? table
---@field email? string
---@field first_name? string
---@field id? string
---@field is_active? boolean
---@field kif? table
---@field last_name? string
---@field partner? table
---@field phone? string
---@field user_name? string
---@field user_role? table
---@field version? number

---@class UpdateResultCreateData
---@field client? table
---@field email? string
---@field first_name? string
---@field id? string
---@field is_active? boolean
---@field kif? table
---@field last_name? string
---@field partner? table
---@field phone? string
---@field user_name? string
---@field user_role? table
---@field version? number

---@class UpdateResultUpdateData
---@field id string

---@class User
---@field client? table
---@field created? string
---@field email? string
---@field first_name? string
---@field id? string
---@field is_active? boolean
---@field kif? table
---@field last_name? string
---@field modified? string
---@field partner? table
---@field phone? string
---@field user_name? string
---@field user_role? table
---@field version? number

---@class UserLoadMatch
---@field id string

---@class UserRemoveMatch
---@field id string

local M = {}

return M

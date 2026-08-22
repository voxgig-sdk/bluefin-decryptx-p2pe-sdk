-- Typed models for the BluefinDecryptxP2pe SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Attestation
---@field client? table
---@field completeDate? string
---@field created? string
---@field device? table
---@field id? string
---@field name? string
---@field notes? string

---@class AttestationLoadMatch
---@field id string

---@class AttestationListMatch
---@field client? table
---@field completeDate? string
---@field created? string
---@field device? table
---@field id? string
---@field name? string
---@field notes? string

---@class AttestationCreateData
---@field client? table
---@field completeDate? string
---@field created? string
---@field device? table
---@field id? string
---@field name? string
---@field notes? string

---@class Client
---@field contact? table
---@field created? string
---@field directPartner? table
---@field id? string
---@field isActive? boolean
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
---@field directPartner? table
---@field id? string
---@field isActive? boolean
---@field location? table
---@field mid? string
---@field modified? string
---@field name? string
---@field partner? table
---@field version? number

---@class ClientCreateData
---@field contact? table
---@field created? string
---@field directPartner? table
---@field id? string
---@field isActive? boolean
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
---@field activatedBy table
---@field activationDate? string
---@field alternateKey? string
---@field auditNextDate? string
---@field auditNotificationDate? string
---@field client? table
---@field created? string
---@field createdBy table
---@field deviceBuild? table
---@field deviceState? table
---@field deviceType? table
---@field errorCounter? number
---@field errorLastDate? string
---@field id? string
---@field initializedBy table
---@field initializedDate? string
---@field injectKey? table
---@field isVirtual? boolean
---@field kif? table
---@field lastActivityDate? string
---@field location table
---@field modified? string
---@field modifiedBy table
---@field name? string
---@field notes? string
---@field partner? table
---@field serialNumber? string
---@field version? number

---@class DeviceLoadMatch
---@field id string

---@class DeviceListMatch
---@field activatedBy? table
---@field activationDate? string
---@field alternateKey? string
---@field auditNextDate? string
---@field auditNotificationDate? string
---@field client? table
---@field created? string
---@field createdBy? table
---@field deviceBuild? table
---@field deviceState? table
---@field deviceType? table
---@field errorCounter? number
---@field errorLastDate? string
---@field id? string
---@field initializedBy? table
---@field initializedDate? string
---@field injectKey? table
---@field isVirtual? boolean
---@field kif? table
---@field lastActivityDate? string
---@field location? table
---@field modified? string
---@field modifiedBy? table
---@field name? string
---@field notes? string
---@field partner? table
---@field serialNumber? string
---@field version? number

---@class DeviceCreateData
---@field activatedBy table
---@field activationDate? string
---@field alternateKey? string
---@field auditNextDate? string
---@field auditNotificationDate? string
---@field client? table
---@field created? string
---@field createdBy table
---@field deviceBuild? table
---@field deviceState? table
---@field deviceType? table
---@field errorCounter? number
---@field errorLastDate? string
---@field id? string
---@field initializedBy table
---@field initializedDate? string
---@field injectKey? table
---@field isVirtual? boolean
---@field kif? table
---@field lastActivityDate? string
---@field location table
---@field modified? string
---@field modifiedBy table
---@field name? string
---@field notes? string
---@field partner? table
---@field serialNumber? string
---@field version? number

---@class DeviceBuild
---@field appVersion? string
---@field buildNumber? string
---@field configFileName? string
---@field created? string
---@field deviceType? string
---@field firmwareVersion? string
---@field hardwareVersion? string
---@field id? number
---@field isActive? boolean
---@field modified? string
---@field name? string
---@field notes? string
---@field version? number
---@field whiteListingBinRanges? string
---@field whiteListingUsed? boolean

---@class DeviceBuildLoadMatch
---@field id string

---@class DeviceBuildListMatch
---@field appVersion? string
---@field buildNumber? string
---@field configFileName? string
---@field created? string
---@field deviceType? string
---@field firmwareVersion? string
---@field hardwareVersion? string
---@field id? number
---@field isActive? boolean
---@field modified? string
---@field name? string
---@field notes? string
---@field version? number
---@field whiteListingBinRanges? string
---@field whiteListingUsed? boolean

---@class DeviceCustodyDetail
---@field completeDate? string
---@field created? string
---@field createdBy table
---@field custodian table
---@field device? table
---@field id? number
---@field location table
---@field modified? string
---@field modifiedBy table
---@field notes? string
---@field status? table
---@field transferMethod? table
---@field version? number

---@class DeviceCustodyDetailLoadMatch
---@field device_type string
---@field id string
---@field serial_number string

---@class DeviceCustodyList
---@field completeDate? string
---@field created? string
---@field createdBy table
---@field custodian table
---@field device? table
---@field id? number
---@field location table
---@field modified? string
---@field modifiedBy table
---@field notes? string
---@field status? table
---@field transferMethod? table
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
---@field deviceTypeMode? string
---@field hardwareVersion? string
---@field id? string
---@field isActive? boolean
---@field manufacturer? string
---@field model? string
---@field modified? string
---@field name? string
---@field photoUrl? string
---@field productName? string
---@field version? number

---@class DeviceTypeLoadMatch
---@field id string

---@class DeviceTypeListMatch
---@field created? string
---@field deviceTypeMode? string
---@field hardwareVersion? string
---@field id? string
---@field isActive? boolean
---@field manufacturer? string
---@field model? string
---@field modified? string
---@field name? string
---@field photoUrl? string
---@field productName? string
---@field version? number

---@class InjectKey
---@field created? string
---@field id? string
---@field isActive? boolean
---@field isP2PE? boolean
---@field keyType? string
---@field modified? string
---@field name? string
---@field version? number

---@class InjectKeyLoadMatch
---@field id string

---@class InjectKeyListMatch
---@field created? string
---@field id? string
---@field isActive? boolean
---@field isP2PE? boolean
---@field keyType? string
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
---@field billingId? string
---@field city? string
---@field country? string
---@field created? string
---@field customReference? string
---@field id? string
---@field locationType? string
---@field mailAddress1? string
---@field mailAddress2? string
---@field mailCity? string
---@field mailCountry? string
---@field mailPostalCode? string
---@field mailStateProvince? string
---@field modified? string
---@field name? string
---@field nameOfBusiness? string
---@field notes? string
---@field postalCode? string
---@field stateProvince? string
---@field uniqueId? string
---@field version? number

---@class LocationLoadMatch
---@field id string

---@class LocationListMatch
---@field address1? string
---@field address2? string
---@field billingId? string
---@field city? string
---@field country? string
---@field created? string
---@field customReference? string
---@field id? string
---@field locationType? string
---@field mailAddress1? string
---@field mailAddress2? string
---@field mailCity? string
---@field mailCountry? string
---@field mailPostalCode? string
---@field mailStateProvince? string
---@field modified? string
---@field name? string
---@field nameOfBusiness? string
---@field notes? string
---@field postalCode? string
---@field stateProvince? string
---@field uniqueId? string
---@field version? number

---@class LocationCreateData
---@field address1? string
---@field address2? string
---@field billingId? string
---@field city? string
---@field country? string
---@field created? string
---@field customReference? string
---@field id? string
---@field locationType? string
---@field mailAddress1? string
---@field mailAddress2? string
---@field mailCity? string
---@field mailCountry? string
---@field mailPostalCode? string
---@field mailStateProvince? string
---@field modified? string
---@field name? string
---@field nameOfBusiness? string
---@field notes? string
---@field postalCode? string
---@field stateProvince? string
---@field uniqueId? string
---@field version? number

---@class LocationRemoveMatch
---@field id string

---@class Partner
---@field billingId? string
---@field clientCanOrderEquipment? boolean
---@field contact? table
---@field created? string
---@field id? string
---@field isActive? boolean
---@field location table
---@field modified? string
---@field name? string
---@field parent? table
---@field partnerId? string
---@field reference? string
---@field verificationPhrase? string
---@field version? number

---@class PartnerLoadMatch
---@field id string

---@class PartnerListMatch
---@field billingId? string
---@field clientCanOrderEquipment? boolean
---@field contact? table
---@field created? string
---@field id? string
---@field isActive? boolean
---@field location? table
---@field modified? string
---@field name? string
---@field parent? table
---@field partnerId? string
---@field reference? string
---@field verificationPhrase? string
---@field version? number

---@class PartnerCreateData
---@field billingId? string
---@field clientCanOrderEquipment? boolean
---@field contact? table
---@field created? string
---@field id? string
---@field isActive? boolean
---@field location table
---@field modified? string
---@field name? string
---@field parent? table
---@field partnerId? string
---@field reference? string
---@field verificationPhrase? string
---@field version? number

---@class Shipment
---@field carrier? string
---@field client? table
---@field created? string
---@field dateReceived? string
---@field dateShipped? string
---@field dcKif? table
---@field id? string
---@field items? table
---@field kif? table
---@field modified? string
---@field partner? table
---@field shipmentType? string
---@field tracking? string
---@field version? number

---@class ShipmentLoadMatch
---@field id string

---@class ShipmentListMatch
---@field carrier? string
---@field client? table
---@field created? string
---@field dateReceived? string
---@field dateShipped? string
---@field dcKif? table
---@field id? string
---@field items? table
---@field kif? table
---@field modified? string
---@field partner? table
---@field shipmentType? string
---@field tracking? string
---@field version? number

---@class ShipmentCreateData
---@field carrier? string
---@field client? table
---@field created? string
---@field dateReceived? string
---@field dateShipped? string
---@field dcKif? table
---@field id? string
---@field items? table
---@field kif? table
---@field modified? string
---@field partner? table
---@field shipmentType? string
---@field tracking? string
---@field version? number

---@class Success
---@field success? boolean

---@class SuccessCreateData
---@field share_partner_to string
---@field success? boolean

---@class SuccessRemoveMatch
---@field share_partner_to string

---@class Transaction
---@field alternateKey? string
---@field client? table
---@field clientRef? string
---@field created? string
---@field decrypted? number
---@field deviceName? string
---@field directPartner? table
---@field encrypted? number
---@field endDate? string
---@field errCode? string
---@field errMessage? string
---@field id? string
---@field ipAddress? string
---@field isVirtual? boolean
---@field keyType? string
---@field location table
---@field messageId? string
---@field method? string
---@field partner? table
---@field reference? string
---@field serialNumber? string
---@field startDate? string
---@field success? boolean
---@field transactionSource? string

---@class TransactionLoadMatch
---@field id string

---@class TransactionListMatch
---@field alternateKey? string
---@field client? table
---@field clientRef? string
---@field created? string
---@field decrypted? number
---@field deviceName? string
---@field directPartner? table
---@field encrypted? number
---@field endDate? string
---@field errCode? string
---@field errMessage? string
---@field id? string
---@field ipAddress? string
---@field isVirtual? boolean
---@field keyType? string
---@field location? table
---@field messageId? string
---@field method? string
---@field partner? table
---@field reference? string
---@field serialNumber? string
---@field startDate? string
---@field success? boolean
---@field transactionSource? string

---@class TransactionCreateData
---@field alternateKey? string
---@field client? table
---@field clientRef? string
---@field created? string
---@field decrypted? number
---@field deviceName? string
---@field directPartner? table
---@field encrypted? number
---@field endDate? string
---@field errCode? string
---@field errMessage? string
---@field id? string
---@field ipAddress? string
---@field isVirtual? boolean
---@field keyType? string
---@field location table
---@field messageId? string
---@field method? string
---@field partner? table
---@field reference? string
---@field serialNumber? string
---@field startDate? string
---@field success? boolean
---@field transactionSource? string

---@class UpdateResult
---@field client? table
---@field email? string
---@field firstName? string
---@field id? string
---@field isActive? boolean
---@field kif? table
---@field lastName? string
---@field partner? table
---@field phone? string
---@field userName? string
---@field userRole? table
---@field version? number

---@class UpdateResultListMatch
---@field client? table
---@field email? string
---@field firstName? string
---@field id? string
---@field isActive? boolean
---@field kif? table
---@field lastName? string
---@field partner? table
---@field phone? string
---@field userName? string
---@field userRole? table
---@field version? number

---@class UpdateResultCreateData
---@field client? table
---@field email? string
---@field firstName? string
---@field id? string
---@field isActive? boolean
---@field kif? table
---@field lastName? string
---@field partner? table
---@field phone? string
---@field userName? string
---@field userRole? table
---@field version? number

---@class UpdateResultUpdateData
---@field id string
---@field client? table
---@field email? string
---@field firstName? string
---@field isActive? boolean
---@field kif? table
---@field lastName? string
---@field partner? table
---@field phone? string
---@field userName? string
---@field userRole? table
---@field version? number

---@class User
---@field client? table
---@field created? string
---@field email? string
---@field firstName? string
---@field id? string
---@field isActive? boolean
---@field kif? table
---@field lastName? string
---@field modified? string
---@field partner? table
---@field phone? string
---@field userName? string
---@field userRole? table
---@field version? number

---@class UserLoadMatch
---@field id string

---@class UserRemoveMatch
---@field id string

local M = {}

return M

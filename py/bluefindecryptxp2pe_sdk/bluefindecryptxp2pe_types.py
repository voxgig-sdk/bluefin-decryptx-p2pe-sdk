# Typed models for the BluefinDecryptxP2pe SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class Attestation(TypedDict, total=False):
    client: dict
    completeDate: str
    created: str
    device: dict
    id: str
    name: str
    notes: str


class AttestationLoadMatch(TypedDict):
    id: str


class AttestationListMatchRequired(TypedDict):
    client: str


class AttestationListMatch(AttestationListMatchRequired, total=False):
    skip: int
    take: int


class AttestationCreateData(TypedDict, total=False):
    client: dict
    completeDate: str
    created: str
    device: dict
    id: str
    name: str
    notes: str


class ClientRequired(TypedDict):
    location: dict


class Client(ClientRequired, total=False):
    contact: dict
    created: str
    directPartner: dict
    id: str
    isActive: bool
    mid: str
    modified: str
    name: str
    partner: dict
    version: int


class ClientLoadMatch(TypedDict):
    id: str


class ClientListMatchRequired(TypedDict):
    partner: str


class ClientListMatch(ClientListMatchRequired, total=False):
    skip: int
    take: int


class ClientCreateDataRequired(TypedDict):
    location: dict


class ClientCreateData(ClientCreateDataRequired, total=False):
    contact: dict
    created: str
    directPartner: dict
    id: str
    isActive: bool
    mid: str
    modified: str
    name: str
    partner: dict
    version: int


class ClientRemoveMatch(TypedDict):
    id: str


class CreateResult(TypedDict):
    pass


class CreateResultCreateData(TypedDict):
    device_type: str
    serial_number: str


class Decryption(TypedDict, total=False):
    success: bool


class DecryptionCreateData(TypedDict, total=False):
    success: bool


class DeviceRequired(TypedDict):
    activatedBy: dict
    createdBy: dict
    initializedBy: dict
    location: dict
    modifiedBy: dict


class Device(DeviceRequired, total=False):
    activationDate: str
    alternateKey: str
    auditNextDate: str
    auditNotificationDate: str
    client: dict
    created: str
    deviceBuild: dict
    deviceState: dict
    deviceType: dict
    errorCounter: int
    errorLastDate: str
    id: str
    initializedDate: str
    injectKey: dict
    isVirtual: bool
    kif: dict
    lastActivityDate: str
    modified: str
    name: str
    notes: str
    partner: dict
    serialNumber: str
    version: int


class DeviceLoadMatch(TypedDict):
    id: str


class DeviceListMatch(TypedDict, total=False):
    client: str
    device_state: str
    kif: str
    partner: str
    serial_number: str
    skip: int
    sorting_direction: str
    sorting_field: str
    take: int


class DeviceCreateDataRequired(TypedDict):
    activatedBy: dict
    createdBy: dict
    initializedBy: dict
    location: dict
    modifiedBy: dict


class DeviceCreateData(DeviceCreateDataRequired, total=False):
    activationDate: str
    alternateKey: str
    auditNextDate: str
    auditNotificationDate: str
    client: dict
    created: str
    deviceBuild: dict
    deviceState: dict
    deviceType: dict
    errorCounter: int
    errorLastDate: str
    id: str
    initializedDate: str
    injectKey: dict
    isVirtual: bool
    kif: dict
    lastActivityDate: str
    modified: str
    name: str
    notes: str
    partner: dict
    serialNumber: str
    version: int


class DeviceBuild(TypedDict, total=False):
    appVersion: str
    buildNumber: str
    configFileName: str
    created: str
    deviceType: str
    firmwareVersion: str
    hardwareVersion: str
    id: int
    isActive: bool
    modified: str
    name: str
    notes: str
    version: int
    whiteListingBinRanges: str
    whiteListingUsed: bool


class DeviceBuildLoadMatch(TypedDict):
    id: str


class DeviceBuildListMatch(TypedDict, total=False):
    device_type: str
    skip: int
    take: int


class DeviceCustodyDetailRequired(TypedDict):
    createdBy: dict
    custodian: dict
    location: dict
    modifiedBy: dict


class DeviceCustodyDetail(DeviceCustodyDetailRequired, total=False):
    completeDate: str
    created: str
    device: dict
    id: int
    modified: str
    notes: str
    status: dict
    transferMethod: dict
    version: int


class DeviceCustodyDetailLoadMatch(TypedDict):
    device_type: str
    id: str
    serial_number: str


class DeviceCustodyListRequired(TypedDict):
    createdBy: dict
    custodian: dict
    location: dict
    modifiedBy: dict


class DeviceCustodyList(DeviceCustodyListRequired, total=False):
    completeDate: str
    created: str
    device: dict
    id: int
    modified: str
    notes: str
    status: dict
    transferMethod: dict
    version: int


class DeviceCustodyListListMatchRequired(TypedDict):
    device_type: str
    serial_number: str


class DeviceCustodyListListMatch(DeviceCustodyListListMatchRequired, total=False):
    skip: int
    take: int


class DeviceList(TypedDict, total=False):
    data: list
    total: int


class DeviceListLoadMatchRequired(TypedDict):
    share_partner_to: str


class DeviceListLoadMatch(DeviceListLoadMatchRequired, total=False):
    skip: int
    sorting_direction: str
    sorting_field: str
    take: int


class DeviceReceiveResult(TypedDict):
    success: bool


class DeviceReceiveResultCreateData(TypedDict):
    success: bool


class DeviceRkiActivateResult(TypedDict):
    success: bool


class DeviceRkiActivateResultCreateData(TypedDict):
    success: bool


class DeviceState(TypedDict, total=False):
    id: int
    name: str


class DeviceStateListMatch(TypedDict, total=False):
    id: int
    name: str


class DeviceType(TypedDict, total=False):
    created: str
    deviceTypeMode: str
    hardwareVersion: str
    id: str
    isActive: bool
    manufacturer: str
    model: str
    modified: str
    name: str
    photoUrl: str
    productName: str
    version: int


class DeviceTypeLoadMatch(TypedDict):
    id: str


class DeviceTypeListMatch(TypedDict, total=False):
    created: str
    deviceTypeMode: str
    hardwareVersion: str
    id: str
    isActive: bool
    manufacturer: str
    model: str
    modified: str
    name: str
    photoUrl: str
    productName: str
    version: int


class InjectKey(TypedDict, total=False):
    created: str
    id: str
    isActive: bool
    isP2PE: bool
    keyType: str
    modified: str
    name: str
    version: int


class InjectKeyLoadMatch(TypedDict):
    id: str


class InjectKeyListMatch(TypedDict, total=False):
    created: str
    id: str
    isActive: bool
    isP2PE: bool
    keyType: str
    modified: str
    name: str
    version: int


class Kif(TypedDict, total=False):
    id: int
    name: str


class KifListMatch(TypedDict, total=False):
    id: int
    name: str


class Location(TypedDict, total=False):
    address1: str
    address2: str
    billingId: str
    city: str
    country: str
    created: str
    customReference: str
    id: str
    locationType: str
    mailAddress1: str
    mailAddress2: str
    mailCity: str
    mailCountry: str
    mailPostalCode: str
    mailStateProvince: str
    modified: str
    name: str
    nameOfBusiness: str
    notes: str
    postalCode: str
    stateProvince: str
    uniqueId: str
    version: int


class LocationLoadMatch(TypedDict):
    id: str


class LocationListMatchRequired(TypedDict):
    client: str


class LocationListMatch(LocationListMatchRequired, total=False):
    skip: int
    take: int


class LocationCreateData(TypedDict, total=False):
    address1: str
    address2: str
    billingId: str
    city: str
    country: str
    created: str
    customReference: str
    id: str
    locationType: str
    mailAddress1: str
    mailAddress2: str
    mailCity: str
    mailCountry: str
    mailPostalCode: str
    mailStateProvince: str
    modified: str
    name: str
    nameOfBusiness: str
    notes: str
    postalCode: str
    stateProvince: str
    uniqueId: str
    version: int


class LocationRemoveMatch(TypedDict):
    id: str


class PartnerRequired(TypedDict):
    location: dict


class Partner(PartnerRequired, total=False):
    billingId: str
    clientCanOrderEquipment: bool
    contact: dict
    created: str
    id: str
    isActive: bool
    modified: str
    name: str
    parent: dict
    partnerId: str
    reference: str
    verificationPhrase: str
    version: int


class PartnerLoadMatch(TypedDict):
    id: str


class PartnerListMatch(TypedDict, total=False):
    partner: str
    skip: int
    take: int


class PartnerCreateDataRequired(TypedDict):
    location: dict


class PartnerCreateData(PartnerCreateDataRequired, total=False):
    billingId: str
    clientCanOrderEquipment: bool
    contact: dict
    created: str
    id: str
    isActive: bool
    modified: str
    name: str
    parent: dict
    partnerId: str
    reference: str
    verificationPhrase: str
    version: int


class Shipment(TypedDict, total=False):
    carrier: str
    client: dict
    created: str
    dateReceived: str
    dateShipped: str
    dcKif: dict
    id: str
    items: list
    kif: dict
    modified: str
    partner: dict
    shipmentType: str
    tracking: str
    version: int


class ShipmentLoadMatch(TypedDict):
    id: str


class ShipmentListMatchRequired(TypedDict):
    kif: str


class ShipmentListMatch(ShipmentListMatchRequired, total=False):
    mode: str
    skip: int
    take: int


class ShipmentCreateData(TypedDict, total=False):
    carrier: str
    client: dict
    created: str
    dateReceived: str
    dateShipped: str
    dcKif: dict
    id: str
    items: list
    kif: dict
    modified: str
    partner: dict
    shipmentType: str
    tracking: str
    version: int


class Success(TypedDict, total=False):
    success: bool


class SuccessCreateDataRequired(TypedDict):
    share_partner_to: str


class SuccessCreateData(SuccessCreateDataRequired, total=False):
    success: bool


class SuccessRemoveMatch(TypedDict):
    share_partner_to: str


class TransactionRequired(TypedDict):
    location: dict


class Transaction(TransactionRequired, total=False):
    alternateKey: str
    client: dict
    clientRef: str
    created: str
    decrypted: int
    deviceName: str
    directPartner: dict
    encrypted: int
    endDate: str
    errCode: str
    errMessage: str
    id: str
    ipAddress: str
    isVirtual: bool
    keyType: str
    messageId: str
    method: str
    partner: dict
    reference: str
    serialNumber: str
    startDate: str
    success: bool
    transactionSource: str


class TransactionLoadMatch(TypedDict):
    id: str


class TransactionListMatch(TypedDict, total=False):
    client: str
    client_ref: str
    date_from: str
    date_to: str
    location: str
    message_id: str
    paging_mode: str
    partner: str
    reference: str
    serial_number: str
    skip: int
    success: bool
    take: int


class TransactionCreateDataRequired(TypedDict):
    location: dict


class TransactionCreateData(TransactionCreateDataRequired, total=False):
    alternateKey: str
    client: dict
    clientRef: str
    created: str
    decrypted: int
    deviceName: str
    directPartner: dict
    encrypted: int
    endDate: str
    errCode: str
    errMessage: str
    id: str
    ipAddress: str
    isVirtual: bool
    keyType: str
    messageId: str
    method: str
    partner: dict
    reference: str
    serialNumber: str
    startDate: str
    success: bool
    transactionSource: str


class UpdateResult(TypedDict, total=False):
    client: dict
    email: str
    firstName: str
    id: str
    isActive: bool
    kif: dict
    lastName: str
    partner: dict
    phone: str
    userName: str
    userRole: dict
    version: int


class UpdateResultListMatch(TypedDict, total=False):
    client: str
    kif: str
    partner: Any
    skip: int
    take: int


class UpdateResultCreateData(TypedDict, total=False):
    client: dict
    email: str
    firstName: str
    id: str
    isActive: bool
    kif: dict
    lastName: str
    partner: dict
    phone: str
    userName: str
    userRole: dict
    version: int


class UpdateResultUpdateDataRequired(TypedDict):
    id: str


class UpdateResultUpdateData(UpdateResultUpdateDataRequired, total=False):
    client: dict
    email: str
    firstName: str
    isActive: bool
    kif: dict
    lastName: str
    partner: dict
    phone: str
    userName: str
    userRole: dict
    version: int


class User(TypedDict, total=False):
    client: dict
    created: str
    email: str
    firstName: str
    id: str
    isActive: bool
    kif: dict
    lastName: str
    modified: str
    partner: dict
    phone: str
    userName: str
    userRole: dict
    version: int


class UserLoadMatch(TypedDict):
    id: str


class UserRemoveMatch(TypedDict):
    id: str

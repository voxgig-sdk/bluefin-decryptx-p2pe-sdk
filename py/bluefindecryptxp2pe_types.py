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
    complete_date: str
    created: str
    device: dict
    id: str
    name: str
    note: str


class AttestationLoadMatch(TypedDict):
    id: str


class AttestationListMatch(TypedDict, total=False):
    client: dict
    complete_date: str
    created: str
    device: dict
    id: str
    name: str
    note: str


class AttestationCreateData(TypedDict, total=False):
    client: dict
    complete_date: str
    created: str
    device: dict
    id: str
    name: str
    note: str


class ClientRequired(TypedDict):
    location: dict


class Client(ClientRequired, total=False):
    contact: dict
    created: str
    direct_partner: dict
    id: str
    is_active: bool
    mid: str
    modified: str
    name: str
    partner: dict
    version: int


class ClientLoadMatch(TypedDict):
    id: str


class ClientListMatch(TypedDict, total=False):
    contact: dict
    created: str
    direct_partner: dict
    id: str
    is_active: bool
    location: dict
    mid: str
    modified: str
    name: str
    partner: dict
    version: int


class ClientCreateDataRequired(TypedDict):
    location: dict


class ClientCreateData(ClientCreateDataRequired, total=False):
    contact: dict
    created: str
    direct_partner: dict
    id: str
    is_active: bool
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
    activated_by: dict
    created_by: dict
    initialized_by: dict
    location: dict
    modified_by: dict


class Device(DeviceRequired, total=False):
    activation_date: str
    alternate_key: str
    audit_next_date: str
    audit_notification_date: str
    client: dict
    created: str
    device_build: dict
    device_state: dict
    device_type: dict
    error_counter: int
    error_last_date: str
    id: str
    initialized_date: str
    inject_key: dict
    is_virtual: bool
    kif: dict
    last_activity_date: str
    modified: str
    name: str
    note: str
    partner: dict
    serial_number: str
    version: int


class DeviceLoadMatch(TypedDict, total=False):
    device_type: str
    serial_number: str
    id: str


class DeviceListMatch(TypedDict, total=False):
    activated_by: dict
    activation_date: str
    alternate_key: str
    audit_next_date: str
    audit_notification_date: str
    client: dict
    created: str
    created_by: dict
    device_build: dict
    device_state: dict
    device_type: dict
    error_counter: int
    error_last_date: str
    id: str
    initialized_by: dict
    initialized_date: str
    inject_key: dict
    is_virtual: bool
    kif: dict
    last_activity_date: str
    location: dict
    modified: str
    modified_by: dict
    name: str
    note: str
    partner: dict
    serial_number: str
    version: int


class DeviceCreateDataRequired(TypedDict):
    activated_by: dict
    created_by: dict
    initialized_by: dict
    location: dict
    modified_by: dict


class DeviceCreateData(DeviceCreateDataRequired, total=False):
    activation_date: str
    alternate_key: str
    audit_next_date: str
    audit_notification_date: str
    client: dict
    created: str
    device_build: dict
    device_state: dict
    device_type: dict
    error_counter: int
    error_last_date: str
    id: str
    initialized_date: str
    inject_key: dict
    is_virtual: bool
    kif: dict
    last_activity_date: str
    modified: str
    name: str
    note: str
    partner: dict
    serial_number: str
    version: int


class DeviceBuild(TypedDict, total=False):
    app_version: str
    build_number: str
    config_file_name: str
    created: str
    device_type: str
    firmware_version: str
    hardware_version: str
    id: int
    is_active: bool
    modified: str
    name: str
    note: str
    version: int
    white_listing_bin_range: str
    white_listing_used: bool


class DeviceBuildLoadMatch(TypedDict):
    id: str


class DeviceBuildListMatch(TypedDict, total=False):
    app_version: str
    build_number: str
    config_file_name: str
    created: str
    device_type: str
    firmware_version: str
    hardware_version: str
    id: int
    is_active: bool
    modified: str
    name: str
    note: str
    version: int
    white_listing_bin_range: str
    white_listing_used: bool


class DeviceCustodyDetailRequired(TypedDict):
    created_by: dict
    custodian: dict
    location: dict
    modified_by: dict


class DeviceCustodyDetail(DeviceCustodyDetailRequired, total=False):
    complete_date: str
    created: str
    device: dict
    id: int
    modified: str
    note: str
    status: dict
    transfer_method: dict
    version: int


class DeviceCustodyDetailLoadMatch(TypedDict):
    device_type: str
    id: str
    serial_number: str


class DeviceCustodyListRequired(TypedDict):
    created_by: dict
    custodian: dict
    location: dict
    modified_by: dict


class DeviceCustodyList(DeviceCustodyListRequired, total=False):
    complete_date: str
    created: str
    device: dict
    id: int
    modified: str
    note: str
    status: dict
    transfer_method: dict
    version: int


class DeviceCustodyListListMatch(TypedDict):
    device_type: str
    serial_number: str


class DeviceList(TypedDict, total=False):
    data: list
    total: int


class DeviceListLoadMatch(TypedDict):
    share_partner_to: str


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
    device_type_mode: str
    hardware_version: str
    id: str
    is_active: bool
    manufacturer: str
    model: str
    modified: str
    name: str
    photo_url: str
    product_name: str
    version: int


class DeviceTypeLoadMatch(TypedDict):
    id: str


class DeviceTypeListMatch(TypedDict, total=False):
    created: str
    device_type_mode: str
    hardware_version: str
    id: str
    is_active: bool
    manufacturer: str
    model: str
    modified: str
    name: str
    photo_url: str
    product_name: str
    version: int


class InjectKey(TypedDict, total=False):
    created: str
    id: str
    is_active: bool
    is_p2_pe: bool
    key_type: str
    modified: str
    name: str
    version: int


class InjectKeyLoadMatch(TypedDict):
    id: str


class InjectKeyListMatch(TypedDict, total=False):
    created: str
    id: str
    is_active: bool
    is_p2_pe: bool
    key_type: str
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
    billing_id: str
    city: str
    country: str
    created: str
    custom_reference: str
    id: str
    location_type: str
    mail_address1: str
    mail_address2: str
    mail_city: str
    mail_country: str
    mail_postal_code: str
    mail_state_province: str
    modified: str
    name: str
    name_of_business: str
    note: str
    postal_code: str
    state_province: str
    unique_id: str
    version: int


class LocationLoadMatch(TypedDict):
    id: str


class LocationListMatch(TypedDict, total=False):
    address1: str
    address2: str
    billing_id: str
    city: str
    country: str
    created: str
    custom_reference: str
    id: str
    location_type: str
    mail_address1: str
    mail_address2: str
    mail_city: str
    mail_country: str
    mail_postal_code: str
    mail_state_province: str
    modified: str
    name: str
    name_of_business: str
    note: str
    postal_code: str
    state_province: str
    unique_id: str
    version: int


class LocationCreateData(TypedDict, total=False):
    address1: str
    address2: str
    billing_id: str
    city: str
    country: str
    created: str
    custom_reference: str
    id: str
    location_type: str
    mail_address1: str
    mail_address2: str
    mail_city: str
    mail_country: str
    mail_postal_code: str
    mail_state_province: str
    modified: str
    name: str
    name_of_business: str
    note: str
    postal_code: str
    state_province: str
    unique_id: str
    version: int


class LocationRemoveMatch(TypedDict):
    id: str


class PartnerRequired(TypedDict):
    location: dict


class Partner(PartnerRequired, total=False):
    billing_id: str
    client_can_order_equipment: bool
    contact: dict
    created: str
    id: str
    is_active: bool
    modified: str
    name: str
    parent: dict
    partner_id: str
    reference: str
    verification_phrase: str
    version: int


class PartnerLoadMatch(TypedDict):
    id: str


class PartnerListMatch(TypedDict, total=False):
    billing_id: str
    client_can_order_equipment: bool
    contact: dict
    created: str
    id: str
    is_active: bool
    location: dict
    modified: str
    name: str
    parent: dict
    partner_id: str
    reference: str
    verification_phrase: str
    version: int


class PartnerCreateDataRequired(TypedDict):
    location: dict


class PartnerCreateData(PartnerCreateDataRequired, total=False):
    billing_id: str
    client_can_order_equipment: bool
    contact: dict
    created: str
    id: str
    is_active: bool
    modified: str
    name: str
    parent: dict
    partner_id: str
    reference: str
    verification_phrase: str
    version: int


class Shipment(TypedDict, total=False):
    carrier: str
    client: dict
    created: str
    date_received: str
    date_shipped: str
    dc_kif: dict
    id: str
    item: list
    kif: dict
    modified: str
    partner: dict
    shipment_type: str
    tracking: str
    version: int


class ShipmentLoadMatch(TypedDict):
    id: str


class ShipmentListMatch(TypedDict, total=False):
    carrier: str
    client: dict
    created: str
    date_received: str
    date_shipped: str
    dc_kif: dict
    id: str
    item: list
    kif: dict
    modified: str
    partner: dict
    shipment_type: str
    tracking: str
    version: int


class ShipmentCreateData(TypedDict, total=False):
    carrier: str
    client: dict
    created: str
    date_received: str
    date_shipped: str
    dc_kif: dict
    id: str
    item: list
    kif: dict
    modified: str
    partner: dict
    shipment_type: str
    tracking: str
    version: int


class Success(TypedDict, total=False):
    success: bool


class SuccessCreateData(TypedDict):
    share_partner_to: str


class SuccessRemoveMatch(TypedDict):
    share_partner_to: str


class TransactionRequired(TypedDict):
    location: dict


class Transaction(TransactionRequired, total=False):
    alternate_key: str
    client: dict
    client_ref: str
    created: str
    decrypted: int
    device_name: str
    direct_partner: dict
    encrypted: int
    end_date: str
    err_code: str
    err_message: str
    id: str
    ip_address: str
    is_virtual: bool
    key_type: str
    message_id: str
    method: str
    partner: dict
    reference: str
    serial_number: str
    start_date: str
    success: bool
    transaction_source: str


class TransactionLoadMatch(TypedDict):
    id: str


class TransactionListMatch(TypedDict, total=False):
    alternate_key: str
    client: dict
    client_ref: str
    created: str
    decrypted: int
    device_name: str
    direct_partner: dict
    encrypted: int
    end_date: str
    err_code: str
    err_message: str
    id: str
    ip_address: str
    is_virtual: bool
    key_type: str
    location: dict
    message_id: str
    method: str
    partner: dict
    reference: str
    serial_number: str
    start_date: str
    success: bool
    transaction_source: str


class TransactionCreateDataRequired(TypedDict):
    location: dict


class TransactionCreateData(TransactionCreateDataRequired, total=False):
    alternate_key: str
    client: dict
    client_ref: str
    created: str
    decrypted: int
    device_name: str
    direct_partner: dict
    encrypted: int
    end_date: str
    err_code: str
    err_message: str
    id: str
    ip_address: str
    is_virtual: bool
    key_type: str
    message_id: str
    method: str
    partner: dict
    reference: str
    serial_number: str
    start_date: str
    success: bool
    transaction_source: str


class UpdateResult(TypedDict, total=False):
    client: dict
    email: str
    first_name: str
    id: str
    is_active: bool
    kif: dict
    last_name: str
    partner: dict
    phone: str
    user_name: str
    user_role: dict
    version: int


class UpdateResultListMatch(TypedDict, total=False):
    client: dict
    email: str
    first_name: str
    id: str
    is_active: bool
    kif: dict
    last_name: str
    partner: dict
    phone: str
    user_name: str
    user_role: dict
    version: int


class UpdateResultCreateData(TypedDict, total=False):
    client: dict
    email: str
    first_name: str
    id: str
    is_active: bool
    kif: dict
    last_name: str
    partner: dict
    phone: str
    user_name: str
    user_role: dict
    version: int


class UpdateResultUpdateData(TypedDict):
    id: str


class User(TypedDict, total=False):
    client: dict
    created: str
    email: str
    first_name: str
    id: str
    is_active: bool
    kif: dict
    last_name: str
    modified: str
    partner: dict
    phone: str
    user_name: str
    user_role: dict
    version: int


class UserLoadMatch(TypedDict):
    id: str


class UserRemoveMatch(TypedDict):
    id: str

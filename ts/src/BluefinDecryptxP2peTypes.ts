// Typed models for the BluefinDecryptxP2pe SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Attestation {
  client?: Record<string, any>
  complete_date?: string
  created?: string
  device?: Record<string, any>
  id?: string
  name?: string
  note?: string
}

export interface AttestationLoadMatch {
  id: string
}

export interface AttestationListMatch {
  client?: Record<string, any>
  complete_date?: string
  created?: string
  device?: Record<string, any>
  id?: string
  name?: string
  note?: string
}

export interface AttestationCreateData {
  client?: Record<string, any>
  complete_date?: string
  created?: string
  device?: Record<string, any>
  id?: string
  name?: string
  note?: string
}

export interface Client {
  contact?: Record<string, any>
  created?: string
  direct_partner?: Record<string, any>
  id?: string
  is_active?: boolean
  location: Record<string, any>
  mid?: string
  modified?: string
  name?: string
  partner?: Record<string, any>
  version?: number
}

export interface ClientLoadMatch {
  id: string
}

export interface ClientListMatch {
  contact?: Record<string, any>
  created?: string
  direct_partner?: Record<string, any>
  id?: string
  is_active?: boolean
  location?: Record<string, any>
  mid?: string
  modified?: string
  name?: string
  partner?: Record<string, any>
  version?: number
}

export interface ClientCreateData {
  contact?: Record<string, any>
  created?: string
  direct_partner?: Record<string, any>
  id?: string
  is_active?: boolean
  location: Record<string, any>
  mid?: string
  modified?: string
  name?: string
  partner?: Record<string, any>
  version?: number
}

export interface ClientRemoveMatch {
  id: string
}

export interface CreateResult {
}

export interface CreateResultCreateData {
  device_type: string
  serial_number: string
}

export interface Decryption {
  success?: boolean
}

export interface DecryptionCreateData {
  success?: boolean
}

export interface Device {
  activated_by: Record<string, any>
  activation_date?: string
  alternate_key?: string
  audit_next_date?: string
  audit_notification_date?: string
  client?: Record<string, any>
  created?: string
  created_by: Record<string, any>
  device_build?: Record<string, any>
  device_state?: Record<string, any>
  device_type?: Record<string, any>
  error_counter?: number
  error_last_date?: string
  id?: string
  initialized_by: Record<string, any>
  initialized_date?: string
  inject_key?: Record<string, any>
  is_virtual?: boolean
  kif?: Record<string, any>
  last_activity_date?: string
  location: Record<string, any>
  modified?: string
  modified_by: Record<string, any>
  name?: string
  note?: string
  partner?: Record<string, any>
  serial_number?: string
  version?: number
}

export interface DeviceLoadMatch {
  device_type?: string
  serial_number?: string
  id?: string
}

export interface DeviceListMatch {
  activated_by?: Record<string, any>
  activation_date?: string
  alternate_key?: string
  audit_next_date?: string
  audit_notification_date?: string
  client?: Record<string, any>
  created?: string
  created_by?: Record<string, any>
  device_build?: Record<string, any>
  device_state?: Record<string, any>
  device_type?: Record<string, any>
  error_counter?: number
  error_last_date?: string
  id?: string
  initialized_by?: Record<string, any>
  initialized_date?: string
  inject_key?: Record<string, any>
  is_virtual?: boolean
  kif?: Record<string, any>
  last_activity_date?: string
  location?: Record<string, any>
  modified?: string
  modified_by?: Record<string, any>
  name?: string
  note?: string
  partner?: Record<string, any>
  serial_number?: string
  version?: number
}

export interface DeviceCreateData {
  activated_by: Record<string, any>
  activation_date?: string
  alternate_key?: string
  audit_next_date?: string
  audit_notification_date?: string
  client?: Record<string, any>
  created?: string
  created_by: Record<string, any>
  device_build?: Record<string, any>
  device_state?: Record<string, any>
  device_type?: Record<string, any>
  error_counter?: number
  error_last_date?: string
  id?: string
  initialized_by: Record<string, any>
  initialized_date?: string
  inject_key?: Record<string, any>
  is_virtual?: boolean
  kif?: Record<string, any>
  last_activity_date?: string
  location: Record<string, any>
  modified?: string
  modified_by: Record<string, any>
  name?: string
  note?: string
  partner?: Record<string, any>
  serial_number?: string
  version?: number
}

export interface DeviceBuild {
  app_version?: string
  build_number?: string
  config_file_name?: string
  created?: string
  device_type?: string
  firmware_version?: string
  hardware_version?: string
  id?: number
  is_active?: boolean
  modified?: string
  name?: string
  note?: string
  version?: number
  white_listing_bin_range?: string
  white_listing_used?: boolean
}

export interface DeviceBuildLoadMatch {
  id: string
}

export interface DeviceBuildListMatch {
  app_version?: string
  build_number?: string
  config_file_name?: string
  created?: string
  device_type?: string
  firmware_version?: string
  hardware_version?: string
  id?: number
  is_active?: boolean
  modified?: string
  name?: string
  note?: string
  version?: number
  white_listing_bin_range?: string
  white_listing_used?: boolean
}

export interface DeviceCustodyDetail {
  complete_date?: string
  created?: string
  created_by: Record<string, any>
  custodian: Record<string, any>
  device?: Record<string, any>
  id?: number
  location: Record<string, any>
  modified?: string
  modified_by: Record<string, any>
  note?: string
  status?: Record<string, any>
  transfer_method?: Record<string, any>
  version?: number
}

export interface DeviceCustodyDetailLoadMatch {
  device_type: string
  id: string
  serial_number: string
}

export interface DeviceCustodyList {
  complete_date?: string
  created?: string
  created_by: Record<string, any>
  custodian: Record<string, any>
  device?: Record<string, any>
  id?: number
  location: Record<string, any>
  modified?: string
  modified_by: Record<string, any>
  note?: string
  status?: Record<string, any>
  transfer_method?: Record<string, any>
  version?: number
}

export interface DeviceCustodyListListMatch {
  device_type: string
  serial_number: string
}

export interface DeviceList {
  data?: any[]
  total?: number
}

export interface DeviceListLoadMatch {
  share_partner_to: string
}

export interface DeviceReceiveResult {
  success: boolean
}

export interface DeviceReceiveResultCreateData {
  success: boolean
}

export interface DeviceRkiActivateResult {
  success: boolean
}

export interface DeviceRkiActivateResultCreateData {
  success: boolean
}

export interface DeviceState {
  id?: number
  name?: string
}

export interface DeviceStateListMatch {
  id?: number
  name?: string
}

export interface DeviceType {
  created?: string
  device_type_mode?: string
  hardware_version?: string
  id?: string
  is_active?: boolean
  manufacturer?: string
  model?: string
  modified?: string
  name?: string
  photo_url?: string
  product_name?: string
  version?: number
}

export interface DeviceTypeLoadMatch {
  id: string
}

export interface DeviceTypeListMatch {
  created?: string
  device_type_mode?: string
  hardware_version?: string
  id?: string
  is_active?: boolean
  manufacturer?: string
  model?: string
  modified?: string
  name?: string
  photo_url?: string
  product_name?: string
  version?: number
}

export interface InjectKey {
  created?: string
  id?: string
  is_active?: boolean
  is_p2_pe?: boolean
  key_type?: string
  modified?: string
  name?: string
  version?: number
}

export interface InjectKeyLoadMatch {
  id: string
}

export interface InjectKeyListMatch {
  created?: string
  id?: string
  is_active?: boolean
  is_p2_pe?: boolean
  key_type?: string
  modified?: string
  name?: string
  version?: number
}

export interface Kif {
  id?: number
  name?: string
}

export interface KifListMatch {
  id?: number
  name?: string
}

export interface Location {
  address1?: string
  address2?: string
  billing_id?: string
  city?: string
  country?: string
  created?: string
  custom_reference?: string
  id?: string
  location_type?: string
  mail_address1?: string
  mail_address2?: string
  mail_city?: string
  mail_country?: string
  mail_postal_code?: string
  mail_state_province?: string
  modified?: string
  name?: string
  name_of_business?: string
  note?: string
  postal_code?: string
  state_province?: string
  unique_id?: string
  version?: number
}

export interface LocationLoadMatch {
  id: string
}

export interface LocationListMatch {
  address1?: string
  address2?: string
  billing_id?: string
  city?: string
  country?: string
  created?: string
  custom_reference?: string
  id?: string
  location_type?: string
  mail_address1?: string
  mail_address2?: string
  mail_city?: string
  mail_country?: string
  mail_postal_code?: string
  mail_state_province?: string
  modified?: string
  name?: string
  name_of_business?: string
  note?: string
  postal_code?: string
  state_province?: string
  unique_id?: string
  version?: number
}

export interface LocationCreateData {
  address1?: string
  address2?: string
  billing_id?: string
  city?: string
  country?: string
  created?: string
  custom_reference?: string
  id?: string
  location_type?: string
  mail_address1?: string
  mail_address2?: string
  mail_city?: string
  mail_country?: string
  mail_postal_code?: string
  mail_state_province?: string
  modified?: string
  name?: string
  name_of_business?: string
  note?: string
  postal_code?: string
  state_province?: string
  unique_id?: string
  version?: number
}

export interface LocationRemoveMatch {
  id: string
}

export interface Partner {
  billing_id?: string
  client_can_order_equipment?: boolean
  contact?: Record<string, any>
  created?: string
  id?: string
  is_active?: boolean
  location: Record<string, any>
  modified?: string
  name?: string
  parent?: Record<string, any>
  partner_id?: string
  reference?: string
  verification_phrase?: string
  version?: number
}

export interface PartnerLoadMatch {
  id: string
}

export interface PartnerListMatch {
  billing_id?: string
  client_can_order_equipment?: boolean
  contact?: Record<string, any>
  created?: string
  id?: string
  is_active?: boolean
  location?: Record<string, any>
  modified?: string
  name?: string
  parent?: Record<string, any>
  partner_id?: string
  reference?: string
  verification_phrase?: string
  version?: number
}

export interface PartnerCreateData {
  billing_id?: string
  client_can_order_equipment?: boolean
  contact?: Record<string, any>
  created?: string
  id?: string
  is_active?: boolean
  location: Record<string, any>
  modified?: string
  name?: string
  parent?: Record<string, any>
  partner_id?: string
  reference?: string
  verification_phrase?: string
  version?: number
}

export interface Shipment {
  carrier?: string
  client?: Record<string, any>
  created?: string
  date_received?: string
  date_shipped?: string
  dc_kif?: Record<string, any>
  id?: string
  item?: any[]
  kif?: Record<string, any>
  modified?: string
  partner?: Record<string, any>
  shipment_type?: string
  tracking?: string
  version?: number
}

export interface ShipmentLoadMatch {
  id: string
}

export interface ShipmentListMatch {
  carrier?: string
  client?: Record<string, any>
  created?: string
  date_received?: string
  date_shipped?: string
  dc_kif?: Record<string, any>
  id?: string
  item?: any[]
  kif?: Record<string, any>
  modified?: string
  partner?: Record<string, any>
  shipment_type?: string
  tracking?: string
  version?: number
}

export interface ShipmentCreateData {
  carrier?: string
  client?: Record<string, any>
  created?: string
  date_received?: string
  date_shipped?: string
  dc_kif?: Record<string, any>
  id?: string
  item?: any[]
  kif?: Record<string, any>
  modified?: string
  partner?: Record<string, any>
  shipment_type?: string
  tracking?: string
  version?: number
}

export interface Success {
  success?: boolean
}

export interface SuccessCreateData {
  share_partner_to: string
}

export interface SuccessRemoveMatch {
  share_partner_to: string
}

export interface Transaction {
  alternate_key?: string
  client?: Record<string, any>
  client_ref?: string
  created?: string
  decrypted?: number
  device_name?: string
  direct_partner?: Record<string, any>
  encrypted?: number
  end_date?: string
  err_code?: string
  err_message?: string
  id?: string
  ip_address?: string
  is_virtual?: boolean
  key_type?: string
  location: Record<string, any>
  message_id?: string
  method?: string
  partner?: Record<string, any>
  reference?: string
  serial_number?: string
  start_date?: string
  success?: boolean
  transaction_source?: string
}

export interface TransactionLoadMatch {
  id: string
}

export interface TransactionListMatch {
  alternate_key?: string
  client?: Record<string, any>
  client_ref?: string
  created?: string
  decrypted?: number
  device_name?: string
  direct_partner?: Record<string, any>
  encrypted?: number
  end_date?: string
  err_code?: string
  err_message?: string
  id?: string
  ip_address?: string
  is_virtual?: boolean
  key_type?: string
  location?: Record<string, any>
  message_id?: string
  method?: string
  partner?: Record<string, any>
  reference?: string
  serial_number?: string
  start_date?: string
  success?: boolean
  transaction_source?: string
}

export interface TransactionCreateData {
  alternate_key?: string
  client?: Record<string, any>
  client_ref?: string
  created?: string
  decrypted?: number
  device_name?: string
  direct_partner?: Record<string, any>
  encrypted?: number
  end_date?: string
  err_code?: string
  err_message?: string
  id?: string
  ip_address?: string
  is_virtual?: boolean
  key_type?: string
  location: Record<string, any>
  message_id?: string
  method?: string
  partner?: Record<string, any>
  reference?: string
  serial_number?: string
  start_date?: string
  success?: boolean
  transaction_source?: string
}

export interface UpdateResult {
  client?: Record<string, any>
  email?: string
  first_name?: string
  id?: string
  is_active?: boolean
  kif?: Record<string, any>
  last_name?: string
  partner?: Record<string, any>
  phone?: string
  user_name?: string
  user_role?: Record<string, any>
  version?: number
}

export interface UpdateResultListMatch {
  client?: Record<string, any>
  email?: string
  first_name?: string
  id?: string
  is_active?: boolean
  kif?: Record<string, any>
  last_name?: string
  partner?: Record<string, any>
  phone?: string
  user_name?: string
  user_role?: Record<string, any>
  version?: number
}

export interface UpdateResultCreateData {
  client?: Record<string, any>
  email?: string
  first_name?: string
  id?: string
  is_active?: boolean
  kif?: Record<string, any>
  last_name?: string
  partner?: Record<string, any>
  phone?: string
  user_name?: string
  user_role?: Record<string, any>
  version?: number
}

export interface UpdateResultUpdateData {
  id: string
}

export interface User {
  client?: Record<string, any>
  created?: string
  email?: string
  first_name?: string
  id?: string
  is_active?: boolean
  kif?: Record<string, any>
  last_name?: string
  modified?: string
  partner?: Record<string, any>
  phone?: string
  user_name?: string
  user_role?: Record<string, any>
  version?: number
}

export interface UserLoadMatch {
  id: string
}

export interface UserRemoveMatch {
  id: string
}


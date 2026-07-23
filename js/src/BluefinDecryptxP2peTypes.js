// Typed models for the BluefinDecryptxP2pe SDK (JSDoc typedefs).
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
// edit by hand.

/**
 * @typedef {Object} Attestation
 * @property {Object} [client]
 * @property {string} [complete_date]
 * @property {string} [created]
 * @property {Object} [device]
 * @property {string} [id]
 * @property {string} [name]
 * @property {string} [note]
 */

/**
 * @typedef {Object} AttestationLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} AttestationListMatch
 * @property {Object} [client]
 * @property {string} [complete_date]
 * @property {string} [created]
 * @property {Object} [device]
 * @property {string} [id]
 * @property {string} [name]
 * @property {string} [note]
 */

/**
 * @typedef {Object} AttestationCreateData
 * @property {Object} [client]
 * @property {string} [complete_date]
 * @property {string} [created]
 * @property {Object} [device]
 * @property {string} [id]
 * @property {string} [name]
 * @property {string} [note]
 */

/**
 * @typedef {Object} Client
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {Object} [direct_partner]
 * @property {string} [id]
 * @property {boolean} [is_active]
 * @property {Object} location
 * @property {string} [mid]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [partner]
 * @property {number} [version]
 */

/**
 * @typedef {Object} ClientLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} ClientListMatch
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {Object} [direct_partner]
 * @property {string} [id]
 * @property {boolean} [is_active]
 * @property {Object} [location]
 * @property {string} [mid]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [partner]
 * @property {number} [version]
 */

/**
 * @typedef {Object} ClientCreateData
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {Object} [direct_partner]
 * @property {string} [id]
 * @property {boolean} [is_active]
 * @property {Object} location
 * @property {string} [mid]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [partner]
 * @property {number} [version]
 */

/**
 * @typedef {Object} ClientRemoveMatch
 * @property {string} id
 */

/**
 * @typedef {Object} CreateResult
 */

/**
 * @typedef {Object} CreateResultCreateData
 * @property {string} device_type
 * @property {string} serial_number
 */

/**
 * @typedef {Object} Decryption
 * @property {boolean} [success]
 */

/**
 * @typedef {Object} DecryptionCreateData
 * @property {boolean} [success]
 */

/**
 * @typedef {Object} Device
 * @property {Object} activated_by
 * @property {string} [activation_date]
 * @property {string} [alternate_key]
 * @property {string} [audit_next_date]
 * @property {string} [audit_notification_date]
 * @property {Object} [client]
 * @property {string} [created]
 * @property {Object} created_by
 * @property {Object} [device_build]
 * @property {Object} [device_state]
 * @property {Object} [device_type]
 * @property {number} [error_counter]
 * @property {string} [error_last_date]
 * @property {string} [id]
 * @property {Object} initialized_by
 * @property {string} [initialized_date]
 * @property {Object} [inject_key]
 * @property {boolean} [is_virtual]
 * @property {Object} [kif]
 * @property {string} [last_activity_date]
 * @property {Object} location
 * @property {string} [modified]
 * @property {Object} modified_by
 * @property {string} [name]
 * @property {string} [note]
 * @property {Object} [partner]
 * @property {string} [serial_number]
 * @property {number} [version]
 */

/**
 * @typedef {Object} DeviceLoadMatch
 * @property {string} [device_type]
 * @property {string} [serial_number]
 * @property {string} [id]
 */

/**
 * @typedef {Object} DeviceListMatch
 * @property {Object} [activated_by]
 * @property {string} [activation_date]
 * @property {string} [alternate_key]
 * @property {string} [audit_next_date]
 * @property {string} [audit_notification_date]
 * @property {Object} [client]
 * @property {string} [created]
 * @property {Object} [created_by]
 * @property {Object} [device_build]
 * @property {Object} [device_state]
 * @property {Object} [device_type]
 * @property {number} [error_counter]
 * @property {string} [error_last_date]
 * @property {string} [id]
 * @property {Object} [initialized_by]
 * @property {string} [initialized_date]
 * @property {Object} [inject_key]
 * @property {boolean} [is_virtual]
 * @property {Object} [kif]
 * @property {string} [last_activity_date]
 * @property {Object} [location]
 * @property {string} [modified]
 * @property {Object} [modified_by]
 * @property {string} [name]
 * @property {string} [note]
 * @property {Object} [partner]
 * @property {string} [serial_number]
 * @property {number} [version]
 */

/**
 * @typedef {Object} DeviceCreateData
 * @property {Object} activated_by
 * @property {string} [activation_date]
 * @property {string} [alternate_key]
 * @property {string} [audit_next_date]
 * @property {string} [audit_notification_date]
 * @property {Object} [client]
 * @property {string} [created]
 * @property {Object} created_by
 * @property {Object} [device_build]
 * @property {Object} [device_state]
 * @property {Object} [device_type]
 * @property {number} [error_counter]
 * @property {string} [error_last_date]
 * @property {string} [id]
 * @property {Object} initialized_by
 * @property {string} [initialized_date]
 * @property {Object} [inject_key]
 * @property {boolean} [is_virtual]
 * @property {Object} [kif]
 * @property {string} [last_activity_date]
 * @property {Object} location
 * @property {string} [modified]
 * @property {Object} modified_by
 * @property {string} [name]
 * @property {string} [note]
 * @property {Object} [partner]
 * @property {string} [serial_number]
 * @property {number} [version]
 */

/**
 * @typedef {Object} DeviceBuild
 * @property {string} [app_version]
 * @property {string} [build_number]
 * @property {string} [config_file_name]
 * @property {string} [created]
 * @property {string} [device_type]
 * @property {string} [firmware_version]
 * @property {string} [hardware_version]
 * @property {number} [id]
 * @property {boolean} [is_active]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {string} [note]
 * @property {number} [version]
 * @property {string} [white_listing_bin_range]
 * @property {boolean} [white_listing_used]
 */

/**
 * @typedef {Object} DeviceBuildLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} DeviceBuildListMatch
 * @property {string} [app_version]
 * @property {string} [build_number]
 * @property {string} [config_file_name]
 * @property {string} [created]
 * @property {string} [device_type]
 * @property {string} [firmware_version]
 * @property {string} [hardware_version]
 * @property {number} [id]
 * @property {boolean} [is_active]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {string} [note]
 * @property {number} [version]
 * @property {string} [white_listing_bin_range]
 * @property {boolean} [white_listing_used]
 */

/**
 * @typedef {Object} DeviceCustodyDetail
 * @property {string} [complete_date]
 * @property {string} [created]
 * @property {Object} created_by
 * @property {Object} custodian
 * @property {Object} [device]
 * @property {number} [id]
 * @property {Object} location
 * @property {string} [modified]
 * @property {Object} modified_by
 * @property {string} [note]
 * @property {Object} [status]
 * @property {Object} [transfer_method]
 * @property {number} [version]
 */

/**
 * @typedef {Object} DeviceCustodyDetailLoadMatch
 * @property {string} device_type
 * @property {string} id
 * @property {string} serial_number
 */

/**
 * @typedef {Object} DeviceCustodyList
 * @property {string} [complete_date]
 * @property {string} [created]
 * @property {Object} created_by
 * @property {Object} custodian
 * @property {Object} [device]
 * @property {number} [id]
 * @property {Object} location
 * @property {string} [modified]
 * @property {Object} modified_by
 * @property {string} [note]
 * @property {Object} [status]
 * @property {Object} [transfer_method]
 * @property {number} [version]
 */

/**
 * @typedef {Object} DeviceCustodyListListMatch
 * @property {string} device_type
 * @property {string} serial_number
 */

/**
 * @typedef {Object} DeviceList
 * @property {Array} [data]
 * @property {number} [total]
 */

/**
 * @typedef {Object} DeviceListLoadMatch
 * @property {string} share_partner_to
 */

/**
 * @typedef {Object} DeviceReceiveResult
 * @property {boolean} success
 */

/**
 * @typedef {Object} DeviceReceiveResultCreateData
 * @property {boolean} success
 */

/**
 * @typedef {Object} DeviceRkiActivateResult
 * @property {boolean} success
 */

/**
 * @typedef {Object} DeviceRkiActivateResultCreateData
 * @property {boolean} success
 */

/**
 * @typedef {Object} DeviceState
 * @property {number} [id]
 * @property {string} [name]
 */

/**
 * @typedef {Object} DeviceStateListMatch
 * @property {number} [id]
 * @property {string} [name]
 */

/**
 * @typedef {Object} DeviceType
 * @property {string} [created]
 * @property {string} [device_type_mode]
 * @property {string} [hardware_version]
 * @property {string} [id]
 * @property {boolean} [is_active]
 * @property {string} [manufacturer]
 * @property {string} [model]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {string} [photo_url]
 * @property {string} [product_name]
 * @property {number} [version]
 */

/**
 * @typedef {Object} DeviceTypeLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} DeviceTypeListMatch
 * @property {string} [created]
 * @property {string} [device_type_mode]
 * @property {string} [hardware_version]
 * @property {string} [id]
 * @property {boolean} [is_active]
 * @property {string} [manufacturer]
 * @property {string} [model]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {string} [photo_url]
 * @property {string} [product_name]
 * @property {number} [version]
 */

/**
 * @typedef {Object} InjectKey
 * @property {string} [created]
 * @property {string} [id]
 * @property {boolean} [is_active]
 * @property {boolean} [is_p2_pe]
 * @property {string} [key_type]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {number} [version]
 */

/**
 * @typedef {Object} InjectKeyLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} InjectKeyListMatch
 * @property {string} [created]
 * @property {string} [id]
 * @property {boolean} [is_active]
 * @property {boolean} [is_p2_pe]
 * @property {string} [key_type]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {number} [version]
 */

/**
 * @typedef {Object} Kif
 * @property {number} [id]
 * @property {string} [name]
 */

/**
 * @typedef {Object} KifListMatch
 * @property {number} [id]
 * @property {string} [name]
 */

/**
 * @typedef {Object} Location
 * @property {string} [address1]
 * @property {string} [address2]
 * @property {string} [billing_id]
 * @property {string} [city]
 * @property {string} [country]
 * @property {string} [created]
 * @property {string} [custom_reference]
 * @property {string} [id]
 * @property {string} [location_type]
 * @property {string} [mail_address1]
 * @property {string} [mail_address2]
 * @property {string} [mail_city]
 * @property {string} [mail_country]
 * @property {string} [mail_postal_code]
 * @property {string} [mail_state_province]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {string} [name_of_business]
 * @property {string} [note]
 * @property {string} [postal_code]
 * @property {string} [state_province]
 * @property {string} [unique_id]
 * @property {number} [version]
 */

/**
 * @typedef {Object} LocationLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} LocationListMatch
 * @property {string} [address1]
 * @property {string} [address2]
 * @property {string} [billing_id]
 * @property {string} [city]
 * @property {string} [country]
 * @property {string} [created]
 * @property {string} [custom_reference]
 * @property {string} [id]
 * @property {string} [location_type]
 * @property {string} [mail_address1]
 * @property {string} [mail_address2]
 * @property {string} [mail_city]
 * @property {string} [mail_country]
 * @property {string} [mail_postal_code]
 * @property {string} [mail_state_province]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {string} [name_of_business]
 * @property {string} [note]
 * @property {string} [postal_code]
 * @property {string} [state_province]
 * @property {string} [unique_id]
 * @property {number} [version]
 */

/**
 * @typedef {Object} LocationCreateData
 * @property {string} [address1]
 * @property {string} [address2]
 * @property {string} [billing_id]
 * @property {string} [city]
 * @property {string} [country]
 * @property {string} [created]
 * @property {string} [custom_reference]
 * @property {string} [id]
 * @property {string} [location_type]
 * @property {string} [mail_address1]
 * @property {string} [mail_address2]
 * @property {string} [mail_city]
 * @property {string} [mail_country]
 * @property {string} [mail_postal_code]
 * @property {string} [mail_state_province]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {string} [name_of_business]
 * @property {string} [note]
 * @property {string} [postal_code]
 * @property {string} [state_province]
 * @property {string} [unique_id]
 * @property {number} [version]
 */

/**
 * @typedef {Object} LocationRemoveMatch
 * @property {string} id
 */

/**
 * @typedef {Object} Partner
 * @property {string} [billing_id]
 * @property {boolean} [client_can_order_equipment]
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {string} [id]
 * @property {boolean} [is_active]
 * @property {Object} location
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [parent]
 * @property {string} [partner_id]
 * @property {string} [reference]
 * @property {string} [verification_phrase]
 * @property {number} [version]
 */

/**
 * @typedef {Object} PartnerLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} PartnerListMatch
 * @property {string} [billing_id]
 * @property {boolean} [client_can_order_equipment]
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {string} [id]
 * @property {boolean} [is_active]
 * @property {Object} [location]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [parent]
 * @property {string} [partner_id]
 * @property {string} [reference]
 * @property {string} [verification_phrase]
 * @property {number} [version]
 */

/**
 * @typedef {Object} PartnerCreateData
 * @property {string} [billing_id]
 * @property {boolean} [client_can_order_equipment]
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {string} [id]
 * @property {boolean} [is_active]
 * @property {Object} location
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [parent]
 * @property {string} [partner_id]
 * @property {string} [reference]
 * @property {string} [verification_phrase]
 * @property {number} [version]
 */

/**
 * @typedef {Object} Shipment
 * @property {string} [carrier]
 * @property {Object} [client]
 * @property {string} [created]
 * @property {string} [date_received]
 * @property {string} [date_shipped]
 * @property {Object} [dc_kif]
 * @property {string} [id]
 * @property {Array} [item]
 * @property {Object} [kif]
 * @property {string} [modified]
 * @property {Object} [partner]
 * @property {string} [shipment_type]
 * @property {string} [tracking]
 * @property {number} [version]
 */

/**
 * @typedef {Object} ShipmentLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} ShipmentListMatch
 * @property {string} [carrier]
 * @property {Object} [client]
 * @property {string} [created]
 * @property {string} [date_received]
 * @property {string} [date_shipped]
 * @property {Object} [dc_kif]
 * @property {string} [id]
 * @property {Array} [item]
 * @property {Object} [kif]
 * @property {string} [modified]
 * @property {Object} [partner]
 * @property {string} [shipment_type]
 * @property {string} [tracking]
 * @property {number} [version]
 */

/**
 * @typedef {Object} ShipmentCreateData
 * @property {string} [carrier]
 * @property {Object} [client]
 * @property {string} [created]
 * @property {string} [date_received]
 * @property {string} [date_shipped]
 * @property {Object} [dc_kif]
 * @property {string} [id]
 * @property {Array} [item]
 * @property {Object} [kif]
 * @property {string} [modified]
 * @property {Object} [partner]
 * @property {string} [shipment_type]
 * @property {string} [tracking]
 * @property {number} [version]
 */

/**
 * @typedef {Object} Success
 * @property {boolean} [success]
 */

/**
 * @typedef {Object} SuccessCreateData
 * @property {string} share_partner_to
 */

/**
 * @typedef {Object} SuccessRemoveMatch
 * @property {string} share_partner_to
 */

/**
 * @typedef {Object} Transaction
 * @property {string} [alternate_key]
 * @property {Object} [client]
 * @property {string} [client_ref]
 * @property {string} [created]
 * @property {number} [decrypted]
 * @property {string} [device_name]
 * @property {Object} [direct_partner]
 * @property {number} [encrypted]
 * @property {string} [end_date]
 * @property {string} [err_code]
 * @property {string} [err_message]
 * @property {string} [id]
 * @property {string} [ip_address]
 * @property {boolean} [is_virtual]
 * @property {string} [key_type]
 * @property {Object} location
 * @property {string} [message_id]
 * @property {string} [method]
 * @property {Object} [partner]
 * @property {string} [reference]
 * @property {string} [serial_number]
 * @property {string} [start_date]
 * @property {boolean} [success]
 * @property {string} [transaction_source]
 */

/**
 * @typedef {Object} TransactionLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} TransactionListMatch
 * @property {string} [alternate_key]
 * @property {Object} [client]
 * @property {string} [client_ref]
 * @property {string} [created]
 * @property {number} [decrypted]
 * @property {string} [device_name]
 * @property {Object} [direct_partner]
 * @property {number} [encrypted]
 * @property {string} [end_date]
 * @property {string} [err_code]
 * @property {string} [err_message]
 * @property {string} [id]
 * @property {string} [ip_address]
 * @property {boolean} [is_virtual]
 * @property {string} [key_type]
 * @property {Object} [location]
 * @property {string} [message_id]
 * @property {string} [method]
 * @property {Object} [partner]
 * @property {string} [reference]
 * @property {string} [serial_number]
 * @property {string} [start_date]
 * @property {boolean} [success]
 * @property {string} [transaction_source]
 */

/**
 * @typedef {Object} TransactionCreateData
 * @property {string} [alternate_key]
 * @property {Object} [client]
 * @property {string} [client_ref]
 * @property {string} [created]
 * @property {number} [decrypted]
 * @property {string} [device_name]
 * @property {Object} [direct_partner]
 * @property {number} [encrypted]
 * @property {string} [end_date]
 * @property {string} [err_code]
 * @property {string} [err_message]
 * @property {string} [id]
 * @property {string} [ip_address]
 * @property {boolean} [is_virtual]
 * @property {string} [key_type]
 * @property {Object} location
 * @property {string} [message_id]
 * @property {string} [method]
 * @property {Object} [partner]
 * @property {string} [reference]
 * @property {string} [serial_number]
 * @property {string} [start_date]
 * @property {boolean} [success]
 * @property {string} [transaction_source]
 */

/**
 * @typedef {Object} UpdateResult
 * @property {Object} [client]
 * @property {string} [email]
 * @property {string} [first_name]
 * @property {string} [id]
 * @property {boolean} [is_active]
 * @property {Object} [kif]
 * @property {string} [last_name]
 * @property {Object} [partner]
 * @property {string} [phone]
 * @property {string} [user_name]
 * @property {Object} [user_role]
 * @property {number} [version]
 */

/**
 * @typedef {Object} UpdateResultListMatch
 * @property {Object} [client]
 * @property {string} [email]
 * @property {string} [first_name]
 * @property {string} [id]
 * @property {boolean} [is_active]
 * @property {Object} [kif]
 * @property {string} [last_name]
 * @property {Object} [partner]
 * @property {string} [phone]
 * @property {string} [user_name]
 * @property {Object} [user_role]
 * @property {number} [version]
 */

/**
 * @typedef {Object} UpdateResultCreateData
 * @property {Object} [client]
 * @property {string} [email]
 * @property {string} [first_name]
 * @property {string} [id]
 * @property {boolean} [is_active]
 * @property {Object} [kif]
 * @property {string} [last_name]
 * @property {Object} [partner]
 * @property {string} [phone]
 * @property {string} [user_name]
 * @property {Object} [user_role]
 * @property {number} [version]
 */

/**
 * @typedef {Object} UpdateResultUpdateData
 * @property {string} id
 */

/**
 * @typedef {Object} User
 * @property {Object} [client]
 * @property {string} [created]
 * @property {string} [email]
 * @property {string} [first_name]
 * @property {string} [id]
 * @property {boolean} [is_active]
 * @property {Object} [kif]
 * @property {string} [last_name]
 * @property {string} [modified]
 * @property {Object} [partner]
 * @property {string} [phone]
 * @property {string} [user_name]
 * @property {Object} [user_role]
 * @property {number} [version]
 */

/**
 * @typedef {Object} UserLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} UserRemoveMatch
 * @property {string} id
 */


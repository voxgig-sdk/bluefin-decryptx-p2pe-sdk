# Typed models for the BluefinDecryptxP2pe SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels. The SDK carries data as string-keyed struct value
# nodes, so each alias is an open string-keyed map; the @typedoc member lists
# document the concrete shapes. Do not edit by hand.

defmodule BluefinDecryptxP2pe.Types do
  @moduledoc """
  Documented shapes for the BluefinDecryptxP2pe SDK entities and operation payloads.

  Every alias resolves to an open string-keyed map because the SDK carries
  data as string-keyed struct value nodes; consult each type's member list for
  the concrete field/param types.
  """

  @typedoc """
  Attestation entity data model.

  Members:
    * `"client"` — map() (optional)
    * `"complete_date"` — String.t() (optional)
    * `"created"` — String.t() (optional)
    * `"device"` — map() (optional)
    * `"id"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"note"` — String.t() (optional)
  """
  @type attestation :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Attestation load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type attestation_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Attestation list.

  Members:
    * `"client"` — map() (optional)
    * `"complete_date"` — String.t() (optional)
    * `"created"` — String.t() (optional)
    * `"device"` — map() (optional)
    * `"id"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"note"` — String.t() (optional)
  """
  @type attestation_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Attestation create.

  Members:
    * `"client"` — map() (optional)
    * `"complete_date"` — String.t() (optional)
    * `"created"` — String.t() (optional)
    * `"device"` — map() (optional)
    * `"id"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"note"` — String.t() (optional)
  """
  @type attestation_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Client entity data model.

  Members:
    * `"contact"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"direct_partner"` — map() (optional)
    * `"id"` — String.t() (optional)
    * `"is_active"` — boolean() (optional)
    * `"location"` — map() (required)
    * `"mid"` — String.t() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"version"` — integer() (optional)
  """
  @type client :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Client load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type client_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Client list.

  Members:
    * `"contact"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"direct_partner"` — map() (optional)
    * `"id"` — String.t() (optional)
    * `"is_active"` — boolean() (optional)
    * `"location"` — map() (optional)
    * `"mid"` — String.t() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"version"` — integer() (optional)
  """
  @type client_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Client create.

  Members:
    * `"contact"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"direct_partner"` — map() (optional)
    * `"id"` — String.t() (optional)
    * `"is_active"` — boolean() (optional)
    * `"location"` — map() (required)
    * `"mid"` — String.t() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"version"` — integer() (optional)
  """
  @type client_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Client remove.

  Members:
    * `"id"` — String.t() (required)
  """
  @type client_remove_match :: %{optional(String.t()) => any()}

  @typedoc """
  CreateResult entity data model.
  """
  @type create_result :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for CreateResult create.

  Members:
    * `"device_type"` — String.t() (required)
    * `"serial_number"` — String.t() (required)
  """
  @type create_result_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Decryption entity data model.

  Members:
    * `"success"` — boolean() (optional)
  """
  @type decryption :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Decryption create.

  Members:
    * `"success"` — boolean() (optional)
  """
  @type decryption_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Device entity data model.

  Members:
    * `"activated_by"` — map() (required)
    * `"activation_date"` — String.t() (optional)
    * `"alternate_key"` — String.t() (optional)
    * `"audit_next_date"` — String.t() (optional)
    * `"audit_notification_date"` — String.t() (optional)
    * `"client"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"created_by"` — map() (required)
    * `"device_build"` — map() (optional)
    * `"device_state"` — map() (optional)
    * `"device_type"` — map() (optional)
    * `"error_counter"` — integer() (optional)
    * `"error_last_date"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"initialized_by"` — map() (required)
    * `"initialized_date"` — String.t() (optional)
    * `"inject_key"` — map() (optional)
    * `"is_virtual"` — boolean() (optional)
    * `"kif"` — map() (optional)
    * `"last_activity_date"` — String.t() (optional)
    * `"location"` — map() (required)
    * `"modified"` — String.t() (optional)
    * `"modified_by"` — map() (required)
    * `"name"` — String.t() (optional)
    * `"note"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"serial_number"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type device :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Device load.

  Members:
    * `"device_type"` — String.t() (optional)
    * `"serial_number"` — String.t() (optional)
    * `"id"` — String.t() (optional)
  """
  @type device_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Device list.

  Members:
    * `"activated_by"` — map() (optional)
    * `"activation_date"` — String.t() (optional)
    * `"alternate_key"` — String.t() (optional)
    * `"audit_next_date"` — String.t() (optional)
    * `"audit_notification_date"` — String.t() (optional)
    * `"client"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"created_by"` — map() (optional)
    * `"device_build"` — map() (optional)
    * `"device_state"` — map() (optional)
    * `"device_type"` — map() (optional)
    * `"error_counter"` — integer() (optional)
    * `"error_last_date"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"initialized_by"` — map() (optional)
    * `"initialized_date"` — String.t() (optional)
    * `"inject_key"` — map() (optional)
    * `"is_virtual"` — boolean() (optional)
    * `"kif"` — map() (optional)
    * `"last_activity_date"` — String.t() (optional)
    * `"location"` — map() (optional)
    * `"modified"` — String.t() (optional)
    * `"modified_by"` — map() (optional)
    * `"name"` — String.t() (optional)
    * `"note"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"serial_number"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type device_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Device create.

  Members:
    * `"activated_by"` — map() (required)
    * `"activation_date"` — String.t() (optional)
    * `"alternate_key"` — String.t() (optional)
    * `"audit_next_date"` — String.t() (optional)
    * `"audit_notification_date"` — String.t() (optional)
    * `"client"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"created_by"` — map() (required)
    * `"device_build"` — map() (optional)
    * `"device_state"` — map() (optional)
    * `"device_type"` — map() (optional)
    * `"error_counter"` — integer() (optional)
    * `"error_last_date"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"initialized_by"` — map() (required)
    * `"initialized_date"` — String.t() (optional)
    * `"inject_key"` — map() (optional)
    * `"is_virtual"` — boolean() (optional)
    * `"kif"` — map() (optional)
    * `"last_activity_date"` — String.t() (optional)
    * `"location"` — map() (required)
    * `"modified"` — String.t() (optional)
    * `"modified_by"` — map() (required)
    * `"name"` — String.t() (optional)
    * `"note"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"serial_number"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type device_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  DeviceBuild entity data model.

  Members:
    * `"app_version"` — String.t() (optional)
    * `"build_number"` — String.t() (optional)
    * `"config_file_name"` — String.t() (optional)
    * `"created"` — String.t() (optional)
    * `"device_type"` — String.t() (optional)
    * `"firmware_version"` — String.t() (optional)
    * `"hardware_version"` — String.t() (optional)
    * `"id"` — integer() (optional)
    * `"is_active"` — boolean() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"note"` — String.t() (optional)
    * `"version"` — integer() (optional)
    * `"white_listing_bin_range"` — String.t() (optional)
    * `"white_listing_used"` — boolean() (optional)
  """
  @type device_build :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for DeviceBuild load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type device_build_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for DeviceBuild list.

  Members:
    * `"app_version"` — String.t() (optional)
    * `"build_number"` — String.t() (optional)
    * `"config_file_name"` — String.t() (optional)
    * `"created"` — String.t() (optional)
    * `"device_type"` — String.t() (optional)
    * `"firmware_version"` — String.t() (optional)
    * `"hardware_version"` — String.t() (optional)
    * `"id"` — integer() (optional)
    * `"is_active"` — boolean() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"note"` — String.t() (optional)
    * `"version"` — integer() (optional)
    * `"white_listing_bin_range"` — String.t() (optional)
    * `"white_listing_used"` — boolean() (optional)
  """
  @type device_build_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  DeviceCustodyDetail entity data model.

  Members:
    * `"complete_date"` — String.t() (optional)
    * `"created"` — String.t() (optional)
    * `"created_by"` — map() (required)
    * `"custodian"` — map() (required)
    * `"device"` — map() (optional)
    * `"id"` — integer() (optional)
    * `"location"` — map() (required)
    * `"modified"` — String.t() (optional)
    * `"modified_by"` — map() (required)
    * `"note"` — String.t() (optional)
    * `"status"` — map() (optional)
    * `"transfer_method"` — map() (optional)
    * `"version"` — integer() (optional)
  """
  @type device_custody_detail :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for DeviceCustodyDetail load.

  Members:
    * `"device_type"` — String.t() (required)
    * `"id"` — String.t() (required)
    * `"serial_number"` — String.t() (required)
  """
  @type device_custody_detail_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  DeviceCustodyList entity data model.

  Members:
    * `"complete_date"` — String.t() (optional)
    * `"created"` — String.t() (optional)
    * `"created_by"` — map() (required)
    * `"custodian"` — map() (required)
    * `"device"` — map() (optional)
    * `"id"` — integer() (optional)
    * `"location"` — map() (required)
    * `"modified"` — String.t() (optional)
    * `"modified_by"` — map() (required)
    * `"note"` — String.t() (optional)
    * `"status"` — map() (optional)
    * `"transfer_method"` — map() (optional)
    * `"version"` — integer() (optional)
  """
  @type device_custody_list :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for DeviceCustodyList list.

  Members:
    * `"device_type"` — String.t() (required)
    * `"serial_number"` — String.t() (required)
  """
  @type device_custody_list_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  DeviceList entity data model.

  Members:
    * `"data"` — list() (optional)
    * `"total"` — integer() (optional)
  """
  @type device_list :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for DeviceList load.

  Members:
    * `"share_partner_to"` — String.t() (required)
  """
  @type device_list_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  DeviceReceiveResult entity data model.

  Members:
    * `"success"` — boolean() (required)
  """
  @type device_receive_result :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for DeviceReceiveResult create.

  Members:
    * `"success"` — boolean() (required)
  """
  @type device_receive_result_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  DeviceRkiActivateResult entity data model.

  Members:
    * `"success"` — boolean() (required)
  """
  @type device_rki_activate_result :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for DeviceRkiActivateResult create.

  Members:
    * `"success"` — boolean() (required)
  """
  @type device_rki_activate_result_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  DeviceState entity data model.

  Members:
    * `"id"` — integer() (optional)
    * `"name"` — String.t() (optional)
  """
  @type device_state :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for DeviceState list.

  Members:
    * `"id"` — integer() (optional)
    * `"name"` — String.t() (optional)
  """
  @type device_state_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  DeviceType entity data model.

  Members:
    * `"created"` — String.t() (optional)
    * `"device_type_mode"` — String.t() (optional)
    * `"hardware_version"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"is_active"` — boolean() (optional)
    * `"manufacturer"` — String.t() (optional)
    * `"model"` — String.t() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"photo_url"` — String.t() (optional)
    * `"product_name"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type device_type :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for DeviceType load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type device_type_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for DeviceType list.

  Members:
    * `"created"` — String.t() (optional)
    * `"device_type_mode"` — String.t() (optional)
    * `"hardware_version"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"is_active"` — boolean() (optional)
    * `"manufacturer"` — String.t() (optional)
    * `"model"` — String.t() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"photo_url"` — String.t() (optional)
    * `"product_name"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type device_type_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  InjectKey entity data model.

  Members:
    * `"created"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"is_active"` — boolean() (optional)
    * `"is_p2_pe"` — boolean() (optional)
    * `"key_type"` — String.t() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type inject_key :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for InjectKey load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type inject_key_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for InjectKey list.

  Members:
    * `"created"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"is_active"` — boolean() (optional)
    * `"is_p2_pe"` — boolean() (optional)
    * `"key_type"` — String.t() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type inject_key_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Kif entity data model.

  Members:
    * `"id"` — integer() (optional)
    * `"name"` — String.t() (optional)
  """
  @type kif :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Kif list.

  Members:
    * `"id"` — integer() (optional)
    * `"name"` — String.t() (optional)
  """
  @type kif_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Location entity data model.

  Members:
    * `"address1"` — String.t() (optional)
    * `"address2"` — String.t() (optional)
    * `"billing_id"` — String.t() (optional)
    * `"city"` — String.t() (optional)
    * `"country"` — String.t() (optional)
    * `"created"` — String.t() (optional)
    * `"custom_reference"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"location_type"` — String.t() (optional)
    * `"mail_address1"` — String.t() (optional)
    * `"mail_address2"` — String.t() (optional)
    * `"mail_city"` — String.t() (optional)
    * `"mail_country"` — String.t() (optional)
    * `"mail_postal_code"` — String.t() (optional)
    * `"mail_state_province"` — String.t() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"name_of_business"` — String.t() (optional)
    * `"note"` — String.t() (optional)
    * `"postal_code"` — String.t() (optional)
    * `"state_province"` — String.t() (optional)
    * `"unique_id"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type location :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Location load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type location_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Location list.

  Members:
    * `"address1"` — String.t() (optional)
    * `"address2"` — String.t() (optional)
    * `"billing_id"` — String.t() (optional)
    * `"city"` — String.t() (optional)
    * `"country"` — String.t() (optional)
    * `"created"` — String.t() (optional)
    * `"custom_reference"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"location_type"` — String.t() (optional)
    * `"mail_address1"` — String.t() (optional)
    * `"mail_address2"` — String.t() (optional)
    * `"mail_city"` — String.t() (optional)
    * `"mail_country"` — String.t() (optional)
    * `"mail_postal_code"` — String.t() (optional)
    * `"mail_state_province"` — String.t() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"name_of_business"` — String.t() (optional)
    * `"note"` — String.t() (optional)
    * `"postal_code"` — String.t() (optional)
    * `"state_province"` — String.t() (optional)
    * `"unique_id"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type location_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Location create.

  Members:
    * `"address1"` — String.t() (optional)
    * `"address2"` — String.t() (optional)
    * `"billing_id"` — String.t() (optional)
    * `"city"` — String.t() (optional)
    * `"country"` — String.t() (optional)
    * `"created"` — String.t() (optional)
    * `"custom_reference"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"location_type"` — String.t() (optional)
    * `"mail_address1"` — String.t() (optional)
    * `"mail_address2"` — String.t() (optional)
    * `"mail_city"` — String.t() (optional)
    * `"mail_country"` — String.t() (optional)
    * `"mail_postal_code"` — String.t() (optional)
    * `"mail_state_province"` — String.t() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"name_of_business"` — String.t() (optional)
    * `"note"` — String.t() (optional)
    * `"postal_code"` — String.t() (optional)
    * `"state_province"` — String.t() (optional)
    * `"unique_id"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type location_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Location remove.

  Members:
    * `"id"` — String.t() (required)
  """
  @type location_remove_match :: %{optional(String.t()) => any()}

  @typedoc """
  Partner entity data model.

  Members:
    * `"billing_id"` — String.t() (optional)
    * `"client_can_order_equipment"` — boolean() (optional)
    * `"contact"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"is_active"` — boolean() (optional)
    * `"location"` — map() (required)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"parent"` — map() (optional)
    * `"partner_id"` — String.t() (optional)
    * `"reference"` — String.t() (optional)
    * `"verification_phrase"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type partner :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Partner load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type partner_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Partner list.

  Members:
    * `"billing_id"` — String.t() (optional)
    * `"client_can_order_equipment"` — boolean() (optional)
    * `"contact"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"is_active"` — boolean() (optional)
    * `"location"` — map() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"parent"` — map() (optional)
    * `"partner_id"` — String.t() (optional)
    * `"reference"` — String.t() (optional)
    * `"verification_phrase"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type partner_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Partner create.

  Members:
    * `"billing_id"` — String.t() (optional)
    * `"client_can_order_equipment"` — boolean() (optional)
    * `"contact"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"is_active"` — boolean() (optional)
    * `"location"` — map() (required)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"parent"` — map() (optional)
    * `"partner_id"` — String.t() (optional)
    * `"reference"` — String.t() (optional)
    * `"verification_phrase"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type partner_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Shipment entity data model.

  Members:
    * `"carrier"` — String.t() (optional)
    * `"client"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"date_received"` — String.t() (optional)
    * `"date_shipped"` — String.t() (optional)
    * `"dc_kif"` — map() (optional)
    * `"id"` — String.t() (optional)
    * `"item"` — list() (optional)
    * `"kif"` — map() (optional)
    * `"modified"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"shipment_type"` — String.t() (optional)
    * `"tracking"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type shipment :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Shipment load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type shipment_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Shipment list.

  Members:
    * `"carrier"` — String.t() (optional)
    * `"client"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"date_received"` — String.t() (optional)
    * `"date_shipped"` — String.t() (optional)
    * `"dc_kif"` — map() (optional)
    * `"id"` — String.t() (optional)
    * `"item"` — list() (optional)
    * `"kif"` — map() (optional)
    * `"modified"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"shipment_type"` — String.t() (optional)
    * `"tracking"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type shipment_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Shipment create.

  Members:
    * `"carrier"` — String.t() (optional)
    * `"client"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"date_received"` — String.t() (optional)
    * `"date_shipped"` — String.t() (optional)
    * `"dc_kif"` — map() (optional)
    * `"id"` — String.t() (optional)
    * `"item"` — list() (optional)
    * `"kif"` — map() (optional)
    * `"modified"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"shipment_type"` — String.t() (optional)
    * `"tracking"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type shipment_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Success entity data model.

  Members:
    * `"success"` — boolean() (optional)
  """
  @type success :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Success create.

  Members:
    * `"share_partner_to"` — String.t() (required)
  """
  @type success_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Success remove.

  Members:
    * `"share_partner_to"` — String.t() (required)
  """
  @type success_remove_match :: %{optional(String.t()) => any()}

  @typedoc """
  Transaction entity data model.

  Members:
    * `"alternate_key"` — String.t() (optional)
    * `"client"` — map() (optional)
    * `"client_ref"` — String.t() (optional)
    * `"created"` — String.t() (optional)
    * `"decrypted"` — integer() (optional)
    * `"device_name"` — String.t() (optional)
    * `"direct_partner"` — map() (optional)
    * `"encrypted"` — integer() (optional)
    * `"end_date"` — String.t() (optional)
    * `"err_code"` — String.t() (optional)
    * `"err_message"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"ip_address"` — String.t() (optional)
    * `"is_virtual"` — boolean() (optional)
    * `"key_type"` — String.t() (optional)
    * `"location"` — map() (required)
    * `"message_id"` — String.t() (optional)
    * `"method"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"reference"` — String.t() (optional)
    * `"serial_number"` — String.t() (optional)
    * `"start_date"` — String.t() (optional)
    * `"success"` — boolean() (optional)
    * `"transaction_source"` — String.t() (optional)
  """
  @type transaction :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Transaction load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type transaction_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Transaction list.

  Members:
    * `"alternate_key"` — String.t() (optional)
    * `"client"` — map() (optional)
    * `"client_ref"` — String.t() (optional)
    * `"created"` — String.t() (optional)
    * `"decrypted"` — integer() (optional)
    * `"device_name"` — String.t() (optional)
    * `"direct_partner"` — map() (optional)
    * `"encrypted"` — integer() (optional)
    * `"end_date"` — String.t() (optional)
    * `"err_code"` — String.t() (optional)
    * `"err_message"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"ip_address"` — String.t() (optional)
    * `"is_virtual"` — boolean() (optional)
    * `"key_type"` — String.t() (optional)
    * `"location"` — map() (optional)
    * `"message_id"` — String.t() (optional)
    * `"method"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"reference"` — String.t() (optional)
    * `"serial_number"` — String.t() (optional)
    * `"start_date"` — String.t() (optional)
    * `"success"` — boolean() (optional)
    * `"transaction_source"` — String.t() (optional)
  """
  @type transaction_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Transaction create.

  Members:
    * `"alternate_key"` — String.t() (optional)
    * `"client"` — map() (optional)
    * `"client_ref"` — String.t() (optional)
    * `"created"` — String.t() (optional)
    * `"decrypted"` — integer() (optional)
    * `"device_name"` — String.t() (optional)
    * `"direct_partner"` — map() (optional)
    * `"encrypted"` — integer() (optional)
    * `"end_date"` — String.t() (optional)
    * `"err_code"` — String.t() (optional)
    * `"err_message"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"ip_address"` — String.t() (optional)
    * `"is_virtual"` — boolean() (optional)
    * `"key_type"` — String.t() (optional)
    * `"location"` — map() (required)
    * `"message_id"` — String.t() (optional)
    * `"method"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"reference"` — String.t() (optional)
    * `"serial_number"` — String.t() (optional)
    * `"start_date"` — String.t() (optional)
    * `"success"` — boolean() (optional)
    * `"transaction_source"` — String.t() (optional)
  """
  @type transaction_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  UpdateResult entity data model.

  Members:
    * `"client"` — map() (optional)
    * `"email"` — String.t() (optional)
    * `"first_name"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"is_active"` — boolean() (optional)
    * `"kif"` — map() (optional)
    * `"last_name"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"phone"` — String.t() (optional)
    * `"user_name"` — String.t() (optional)
    * `"user_role"` — map() (optional)
    * `"version"` — integer() (optional)
  """
  @type update_result :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for UpdateResult list.

  Members:
    * `"client"` — map() (optional)
    * `"email"` — String.t() (optional)
    * `"first_name"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"is_active"` — boolean() (optional)
    * `"kif"` — map() (optional)
    * `"last_name"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"phone"` — String.t() (optional)
    * `"user_name"` — String.t() (optional)
    * `"user_role"` — map() (optional)
    * `"version"` — integer() (optional)
  """
  @type update_result_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for UpdateResult create.

  Members:
    * `"client"` — map() (optional)
    * `"email"` — String.t() (optional)
    * `"first_name"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"is_active"` — boolean() (optional)
    * `"kif"` — map() (optional)
    * `"last_name"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"phone"` — String.t() (optional)
    * `"user_name"` — String.t() (optional)
    * `"user_role"` — map() (optional)
    * `"version"` — integer() (optional)
  """
  @type update_result_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for UpdateResult update.

  Members:
    * `"id"` — String.t() (required)
  """
  @type update_result_update_data :: %{optional(String.t()) => any()}

  @typedoc """
  User entity data model.

  Members:
    * `"client"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"email"` — String.t() (optional)
    * `"first_name"` — String.t() (optional)
    * `"id"` — String.t() (optional)
    * `"is_active"` — boolean() (optional)
    * `"kif"` — map() (optional)
    * `"last_name"` — String.t() (optional)
    * `"modified"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"phone"` — String.t() (optional)
    * `"user_name"` — String.t() (optional)
    * `"user_role"` — map() (optional)
    * `"version"` — integer() (optional)
  """
  @type user :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for User load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type user_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for User remove.

  Members:
    * `"id"` — String.t() (required)
  """
  @type user_remove_match :: %{optional(String.t()) => any()}

end

# BluefinDecryptxP2pe OCaml SDK Reference

Complete API reference for the BluefinDecryptxP2pe OCaml SDK.


## Sdk_client

### Constructor

```ocaml
open Voxgig_struct
open Sdk_helpers

let client = Sdk_client.make options
```

Create a new SDK client instance from a `value` options map. Use
`Sdk_client.make0 ()` for defaults.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `value` | SDK configuration options (a Map). |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides (e.g. custom fetch). |


### Static constructors

#### `Sdk_client.test testopts sdkopts`

Create a test client with mock features active. Both arguments may be `Noval`
(`Sdk_client.test ()` uses defaults, `Sdk_client.test_with` takes explicit
options).

```ocaml
let client = Sdk_client.test ()
```


### Instance functions

#### `Sdk_client.attestation client entopts : entity_obj`

Create a `Attestation` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.client client entopts : entity_obj`

Create a `Client` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.create_result client entopts : entity_obj`

Create a `CreateResult` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.decryption client entopts : entity_obj`

Create a `Decryption` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.device client entopts : entity_obj`

Create a `Device` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.device_build client entopts : entity_obj`

Create a `DeviceBuild` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.device_custody_detail client entopts : entity_obj`

Create a `DeviceCustodyDetail` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.device_custody_list client entopts : entity_obj`

Create a `DeviceCustodyList` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.device_list client entopts : entity_obj`

Create a `DeviceList` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.device_receive_result client entopts : entity_obj`

Create a `DeviceReceiveResult` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.device_rki_activate_result client entopts : entity_obj`

Create a `DeviceRkiActivateResult` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.device_state client entopts : entity_obj`

Create a `DeviceState` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.device_type client entopts : entity_obj`

Create a `DeviceType` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.inject_key client entopts : entity_obj`

Create a `InjectKey` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.kif client entopts : entity_obj`

Create a `Kif` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.location client entopts : entity_obj`

Create a `Location` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.partner client entopts : entity_obj`

Create a `Partner` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.shipment client entopts : entity_obj`

Create a `Shipment` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.success client entopts : entity_obj`

Create a `Success` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.transaction client entopts : entity_obj`

Create a `Transaction` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.update_result client entopts : entity_obj`

Create a `UpdateResult` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.user client entopts : entity_obj`

Create a `User` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.direct client fetchargs : value`

Make a direct HTTP request to any API endpoint. Returns a result `value` map
with `ok`, `status`, `headers`, and `data` (or `err` on failure). This
escape hatch never raises — branch on `getp result "ok"`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `value` | Request body (Maps are JSON-serialized). |

**Returns:** a result `value` map.

#### `Sdk_client.prepare client fetchargs : value`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises
on error.


---

## Attestation

```ocaml
let attestation = Sdk_client.attestation client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `value map` | No |  |
| `complete_date` | `string` | No |  |
| `created` | `string` | No |  |
| `device` | `value map` | No |  |
| `id` | `string` | No |  |
| `name` | `string` | No |  |
| `note` | `string` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.attestation client Noval).e_create (jo [
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.attestation client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.attestation client Noval).e_load (jo [("id", (Str "attestation_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Attestation` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Client

```ocaml
let client = Sdk_client.client client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `value map` | No |  |
| `created` | `string` | No |  |
| `direct_partner` | `value map` | No |  |
| `id` | `string` | No |  |
| `is_active` | `bool` | No |  |
| `location` | `value map` | Yes |  |
| `mid` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `partner` | `value map` | No |  |
| `version` | `int` | No |  |

### Field Usage by Operation

| Field | load | list | create | remove |
| --- | --- | --- | --- | --- |
| `contact` | - | Yes | - | - |
| `created` | - | - | - | - |
| `direct_partner` | - | - | - | - |
| `id` | - | - | - | - |
| `is_active` | - | - | - | - |
| `location` | - | - | - | - |
| `mid` | - | - | - | - |
| `modified` | - | - | - | - |
| `name` | - | - | - | - |
| `partner` | - | - | - | - |
| `version` | - | - | - | - |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.client client Noval).e_create (jo [
    ("location", (empty_map ()));  (* value map *)
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.client client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.client client Noval).e_load (jo [("id", (Str "client_id"))]) Noval
```

#### `e_remove reqmatch ctrl : value`

Remove the entity matching the given criteria. Raises on error.

```ocaml
let result = (Sdk_client.client client Noval).e_remove (jo [("id", (Str "client_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Client` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## CreateResult

```ocaml
let create_result = Sdk_client.create_result client Noval
```

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.create_result client Noval).e_create (jo [
    ("device_type", (Str "example_device_type"));  (* string *)
    ("serial_number", (Str "example_serial_number"));  (* string *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `CreateResult` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Decryption

```ocaml
let decryption = Sdk_client.decryption client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.decryption client Noval).e_create (jo [
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Decryption` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Device

```ocaml
let device = Sdk_client.device client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activated_by` | `value map` | Yes |  |
| `activation_date` | `string` | No |  |
| `alternate_key` | `string` | No |  |
| `audit_next_date` | `string` | No |  |
| `audit_notification_date` | `string` | No |  |
| `client` | `value map` | No |  |
| `created` | `string` | No |  |
| `created_by` | `value map` | Yes |  |
| `device_build` | `value map` | No |  |
| `device_state` | `value map` | No |  |
| `device_type` | `value map` | No |  |
| `error_counter` | `int` | No |  |
| `error_last_date` | `string` | No |  |
| `id` | `string` | No |  |
| `initialized_by` | `value map` | Yes |  |
| `initialized_date` | `string` | No |  |
| `inject_key` | `value map` | No |  |
| `is_virtual` | `bool` | No |  |
| `kif` | `value map` | No |  |
| `last_activity_date` | `string` | No |  |
| `location` | `value map` | Yes |  |
| `modified` | `string` | No |  |
| `modified_by` | `value map` | Yes |  |
| `name` | `string` | No |  |
| `note` | `string` | No |  |
| `partner` | `value map` | No |  |
| `serial_number` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.device client Noval).e_create (jo [
    ("activated_by", (empty_map ()));  (* value map *)
    ("created_by", (empty_map ()));  (* value map *)
    ("initialized_by", (empty_map ()));  (* value map *)
    ("location", (empty_map ()));  (* value map *)
    ("modified_by", (empty_map ()));  (* value map *)
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.device client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.device client Noval).e_load (jo [("id", (Str "device_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Device` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## DeviceBuild

```ocaml
let device_build = Sdk_client.device_build client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_version` | `string` | No |  |
| `build_number` | `string` | No |  |
| `config_file_name` | `string` | No |  |
| `created` | `string` | No |  |
| `device_type` | `string` | No |  |
| `firmware_version` | `string` | No |  |
| `hardware_version` | `string` | No |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `note` | `string` | No |  |
| `version` | `int` | No |  |
| `white_listing_bin_range` | `string` | No |  |
| `white_listing_used` | `bool` | No |  |

### Operations

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.device_build client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.device_build client Noval).e_load (jo [("id", (Str "device_build_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `DeviceBuild` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## DeviceCustodyDetail

```ocaml
let device_custody_detail = Sdk_client.device_custody_detail client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `complete_date` | `string` | No |  |
| `created` | `string` | No |  |
| `created_by` | `value map` | Yes |  |
| `custodian` | `value map` | Yes |  |
| `device` | `value map` | No |  |
| `id` | `int` | No |  |
| `location` | `value map` | Yes |  |
| `modified` | `string` | No |  |
| `modified_by` | `value map` | Yes |  |
| `note` | `string` | No |  |
| `status` | `value map` | No |  |
| `transfer_method` | `value map` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.device_custody_detail client Noval).e_load (jo [("id", (Str "device_custody_detail_id")); ("device_type", (Str "device_type")); ("serial_number", (Str "serial_number"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `DeviceCustodyDetail` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## DeviceCustodyList

```ocaml
let device_custody_list = Sdk_client.device_custody_list client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `complete_date` | `string` | No |  |
| `created` | `string` | No |  |
| `created_by` | `value map` | Yes |  |
| `custodian` | `value map` | Yes |  |
| `device` | `value map` | No |  |
| `id` | `int` | No |  |
| `location` | `value map` | Yes |  |
| `modified` | `string` | No |  |
| `modified_by` | `value map` | Yes |  |
| `note` | `string` | No |  |
| `status` | `value map` | No |  |
| `transfer_method` | `value map` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.device_custody_list client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `DeviceCustodyList` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## DeviceList

```ocaml
let device_list = Sdk_client.device_list client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `value list` | No |  |
| `total` | `int` | No |  |

### Operations

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.device_list client Noval).e_load (jo [("share_partner_to", (Str "share_partner_to"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `DeviceList` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## DeviceReceiveResult

```ocaml
let device_receive_result = Sdk_client.device_receive_result client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.device_receive_result client Noval).e_create (jo [
    ("success", (Bool true));  (* bool *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `DeviceReceiveResult` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## DeviceRkiActivateResult

```ocaml
let device_rki_activate_result = Sdk_client.device_rki_activate_result client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.device_rki_activate_result client Noval).e_create (jo [
    ("success", (Bool true));  (* bool *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `DeviceRkiActivateResult` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## DeviceState

```ocaml
let device_state = Sdk_client.device_state client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int` | No |  |
| `name` | `string` | No |  |

### Operations

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.device_state client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `DeviceState` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## DeviceType

```ocaml
let device_type = Sdk_client.device_type client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `string` | No |  |
| `device_type_mode` | `string` | No |  |
| `hardware_version` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `bool` | No |  |
| `manufacturer` | `string` | No |  |
| `model` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `photo_url` | `string` | No |  |
| `product_name` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.device_type client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.device_type client Noval).e_load (jo [("id", (Str "device_type_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `DeviceType` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## InjectKey

```ocaml
let inject_key = Sdk_client.inject_key client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `bool` | No |  |
| `is_p2_pe` | `bool` | No |  |
| `key_type` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.inject_key client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.inject_key client Noval).e_load (jo [("id", (Str "inject_key_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `InjectKey` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Kif

```ocaml
let kif = Sdk_client.kif client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int` | No |  |
| `name` | `string` | No |  |

### Operations

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.kif client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Kif` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Location

```ocaml
let location = Sdk_client.location client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address1` | `string` | No |  |
| `address2` | `string` | No |  |
| `billing_id` | `string` | No |  |
| `city` | `string` | No |  |
| `country` | `string` | No |  |
| `created` | `string` | No |  |
| `custom_reference` | `string` | No |  |
| `id` | `string` | No |  |
| `location_type` | `string` | No |  |
| `mail_address1` | `string` | No |  |
| `mail_address2` | `string` | No |  |
| `mail_city` | `string` | No |  |
| `mail_country` | `string` | No |  |
| `mail_postal_code` | `string` | No |  |
| `mail_state_province` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `name_of_business` | `string` | No |  |
| `note` | `string` | No |  |
| `postal_code` | `string` | No |  |
| `state_province` | `string` | No |  |
| `unique_id` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.location client Noval).e_create (jo [
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.location client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.location client Noval).e_load (jo [("id", (Str "location_id"))]) Noval
```

#### `e_remove reqmatch ctrl : value`

Remove the entity matching the given criteria. Raises on error.

```ocaml
let result = (Sdk_client.location client Noval).e_remove (jo [("id", (Str "location_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Location` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Partner

```ocaml
let partner = Sdk_client.partner client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `client_can_order_equipment` | `bool` | No |  |
| `contact` | `value map` | No |  |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `bool` | No |  |
| `location` | `value map` | Yes |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `value map` | No |  |
| `partner_id` | `string` | No |  |
| `reference` | `string` | No |  |
| `verification_phrase` | `string` | No |  |
| `version` | `int` | No |  |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `billing_id` | - | - | - |
| `client_can_order_equipment` | - | - | - |
| `contact` | - | Yes | - |
| `created` | - | - | - |
| `id` | - | - | - |
| `is_active` | - | - | - |
| `location` | - | - | - |
| `modified` | - | - | - |
| `name` | - | - | - |
| `parent` | - | - | - |
| `partner_id` | - | - | - |
| `reference` | - | - | - |
| `verification_phrase` | - | - | - |
| `version` | - | - | - |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.partner client Noval).e_create (jo [
    ("location", (empty_map ()));  (* value map *)
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.partner client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.partner client Noval).e_load (jo [("id", (Str "partner_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Partner` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Shipment

```ocaml
let shipment = Sdk_client.shipment client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `string` | No |  |
| `client` | `value map` | No |  |
| `created` | `string` | No |  |
| `date_received` | `string` | No |  |
| `date_shipped` | `string` | No |  |
| `dc_kif` | `value map` | No |  |
| `id` | `string` | No |  |
| `item` | `value list` | No |  |
| `kif` | `value map` | No |  |
| `modified` | `string` | No |  |
| `partner` | `value map` | No |  |
| `shipment_type` | `string` | No |  |
| `tracking` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.shipment client Noval).e_create (jo [
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.shipment client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.shipment client Noval).e_load (jo [("id", (Str "shipment_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Shipment` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Success

```ocaml
let success = Sdk_client.success client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.success client Noval).e_create (jo [
    ("share_partner_to", (Str "example_share_partner_to"));  (* string *)
]) Noval
```

#### `e_remove reqmatch ctrl : value`

Remove the entity matching the given criteria. Raises on error.

```ocaml
let result = (Sdk_client.success client Noval).e_remove (jo [("share_partner_to", (Str "share_partner_to"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Success` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Transaction

```ocaml
let transaction = Sdk_client.transaction client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternate_key` | `string` | No |  |
| `client` | `value map` | No |  |
| `client_ref` | `string` | No |  |
| `created` | `string` | No |  |
| `decrypted` | `int` | No |  |
| `device_name` | `string` | No |  |
| `direct_partner` | `value map` | No |  |
| `encrypted` | `int` | No |  |
| `end_date` | `string` | No |  |
| `err_code` | `string` | No |  |
| `err_message` | `string` | No |  |
| `id` | `string` | No |  |
| `ip_address` | `string` | No |  |
| `is_virtual` | `bool` | No |  |
| `key_type` | `string` | No |  |
| `location` | `value map` | Yes |  |
| `message_id` | `string` | No |  |
| `method` | `string` | No |  |
| `partner` | `value map` | No |  |
| `reference` | `string` | No |  |
| `serial_number` | `string` | No |  |
| `start_date` | `string` | No |  |
| `success` | `bool` | No |  |
| `transaction_source` | `string` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.transaction client Noval).e_create (jo [
    ("location", (empty_map ()));  (* value map *)
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.transaction client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.transaction client Noval).e_load (jo [("id", (Str "transaction_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Transaction` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## UpdateResult

```ocaml
let update_result = Sdk_client.update_result client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `value map` | No |  |
| `email` | `string` | No |  |
| `first_name` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `bool` | No |  |
| `kif` | `value map` | No |  |
| `last_name` | `string` | No |  |
| `partner` | `value map` | No |  |
| `phone` | `string` | No |  |
| `user_name` | `string` | No |  |
| `user_role` | `value map` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.update_result client Noval).e_create (jo [
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.update_result client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_update reqdata ctrl : value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```ocaml
let result = (Sdk_client.update_result client Noval).e_update (jo [
    ("id", (Str "id"));
    (* Fields to update *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `UpdateResult` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## User

```ocaml
let user = Sdk_client.user client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `value map` | No |  |
| `created` | `string` | No |  |
| `email` | `string` | No |  |
| `first_name` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `bool` | No |  |
| `kif` | `value map` | No |  |
| `last_name` | `string` | No |  |
| `modified` | `string` | No |  |
| `partner` | `value map` | No |  |
| `phone` | `string` | No |  |
| `user_name` | `string` | No |  |
| `user_role` | `value map` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.user client Noval).e_load (jo [("id", (Str "user_id"))]) Noval
```

#### `e_remove reqmatch ctrl : value`

Remove the entity matching the given criteria. Raises on error.

```ocaml
let result = (Sdk_client.user client Noval).e_remove (jo [("id", (Str "user_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `User` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ocaml
let client = Sdk_client.make (jo [
    ("feature", jo [
        ("test", jo [("active", Bool true)]);
    ]);
])
```


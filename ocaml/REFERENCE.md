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
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `device` | `value map` | No |  |
| `id` | `string` | No |  |
| `name` | `string` | No |  |
| `notes` | `string` | No |  |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.attestation client Noval).e_create (jo [
]) Noval
let result_data = result.e_data_get ()
```

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.attestation client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
```

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.attestation client Noval).e_load (jo [("id", (Str "attestation_id"))]) Noval
let result_data = result.e_data_get ()
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
| `directPartner` | `value map` | No |  |
| `id` | `string` | No |  |
| `isActive` | `bool` | No |  |
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
| `directPartner` | - | - | - | - |
| `id` | - | - | - | - |
| `isActive` | - | - | - | - |
| `location` | - | - | - | - |
| `mid` | - | - | - | - |
| `modified` | - | - | - | - |
| `name` | - | - | - | - |
| `partner` | - | - | - | - |
| `version` | - | - | - | - |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.client client Noval).e_create (jo [
    ("location", (empty_map ()));  (* value map *)
]) Noval
let result_data = result.e_data_get ()
```

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.client client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
```

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.client client Noval).e_load (jo [("id", (Str "client_id"))]) Noval
let result_data = result.e_data_get ()
```

#### `e_remove reqmatch ctrl : entity_obj`

Remove the entity matching the given criteria. Resolves to the ENTITY, marked deleted (`e_deleted`); it keeps the data it held. Raises on error.

```ocaml
let result = (Sdk_client.client client Noval).e_remove (jo [("id", (Str "client_id"))]) Noval
let result_data = result.e_data_get ()
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

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.create_result client Noval).e_create (jo [
    ("device_type", (Str "example_device_type"));  (* string *)
    ("serial_number", (Str "example_serial_number"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
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

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.decryption client Noval).e_create (jo [
]) Noval
let result_data = result.e_data_get ()
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
| `activatedBy` | `value map` | Yes |  |
| `activationDate` | `string` | No |  |
| `alternateKey` | `string` | No |  |
| `auditNextDate` | `string` | No |  |
| `auditNotificationDate` | `string` | No |  |
| `client` | `value map` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `value map` | Yes |  |
| `deviceBuild` | `value map` | No |  |
| `deviceState` | `value map` | No |  |
| `deviceType` | `value map` | No |  |
| `errorCounter` | `int` | No |  |
| `errorLastDate` | `string` | No |  |
| `id` | `string` | No |  |
| `initializedBy` | `value map` | Yes |  |
| `initializedDate` | `string` | No |  |
| `injectKey` | `value map` | No |  |
| `isVirtual` | `bool` | No |  |
| `kif` | `value map` | No |  |
| `lastActivityDate` | `string` | No |  |
| `location` | `value map` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `value map` | Yes |  |
| `name` | `string` | No |  |
| `notes` | `string` | No |  |
| `partner` | `value map` | No |  |
| `serialNumber` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.device client Noval).e_create (jo [
    ("activatedBy", (empty_map ()));  (* value map *)
    ("createdBy", (empty_map ()));  (* value map *)
    ("initializedBy", (empty_map ()));  (* value map *)
    ("location", (empty_map ()));  (* value map *)
    ("modifiedBy", (empty_map ()));  (* value map *)
]) Noval
let result_data = result.e_data_get ()
```

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.device client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
```

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.device client Noval).e_load (jo [("id", (Str "device_id"))]) Noval
let result_data = result.e_data_get ()
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
| `appVersion` | `string` | No |  |
| `buildNumber` | `string` | No |  |
| `configFileName` | `string` | No |  |
| `created` | `string` | No |  |
| `deviceType` | `string` | No |  |
| `firmwareVersion` | `string` | No |  |
| `hardwareVersion` | `string` | No |  |
| `id` | `int` | No |  |
| `isActive` | `bool` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `notes` | `string` | No |  |
| `version` | `int` | No |  |
| `whiteListingBinRanges` | `string` | No |  |
| `whiteListingUsed` | `bool` | No |  |

### Operations

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.device_build client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
```

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.device_build client Noval).e_load (jo [("id", (Str "device_build_id"))]) Noval
let result_data = result.e_data_get ()
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
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `value map` | Yes |  |
| `custodian` | `value map` | Yes |  |
| `device` | `value map` | No |  |
| `id` | `int` | No |  |
| `location` | `value map` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `value map` | Yes |  |
| `notes` | `string` | No |  |
| `status` | `value map` | No |  |
| `transferMethod` | `value map` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.device_custody_detail client Noval).e_load (jo [("id", (Str "device_custody_detail_id")); ("device_type", (Str "device_type")); ("serial_number", (Str "serial_number"))]) Noval
let result_data = result.e_data_get ()
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
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `value map` | Yes |  |
| `custodian` | `value map` | Yes |  |
| `device` | `value map` | No |  |
| `id` | `int` | No |  |
| `location` | `value map` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `value map` | Yes |  |
| `notes` | `string` | No |  |
| `status` | `value map` | No |  |
| `transferMethod` | `value map` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.device_custody_list client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
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

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.device_list client Noval).e_load (jo [("share_partner_to", (Str "share_partner_to"))]) Noval
let result_data = result.e_data_get ()
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

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.device_receive_result client Noval).e_create (jo [
    ("success", (Bool true));  (* bool *)
]) Noval
let result_data = result.e_data_get ()
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

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.device_rki_activate_result client Noval).e_create (jo [
    ("success", (Bool true));  (* bool *)
]) Noval
let result_data = result.e_data_get ()
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

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.device_state client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
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
| `deviceTypeMode` | `string` | No |  |
| `hardwareVersion` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `bool` | No |  |
| `manufacturer` | `string` | No |  |
| `model` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `photoUrl` | `string` | No |  |
| `productName` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.device_type client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
```

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.device_type client Noval).e_load (jo [("id", (Str "device_type_id"))]) Noval
let result_data = result.e_data_get ()
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
| `isActive` | `bool` | No |  |
| `isP2PE` | `bool` | No |  |
| `keyType` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.inject_key client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
```

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.inject_key client Noval).e_load (jo [("id", (Str "inject_key_id"))]) Noval
let result_data = result.e_data_get ()
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

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.kif client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
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
| `billingId` | `string` | No |  |
| `city` | `string` | No |  |
| `country` | `string` | No |  |
| `created` | `string` | No |  |
| `customReference` | `string` | No |  |
| `id` | `string` | No |  |
| `locationType` | `string` | No |  |
| `mailAddress1` | `string` | No |  |
| `mailAddress2` | `string` | No |  |
| `mailCity` | `string` | No |  |
| `mailCountry` | `string` | No |  |
| `mailPostalCode` | `string` | No |  |
| `mailStateProvince` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `nameOfBusiness` | `string` | No |  |
| `notes` | `string` | No |  |
| `postalCode` | `string` | No |  |
| `stateProvince` | `string` | No |  |
| `uniqueId` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.location client Noval).e_create (jo [
]) Noval
let result_data = result.e_data_get ()
```

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.location client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
```

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.location client Noval).e_load (jo [("id", (Str "location_id"))]) Noval
let result_data = result.e_data_get ()
```

#### `e_remove reqmatch ctrl : entity_obj`

Remove the entity matching the given criteria. Resolves to the ENTITY, marked deleted (`e_deleted`); it keeps the data it held. Raises on error.

```ocaml
let result = (Sdk_client.location client Noval).e_remove (jo [("id", (Str "location_id"))]) Noval
let result_data = result.e_data_get ()
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
| `billingId` | `string` | No |  |
| `clientCanOrderEquipment` | `bool` | No |  |
| `contact` | `value map` | No |  |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `bool` | No |  |
| `location` | `value map` | Yes |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `value map` | No |  |
| `partnerId` | `string` | No |  |
| `reference` | `string` | No |  |
| `verificationPhrase` | `string` | No |  |
| `version` | `int` | No |  |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `billingId` | - | - | - |
| `clientCanOrderEquipment` | - | - | - |
| `contact` | - | Yes | - |
| `created` | - | - | - |
| `id` | - | - | - |
| `isActive` | - | - | - |
| `location` | - | - | - |
| `modified` | - | - | - |
| `name` | - | - | - |
| `parent` | - | - | - |
| `partnerId` | - | - | - |
| `reference` | - | - | - |
| `verificationPhrase` | - | - | - |
| `version` | - | - | - |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.partner client Noval).e_create (jo [
    ("location", (empty_map ()));  (* value map *)
]) Noval
let result_data = result.e_data_get ()
```

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.partner client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
```

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.partner client Noval).e_load (jo [("id", (Str "partner_id"))]) Noval
let result_data = result.e_data_get ()
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
| `dateReceived` | `string` | No |  |
| `dateShipped` | `string` | No |  |
| `dcKif` | `value map` | No |  |
| `id` | `string` | No |  |
| `items` | `value list` | No |  |
| `kif` | `value map` | No |  |
| `modified` | `string` | No |  |
| `partner` | `value map` | No |  |
| `shipmentType` | `string` | No |  |
| `tracking` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.shipment client Noval).e_create (jo [
]) Noval
let result_data = result.e_data_get ()
```

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.shipment client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
```

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.shipment client Noval).e_load (jo [("id", (Str "shipment_id"))]) Noval
let result_data = result.e_data_get ()
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

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.success client Noval).e_create (jo [
    ("share_partner_to", (Str "example_share_partner_to"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
```

#### `e_remove reqmatch ctrl : entity_obj`

Remove the entity matching the given criteria. Resolves to the ENTITY, marked deleted (`e_deleted`); it keeps the data it held. Raises on error.

```ocaml
let result = (Sdk_client.success client Noval).e_remove (jo [("share_partner_to", (Str "share_partner_to"))]) Noval
let result_data = result.e_data_get ()
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
| `alternateKey` | `string` | No |  |
| `client` | `value map` | No |  |
| `clientRef` | `string` | No |  |
| `created` | `string` | No |  |
| `decrypted` | `int` | No |  |
| `deviceName` | `string` | No |  |
| `directPartner` | `value map` | No |  |
| `encrypted` | `int` | No |  |
| `endDate` | `string` | No |  |
| `errCode` | `string` | No |  |
| `errMessage` | `string` | No |  |
| `id` | `string` | No |  |
| `ipAddress` | `string` | No |  |
| `isVirtual` | `bool` | No |  |
| `keyType` | `string` | No |  |
| `location` | `value map` | Yes |  |
| `messageId` | `string` | No |  |
| `method` | `string` | No |  |
| `partner` | `value map` | No |  |
| `reference` | `string` | No |  |
| `serialNumber` | `string` | No |  |
| `startDate` | `string` | No |  |
| `success` | `bool` | No |  |
| `transactionSource` | `string` | No |  |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.transaction client Noval).e_create (jo [
    ("location", (empty_map ()));  (* value map *)
]) Noval
let result_data = result.e_data_get ()
```

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.transaction client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
```

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.transaction client Noval).e_load (jo [("id", (Str "transaction_id"))]) Noval
let result_data = result.e_data_get ()
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
| `firstName` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `bool` | No |  |
| `kif` | `value map` | No |  |
| `lastName` | `string` | No |  |
| `partner` | `value map` | No |  |
| `phone` | `string` | No |  |
| `userName` | `string` | No |  |
| `userRole` | `value map` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.update_result client Noval).e_create (jo [
]) Noval
let result_data = result.e_data_get ()
```

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.update_result client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
```

#### `e_update reqdata ctrl : entity_obj`

Update an existing entity. The data must include the entity `id`. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.update_result client Noval).e_update (jo [
    ("id", (Str "id"));
    (* Fields to update *)
]) Noval
let result_data = result.e_data_get ()
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
| `firstName` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `bool` | No |  |
| `kif` | `value map` | No |  |
| `lastName` | `string` | No |  |
| `modified` | `string` | No |  |
| `partner` | `value map` | No |  |
| `phone` | `string` | No |  |
| `userName` | `string` | No |  |
| `userRole` | `value map` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.user client Noval).e_load (jo [("id", (Str "user_id"))]) Noval
let result_data = result.e_data_get ()
```

#### `e_remove reqmatch ctrl : entity_obj`

Remove the entity matching the given criteria. Resolves to the ENTITY, marked deleted (`e_deleted`); it keeps the data it held. Raises on error.

```ocaml
let result = (Sdk_client.user client Noval).e_remove (jo [("id", (Str "user_id"))]) Noval
let result_data = result.e_data_get ()
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


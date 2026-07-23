# BluefinDecryptxP2pe OCaml SDK



The OCaml SDK for the BluefinDecryptxP2pe API — an entity-oriented client
following idiomatic OCaml conventions (a dependency-free library that compiles
with the stock `ocamlc`).

The SDK exposes the API as capitalised, semantic **Entities** — for example `Sdk_client.attestation client Noval` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to the opam registry. Install it from the
GitHub release tag (`ocaml/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases))
or from a source checkout. The SDK is dependency-free and compiles with the
stock `ocamlc` — no opam packages, no dune:

```bash
cd ocaml && make build
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ocaml
open Voxgig_struct
open Sdk_helpers

let client = Sdk_client.make (jo [("apikey", Str (Sys.getenv "BLUEFIN_DECRYPTX_P2PE_APIKEY"))])
```

### 2. List attestation records

`e_list` returns a `List` value of records (each a `Map`) and raises on
error — iterate it directly.

```ocaml
(try
   let attestations = (Sdk_client.attestation client Noval).e_list (empty_map ()) Noval in
   (match attestations with
    | List items -> List.iter (fun r -> print_endline (stringify r)) !items
    | _ -> ())
 with Sdk_error.E err -> Printf.eprintf "list failed: %s\n" (Sdk_error.message err))
```

### 3. Load a device_custody_detail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`e_load` returns the bare record (a `Map`) and raises on error.

```ocaml
(try
   let device_custody_detail = (Sdk_client.device_custody_detail client Noval).e_load (jo [("device_type", (Str "example_device_type")); ("serial_number", (Str "example_serial_number")); ("id", (Str "example_id"))]) Noval in
   print_endline (stringify device_custody_detail)
 with Sdk_error.E err -> Printf.eprintf "load failed: %s\n" (Sdk_error.message err))
```

### 4. Create, update, and remove

```ocaml
(* Create — returns the bare created record (a Map) *)
let created = (Sdk_client.attestation client Noval).e_create (jo [("client", (empty_map ())); ("complete_date", (Str "example_complete_date"))]) Noval in
ignore created;

```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const devicetypes = await client.DeviceType().list()
  console.log(devicetypes)
} catch (err) {
  console.error('list failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ocaml
let result = Sdk_client.direct client (jo [
    ("path", Str "/api/resource/{id}");
    ("method", Str "GET");
    ("params", jo [("id", Str "example")]);
]) in
(match getp result "ok" with
 | Bool true ->
   print_endline (stringify (getp result "status"));  (* 200 *)
   print_endline (stringify (getp result "data"))      (* response body *)
 | _ ->
   (* A non-2xx response carries status + data (the error body); a transport
      failure carries err instead. Read whichever is present. *)
   print_endline (stringify (getp result "status"));
   print_endline (stringify (getp result "err")))
```

### Prepare a request without sending it

```ocaml
(* prepare returns the fetch definition and raises on error. *)
let fetchdef = Sdk_client.prepare client (jo [
    ("path", Str "/api/resource/{id}");
    ("method", Str "DELETE");
    ("params", jo [("id", Str "example")]);
]) in
print_endline (stringify (getp fetchdef "url"));
print_endline (stringify (getp fetchdef "method"));
print_endline (stringify (getp fetchdef "headers"))
```

### Use test mode

Create a mock client for unit testing — no server required:

```ocaml
let () =
  let client = Sdk_client.test () in
  (* Entity ops return the bare record and raise on error. *)
  let device_type = (Sdk_client.device_type client Noval).e_list (empty_map ()) Noval in
  print_endline (stringify device_type)  (* the mock response record *)
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```ocaml
let mock_fetch = Func (fun _ _args _ _ ->
    jo [("status", Num 200.); ("statusText", Str "OK"); ("headers", empty_map ());
        ("json", json_thunk (jo [("id", Str "mock01")]))]) in
let client = Sdk_client.make (jo [
    ("base", Str "http://localhost:8080");
    ("system", jo [("fetch", mock_fetch)]);
]) in
ignore client
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd ocaml && make test
```


## Reference

### Sdk_client

```ocaml
open Voxgig_struct
open Sdk_helpers

let client = Sdk_client.make options
```

Creates a new SDK client from a `value` options map. Use `Sdk_client.make0 ()`
for defaults.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `extend` | `list` | Additional feature instances to load. |
| `system` | `map` | System overrides (e.g. custom `fetch` function). |

### Sdk_client.test

```ocaml
let client = Sdk_client.test_with testopts sdkopts
```

Creates a test-mode client with mock transport. Both arguments may be `Noval`
(`Sdk_client.test ()` uses defaults).

### Sdk_client functions

| Function | Signature | Description |
| --- | --- | --- |
| `make` | `value -> sdk_client` | Construct a client from options. |
| `make0` | `unit -> sdk_client` | Construct a client with defaults. |
| `prepare` | `sdk_client -> value -> value` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `sdk_client -> value -> value` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `attestation` | `sdk_client -> value -> entity_obj` | An Attestation entity accessor. |
| `client` | `sdk_client -> value -> entity_obj` | A Client entity accessor. |
| `create_result` | `sdk_client -> value -> entity_obj` | A CreateResult entity accessor. |
| `decryption` | `sdk_client -> value -> entity_obj` | A Decryption entity accessor. |
| `device` | `sdk_client -> value -> entity_obj` | A Device entity accessor. |
| `device_build` | `sdk_client -> value -> entity_obj` | A DeviceBuild entity accessor. |
| `device_custody_detail` | `sdk_client -> value -> entity_obj` | A DeviceCustodyDetail entity accessor. |
| `device_custody_list` | `sdk_client -> value -> entity_obj` | A DeviceCustodyList entity accessor. |
| `device_list` | `sdk_client -> value -> entity_obj` | A DeviceList entity accessor. |
| `device_receive_result` | `sdk_client -> value -> entity_obj` | A DeviceReceiveResult entity accessor. |
| `device_rki_activate_result` | `sdk_client -> value -> entity_obj` | A DeviceRkiActivateResult entity accessor. |
| `device_state` | `sdk_client -> value -> entity_obj` | A DeviceState entity accessor. |
| `device_type` | `sdk_client -> value -> entity_obj` | A DeviceType entity accessor. |
| `inject_key` | `sdk_client -> value -> entity_obj` | An InjectKey entity accessor. |
| `kif` | `sdk_client -> value -> entity_obj` | A Kif entity accessor. |
| `location` | `sdk_client -> value -> entity_obj` | A Location entity accessor. |
| `partner` | `sdk_client -> value -> entity_obj` | A Partner entity accessor. |
| `shipment` | `sdk_client -> value -> entity_obj` | A Shipment entity accessor. |
| `success` | `sdk_client -> value -> entity_obj` | A Success entity accessor. |
| `transaction` | `sdk_client -> value -> entity_obj` | A Transaction entity accessor. |
| `update_result` | `sdk_client -> value -> entity_obj` | An UpdateResult entity accessor. |
| `user` | `sdk_client -> value -> entity_obj` | An User entity accessor. |

### Entity interface

All entities are `entity_obj` records sharing the same fields.

| Field | Signature | Description |
| --- | --- | --- |
| `e_load` | `value -> value -> value` | Load a single entity by match criteria. Raises on error. |
| `e_list` | `value -> value -> value` | List entities matching the criteria (returns a List). Raises on error. |
| `e_create` | `value -> value -> value` | Create a new entity. Raises on error. |
| `e_update` | `value -> value -> value` | Update an existing entity. Raises on error. |
| `e_remove` | `value -> value -> value` | Remove an entity. Raises on error. |
| `e_data_get` | `unit -> value` | Get entity data. |
| `e_data_set` | `value -> unit` | Set entity data. |
| `e_match_get` | `unit -> value` | Get entity match criteria. |
| `e_match_set` | `value -> unit` | Set entity match criteria. |
| `e_make` | `unit -> entity_obj` | Create a new instance with the same options. |
| `e_name` | `string` | The entity name. |

### Result shape

Entity operations return the bare result value (a `Map` for single-entity
ops, a `List` for `e_list`) and raise `Sdk_error.E` on error. Wrap calls
in `try`/`with` to handle failures.

The `direct` escape hatch never raises — it returns a result `value` map
you branch on via `getp result "ok"`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Bool` | `Bool true` if the HTTP status is 2xx. |
| `status` | `Num` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `value` | Parsed JSON response body. |

On error, `ok` is `Bool false` and `err` carries the error value.

### Entities

#### Attestation

| Field | Description |
| --- | --- |
| `client` |  |
| `complete_date` |  |
| `created` |  |
| `device` |  |
| `id` |  |
| `name` |  |
| `note` |  |

Operations: Create, List, Load.

API path: `/attestations`

#### Client

| Field | Description |
| --- | --- |
| `contact` |  |
| `created` |  |
| `direct_partner` |  |
| `id` |  |
| `is_active` |  |
| `location` |  |
| `mid` |  |
| `modified` |  |
| `name` |  |
| `partner` |  |
| `version` |  |

Operations: Create, List, Load, Remove.

API path: `/clients`

#### CreateResult

| Field | Description |
| --- | --- |

Operations: Create.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### Decryption

| Field | Description |
| --- | --- |
| `success` |  |

Operations: Create.

API path: `/decryption`

#### Device

| Field | Description |
| --- | --- |
| `activated_by` |  |
| `activation_date` |  |
| `alternate_key` |  |
| `audit_next_date` |  |
| `audit_notification_date` |  |
| `client` |  |
| `created` |  |
| `created_by` |  |
| `device_build` |  |
| `device_state` |  |
| `device_type` |  |
| `error_counter` |  |
| `error_last_date` |  |
| `id` |  |
| `initialized_by` |  |
| `initialized_date` |  |
| `inject_key` |  |
| `is_virtual` |  |
| `kif` |  |
| `last_activity_date` |  |
| `location` |  |
| `modified` |  |
| `modified_by` |  |
| `name` |  |
| `note` |  |
| `partner` |  |
| `serial_number` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/devices`

#### DeviceBuild

| Field | Description |
| --- | --- |
| `app_version` |  |
| `build_number` |  |
| `config_file_name` |  |
| `created` |  |
| `device_type` |  |
| `firmware_version` |  |
| `hardware_version` |  |
| `id` |  |
| `is_active` |  |
| `modified` |  |
| `name` |  |
| `note` |  |
| `version` |  |
| `white_listing_bin_range` |  |
| `white_listing_used` |  |

Operations: List, Load.

API path: `/deviceBuilds`

#### DeviceCustodyDetail

| Field | Description |
| --- | --- |
| `complete_date` |  |
| `created` |  |
| `created_by` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modified_by` |  |
| `note` |  |
| `status` |  |
| `transfer_method` |  |
| `version` |  |

Operations: Load.

API path: `/devices/{serialNumber}/{deviceType}/custody/{id}`

#### DeviceCustodyList

| Field | Description |
| --- | --- |
| `complete_date` |  |
| `created` |  |
| `created_by` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modified_by` |  |
| `note` |  |
| `status` |  |
| `transfer_method` |  |
| `version` |  |

Operations: List.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### DeviceList

| Field | Description |
| --- | --- |
| `data` |  |
| `total` |  |

Operations: Load.

API path: `/virtualDevices/{sharePartnerTo}`

#### DeviceReceiveResult

| Field | Description |
| --- | --- |
| `success` |  |

Operations: Create.

API path: `/devices/receive`

#### DeviceRkiActivateResult

| Field | Description |
| --- | --- |
| `success` |  |

Operations: Create.

API path: `/devices/rki/activate`

#### DeviceState

| Field | Description |
| --- | --- |
| `id` |  |
| `name` |  |

Operations: List.

API path: `/deviceStates`

#### DeviceType

| Field | Description |
| --- | --- |
| `created` |  |
| `device_type_mode` |  |
| `hardware_version` |  |
| `id` |  |
| `is_active` |  |
| `manufacturer` |  |
| `model` |  |
| `modified` |  |
| `name` |  |
| `photo_url` |  |
| `product_name` |  |
| `version` |  |

Operations: List, Load.

API path: `/deviceTypes`

#### InjectKey

| Field | Description |
| --- | --- |
| `created` |  |
| `id` |  |
| `is_active` |  |
| `is_p2_pe` |  |
| `key_type` |  |
| `modified` |  |
| `name` |  |
| `version` |  |

Operations: List, Load.

API path: `/injectKeys`

#### Kif

| Field | Description |
| --- | --- |
| `id` |  |
| `name` |  |

Operations: List.

API path: `/kifs`

#### Location

| Field | Description |
| --- | --- |
| `address1` |  |
| `address2` |  |
| `billing_id` |  |
| `city` |  |
| `country` |  |
| `created` |  |
| `custom_reference` |  |
| `id` |  |
| `location_type` |  |
| `mail_address1` |  |
| `mail_address2` |  |
| `mail_city` |  |
| `mail_country` |  |
| `mail_postal_code` |  |
| `mail_state_province` |  |
| `modified` |  |
| `name` |  |
| `name_of_business` |  |
| `note` |  |
| `postal_code` |  |
| `state_province` |  |
| `unique_id` |  |
| `version` |  |

Operations: Create, List, Load, Remove.

API path: `/locations`

#### Partner

| Field | Description |
| --- | --- |
| `billing_id` |  |
| `client_can_order_equipment` |  |
| `contact` |  |
| `created` |  |
| `id` |  |
| `is_active` |  |
| `location` |  |
| `modified` |  |
| `name` |  |
| `parent` |  |
| `partner_id` |  |
| `reference` |  |
| `verification_phrase` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/partners`

#### Shipment

| Field | Description |
| --- | --- |
| `carrier` |  |
| `client` |  |
| `created` |  |
| `date_received` |  |
| `date_shipped` |  |
| `dc_kif` |  |
| `id` |  |
| `item` |  |
| `kif` |  |
| `modified` |  |
| `partner` |  |
| `shipment_type` |  |
| `tracking` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/shipments`

#### Success

| Field | Description |
| --- | --- |
| `success` |  |

Operations: Create, Remove.

API path: `/virtualDevices/{sharePartnerTo}`

#### Transaction

| Field | Description |
| --- | --- |
| `alternate_key` |  |
| `client` |  |
| `client_ref` |  |
| `created` |  |
| `decrypted` |  |
| `device_name` |  |
| `direct_partner` |  |
| `encrypted` |  |
| `end_date` |  |
| `err_code` |  |
| `err_message` |  |
| `id` |  |
| `ip_address` |  |
| `is_virtual` |  |
| `key_type` |  |
| `location` |  |
| `message_id` |  |
| `method` |  |
| `partner` |  |
| `reference` |  |
| `serial_number` |  |
| `start_date` |  |
| `success` |  |
| `transaction_source` |  |

Operations: Create, List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `client` |  |
| `email` |  |
| `first_name` |  |
| `id` |  |
| `is_active` |  |
| `kif` |  |
| `last_name` |  |
| `partner` |  |
| `phone` |  |
| `user_name` |  |
| `user_role` |  |
| `version` |  |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` |  |
| `created` |  |
| `email` |  |
| `first_name` |  |
| `id` |  |
| `is_active` |  |
| `kif` |  |
| `last_name` |  |
| `modified` |  |
| `partner` |  |
| `phone` |  |
| `user_name` |  |
| `user_role` |  |
| `version` |  |

Operations: Load, Remove.

API path: `/users/{id}`



## Entities


### Attestation

Create an instance: `let attestation = Sdk_client.attestation client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `value map` |  |
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `device` | `value map` |  |
| `id` | `string` |  |
| `name` | `string` |  |
| `note` | `string` |  |

#### Example: Load

```ocaml
let attestation = (Sdk_client.attestation client Noval).e_load (jo [("id", (Str "attestation_id"))]) Noval
```

#### Example: List

```ocaml
let attestations = (Sdk_client.attestation client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let attestation = (Sdk_client.attestation client Noval).e_create (jo [
]) Noval
```


### Client

Create an instance: `let client = Sdk_client.client client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |
| `e_remove reqmatch ctrl` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `value map` |  |
| `created` | `string` |  |
| `direct_partner` | `value map` |  |
| `id` | `string` |  |
| `is_active` | `bool` |  |
| `location` | `value map` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `value map` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
let client = (Sdk_client.client client Noval).e_load (jo [("id", (Str "client_id"))]) Noval
```

#### Example: List

```ocaml
let clients = (Sdk_client.client client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let client = (Sdk_client.client client Noval).e_create (jo [
    ("location", (empty_map ()));  (* value map *)
]) Noval
```


### CreateResult

Create an instance: `let create_result = Sdk_client.create_result client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Example: Create

```ocaml
let create_result = (Sdk_client.create_result client Noval).e_create (jo [
    ("device_type", (Str "example_device_type"));  (* string *)
    ("serial_number", (Str "example_serial_number"));  (* string *)
]) Noval
```


### Decryption

Create an instance: `let decryption = Sdk_client.decryption client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```ocaml
let decryption = (Sdk_client.decryption client Noval).e_create (jo [
]) Noval
```


### Device

Create an instance: `let device = Sdk_client.device client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activated_by` | `value map` |  |
| `activation_date` | `string` |  |
| `alternate_key` | `string` |  |
| `audit_next_date` | `string` |  |
| `audit_notification_date` | `string` |  |
| `client` | `value map` |  |
| `created` | `string` |  |
| `created_by` | `value map` |  |
| `device_build` | `value map` |  |
| `device_state` | `value map` |  |
| `device_type` | `value map` |  |
| `error_counter` | `int` |  |
| `error_last_date` | `string` |  |
| `id` | `string` |  |
| `initialized_by` | `value map` |  |
| `initialized_date` | `string` |  |
| `inject_key` | `value map` |  |
| `is_virtual` | `bool` |  |
| `kif` | `value map` |  |
| `last_activity_date` | `string` |  |
| `location` | `value map` |  |
| `modified` | `string` |  |
| `modified_by` | `value map` |  |
| `name` | `string` |  |
| `note` | `string` |  |
| `partner` | `value map` |  |
| `serial_number` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
let device = (Sdk_client.device client Noval).e_load (jo [("id", (Str "device_id"))]) Noval
```

#### Example: List

```ocaml
let devices = (Sdk_client.device client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let device = (Sdk_client.device client Noval).e_create (jo [
    ("activated_by", (empty_map ()));  (* value map *)
    ("created_by", (empty_map ()));  (* value map *)
    ("initialized_by", (empty_map ()));  (* value map *)
    ("location", (empty_map ()));  (* value map *)
    ("modified_by", (empty_map ()));  (* value map *)
]) Noval
```


### DeviceBuild

Create an instance: `let device_build = Sdk_client.device_build client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_version` | `string` |  |
| `build_number` | `string` |  |
| `config_file_name` | `string` |  |
| `created` | `string` |  |
| `device_type` | `string` |  |
| `firmware_version` | `string` |  |
| `hardware_version` | `string` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `note` | `string` |  |
| `version` | `int` |  |
| `white_listing_bin_range` | `string` |  |
| `white_listing_used` | `bool` |  |

#### Example: Load

```ocaml
let device_build = (Sdk_client.device_build client Noval).e_load (jo [("id", (Str "device_build_id"))]) Noval
```

#### Example: List

```ocaml
let device_builds = (Sdk_client.device_build client Noval).e_list (empty_map ()) Noval
```


### DeviceCustodyDetail

Create an instance: `let device_custody_detail = Sdk_client.device_custody_detail client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `created_by` | `value map` |  |
| `custodian` | `value map` |  |
| `device` | `value map` |  |
| `id` | `int` |  |
| `location` | `value map` |  |
| `modified` | `string` |  |
| `modified_by` | `value map` |  |
| `note` | `string` |  |
| `status` | `value map` |  |
| `transfer_method` | `value map` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
let device_custody_detail = (Sdk_client.device_custody_detail client Noval).e_load (jo [("id", (Str "device_custody_detail_id")); ("device_type", (Str "device_type")); ("serial_number", (Str "serial_number"))]) Noval
```


### DeviceCustodyList

Create an instance: `let device_custody_list = Sdk_client.device_custody_list client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `created_by` | `value map` |  |
| `custodian` | `value map` |  |
| `device` | `value map` |  |
| `id` | `int` |  |
| `location` | `value map` |  |
| `modified` | `string` |  |
| `modified_by` | `value map` |  |
| `note` | `string` |  |
| `status` | `value map` |  |
| `transfer_method` | `value map` |  |
| `version` | `int` |  |

#### Example: List

```ocaml
let device_custody_lists = (Sdk_client.device_custody_list client Noval).e_list (empty_map ()) Noval
```


### DeviceList

Create an instance: `let device_list = Sdk_client.device_list client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `value list` |  |
| `total` | `int` |  |

#### Example: Load

```ocaml
let device_list = (Sdk_client.device_list client Noval).e_load (jo [("share_partner_to", (Str "share_partner_to"))]) Noval
```


### DeviceReceiveResult

Create an instance: `let device_receive_result = Sdk_client.device_receive_result client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```ocaml
let device_receive_result = (Sdk_client.device_receive_result client Noval).e_create (jo [
    ("success", (Bool true));  (* bool *)
]) Noval
```


### DeviceRkiActivateResult

Create an instance: `let device_rki_activate_result = Sdk_client.device_rki_activate_result client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```ocaml
let device_rki_activate_result = (Sdk_client.device_rki_activate_result client Noval).e_create (jo [
    ("success", (Bool true));  (* bool *)
]) Noval
```


### DeviceState

Create an instance: `let device_state = Sdk_client.device_state client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` |  |
| `name` | `string` |  |

#### Example: List

```ocaml
let device_states = (Sdk_client.device_state client Noval).e_list (empty_map ()) Noval
```


### DeviceType

Create an instance: `let device_type = Sdk_client.device_type client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `string` |  |
| `device_type_mode` | `string` |  |
| `hardware_version` | `string` |  |
| `id` | `string` |  |
| `is_active` | `bool` |  |
| `manufacturer` | `string` |  |
| `model` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `photo_url` | `string` |  |
| `product_name` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
let device_type = (Sdk_client.device_type client Noval).e_load (jo [("id", (Str "device_type_id"))]) Noval
```

#### Example: List

```ocaml
let device_types = (Sdk_client.device_type client Noval).e_list (empty_map ()) Noval
```


### InjectKey

Create an instance: `let inject_key = Sdk_client.inject_key client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `string` |  |
| `id` | `string` |  |
| `is_active` | `bool` |  |
| `is_p2_pe` | `bool` |  |
| `key_type` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
let inject_key = (Sdk_client.inject_key client Noval).e_load (jo [("id", (Str "inject_key_id"))]) Noval
```

#### Example: List

```ocaml
let inject_keys = (Sdk_client.inject_key client Noval).e_list (empty_map ()) Noval
```


### Kif

Create an instance: `let kif = Sdk_client.kif client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` |  |
| `name` | `string` |  |

#### Example: List

```ocaml
let kifs = (Sdk_client.kif client Noval).e_list (empty_map ()) Noval
```


### Location

Create an instance: `let location = Sdk_client.location client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |
| `e_remove reqmatch ctrl` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address1` | `string` |  |
| `address2` | `string` |  |
| `billing_id` | `string` |  |
| `city` | `string` |  |
| `country` | `string` |  |
| `created` | `string` |  |
| `custom_reference` | `string` |  |
| `id` | `string` |  |
| `location_type` | `string` |  |
| `mail_address1` | `string` |  |
| `mail_address2` | `string` |  |
| `mail_city` | `string` |  |
| `mail_country` | `string` |  |
| `mail_postal_code` | `string` |  |
| `mail_state_province` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `name_of_business` | `string` |  |
| `note` | `string` |  |
| `postal_code` | `string` |  |
| `state_province` | `string` |  |
| `unique_id` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
let location = (Sdk_client.location client Noval).e_load (jo [("id", (Str "location_id"))]) Noval
```

#### Example: List

```ocaml
let locations = (Sdk_client.location client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let location = (Sdk_client.location client Noval).e_create (jo [
]) Noval
```


### Partner

Create an instance: `let partner = Sdk_client.partner client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `client_can_order_equipment` | `bool` |  |
| `contact` | `value map` |  |
| `created` | `string` |  |
| `id` | `string` |  |
| `is_active` | `bool` |  |
| `location` | `value map` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `value map` |  |
| `partner_id` | `string` |  |
| `reference` | `string` |  |
| `verification_phrase` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
let partner = (Sdk_client.partner client Noval).e_load (jo [("id", (Str "partner_id"))]) Noval
```

#### Example: List

```ocaml
let partners = (Sdk_client.partner client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let partner = (Sdk_client.partner client Noval).e_create (jo [
    ("location", (empty_map ()));  (* value map *)
]) Noval
```


### Shipment

Create an instance: `let shipment = Sdk_client.shipment client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `string` |  |
| `client` | `value map` |  |
| `created` | `string` |  |
| `date_received` | `string` |  |
| `date_shipped` | `string` |  |
| `dc_kif` | `value map` |  |
| `id` | `string` |  |
| `item` | `value list` |  |
| `kif` | `value map` |  |
| `modified` | `string` |  |
| `partner` | `value map` |  |
| `shipment_type` | `string` |  |
| `tracking` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
let shipment = (Sdk_client.shipment client Noval).e_load (jo [("id", (Str "shipment_id"))]) Noval
```

#### Example: List

```ocaml
let shipments = (Sdk_client.shipment client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let shipment = (Sdk_client.shipment client Noval).e_create (jo [
]) Noval
```


### Success

Create an instance: `let success = Sdk_client.success client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_remove reqmatch ctrl` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```ocaml
let success = (Sdk_client.success client Noval).e_create (jo [
    ("share_partner_to", (Str "example_share_partner_to"));  (* string *)
]) Noval
```


### Transaction

Create an instance: `let transaction = Sdk_client.transaction client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternate_key` | `string` |  |
| `client` | `value map` |  |
| `client_ref` | `string` |  |
| `created` | `string` |  |
| `decrypted` | `int` |  |
| `device_name` | `string` |  |
| `direct_partner` | `value map` |  |
| `encrypted` | `int` |  |
| `end_date` | `string` |  |
| `err_code` | `string` |  |
| `err_message` | `string` |  |
| `id` | `string` |  |
| `ip_address` | `string` |  |
| `is_virtual` | `bool` |  |
| `key_type` | `string` |  |
| `location` | `value map` |  |
| `message_id` | `string` |  |
| `method` | `string` |  |
| `partner` | `value map` |  |
| `reference` | `string` |  |
| `serial_number` | `string` |  |
| `start_date` | `string` |  |
| `success` | `bool` |  |
| `transaction_source` | `string` |  |

#### Example: Load

```ocaml
let transaction = (Sdk_client.transaction client Noval).e_load (jo [("id", (Str "transaction_id"))]) Noval
```

#### Example: List

```ocaml
let transactions = (Sdk_client.transaction client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let transaction = (Sdk_client.transaction client Noval).e_create (jo [
    ("location", (empty_map ()));  (* value map *)
]) Noval
```


### UpdateResult

Create an instance: `let update_result = Sdk_client.update_result client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_update reqdata ctrl` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `value map` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `string` |  |
| `is_active` | `bool` |  |
| `kif` | `value map` |  |
| `last_name` | `string` |  |
| `partner` | `value map` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `value map` |  |
| `version` | `int` |  |

#### Example: List

```ocaml
let update_results = (Sdk_client.update_result client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let update_result = (Sdk_client.update_result client Noval).e_create (jo [
]) Noval
```


### User

Create an instance: `let user = Sdk_client.user client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |
| `e_remove reqmatch ctrl` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `value map` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `string` |  |
| `is_active` | `bool` |  |
| `kif` | `value map` |  |
| `last_name` | `string` |  |
| `modified` | `string` |  |
| `partner` | `value map` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `value map` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
let user = (Sdk_client.user client Noval).e_load (jo [("id", (Str "user_id"))]) Noval
```


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as `value`

The OCaml SDK uses a single dynamic `value` type throughout rather than a
typed record per entity. `value` is the vendored voxgig struct port (a
JSON-shaped variant: `Str`, `Num`, `Bool`, `List`, `Map`, `Null`,
`Noval`). This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with the `jo` / `ja` helpers and read fields back with
`getp`; use `to_map` to safely coerce a value to a map.

### Module structure

```
ocaml/
├── sdk_client.ml               -- Main SDK client (constructors + accessors)
├── sdk_config.ml               -- Embedded API config + feature factory
├── sdk_error.ml                -- Branded error re-exports
├── sdk_entity_*.ml             -- Per-entity implementations (one each)
├── sdk_types.ml                -- Core pipeline types
├── sdk_helpers.ml              -- jo / ja / getp and friends
├── sdk_runtime.ml              -- Operation pipeline runner
├── sdk_features.ml             -- Built-in features (base, test, log)
├── utility/                    -- Vendored voxgig struct port
└── test/                       -- Test suites
```

The public surface lives in `Sdk_client` (the constructors and per-entity
accessors); `Sdk_helpers` carries the `jo` / `ja` / `getp` value
helpers. Open the runtime modules directly only when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const devicetype = client.DeviceType()
await devicetype.list()

// devicetype.data() now returns the devicetype data from the last `list`
// devicetype.match() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.

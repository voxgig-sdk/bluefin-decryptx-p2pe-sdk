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

`e_list` resolves to one ENTITY per record and raises on error. Read a
record with `e_data_get`.

```ocaml
(try
   let attestations = (Sdk_client.attestation client Noval).e_list (empty_map ()) Noval in
   List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) attestations
 with Sdk_error.E err -> Printf.eprintf "list failed: %s\n" (Sdk_error.message err))
```

### 3. Load a device_custody_detail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`e_load` resolves to the ENTITY and raises on error; `e_data_get` gives the
record.

```ocaml
(try
   let device_custody_detail = (Sdk_client.device_custody_detail client Noval).e_load (jo [("device_type", (Str "example_device_type")); ("serial_number", (Str "example_serial_number")); ("id", (Str "example_id"))]) Noval in
   print_endline (stringify (device_custody_detail.e_data_get ()))
 with Sdk_error.E err -> Printf.eprintf "load failed: %s\n" (Sdk_error.message err))
```

### 4. Create, update, and remove

```ocaml
(* Create — resolves to the ENTITY; e_data_get gives the record *)
let created = (Sdk_client.attestation client Noval).e_create (jo [("client", (empty_map ())); ("completeDate", (Str "example_completeDate"))]) Noval in
print_endline (stringify (created.e_data_get ()));

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
  (* Entity ops resolve to the ENTITY (list: one per record) and raise on error. *)
  let device_types = (Sdk_client.device_type client Noval).e_list (empty_map ()) Noval in
  List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) device_types  (* the mock records *)
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
| `e_load` | `value -> value -> entity_obj` | Load a single entity by match criteria. Resolves to the entity. Raises on error. |
| `e_list` | `value -> value -> entity_obj list` | List entities matching the criteria. Resolves to one entity per record. Raises on error. |
| `e_create` | `value -> value -> entity_obj` | Create a new entity. Resolves to the entity. Raises on error. |
| `e_update` | `value -> value -> entity_obj` | Update an existing entity. Resolves to the entity. Raises on error. |
| `e_remove` | `value -> value -> entity_obj` | Remove an entity. Resolves to the entity, marked deleted. Raises on error. |
| `e_data_get` | `unit -> value` | Get entity data. |
| `e_data_set` | `value -> unit` | Set entity data. |
| `e_match_get` | `unit -> value` | Get entity match criteria. |
| `e_match_set` | `value -> unit` | Set entity match criteria. |
| `e_make` | `unit -> entity_obj` | Create a new instance with the same options. |
| `e_name` | `string` | The entity name. |

### Result shape

Entity operations resolve to the ENTITY, not the raw record — `e_list` to
one entity per record — and raise `Sdk_error.E` on error. The record is
reached through `e_data_get`, which returns the entity's data container.
`e_remove` resolves to the entity marked deleted (`e_deleted`); it keeps the
data it held. Wrap calls in `try`/`with` to handle failures.

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
| `completeDate` |  |
| `created` |  |
| `device` |  |
| `id` |  |
| `name` |  |
| `notes` |  |

Operations: Create, List, Load.

API path: `/attestations`

#### Client

| Field | Description |
| --- | --- |
| `contact` |  |
| `created` |  |
| `directPartner` |  |
| `id` |  |
| `isActive` |  |
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
| `activatedBy` |  |
| `activationDate` |  |
| `alternateKey` |  |
| `auditNextDate` |  |
| `auditNotificationDate` |  |
| `client` |  |
| `created` |  |
| `createdBy` |  |
| `deviceBuild` |  |
| `deviceState` |  |
| `deviceType` |  |
| `errorCounter` |  |
| `errorLastDate` |  |
| `id` |  |
| `initializedBy` |  |
| `initializedDate` |  |
| `injectKey` |  |
| `isVirtual` |  |
| `kif` |  |
| `lastActivityDate` |  |
| `location` |  |
| `modified` |  |
| `modifiedBy` |  |
| `name` |  |
| `notes` |  |
| `partner` |  |
| `serialNumber` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/devices`

#### DeviceBuild

| Field | Description |
| --- | --- |
| `appVersion` |  |
| `buildNumber` |  |
| `configFileName` |  |
| `created` |  |
| `deviceType` |  |
| `firmwareVersion` |  |
| `hardwareVersion` |  |
| `id` |  |
| `isActive` |  |
| `modified` |  |
| `name` |  |
| `notes` |  |
| `version` |  |
| `whiteListingBinRanges` |  |
| `whiteListingUsed` |  |

Operations: List, Load.

API path: `/deviceBuilds`

#### DeviceCustodyDetail

| Field | Description |
| --- | --- |
| `completeDate` |  |
| `created` |  |
| `createdBy` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modifiedBy` |  |
| `notes` |  |
| `status` |  |
| `transferMethod` |  |
| `version` |  |

Operations: Load.

API path: `/devices/{serialNumber}/{deviceType}/custody/{id}`

#### DeviceCustodyList

| Field | Description |
| --- | --- |
| `completeDate` |  |
| `created` |  |
| `createdBy` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modifiedBy` |  |
| `notes` |  |
| `status` |  |
| `transferMethod` |  |
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
| `deviceTypeMode` |  |
| `hardwareVersion` |  |
| `id` |  |
| `isActive` |  |
| `manufacturer` |  |
| `model` |  |
| `modified` |  |
| `name` |  |
| `photoUrl` |  |
| `productName` |  |
| `version` |  |

Operations: List, Load.

API path: `/deviceTypes`

#### InjectKey

| Field | Description |
| --- | --- |
| `created` |  |
| `id` |  |
| `isActive` |  |
| `isP2PE` |  |
| `keyType` |  |
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
| `billingId` |  |
| `city` |  |
| `country` |  |
| `created` |  |
| `customReference` |  |
| `id` |  |
| `locationType` |  |
| `mailAddress1` |  |
| `mailAddress2` |  |
| `mailCity` |  |
| `mailCountry` |  |
| `mailPostalCode` |  |
| `mailStateProvince` |  |
| `modified` |  |
| `name` |  |
| `nameOfBusiness` |  |
| `notes` |  |
| `postalCode` |  |
| `stateProvince` |  |
| `uniqueId` |  |
| `version` |  |

Operations: Create, List, Load, Remove.

API path: `/locations`

#### Partner

| Field | Description |
| --- | --- |
| `billingId` |  |
| `clientCanOrderEquipment` |  |
| `contact` |  |
| `created` |  |
| `id` |  |
| `isActive` |  |
| `location` |  |
| `modified` |  |
| `name` |  |
| `parent` |  |
| `partnerId` |  |
| `reference` |  |
| `verificationPhrase` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/partners`

#### Shipment

| Field | Description |
| --- | --- |
| `carrier` |  |
| `client` |  |
| `created` |  |
| `dateReceived` |  |
| `dateShipped` |  |
| `dcKif` |  |
| `id` |  |
| `items` |  |
| `kif` |  |
| `modified` |  |
| `partner` |  |
| `shipmentType` |  |
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
| `alternateKey` |  |
| `client` |  |
| `clientRef` |  |
| `created` |  |
| `decrypted` |  |
| `deviceName` |  |
| `directPartner` |  |
| `encrypted` |  |
| `endDate` |  |
| `errCode` |  |
| `errMessage` |  |
| `id` |  |
| `ipAddress` |  |
| `isVirtual` |  |
| `keyType` |  |
| `location` |  |
| `messageId` |  |
| `method` |  |
| `partner` |  |
| `reference` |  |
| `serialNumber` |  |
| `startDate` |  |
| `success` |  |
| `transactionSource` |  |

Operations: Create, List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `client` |  |
| `email` |  |
| `firstName` |  |
| `id` |  |
| `isActive` |  |
| `kif` |  |
| `lastName` |  |
| `partner` |  |
| `phone` |  |
| `userName` |  |
| `userRole` |  |
| `version` |  |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` |  |
| `created` |  |
| `email` |  |
| `firstName` |  |
| `id` |  |
| `isActive` |  |
| `kif` |  |
| `lastName` |  |
| `modified` |  |
| `partner` |  |
| `phone` |  |
| `userName` |  |
| `userRole` |  |
| `version` |  |

Operations: Load, Remove.

API path: `/users/{id}`



## Entities


### Attestation

Create an instance: `let attestation = Sdk_client.attestation client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `value map` |  |
| `completeDate` | `string` |  |
| `created` | `string` |  |
| `device` | `value map` |  |
| `id` | `string` |  |
| `name` | `string` |  |
| `notes` | `string` |  |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let attestation = (Sdk_client.attestation client Noval).e_load (jo [("id", (Str "attestation_id"))]) Noval
let attestation_data = attestation.e_data_get ()
```

#### Example: List

```ocaml
(* One ENTITY per record. *)
let attestations = (Sdk_client.attestation client Noval).e_list (empty_map ()) Noval
let attestation_datas = List.map (fun e -> e.e_data_get ()) attestations
```

#### Example: Create

```ocaml
let attestation = (Sdk_client.attestation client Noval).e_create (jo [
]) Noval
let attestation_data = attestation.e_data_get ()
```


### Client

Create an instance: `let client = Sdk_client.client client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |
| `e_remove reqmatch ctrl` | Remove the matching entity. Resolves to the entity, marked deleted. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `value map` |  |
| `created` | `string` |  |
| `directPartner` | `value map` |  |
| `id` | `string` |  |
| `isActive` | `bool` |  |
| `location` | `value map` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `value map` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let client = (Sdk_client.client client Noval).e_load (jo [("id", (Str "client_id"))]) Noval
let client_data = client.e_data_get ()
```

#### Example: List

```ocaml
(* One ENTITY per record. *)
let clients = (Sdk_client.client client Noval).e_list (empty_map ()) Noval
let client_datas = List.map (fun e -> e.e_data_get ()) clients
```

#### Example: Create

```ocaml
let client = (Sdk_client.client client Noval).e_create (jo [
    ("location", (empty_map ()));  (* value map *)
]) Noval
let client_data = client.e_data_get ()
```


### CreateResult

Create an instance: `let create_result = Sdk_client.create_result client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Example: Create

```ocaml
let create_result = (Sdk_client.create_result client Noval).e_create (jo [
    ("device_type", (Str "example_device_type"));  (* string *)
    ("serial_number", (Str "example_serial_number"));  (* string *)
]) Noval
let create_result_data = create_result.e_data_get ()
```


### Decryption

Create an instance: `let decryption = Sdk_client.decryption client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```ocaml
let decryption = (Sdk_client.decryption client Noval).e_create (jo [
]) Noval
let decryption_data = decryption.e_data_get ()
```


### Device

Create an instance: `let device = Sdk_client.device client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `value map` |  |
| `activationDate` | `string` |  |
| `alternateKey` | `string` |  |
| `auditNextDate` | `string` |  |
| `auditNotificationDate` | `string` |  |
| `client` | `value map` |  |
| `created` | `string` |  |
| `createdBy` | `value map` |  |
| `deviceBuild` | `value map` |  |
| `deviceState` | `value map` |  |
| `deviceType` | `value map` |  |
| `errorCounter` | `int` |  |
| `errorLastDate` | `string` |  |
| `id` | `string` |  |
| `initializedBy` | `value map` |  |
| `initializedDate` | `string` |  |
| `injectKey` | `value map` |  |
| `isVirtual` | `bool` |  |
| `kif` | `value map` |  |
| `lastActivityDate` | `string` |  |
| `location` | `value map` |  |
| `modified` | `string` |  |
| `modifiedBy` | `value map` |  |
| `name` | `string` |  |
| `notes` | `string` |  |
| `partner` | `value map` |  |
| `serialNumber` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let device = (Sdk_client.device client Noval).e_load (jo [("id", (Str "device_id"))]) Noval
let device_data = device.e_data_get ()
```

#### Example: List

```ocaml
(* One ENTITY per record. *)
let devices = (Sdk_client.device client Noval).e_list (empty_map ()) Noval
let device_datas = List.map (fun e -> e.e_data_get ()) devices
```

#### Example: Create

```ocaml
let device = (Sdk_client.device client Noval).e_create (jo [
    ("activatedBy", (empty_map ()));  (* value map *)
    ("createdBy", (empty_map ()));  (* value map *)
    ("initializedBy", (empty_map ()));  (* value map *)
    ("location", (empty_map ()));  (* value map *)
    ("modifiedBy", (empty_map ()));  (* value map *)
]) Noval
let device_data = device.e_data_get ()
```


### DeviceBuild

Create an instance: `let device_build = Sdk_client.device_build client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appVersion` | `string` |  |
| `buildNumber` | `string` |  |
| `configFileName` | `string` |  |
| `created` | `string` |  |
| `deviceType` | `string` |  |
| `firmwareVersion` | `string` |  |
| `hardwareVersion` | `string` |  |
| `id` | `int` |  |
| `isActive` | `bool` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `notes` | `string` |  |
| `version` | `int` |  |
| `whiteListingBinRanges` | `string` |  |
| `whiteListingUsed` | `bool` |  |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let device_build = (Sdk_client.device_build client Noval).e_load (jo [("id", (Str "device_build_id"))]) Noval
let device_build_data = device_build.e_data_get ()
```

#### Example: List

```ocaml
(* One ENTITY per record. *)
let device_builds = (Sdk_client.device_build client Noval).e_list (empty_map ()) Noval
let device_build_datas = List.map (fun e -> e.e_data_get ()) device_builds
```


### DeviceCustodyDetail

Create an instance: `let device_custody_detail = Sdk_client.device_custody_detail client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `string` |  |
| `created` | `string` |  |
| `createdBy` | `value map` |  |
| `custodian` | `value map` |  |
| `device` | `value map` |  |
| `id` | `int` |  |
| `location` | `value map` |  |
| `modified` | `string` |  |
| `modifiedBy` | `value map` |  |
| `notes` | `string` |  |
| `status` | `value map` |  |
| `transferMethod` | `value map` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let device_custody_detail = (Sdk_client.device_custody_detail client Noval).e_load (jo [("id", (Str "device_custody_detail_id")); ("device_type", (Str "device_type")); ("serial_number", (Str "serial_number"))]) Noval
let device_custody_detail_data = device_custody_detail.e_data_get ()
```


### DeviceCustodyList

Create an instance: `let device_custody_list = Sdk_client.device_custody_list client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `string` |  |
| `created` | `string` |  |
| `createdBy` | `value map` |  |
| `custodian` | `value map` |  |
| `device` | `value map` |  |
| `id` | `int` |  |
| `location` | `value map` |  |
| `modified` | `string` |  |
| `modifiedBy` | `value map` |  |
| `notes` | `string` |  |
| `status` | `value map` |  |
| `transferMethod` | `value map` |  |
| `version` | `int` |  |

#### Example: List

```ocaml
(* One ENTITY per record. *)
let device_custody_lists = (Sdk_client.device_custody_list client Noval).e_list (empty_map ()) Noval
let device_custody_list_datas = List.map (fun e -> e.e_data_get ()) device_custody_lists
```


### DeviceList

Create an instance: `let device_list = Sdk_client.device_list client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `value list` |  |
| `total` | `int` |  |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let device_list = (Sdk_client.device_list client Noval).e_load (jo [("share_partner_to", (Str "share_partner_to"))]) Noval
let device_list_data = device_list.e_data_get ()
```


### DeviceReceiveResult

Create an instance: `let device_receive_result = Sdk_client.device_receive_result client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```ocaml
let device_receive_result = (Sdk_client.device_receive_result client Noval).e_create (jo [
    ("success", (Bool true));  (* bool *)
]) Noval
let device_receive_result_data = device_receive_result.e_data_get ()
```


### DeviceRkiActivateResult

Create an instance: `let device_rki_activate_result = Sdk_client.device_rki_activate_result client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```ocaml
let device_rki_activate_result = (Sdk_client.device_rki_activate_result client Noval).e_create (jo [
    ("success", (Bool true));  (* bool *)
]) Noval
let device_rki_activate_result_data = device_rki_activate_result.e_data_get ()
```


### DeviceState

Create an instance: `let device_state = Sdk_client.device_state client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` |  |
| `name` | `string` |  |

#### Example: List

```ocaml
(* One ENTITY per record. *)
let device_states = (Sdk_client.device_state client Noval).e_list (empty_map ()) Noval
let device_state_datas = List.map (fun e -> e.e_data_get ()) device_states
```


### DeviceType

Create an instance: `let device_type = Sdk_client.device_type client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `string` |  |
| `deviceTypeMode` | `string` |  |
| `hardwareVersion` | `string` |  |
| `id` | `string` |  |
| `isActive` | `bool` |  |
| `manufacturer` | `string` |  |
| `model` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `photoUrl` | `string` |  |
| `productName` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let device_type = (Sdk_client.device_type client Noval).e_load (jo [("id", (Str "device_type_id"))]) Noval
let device_type_data = device_type.e_data_get ()
```

#### Example: List

```ocaml
(* One ENTITY per record. *)
let device_types = (Sdk_client.device_type client Noval).e_list (empty_map ()) Noval
let device_type_datas = List.map (fun e -> e.e_data_get ()) device_types
```


### InjectKey

Create an instance: `let inject_key = Sdk_client.inject_key client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `string` |  |
| `id` | `string` |  |
| `isActive` | `bool` |  |
| `isP2PE` | `bool` |  |
| `keyType` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let inject_key = (Sdk_client.inject_key client Noval).e_load (jo [("id", (Str "inject_key_id"))]) Noval
let inject_key_data = inject_key.e_data_get ()
```

#### Example: List

```ocaml
(* One ENTITY per record. *)
let inject_keys = (Sdk_client.inject_key client Noval).e_list (empty_map ()) Noval
let inject_key_datas = List.map (fun e -> e.e_data_get ()) inject_keys
```


### Kif

Create an instance: `let kif = Sdk_client.kif client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` |  |
| `name` | `string` |  |

#### Example: List

```ocaml
(* One ENTITY per record. *)
let kifs = (Sdk_client.kif client Noval).e_list (empty_map ()) Noval
let kif_datas = List.map (fun e -> e.e_data_get ()) kifs
```


### Location

Create an instance: `let location = Sdk_client.location client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |
| `e_remove reqmatch ctrl` | Remove the matching entity. Resolves to the entity, marked deleted. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address1` | `string` |  |
| `address2` | `string` |  |
| `billingId` | `string` |  |
| `city` | `string` |  |
| `country` | `string` |  |
| `created` | `string` |  |
| `customReference` | `string` |  |
| `id` | `string` |  |
| `locationType` | `string` |  |
| `mailAddress1` | `string` |  |
| `mailAddress2` | `string` |  |
| `mailCity` | `string` |  |
| `mailCountry` | `string` |  |
| `mailPostalCode` | `string` |  |
| `mailStateProvince` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `nameOfBusiness` | `string` |  |
| `notes` | `string` |  |
| `postalCode` | `string` |  |
| `stateProvince` | `string` |  |
| `uniqueId` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let location = (Sdk_client.location client Noval).e_load (jo [("id", (Str "location_id"))]) Noval
let location_data = location.e_data_get ()
```

#### Example: List

```ocaml
(* One ENTITY per record. *)
let locations = (Sdk_client.location client Noval).e_list (empty_map ()) Noval
let location_datas = List.map (fun e -> e.e_data_get ()) locations
```

#### Example: Create

```ocaml
let location = (Sdk_client.location client Noval).e_create (jo [
]) Noval
let location_data = location.e_data_get ()
```


### Partner

Create an instance: `let partner = Sdk_client.partner client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `string` |  |
| `clientCanOrderEquipment` | `bool` |  |
| `contact` | `value map` |  |
| `created` | `string` |  |
| `id` | `string` |  |
| `isActive` | `bool` |  |
| `location` | `value map` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `value map` |  |
| `partnerId` | `string` |  |
| `reference` | `string` |  |
| `verificationPhrase` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let partner = (Sdk_client.partner client Noval).e_load (jo [("id", (Str "partner_id"))]) Noval
let partner_data = partner.e_data_get ()
```

#### Example: List

```ocaml
(* One ENTITY per record. *)
let partners = (Sdk_client.partner client Noval).e_list (empty_map ()) Noval
let partner_datas = List.map (fun e -> e.e_data_get ()) partners
```

#### Example: Create

```ocaml
let partner = (Sdk_client.partner client Noval).e_create (jo [
    ("location", (empty_map ()));  (* value map *)
]) Noval
let partner_data = partner.e_data_get ()
```


### Shipment

Create an instance: `let shipment = Sdk_client.shipment client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `string` |  |
| `client` | `value map` |  |
| `created` | `string` |  |
| `dateReceived` | `string` |  |
| `dateShipped` | `string` |  |
| `dcKif` | `value map` |  |
| `id` | `string` |  |
| `items` | `value list` |  |
| `kif` | `value map` |  |
| `modified` | `string` |  |
| `partner` | `value map` |  |
| `shipmentType` | `string` |  |
| `tracking` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let shipment = (Sdk_client.shipment client Noval).e_load (jo [("id", (Str "shipment_id"))]) Noval
let shipment_data = shipment.e_data_get ()
```

#### Example: List

```ocaml
(* One ENTITY per record. *)
let shipments = (Sdk_client.shipment client Noval).e_list (empty_map ()) Noval
let shipment_datas = List.map (fun e -> e.e_data_get ()) shipments
```

#### Example: Create

```ocaml
let shipment = (Sdk_client.shipment client Noval).e_create (jo [
]) Noval
let shipment_data = shipment.e_data_get ()
```


### Success

Create an instance: `let success = Sdk_client.success client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `e_remove reqmatch ctrl` | Remove the matching entity. Resolves to the entity, marked deleted. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```ocaml
let success = (Sdk_client.success client Noval).e_create (jo [
    ("share_partner_to", (Str "example_share_partner_to"));  (* string *)
]) Noval
let success_data = success.e_data_get ()
```


### Transaction

Create an instance: `let transaction = Sdk_client.transaction client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `string` |  |
| `client` | `value map` |  |
| `clientRef` | `string` |  |
| `created` | `string` |  |
| `decrypted` | `int` |  |
| `deviceName` | `string` |  |
| `directPartner` | `value map` |  |
| `encrypted` | `int` |  |
| `endDate` | `string` |  |
| `errCode` | `string` |  |
| `errMessage` | `string` |  |
| `id` | `string` |  |
| `ipAddress` | `string` |  |
| `isVirtual` | `bool` |  |
| `keyType` | `string` |  |
| `location` | `value map` |  |
| `messageId` | `string` |  |
| `method` | `string` |  |
| `partner` | `value map` |  |
| `reference` | `string` |  |
| `serialNumber` | `string` |  |
| `startDate` | `string` |  |
| `success` | `bool` |  |
| `transactionSource` | `string` |  |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let transaction = (Sdk_client.transaction client Noval).e_load (jo [("id", (Str "transaction_id"))]) Noval
let transaction_data = transaction.e_data_get ()
```

#### Example: List

```ocaml
(* One ENTITY per record. *)
let transactions = (Sdk_client.transaction client Noval).e_list (empty_map ()) Noval
let transaction_datas = List.map (fun e -> e.e_data_get ()) transactions
```

#### Example: Create

```ocaml
let transaction = (Sdk_client.transaction client Noval).e_create (jo [
    ("location", (empty_map ()));  (* value map *)
]) Noval
let transaction_data = transaction.e_data_get ()
```


### UpdateResult

Create an instance: `let update_result = Sdk_client.update_result client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `e_update reqdata ctrl` | Update an existing entity. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `value map` |  |
| `email` | `string` |  |
| `firstName` | `string` |  |
| `id` | `string` |  |
| `isActive` | `bool` |  |
| `kif` | `value map` |  |
| `lastName` | `string` |  |
| `partner` | `value map` |  |
| `phone` | `string` |  |
| `userName` | `string` |  |
| `userRole` | `value map` |  |
| `version` | `int` |  |

#### Example: List

```ocaml
(* One ENTITY per record. *)
let update_results = (Sdk_client.update_result client Noval).e_list (empty_map ()) Noval
let update_result_datas = List.map (fun e -> e.e_data_get ()) update_results
```

#### Example: Create

```ocaml
let update_result = (Sdk_client.update_result client Noval).e_create (jo [
]) Noval
let update_result_data = update_result.e_data_get ()
```


### User

Create an instance: `let user = Sdk_client.user client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |
| `e_remove reqmatch ctrl` | Remove the matching entity. Resolves to the entity, marked deleted. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `value map` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `firstName` | `string` |  |
| `id` | `string` |  |
| `isActive` | `bool` |  |
| `kif` | `value map` |  |
| `lastName` | `string` |  |
| `modified` | `string` |  |
| `partner` | `value map` |  |
| `phone` | `string` |  |
| `userName` | `string` |  |
| `userRole` | `value map` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let user = (Sdk_client.user client Noval).e_load (jo [("id", (Str "user_id"))]) Noval
let user_data = user.e_data_get ()
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

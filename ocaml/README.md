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
| `client` | Reference to the associated Client resource. |
| `completeDate` | The date and time that the Attestation took place. |
| `created` | Creation timestamp in ISO 8601 format. |
| `device` | Reference to the associated Device resource. |
| `id` | This resource's unique identifier. |
| `name` | Text describing the attestation. |
| `notes` | Free form field that allows the Client associate notes with the Attestation. |

Operations: Create, List, Load.

API path: `/attestations`

#### Client

| Field | Description |
| --- | --- |
| `contact` | Reference to the associated User resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `directPartner` | Reference to the associated Partner. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the Client account is active or disabled. |
| `location` | Reference to the associated Location resource. |
| `mid` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | Last modified timestamp. |
| `name` | The Client's name. |
| `partner` | Reference to the Client's root Partner. |
| `version` | The number of times that this resource has been updated. |

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
| `success` | true if the payload decryption was successful. |

Operations: Create.

API path: `/decryption`

#### Device

| Field | Description |
| --- | --- |
| `activatedBy` | Reference to the associated User resource. |
| `activationDate` | Timestamp from when the Device was activated. |
| `alternateKey` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | Reference to the associated Client resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `createdBy` | Reference to the associated User resource. |
| `deviceBuild` | Reference to the associated Device Build resource. |
| `deviceState` | Reference to the associated Device State resource. |
| `deviceType` | Reference to the associated Device Type resource. |
| `errorCounter` | The number times the Device has been in error. |
| `errorLastDate` | Timestamp from the last time that the Device had an error. |
| `id` | The Device's unique identifier. |
| `initializedBy` | Reference to the associated User resource. |
| `initializedDate` | Timestamp from when the Device was initialized. |
| `injectKey` | Reference to the associated Device resource. |
| `isVirtual` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | Reference to the associated KIF resource. |
| `lastActivityDate` | Timestamp from the last time that the Device was used. |
| `location` | Reference to the associated Location resource. |
| `modified` | Last modified timestamp. |
| `modifiedBy` | Reference to the associated User resource. |
| `name` | The Device's name. |
| `notes` | Arbitary note that can be attached to a Device entry. |
| `partner` | Reference to the associated Partner. |
| `serialNumber` | The Device's serial number. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/devices`

#### DeviceBuild

| Field | Description |
| --- | --- |
| `appVersion` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | The Build Number. |
| `configFileName` | The name of the configuration file that is uploaded to the device. |
| `created` | Creation timestamp in ISO 8601 format. |
| `deviceType` | The Device Type Name. |
| `firmwareVersion` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | A list of hardware versions that this Device Build covers. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | Last modified timestamp. |
| `name` | The Device Builds's name. |
| `notes` | Notes attached to the device build by Bluefin CISO. |
| `version` | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

Operations: List, Load.

API path: `/deviceBuilds`

#### DeviceCustodyDetail

| Field | Description |
| --- | --- |
| `completeDate` | The date and time that the Custody change took place. |
| `created` | Creation timestamp in ISO 8601 format. |
| `createdBy` | Reference to the associated User resource. |
| `custodian` | Reference to the associated User resource. |
| `device` | Reference to the associated Device resource. |
| `id` | This resource's unique identifier. |
| `location` | Reference to the associated Location resource. |
| `modified` | Last modified timestamp. |
| `modifiedBy` | Reference to the associated User resource. |
| `notes` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | Reference to the associated Custody Status. |
| `transferMethod` | Reference to the associated Transfer Method. |
| `version` | The number of times that this resource has been updated. |

Operations: Load.

API path: `/devices/{serialNumber}/{deviceType}/custody/{id}`

#### DeviceCustodyList

| Field | Description |
| --- | --- |
| `completeDate` | The date and time that the Custody change took place. |
| `created` | Creation timestamp in ISO 8601 format. |
| `createdBy` | Reference to the associated User resource. |
| `custodian` | Reference to the associated User resource. |
| `device` | Reference to the associated Device resource. |
| `id` | This resource's unique identifier. |
| `location` | Reference to the associated Location resource. |
| `modified` | Last modified timestamp. |
| `modifiedBy` | Reference to the associated User resource. |
| `notes` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | Reference to the associated Custody Status. |
| `transferMethod` | Reference to the associated Transfer Method. |
| `version` | The number of times that this resource has been updated. |

Operations: List.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### DeviceList

| Field | Description |
| --- | --- |
| `data` | List of Devices. |
| `total` | Total number of Devices available (not the number of Users in the response). |

Operations: Load.

API path: `/virtualDevices/{sharePartnerTo}`

#### DeviceReceiveResult

| Field | Description |
| --- | --- |
| `success` | Indicates if the action succeeded. |

Operations: Create.

API path: `/devices/receive`

#### DeviceRkiActivateResult

| Field | Description |
| --- | --- |
| `success` | Indicates if the RKI activation succeeded. |

Operations: Create.

API path: `/devices/rki/activate`

#### DeviceState

| Field | Description |
| --- | --- |
| `id` | Unique identifier for this Device state. |
| `name` | Descriptive name for this Device state. |

Operations: List.

API path: `/deviceStates`

#### DeviceType

| Field | Description |
| --- | --- |
| `created` | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | The Device type. |
| `hardwareVersion` | The Device hardware version. |
| `id` | Unique idenifier. |
| `isActive` | This property indicates if the DeviceType is active. |
| `manufacturer` | The Device manufacturer. |
| `model` | The Device model. |
| `modified` | Last modified timestamp. |
| `name` | The DeviceType name. |
| `photoUrl` |  |
| `productName` | The Device name. |
| `version` | The number of times that this resource has been updated. |

Operations: List, Load.

API path: `/deviceTypes`

#### InjectKey

| Field | Description |
| --- | --- |
| `created` | Creation timestamp in ISO 8601 format. |
| `id` | unique idenifier |
| `isActive` | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | The cipher type that the key works with. |
| `modified` | Last modified timestamp in ISO 8601 format. |
| `name` | Key name. |
| `version` | The number of times that this resource has been updated. |

Operations: List, Load.

API path: `/injectKeys`

#### Kif

| Field | Description |
| --- | --- |
| `id` | This resource's unique identifier. |
| `name` | The KIF's name. |

Operations: List.

API path: `/kifs`

#### Location

| Field | Description |
| --- | --- |
| `address1` | The Location's street address. |
| `address2` | The Location's street address. |
| `billingId` | \? |
| `city` | The Location's city. |
| `country` | The Location's country. |
| `created` | Creation timestamp in ISO 8601 format. |
| `customReference` | A Partner specified reference for a location. |
| `id` | This resource's unique identifier. |
| `locationType` | The Location's clasification. |
| `mailAddress1` | The Location's street address. |
| `mailAddress2` | The Location's street address. |
| `mailCity` | The Location's city. |
| `mailCountry` | The Location's street address. |
| `mailPostalCode` | The Location's postal code. |
| `mailStateProvince` | The Location's street state or province. |
| `modified` | Last modified timestamp. |
| `name` | The Location's name. |
| `nameOfBusiness` | The name of the business at this location. |
| `notes` | Note for delivery driver. |
| `postalCode` | The Location's postal code. |
| `stateProvince` | The Location's street state or province. |
| `uniqueId` | Unique Identifier for the Location. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load, Remove.

API path: `/locations`

#### Partner

| Field | Description |
| --- | --- |
| `billingId` | The Partner's billing identifier. |
| `clientCanOrderEquipment` | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | Reference to the associated User resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the Parter account is active or disabled. |
| `location` | Reference to the associated Location resource. |
| `modified` | Last modified timestamp. |
| `name` | The Partner's name. |
| `parent` | Reference to the associated Partner. |
| `partnerId` | The Partner's id. |
| `reference` | The Partner's reference string. |
| `verificationPhrase` | The verification phrase is a message that the Partner creates. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/partners`

#### Shipment

| Field | Description |
| --- | --- |
| `carrier` | The name of the courier. |
| `client` | Reference to the associated Client resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `dateReceived` | The date and time that a package is recieved. |
| `dateShipped` | The date and time that a package is shipped. |
| `dcKif` | Reference to the associated KIF resource. |
| `id` | This resource's unique identifier. |
| `items` |  |
| `kif` | Reference to the associated KIF resource. |
| `modified` | Last modified timestamp. |
| `partner` | Reference to the associated Partner. |
| `shipmentType` | The type of shipment. |
| `tracking` | The courier's tracking number. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/shipments`

#### Success

| Field | Description |
| --- | --- |
| `success` | Indicates if the action was a success. |

Operations: Create, Remove.

API path: `/virtualDevices/{sharePartnerTo}`

#### Transaction

| Field | Description |
| --- | --- |
| `alternateKey` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | Reference to the associated Client resource. |
| `clientRef` | Client Reference property that is included in the decrypt API call. |
| `created` | Creation timestamp in ISO 8601 format. |
| `decrypted` | A Transcation can process muliple decryptions. |
| `deviceName` | The name of the Device that generated the payload to decrypt. |
| `directPartner` | Reference to the associated Partner. |
| `encrypted` | A Transcation can process muliple encryptions. |
| `endDate` | Timestamp from the end of the transaction. |
| `errCode` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | This resource's unique identifier. |
| `ipAddress` | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | Indicates if the Transaction came from a virtual Device. |
| `keyType` | The type of cipher used during decrytion. |
| `location` | Reference to the associated Location resource. |
| `messageId` | Message ID. |
| `method` | The decryption cypher/method. |
| `partner` | Reference to the associated Partner. |
| `reference` | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | Timestamp from the beginning of the transaction. |
| `success` | The success indicator. |
| `transactionSource` | The source of the Transaction. |

Operations: Create, List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `client` | Reference to the associated Client resource. |
| `email` | The User's email address. |
| `firstName` | The User's name. |
| `id` | ID of newly created resource |
| `isActive` | This property indicates if the User account is active or disabled. |
| `kif` | Reference to the associated KIF resource. |
| `lastName` | The User's Surname. |
| `partner` | Reference to the associated Partner. |
| `phone` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | The User's unique username. |
| `userRole` | Reference to the associated User Role. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` | Reference to the associated Client resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `email` | The User's email address. |
| `firstName` | The User's name. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the User account is active or disabled. |
| `kif` | Reference to the associated KIF resource. |
| `lastName` | The User's Surname. |
| `modified` | Last modified timestamp. |
| `partner` | Reference to the associated Partner. |
| `phone` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | The User's unique username. |
| `userRole` | Reference to the associated User Role. |
| `version` | The number of times that this resource has been updated. |

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
| `client` | `value map` | Reference to the associated Client resource. |
| `completeDate` | `string` | The date and time that the Attestation took place. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `device` | `value map` | Reference to the associated Device resource. |
| `id` | `string` | This resource's unique identifier. |
| `name` | `string` | Text describing the attestation. |
| `notes` | `string` | Free form field that allows the Client associate notes with the Attestation. |

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
| `contact` | `value map` | Reference to the associated User resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `value map` | Reference to the associated Partner. |
| `id` | `string` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Client account is active or disabled. |
| `location` | `value map` | Reference to the associated Location resource. |
| `mid` | `string` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Client's name. |
| `partner` | `value map` | Reference to the Client's root Partner. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `success` | `bool` | true if the payload decryption was successful. |

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
| `activatedBy` | `value map` | Reference to the associated User resource. |
| `activationDate` | `string` | Timestamp from when the Device was activated. |
| `alternateKey` | `string` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `string` | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `string` | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `value map` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `value map` | Reference to the associated User resource. |
| `deviceBuild` | `value map` | Reference to the associated Device Build resource. |
| `deviceState` | `value map` | Reference to the associated Device State resource. |
| `deviceType` | `value map` | Reference to the associated Device Type resource. |
| `errorCounter` | `int` | The number times the Device has been in error. |
| `errorLastDate` | `string` | Timestamp from the last time that the Device had an error. |
| `id` | `string` | The Device's unique identifier. |
| `initializedBy` | `value map` | Reference to the associated User resource. |
| `initializedDate` | `string` | Timestamp from when the Device was initialized. |
| `injectKey` | `value map` | Reference to the associated Device resource. |
| `isVirtual` | `bool` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `value map` | Reference to the associated KIF resource. |
| `lastActivityDate` | `string` | Timestamp from the last time that the Device was used. |
| `location` | `value map` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `modifiedBy` | `value map` | Reference to the associated User resource. |
| `name` | `string` | The Device's name. |
| `notes` | `string` | Arbitary note that can be attached to a Device entry. |
| `partner` | `value map` | Reference to the associated Partner. |
| `serialNumber` | `string` | The Device's serial number. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `appVersion` | `string` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `string` | The Build Number. |
| `configFileName` | `string` | The name of the configuration file that is uploaded to the device. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `deviceType` | `string` | The Device Type Name. |
| `firmwareVersion` | `string` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `string` | A list of hardware versions that this Device Build covers. |
| `id` | `int` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Device Builds's name. |
| `notes` | `string` | Notes attached to the device build by Bluefin CISO. |
| `version` | `int` | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `string` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `bool` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

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
| `completeDate` | `string` | The date and time that the Custody change took place. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `value map` | Reference to the associated User resource. |
| `custodian` | `value map` | Reference to the associated User resource. |
| `device` | `value map` | Reference to the associated Device resource. |
| `id` | `int` | This resource's unique identifier. |
| `location` | `value map` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `modifiedBy` | `value map` | Reference to the associated User resource. |
| `notes` | `string` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `value map` | Reference to the associated Custody Status. |
| `transferMethod` | `value map` | Reference to the associated Transfer Method. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `completeDate` | `string` | The date and time that the Custody change took place. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `value map` | Reference to the associated User resource. |
| `custodian` | `value map` | Reference to the associated User resource. |
| `device` | `value map` | Reference to the associated Device resource. |
| `id` | `int` | This resource's unique identifier. |
| `location` | `value map` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `modifiedBy` | `value map` | Reference to the associated User resource. |
| `notes` | `string` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `value map` | Reference to the associated Custody Status. |
| `transferMethod` | `value map` | Reference to the associated Transfer Method. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `data` | `value list` | List of Devices. |
| `total` | `int` | Total number of Devices available (not the number of Users in the response). |

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
| `success` | `bool` | Indicates if the action succeeded. |

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
| `success` | `bool` | Indicates if the RKI activation succeeded. |

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
| `id` | `int` | Unique identifier for this Device state. |
| `name` | `string` | Descriptive name for this Device state. |

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
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `string` | The Device type. |
| `hardwareVersion` | `string` | The Device hardware version. |
| `id` | `string` | Unique idenifier. |
| `isActive` | `bool` | This property indicates if the DeviceType is active. |
| `manufacturer` | `string` | The Device manufacturer. |
| `model` | `string` | The Device model. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The DeviceType name. |
| `photoUrl` | `string` |  |
| `productName` | `string` | The Device name. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `id` | `string` | unique idenifier |
| `isActive` | `bool` | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `bool` | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `string` | The cipher type that the key works with. |
| `modified` | `string` | Last modified timestamp in ISO 8601 format. |
| `name` | `string` | Key name. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `id` | `int` | This resource's unique identifier. |
| `name` | `string` | The KIF's name. |

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
| `address1` | `string` | The Location's street address. |
| `address2` | `string` | The Location's street address. |
| `billingId` | `string` | \? |
| `city` | `string` | The Location's city. |
| `country` | `string` | The Location's country. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `customReference` | `string` | A Partner specified reference for a location. |
| `id` | `string` | This resource's unique identifier. |
| `locationType` | `string` | The Location's clasification. |
| `mailAddress1` | `string` | The Location's street address. |
| `mailAddress2` | `string` | The Location's street address. |
| `mailCity` | `string` | The Location's city. |
| `mailCountry` | `string` | The Location's street address. |
| `mailPostalCode` | `string` | The Location's postal code. |
| `mailStateProvince` | `string` | The Location's street state or province. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Location's name. |
| `nameOfBusiness` | `string` | The name of the business at this location. |
| `notes` | `string` | Note for delivery driver. |
| `postalCode` | `string` | The Location's postal code. |
| `stateProvince` | `string` | The Location's street state or province. |
| `uniqueId` | `string` | Unique Identifier for the Location. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `billingId` | `string` | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `bool` | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `value map` | Reference to the associated User resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `id` | `string` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Parter account is active or disabled. |
| `location` | `value map` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Partner's name. |
| `parent` | `value map` | Reference to the associated Partner. |
| `partnerId` | `string` | The Partner's id. |
| `reference` | `string` | The Partner's reference string. |
| `verificationPhrase` | `string` | The verification phrase is a message that the Partner creates. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `carrier` | `string` | The name of the courier. |
| `client` | `value map` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `string` | The date and time that a package is recieved. |
| `dateShipped` | `string` | The date and time that a package is shipped. |
| `dcKif` | `value map` | Reference to the associated KIF resource. |
| `id` | `string` | This resource's unique identifier. |
| `items` | `value list` |  |
| `kif` | `value map` | Reference to the associated KIF resource. |
| `modified` | `string` | Last modified timestamp. |
| `partner` | `value map` | Reference to the associated Partner. |
| `shipmentType` | `string` | The type of shipment. |
| `tracking` | `string` | The courier's tracking number. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `success` | `bool` | Indicates if the action was a success. |

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
| `alternateKey` | `string` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `value map` | Reference to the associated Client resource. |
| `clientRef` | `string` | Client Reference property that is included in the decrypt API call. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `decrypted` | `int` | A Transcation can process muliple decryptions. |
| `deviceName` | `string` | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `value map` | Reference to the associated Partner. |
| `encrypted` | `int` | A Transcation can process muliple encryptions. |
| `endDate` | `string` | Timestamp from the end of the transaction. |
| `errCode` | `string` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `string` | This resource's unique identifier. |
| `ipAddress` | `string` | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `bool` | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `string` | The type of cipher used during decrytion. |
| `location` | `value map` | Reference to the associated Location resource. |
| `messageId` | `string` | Message ID. |
| `method` | `string` | The decryption cypher/method. |
| `partner` | `value map` | Reference to the associated Partner. |
| `reference` | `string` | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `string` | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `string` | Timestamp from the beginning of the transaction. |
| `success` | `bool` | The success indicator. |
| `transactionSource` | `string` | The source of the Transaction. |

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
| `client` | `value map` | Reference to the associated Client resource. |
| `email` | `string` | The User's email address. |
| `firstName` | `string` | The User's name. |
| `id` | `string` | ID of newly created resource |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `kif` | `value map` | Reference to the associated KIF resource. |
| `lastName` | `string` | The User's Surname. |
| `partner` | `value map` | Reference to the associated Partner. |
| `phone` | `string` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `string` | The User's unique username. |
| `userRole` | `value map` | Reference to the associated User Role. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `client` | `value map` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `email` | `string` | The User's email address. |
| `firstName` | `string` | The User's name. |
| `id` | `string` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `kif` | `value map` | Reference to the associated KIF resource. |
| `lastName` | `string` | The User's Surname. |
| `modified` | `string` | Last modified timestamp. |
| `partner` | `value map` | Reference to the associated Partner. |
| `phone` | `string` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `string` | The User's unique username. |
| `userRole` | `value map` | Reference to the associated User Role. |
| `version` | `int` | The number of times that this resource has been updated. |

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

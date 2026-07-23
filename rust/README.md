# BluefinDecryptxP2pe Rust SDK



The Rust SDK for the BluefinDecryptxP2pe API — an entity-oriented client following idiomatic Rust conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.attestation(Value::Noval)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This crate is not yet published to crates.io. Depend on it from the GitHub
release tag (`rust/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)) or
from a source checkout by adding it to your `Cargo.toml`:

```toml
[dependencies]
# From a source checkout:
voxgig-bluefin-decryptx-p2pe-sdk = { path = "../rust" }

# Or from the git release tag:
# voxgig-bluefin-decryptx-p2pe-sdk = { git = "<repo-url>", tag = "rust/vX.Y.Z" }
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```rust
use bluefin_decryptx_p2pe_sdk::{getp, jo, BluefinDecryptxP2peSDK, Value};

let client = BluefinDecryptxP2peSDK::new(jo(vec![
    ("apikey", Value::str(std::env::var("BLUEFIN_DECRYPTX_P2PE_APIKEY").unwrap_or_default())),
]));
```

### 2. List attestation records

`list()` returns a `Value::List` of records and returns `Err` on
failure — match on the `Result`.

```rust
match client.attestation(Value::Noval).list(Value::Noval, Value::Noval) {
    Ok(attestations) => {
        if let Value::List(items) = &attestations {
            for attestation in items.borrow().iter() {
                println!("{:?}", attestation);
            }
        }
    }
    Err(err) => eprintln!("list failed: {}", err),
}
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`load()` returns the bare record and returns `Err` on failure.

```rust
match client.device_custody_detail(Value::Noval).load(jo(vec![("device_type", Value::str("example_device_type")), ("serial_number", Value::str("example_serial_number")), ("id", Value::str("example_id"))]), Value::Noval) {
    Ok(device_custody_detail) => println!("{:?}", device_custody_detail),
    Err(err) => eprintln!("load failed: {}", err),
}
```

### 4. Create, update, and remove

```rust
// Create — returns the bare created record
let created = client.attestation(Value::Noval).create(jo(vec![("client", Value::empty_map()), ("complete_date", Value::str("example_complete_date"))]), Value::Noval).unwrap();

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

```rust
let result = client.direct(jo(vec![
    ("path", Value::str("/api/resource/{id}")),
    ("method", Value::str("GET")),
    ("params", jo(vec![("id", Value::str("example"))])),
])).unwrap();

if getp(&result, "ok") == Value::Bool(true) {
    println!("{:?}", getp(&result, "status"));  // 200
    println!("{:?}", getp(&result, "data"));    // response body
} else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present.
    println!("{:?} {:?}", getp(&result, "status"), getp(&result, "err"));
}
```

### Prepare a request without sending it

```rust
// prepare() returns the fetch definition on Ok and Err on failure.
let fetchdef = client.prepare(jo(vec![
    ("path", Value::str("/api/resource/{id}")),
    ("method", Value::str("DELETE")),
    ("params", jo(vec![("id", Value::str("example"))])),
])).unwrap();

println!("{:?}", getp(&fetchdef, "url"));
println!("{:?}", getp(&fetchdef, "method"));
println!("{:?}", getp(&fetchdef, "headers"));
```

### Use test mode

Create a mock client for unit testing — no server required:

```rust
let client = test_sdk(Value::Noval, Value::Noval);

// Entity ops return the bare record on Ok and Err on failure.
let device_type = client.device_type(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
// device_type contains the mock response record
```

### Point at a different server

Override the base URL to reach a local or staging server:

```rust
let client = BluefinDecryptxP2peSDK::new(jo(vec![
    ("base", Value::str("http://localhost:8080")),
]));
```

### Run live tests

Create a `.env.local` file at the crate root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd rust && cargo test
```


## Reference

### BluefinDecryptxP2peSDK

```rust
use bluefin_decryptx_p2pe_sdk::{BluefinDecryptxP2peSDK, Value};

let client = BluefinDecryptxP2peSDK::new(options);
```

Creates a new SDK client. `options` is a `Value` map (`Value::Noval` for
none) carrying any of the following keys:

| Option | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `system` | `map` | System overrides (e.g. a custom fetcher). |

### test_sdk

```rust
use bluefin_decryptx_p2pe_sdk::{test_sdk, Value};

let client = test_sdk(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`Value::Noval`.

### BluefinDecryptxP2peSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Value` | Deep copy of the current SDK options. |
| `get_utility` | `() -> Rc<Utility>` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs: Value) -> Result<Value, BluefinDecryptxP2peError>` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs: Value) -> Result<Value, BluefinDecryptxP2peError>` | Build and send an HTTP request. `Ok` is a result map (branch on `ok`). |
| `attestation` | `(entopts: Value) -> Rc<AttestationEntity>` | Create an Attestation entity instance. |
| `client` | `(entopts: Value) -> Rc<ClientEntity>` | Create a Client entity instance. |
| `create_result` | `(entopts: Value) -> Rc<CreateResultEntity>` | Create a CreateResult entity instance. |
| `decryption` | `(entopts: Value) -> Rc<DecryptionEntity>` | Create a Decryption entity instance. |
| `device` | `(entopts: Value) -> Rc<DeviceEntity>` | Create a Device entity instance. |
| `device_build` | `(entopts: Value) -> Rc<DeviceBuildEntity>` | Create a DeviceBuild entity instance. |
| `device_custody_detail` | `(entopts: Value) -> Rc<DeviceCustodyDetailEntity>` | Create a DeviceCustodyDetail entity instance. |
| `device_custody_list` | `(entopts: Value) -> Rc<DeviceCustodyListEntity>` | Create a DeviceCustodyList entity instance. |
| `device_list` | `(entopts: Value) -> Rc<DeviceListEntity>` | Create a DeviceList entity instance. |
| `device_receive_result` | `(entopts: Value) -> Rc<DeviceReceiveResultEntity>` | Create a DeviceReceiveResult entity instance. |
| `device_rki_activate_result` | `(entopts: Value) -> Rc<DeviceRkiActivateResultEntity>` | Create a DeviceRkiActivateResult entity instance. |
| `device_state` | `(entopts: Value) -> Rc<DeviceStateEntity>` | Create a DeviceState entity instance. |
| `device_type` | `(entopts: Value) -> Rc<DeviceTypeEntity>` | Create a DeviceType entity instance. |
| `inject_key` | `(entopts: Value) -> Rc<InjectKeyEntity>` | Create an InjectKey entity instance. |
| `kif` | `(entopts: Value) -> Rc<KifEntity>` | Create a Kif entity instance. |
| `location` | `(entopts: Value) -> Rc<LocationEntity>` | Create a Location entity instance. |
| `partner` | `(entopts: Value) -> Rc<PartnerEntity>` | Create a Partner entity instance. |
| `shipment` | `(entopts: Value) -> Rc<ShipmentEntity>` | Create a Shipment entity instance. |
| `success` | `(entopts: Value) -> Rc<SuccessEntity>` | Create a Success entity instance. |
| `transaction` | `(entopts: Value) -> Rc<TransactionEntity>` | Create a Transaction entity instance. |
| `update_result` | `(entopts: Value) -> Rc<UpdateResultEntity>` | Create an UpdateResult entity instance. |
| `user` | `(entopts: Value) -> Rc<UserEntity>` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>` | Load a single entity by match criteria. |
| `list` | `(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>` | List entities matching the criteria (Ok is a `Value::List`). |
| `create` | `(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>` | Create a new entity. |
| `update` | `(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>` | Update an existing entity. |
| `remove` | `(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>` | Remove an entity. |
| `data` | `(args: Option<&Value>) -> Value` | Get entity data (pass `Some(&map)` to set). |
| `matchv` | `(args: Option<&Value>) -> Value` | Get entity match criteria (pass `Some(&map)` to set). |
| `make` | `() -> Rc<dyn Entity>` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return `Result<Value, BluefinDecryptxP2peError>` — the
bare result data on `Ok` (a `Value::Map` for single-entity ops, a
`Value::List` for `list`) and the branded error on `Err`.

The `direct()` escape hatch resolves to `Ok` even on a non-2xx response —
it returns a result `Value::Map` you branch on via `getp(&result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `number` | HTTP status code. |
| `headers` | `map` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `false` and `err` carries the error value.

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

Create an instance: `let attestation = client.attestation(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `std::collections::HashMap<String, Value>` |  |
| `complete_date` | `String` |  |
| `created` | `String` |  |
| `device` | `std::collections::HashMap<String, Value>` |  |
| `id` | `String` |  |
| `name` | `String` |  |
| `note` | `String` |  |

#### Example: Load

```rust
let attestation = client.attestation(Value::Noval).load(jo(vec![("id", Value::str("attestation_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let attestations = client.attestation(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let attestation = client.attestation(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```


### Client

Create an instance: `let client = client.client(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `std::collections::HashMap<String, Value>` |  |
| `created` | `String` |  |
| `direct_partner` | `std::collections::HashMap<String, Value>` |  |
| `id` | `String` |  |
| `is_active` | `bool` |  |
| `location` | `std::collections::HashMap<String, Value>` |  |
| `mid` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `partner` | `std::collections::HashMap<String, Value>` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let client = client.client(Value::Noval).load(jo(vec![("id", Value::str("client_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let clients = client.client(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let client = client.client(Value::Noval).create(jo(vec![
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```


### CreateResult

Create an instance: `let create_result = client.create_result(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Example: Create

```rust
let create_result = client.create_result(Value::Noval).create(jo(vec![
    ("device_type", Value::str("example_device_type")),  // String
    ("serial_number", Value::str("example_serial_number")),  // String
]), Value::Noval).unwrap();
```


### Decryption

Create an instance: `let decryption = client.decryption(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```rust
let decryption = client.decryption(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```


### Device

Create an instance: `let device = client.device(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activated_by` | `std::collections::HashMap<String, Value>` |  |
| `activation_date` | `String` |  |
| `alternate_key` | `String` |  |
| `audit_next_date` | `String` |  |
| `audit_notification_date` | `String` |  |
| `client` | `std::collections::HashMap<String, Value>` |  |
| `created` | `String` |  |
| `created_by` | `std::collections::HashMap<String, Value>` |  |
| `device_build` | `std::collections::HashMap<String, Value>` |  |
| `device_state` | `std::collections::HashMap<String, Value>` |  |
| `device_type` | `std::collections::HashMap<String, Value>` |  |
| `error_counter` | `i64` |  |
| `error_last_date` | `String` |  |
| `id` | `String` |  |
| `initialized_by` | `std::collections::HashMap<String, Value>` |  |
| `initialized_date` | `String` |  |
| `inject_key` | `std::collections::HashMap<String, Value>` |  |
| `is_virtual` | `bool` |  |
| `kif` | `std::collections::HashMap<String, Value>` |  |
| `last_activity_date` | `String` |  |
| `location` | `std::collections::HashMap<String, Value>` |  |
| `modified` | `String` |  |
| `modified_by` | `std::collections::HashMap<String, Value>` |  |
| `name` | `String` |  |
| `note` | `String` |  |
| `partner` | `std::collections::HashMap<String, Value>` |  |
| `serial_number` | `String` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let device = client.device(Value::Noval).load(jo(vec![("id", Value::str("device_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let devices = client.device(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let device = client.device(Value::Noval).create(jo(vec![
    ("activated_by", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("created_by", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("initialized_by", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("modified_by", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```


### DeviceBuild

Create an instance: `let device_build = client.device_build(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_version` | `String` |  |
| `build_number` | `String` |  |
| `config_file_name` | `String` |  |
| `created` | `String` |  |
| `device_type` | `String` |  |
| `firmware_version` | `String` |  |
| `hardware_version` | `String` |  |
| `id` | `i64` |  |
| `is_active` | `bool` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `note` | `String` |  |
| `version` | `i64` |  |
| `white_listing_bin_range` | `String` |  |
| `white_listing_used` | `bool` |  |

#### Example: Load

```rust
let device_build = client.device_build(Value::Noval).load(jo(vec![("id", Value::str("device_build_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let device_builds = client.device_build(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```


### DeviceCustodyDetail

Create an instance: `let device_custody_detail = client.device_custody_detail(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `complete_date` | `String` |  |
| `created` | `String` |  |
| `created_by` | `std::collections::HashMap<String, Value>` |  |
| `custodian` | `std::collections::HashMap<String, Value>` |  |
| `device` | `std::collections::HashMap<String, Value>` |  |
| `id` | `i64` |  |
| `location` | `std::collections::HashMap<String, Value>` |  |
| `modified` | `String` |  |
| `modified_by` | `std::collections::HashMap<String, Value>` |  |
| `note` | `String` |  |
| `status` | `std::collections::HashMap<String, Value>` |  |
| `transfer_method` | `std::collections::HashMap<String, Value>` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let device_custody_detail = client.device_custody_detail(Value::Noval).load(jo(vec![("id", Value::str("device_custody_detail_id")), ("device_type", Value::str("device_type")), ("serial_number", Value::str("serial_number"))]), Value::Noval).unwrap();
```


### DeviceCustodyList

Create an instance: `let device_custody_list = client.device_custody_list(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `complete_date` | `String` |  |
| `created` | `String` |  |
| `created_by` | `std::collections::HashMap<String, Value>` |  |
| `custodian` | `std::collections::HashMap<String, Value>` |  |
| `device` | `std::collections::HashMap<String, Value>` |  |
| `id` | `i64` |  |
| `location` | `std::collections::HashMap<String, Value>` |  |
| `modified` | `String` |  |
| `modified_by` | `std::collections::HashMap<String, Value>` |  |
| `note` | `String` |  |
| `status` | `std::collections::HashMap<String, Value>` |  |
| `transfer_method` | `std::collections::HashMap<String, Value>` |  |
| `version` | `i64` |  |

#### Example: List

```rust
let device_custody_lists = client.device_custody_list(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```


### DeviceList

Create an instance: `let device_list = client.device_list(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `Vec<Value>` |  |
| `total` | `i64` |  |

#### Example: Load

```rust
let device_list = client.device_list(Value::Noval).load(jo(vec![("share_partner_to", Value::str("share_partner_to"))]), Value::Noval).unwrap();
```


### DeviceReceiveResult

Create an instance: `let device_receive_result = client.device_receive_result(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```rust
let device_receive_result = client.device_receive_result(Value::Noval).create(jo(vec![
    ("success", Value::Bool(true)),  // bool
]), Value::Noval).unwrap();
```


### DeviceRkiActivateResult

Create an instance: `let device_rki_activate_result = client.device_rki_activate_result(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```rust
let device_rki_activate_result = client.device_rki_activate_result(Value::Noval).create(jo(vec![
    ("success", Value::Bool(true)),  // bool
]), Value::Noval).unwrap();
```


### DeviceState

Create an instance: `let device_state = client.device_state(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `i64` |  |
| `name` | `String` |  |

#### Example: List

```rust
let device_states = client.device_state(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```


### DeviceType

Create an instance: `let device_type = client.device_type(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` |  |
| `device_type_mode` | `String` |  |
| `hardware_version` | `String` |  |
| `id` | `String` |  |
| `is_active` | `bool` |  |
| `manufacturer` | `String` |  |
| `model` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `photo_url` | `String` |  |
| `product_name` | `String` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let device_type = client.device_type(Value::Noval).load(jo(vec![("id", Value::str("device_type_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let device_types = client.device_type(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```


### InjectKey

Create an instance: `let inject_key = client.inject_key(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` |  |
| `id` | `String` |  |
| `is_active` | `bool` |  |
| `is_p2_pe` | `bool` |  |
| `key_type` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let inject_key = client.inject_key(Value::Noval).load(jo(vec![("id", Value::str("inject_key_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let inject_keys = client.inject_key(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```


### Kif

Create an instance: `let kif = client.kif(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `i64` |  |
| `name` | `String` |  |

#### Example: List

```rust
let kifs = client.kif(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```


### Location

Create an instance: `let location = client.location(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address1` | `String` |  |
| `address2` | `String` |  |
| `billing_id` | `String` |  |
| `city` | `String` |  |
| `country` | `String` |  |
| `created` | `String` |  |
| `custom_reference` | `String` |  |
| `id` | `String` |  |
| `location_type` | `String` |  |
| `mail_address1` | `String` |  |
| `mail_address2` | `String` |  |
| `mail_city` | `String` |  |
| `mail_country` | `String` |  |
| `mail_postal_code` | `String` |  |
| `mail_state_province` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `name_of_business` | `String` |  |
| `note` | `String` |  |
| `postal_code` | `String` |  |
| `state_province` | `String` |  |
| `unique_id` | `String` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let location = client.location(Value::Noval).load(jo(vec![("id", Value::str("location_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let locations = client.location(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let location = client.location(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```


### Partner

Create an instance: `let partner = client.partner(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `client_can_order_equipment` | `bool` |  |
| `contact` | `std::collections::HashMap<String, Value>` |  |
| `created` | `String` |  |
| `id` | `String` |  |
| `is_active` | `bool` |  |
| `location` | `std::collections::HashMap<String, Value>` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `parent` | `std::collections::HashMap<String, Value>` |  |
| `partner_id` | `String` |  |
| `reference` | `String` |  |
| `verification_phrase` | `String` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let partner = client.partner(Value::Noval).load(jo(vec![("id", Value::str("partner_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let partners = client.partner(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let partner = client.partner(Value::Noval).create(jo(vec![
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```


### Shipment

Create an instance: `let shipment = client.shipment(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `String` |  |
| `client` | `std::collections::HashMap<String, Value>` |  |
| `created` | `String` |  |
| `date_received` | `String` |  |
| `date_shipped` | `String` |  |
| `dc_kif` | `std::collections::HashMap<String, Value>` |  |
| `id` | `String` |  |
| `item` | `Vec<Value>` |  |
| `kif` | `std::collections::HashMap<String, Value>` |  |
| `modified` | `String` |  |
| `partner` | `std::collections::HashMap<String, Value>` |  |
| `shipment_type` | `String` |  |
| `tracking` | `String` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let shipment = client.shipment(Value::Noval).load(jo(vec![("id", Value::str("shipment_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let shipments = client.shipment(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let shipment = client.shipment(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```


### Success

Create an instance: `let success = client.success(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```rust
let success = client.success(Value::Noval).create(jo(vec![
    ("share_partner_to", Value::str("example_share_partner_to")),  // String
]), Value::Noval).unwrap();
```


### Transaction

Create an instance: `let transaction = client.transaction(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternate_key` | `String` |  |
| `client` | `std::collections::HashMap<String, Value>` |  |
| `client_ref` | `String` |  |
| `created` | `String` |  |
| `decrypted` | `i64` |  |
| `device_name` | `String` |  |
| `direct_partner` | `std::collections::HashMap<String, Value>` |  |
| `encrypted` | `i64` |  |
| `end_date` | `String` |  |
| `err_code` | `String` |  |
| `err_message` | `String` |  |
| `id` | `String` |  |
| `ip_address` | `String` |  |
| `is_virtual` | `bool` |  |
| `key_type` | `String` |  |
| `location` | `std::collections::HashMap<String, Value>` |  |
| `message_id` | `String` |  |
| `method` | `String` |  |
| `partner` | `std::collections::HashMap<String, Value>` |  |
| `reference` | `String` |  |
| `serial_number` | `String` |  |
| `start_date` | `String` |  |
| `success` | `bool` |  |
| `transaction_source` | `String` |  |

#### Example: Load

```rust
let transaction = client.transaction(Value::Noval).load(jo(vec![("id", Value::str("transaction_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let transactions = client.transaction(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let transaction = client.transaction(Value::Noval).create(jo(vec![
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```


### UpdateResult

Create an instance: `let update_result = client.update_result(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `update(reqdata, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `std::collections::HashMap<String, Value>` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `String` |  |
| `is_active` | `bool` |  |
| `kif` | `std::collections::HashMap<String, Value>` |  |
| `last_name` | `String` |  |
| `partner` | `std::collections::HashMap<String, Value>` |  |
| `phone` | `String` |  |
| `user_name` | `String` |  |
| `user_role` | `std::collections::HashMap<String, Value>` |  |
| `version` | `i64` |  |

#### Example: List

```rust
let update_results = client.update_result(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let update_result = client.update_result(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```


### User

Create an instance: `let user = client.user(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `std::collections::HashMap<String, Value>` |  |
| `created` | `String` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `String` |  |
| `is_active` | `bool` |  |
| `kif` | `std::collections::HashMap<String, Value>` |  |
| `last_name` | `String` |  |
| `modified` | `String` |  |
| `partner` | `std::collections::HashMap<String, Value>` |  |
| `phone` | `String` |  |
| `user_name` | `String` |  |
| `user_role` | `std::collections::HashMap<String, Value>` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let user = client.user(Value::Noval).load(jo(vec![("id", Value::str("user_id"))]), Value::Noval).unwrap();
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

### Data as `Value`

The Rust SDK uses a single dynamic `Value` type throughout rather than a
typed struct per entity. `Value` is the vendored voxgig struct port (a
JSON-shaped enum: `Str`, `Num`, `Bool`, `List`, `Map`, `Null`,
`Noval`). This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with the `jo` / `ja` helpers and read fields back with
`getp`; use `to_map` to safely coerce a value to a map.

### Crate structure

```
rust/
├── lib.rs                       -- Crate root (module decls + re-exports)
├── core/                        -- Pipeline types, config, client (sdk.rs)
├── entity/                      -- Per-entity clients (one module each)
├── feature/                     -- Built-in features (base, test, log)
└── utility/                     -- Utilities + the vendored voxgig struct port
```

The public API is re-exported from the crate root, so `use bluefin_decryptx_p2pe_sdk::{...}`
reaches the SDK client, `Value`, and the `jo` / `ja` / `getp` helpers
directly. Import entity or utility modules only when needed.

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

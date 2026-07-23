# BluefinDecryptxP2pe Rust SDK Reference

Complete API reference for the BluefinDecryptxP2pe Rust SDK.


## BluefinDecryptxP2peSDK

### Constructor

```rust
use bluefin_decryptx_p2pe_sdk::{BluefinDecryptxP2peSDK, Value};

let client = BluefinDecryptxP2peSDK::new(options);
```

Create a new SDK client instance. `options` is a `Value` map
(`Value::Noval` for none).

**Parameters:**

| Key | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides. |


### Static Functions

#### `test_sdk(testopts: Value, sdkopts: Value) -> Rc<BluefinDecryptxP2peSDK>`

Create a test client with mock features active. Both arguments may be
`Value::Noval`.

```rust
use bluefin_decryptx_p2pe_sdk::{test_sdk, Value};

let client = test_sdk(Value::Noval, Value::Noval);
```


### Instance Methods

#### `attestation(entopts: Value) -> Rc<AttestationEntity>`

Create a new `AttestationEntity` instance. Pass `Value::Noval` for no
initial options.

#### `client(entopts: Value) -> Rc<ClientEntity>`

Create a new `ClientEntity` instance. Pass `Value::Noval` for no
initial options.

#### `create_result(entopts: Value) -> Rc<CreateResultEntity>`

Create a new `CreateResultEntity` instance. Pass `Value::Noval` for no
initial options.

#### `decryption(entopts: Value) -> Rc<DecryptionEntity>`

Create a new `DecryptionEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device(entopts: Value) -> Rc<DeviceEntity>`

Create a new `DeviceEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device_build(entopts: Value) -> Rc<DeviceBuildEntity>`

Create a new `DeviceBuildEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device_custody_detail(entopts: Value) -> Rc<DeviceCustodyDetailEntity>`

Create a new `DeviceCustodyDetailEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device_custody_list(entopts: Value) -> Rc<DeviceCustodyListEntity>`

Create a new `DeviceCustodyListEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device_list(entopts: Value) -> Rc<DeviceListEntity>`

Create a new `DeviceListEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device_receive_result(entopts: Value) -> Rc<DeviceReceiveResultEntity>`

Create a new `DeviceReceiveResultEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device_rki_activate_result(entopts: Value) -> Rc<DeviceRkiActivateResultEntity>`

Create a new `DeviceRkiActivateResultEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device_state(entopts: Value) -> Rc<DeviceStateEntity>`

Create a new `DeviceStateEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device_type(entopts: Value) -> Rc<DeviceTypeEntity>`

Create a new `DeviceTypeEntity` instance. Pass `Value::Noval` for no
initial options.

#### `inject_key(entopts: Value) -> Rc<InjectKeyEntity>`

Create a new `InjectKeyEntity` instance. Pass `Value::Noval` for no
initial options.

#### `kif(entopts: Value) -> Rc<KifEntity>`

Create a new `KifEntity` instance. Pass `Value::Noval` for no
initial options.

#### `location(entopts: Value) -> Rc<LocationEntity>`

Create a new `LocationEntity` instance. Pass `Value::Noval` for no
initial options.

#### `partner(entopts: Value) -> Rc<PartnerEntity>`

Create a new `PartnerEntity` instance. Pass `Value::Noval` for no
initial options.

#### `shipment(entopts: Value) -> Rc<ShipmentEntity>`

Create a new `ShipmentEntity` instance. Pass `Value::Noval` for no
initial options.

#### `success(entopts: Value) -> Rc<SuccessEntity>`

Create a new `SuccessEntity` instance. Pass `Value::Noval` for no
initial options.

#### `transaction(entopts: Value) -> Rc<TransactionEntity>`

Create a new `TransactionEntity` instance. Pass `Value::Noval` for no
initial options.

#### `update_result(entopts: Value) -> Rc<UpdateResultEntity>`

Create a new `UpdateResultEntity` instance. Pass `Value::Noval` for no
initial options.

#### `user(entopts: Value) -> Rc<UserEntity>`

Create a new `UserEntity` instance. Pass `Value::Noval` for no
initial options.

#### `options_map() -> Value`

Return a deep copy of the current SDK options.

#### `get_utility() -> Rc<Utility>`

Return a copy of the SDK utility object.

#### `direct(fetchargs: Value) -> Result<Value, BluefinDecryptxP2peError>`

Make a direct HTTP request to any API endpoint. `Ok` is a result `Value::Map`
with `ok`, `status`, `headers`, and `data` (or `err` on failure). This
escape hatch resolves to `Ok` even on a non-2xx response — branch on
`getp(&result, "ok")`.

**Parameters (`fetchargs` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

#### `prepare(fetchargs: Value) -> Result<Value, BluefinDecryptxP2peError>`

Prepare a fetch definition without sending. Returns the fetchdef on `Ok`.


---

## AttestationEntity

```rust
let attestation = client.attestation(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `std::collections::HashMap<String, Value>` | No |  |
| `complete_date` | `String` | No |  |
| `created` | `String` | No |  |
| `device` | `std::collections::HashMap<String, Value>` | No |  |
| `id` | `String` | No |  |
| `name` | `String` | No |  |
| `note` | `String` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.attestation(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.attestation(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for attestation in items.borrow().iter() {
        println!("{:?}", attestation);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.attestation(Value::Noval).load(jo(vec![("id", Value::str("attestation_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `AttestationEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## ClientEntity

```rust
let client = client.client(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `std::collections::HashMap<String, Value>` | No |  |
| `created` | `String` | No |  |
| `direct_partner` | `std::collections::HashMap<String, Value>` | No |  |
| `id` | `String` | No |  |
| `is_active` | `bool` | No |  |
| `location` | `std::collections::HashMap<String, Value>` | Yes |  |
| `mid` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `partner` | `std::collections::HashMap<String, Value>` | No |  |
| `version` | `i64` | No |  |

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

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.client(Value::Noval).create(jo(vec![
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.client(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for client in items.borrow().iter() {
        println!("{:?}", client);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.client(Value::Noval).load(jo(vec![("id", Value::str("client_id"))]), Value::Noval).unwrap();
```

#### `remove(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Remove the entity matching the given criteria. `Err` on failure.

```rust
let result = client.client(Value::Noval).remove(jo(vec![("id", Value::str("client_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `ClientEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## CreateResultEntity

```rust
let create_result = client.create_result(Value::Noval);
```

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.create_result(Value::Noval).create(jo(vec![
    ("device_type", Value::str("example_device_type")),  // String
    ("serial_number", Value::str("example_serial_number")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `CreateResultEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DecryptionEntity

```rust
let decryption = client.decryption(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.decryption(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DecryptionEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceEntity

```rust
let device = client.device(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activated_by` | `std::collections::HashMap<String, Value>` | Yes |  |
| `activation_date` | `String` | No |  |
| `alternate_key` | `String` | No |  |
| `audit_next_date` | `String` | No |  |
| `audit_notification_date` | `String` | No |  |
| `client` | `std::collections::HashMap<String, Value>` | No |  |
| `created` | `String` | No |  |
| `created_by` | `std::collections::HashMap<String, Value>` | Yes |  |
| `device_build` | `std::collections::HashMap<String, Value>` | No |  |
| `device_state` | `std::collections::HashMap<String, Value>` | No |  |
| `device_type` | `std::collections::HashMap<String, Value>` | No |  |
| `error_counter` | `i64` | No |  |
| `error_last_date` | `String` | No |  |
| `id` | `String` | No |  |
| `initialized_by` | `std::collections::HashMap<String, Value>` | Yes |  |
| `initialized_date` | `String` | No |  |
| `inject_key` | `std::collections::HashMap<String, Value>` | No |  |
| `is_virtual` | `bool` | No |  |
| `kif` | `std::collections::HashMap<String, Value>` | No |  |
| `last_activity_date` | `String` | No |  |
| `location` | `std::collections::HashMap<String, Value>` | Yes |  |
| `modified` | `String` | No |  |
| `modified_by` | `std::collections::HashMap<String, Value>` | Yes |  |
| `name` | `String` | No |  |
| `note` | `String` | No |  |
| `partner` | `std::collections::HashMap<String, Value>` | No |  |
| `serial_number` | `String` | No |  |
| `version` | `i64` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.device(Value::Noval).create(jo(vec![
    ("activated_by", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("created_by", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("initialized_by", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("modified_by", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.device(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for device in items.borrow().iter() {
        println!("{:?}", device);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.device(Value::Noval).load(jo(vec![("id", Value::str("device_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceBuildEntity

```rust
let device_build = client.device_build(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_version` | `String` | No |  |
| `build_number` | `String` | No |  |
| `config_file_name` | `String` | No |  |
| `created` | `String` | No |  |
| `device_type` | `String` | No |  |
| `firmware_version` | `String` | No |  |
| `hardware_version` | `String` | No |  |
| `id` | `i64` | No |  |
| `is_active` | `bool` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `note` | `String` | No |  |
| `version` | `i64` | No |  |
| `white_listing_bin_range` | `String` | No |  |
| `white_listing_used` | `bool` | No |  |

### Operations

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.device_build(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for device_build in items.borrow().iter() {
        println!("{:?}", device_build);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.device_build(Value::Noval).load(jo(vec![("id", Value::str("device_build_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceBuildEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceCustodyDetailEntity

```rust
let device_custody_detail = client.device_custody_detail(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `complete_date` | `String` | No |  |
| `created` | `String` | No |  |
| `created_by` | `std::collections::HashMap<String, Value>` | Yes |  |
| `custodian` | `std::collections::HashMap<String, Value>` | Yes |  |
| `device` | `std::collections::HashMap<String, Value>` | No |  |
| `id` | `i64` | No |  |
| `location` | `std::collections::HashMap<String, Value>` | Yes |  |
| `modified` | `String` | No |  |
| `modified_by` | `std::collections::HashMap<String, Value>` | Yes |  |
| `note` | `String` | No |  |
| `status` | `std::collections::HashMap<String, Value>` | No |  |
| `transfer_method` | `std::collections::HashMap<String, Value>` | No |  |
| `version` | `i64` | No |  |

### Operations

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.device_custody_detail(Value::Noval).load(jo(vec![("id", Value::str("device_custody_detail_id")), ("device_type", Value::str("device_type")), ("serial_number", Value::str("serial_number"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceCustodyDetailEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceCustodyListEntity

```rust
let device_custody_list = client.device_custody_list(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `complete_date` | `String` | No |  |
| `created` | `String` | No |  |
| `created_by` | `std::collections::HashMap<String, Value>` | Yes |  |
| `custodian` | `std::collections::HashMap<String, Value>` | Yes |  |
| `device` | `std::collections::HashMap<String, Value>` | No |  |
| `id` | `i64` | No |  |
| `location` | `std::collections::HashMap<String, Value>` | Yes |  |
| `modified` | `String` | No |  |
| `modified_by` | `std::collections::HashMap<String, Value>` | Yes |  |
| `note` | `String` | No |  |
| `status` | `std::collections::HashMap<String, Value>` | No |  |
| `transfer_method` | `std::collections::HashMap<String, Value>` | No |  |
| `version` | `i64` | No |  |

### Operations

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.device_custody_list(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for device_custody_list in items.borrow().iter() {
        println!("{:?}", device_custody_list);
    }
}
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceCustodyListEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceListEntity

```rust
let device_list = client.device_list(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `Vec<Value>` | No |  |
| `total` | `i64` | No |  |

### Operations

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.device_list(Value::Noval).load(jo(vec![("share_partner_to", Value::str("share_partner_to"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceListEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceReceiveResultEntity

```rust
let device_receive_result = client.device_receive_result(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.device_receive_result(Value::Noval).create(jo(vec![
    ("success", Value::Bool(true)),  // bool
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceReceiveResultEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceRkiActivateResultEntity

```rust
let device_rki_activate_result = client.device_rki_activate_result(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.device_rki_activate_result(Value::Noval).create(jo(vec![
    ("success", Value::Bool(true)),  // bool
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceRkiActivateResultEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceStateEntity

```rust
let device_state = client.device_state(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `i64` | No |  |
| `name` | `String` | No |  |

### Operations

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.device_state(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for device_state in items.borrow().iter() {
        println!("{:?}", device_state);
    }
}
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceStateEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceTypeEntity

```rust
let device_type = client.device_type(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String` | No |  |
| `device_type_mode` | `String` | No |  |
| `hardware_version` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `bool` | No |  |
| `manufacturer` | `String` | No |  |
| `model` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `photo_url` | `String` | No |  |
| `product_name` | `String` | No |  |
| `version` | `i64` | No |  |

### Operations

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.device_type(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for device_type in items.borrow().iter() {
        println!("{:?}", device_type);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.device_type(Value::Noval).load(jo(vec![("id", Value::str("device_type_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceTypeEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## InjectKeyEntity

```rust
let inject_key = client.inject_key(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `bool` | No |  |
| `is_p2_pe` | `bool` | No |  |
| `key_type` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `version` | `i64` | No |  |

### Operations

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.inject_key(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for inject_key in items.borrow().iter() {
        println!("{:?}", inject_key);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.inject_key(Value::Noval).load(jo(vec![("id", Value::str("inject_key_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `InjectKeyEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## KifEntity

```rust
let kif = client.kif(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `i64` | No |  |
| `name` | `String` | No |  |

### Operations

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.kif(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for kif in items.borrow().iter() {
        println!("{:?}", kif);
    }
}
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `KifEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## LocationEntity

```rust
let location = client.location(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address1` | `String` | No |  |
| `address2` | `String` | No |  |
| `billing_id` | `String` | No |  |
| `city` | `String` | No |  |
| `country` | `String` | No |  |
| `created` | `String` | No |  |
| `custom_reference` | `String` | No |  |
| `id` | `String` | No |  |
| `location_type` | `String` | No |  |
| `mail_address1` | `String` | No |  |
| `mail_address2` | `String` | No |  |
| `mail_city` | `String` | No |  |
| `mail_country` | `String` | No |  |
| `mail_postal_code` | `String` | No |  |
| `mail_state_province` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `name_of_business` | `String` | No |  |
| `note` | `String` | No |  |
| `postal_code` | `String` | No |  |
| `state_province` | `String` | No |  |
| `unique_id` | `String` | No |  |
| `version` | `i64` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.location(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.location(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for location in items.borrow().iter() {
        println!("{:?}", location);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.location(Value::Noval).load(jo(vec![("id", Value::str("location_id"))]), Value::Noval).unwrap();
```

#### `remove(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Remove the entity matching the given criteria. `Err` on failure.

```rust
let result = client.location(Value::Noval).remove(jo(vec![("id", Value::str("location_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `LocationEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## PartnerEntity

```rust
let partner = client.partner(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `String` | No |  |
| `client_can_order_equipment` | `bool` | No |  |
| `contact` | `std::collections::HashMap<String, Value>` | No |  |
| `created` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `bool` | No |  |
| `location` | `std::collections::HashMap<String, Value>` | Yes |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `parent` | `std::collections::HashMap<String, Value>` | No |  |
| `partner_id` | `String` | No |  |
| `reference` | `String` | No |  |
| `verification_phrase` | `String` | No |  |
| `version` | `i64` | No |  |

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

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.partner(Value::Noval).create(jo(vec![
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.partner(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for partner in items.borrow().iter() {
        println!("{:?}", partner);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.partner(Value::Noval).load(jo(vec![("id", Value::str("partner_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `PartnerEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## ShipmentEntity

```rust
let shipment = client.shipment(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `String` | No |  |
| `client` | `std::collections::HashMap<String, Value>` | No |  |
| `created` | `String` | No |  |
| `date_received` | `String` | No |  |
| `date_shipped` | `String` | No |  |
| `dc_kif` | `std::collections::HashMap<String, Value>` | No |  |
| `id` | `String` | No |  |
| `item` | `Vec<Value>` | No |  |
| `kif` | `std::collections::HashMap<String, Value>` | No |  |
| `modified` | `String` | No |  |
| `partner` | `std::collections::HashMap<String, Value>` | No |  |
| `shipment_type` | `String` | No |  |
| `tracking` | `String` | No |  |
| `version` | `i64` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.shipment(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.shipment(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for shipment in items.borrow().iter() {
        println!("{:?}", shipment);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.shipment(Value::Noval).load(jo(vec![("id", Value::str("shipment_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `ShipmentEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## SuccessEntity

```rust
let success = client.success(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.success(Value::Noval).create(jo(vec![
    ("share_partner_to", Value::str("example_share_partner_to")),  // String
]), Value::Noval).unwrap();
```

#### `remove(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Remove the entity matching the given criteria. `Err` on failure.

```rust
let result = client.success(Value::Noval).remove(jo(vec![("share_partner_to", Value::str("share_partner_to"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `SuccessEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## TransactionEntity

```rust
let transaction = client.transaction(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternate_key` | `String` | No |  |
| `client` | `std::collections::HashMap<String, Value>` | No |  |
| `client_ref` | `String` | No |  |
| `created` | `String` | No |  |
| `decrypted` | `i64` | No |  |
| `device_name` | `String` | No |  |
| `direct_partner` | `std::collections::HashMap<String, Value>` | No |  |
| `encrypted` | `i64` | No |  |
| `end_date` | `String` | No |  |
| `err_code` | `String` | No |  |
| `err_message` | `String` | No |  |
| `id` | `String` | No |  |
| `ip_address` | `String` | No |  |
| `is_virtual` | `bool` | No |  |
| `key_type` | `String` | No |  |
| `location` | `std::collections::HashMap<String, Value>` | Yes |  |
| `message_id` | `String` | No |  |
| `method` | `String` | No |  |
| `partner` | `std::collections::HashMap<String, Value>` | No |  |
| `reference` | `String` | No |  |
| `serial_number` | `String` | No |  |
| `start_date` | `String` | No |  |
| `success` | `bool` | No |  |
| `transaction_source` | `String` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.transaction(Value::Noval).create(jo(vec![
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.transaction(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for transaction in items.borrow().iter() {
        println!("{:?}", transaction);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.transaction(Value::Noval).load(jo(vec![("id", Value::str("transaction_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `TransactionEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## UpdateResultEntity

```rust
let update_result = client.update_result(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `std::collections::HashMap<String, Value>` | No |  |
| `email` | `String` | No |  |
| `first_name` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `bool` | No |  |
| `kif` | `std::collections::HashMap<String, Value>` | No |  |
| `last_name` | `String` | No |  |
| `partner` | `std::collections::HashMap<String, Value>` | No |  |
| `phone` | `String` | No |  |
| `user_name` | `String` | No |  |
| `user_role` | `std::collections::HashMap<String, Value>` | No |  |
| `version` | `i64` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.update_result(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.update_result(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for update_result in items.borrow().iter() {
        println!("{:?}", update_result);
    }
}
```

#### `update(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Update an existing entity. The data must include the entity id. Returns the updated entity data on `Ok`.

```rust
let result = client.update_result(Value::Noval).update(jo(vec![
    ("id", Value::str("id")),
    // Fields to update
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `UpdateResultEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## UserEntity

```rust
let user = client.user(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `std::collections::HashMap<String, Value>` | No |  |
| `created` | `String` | No |  |
| `email` | `String` | No |  |
| `first_name` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `bool` | No |  |
| `kif` | `std::collections::HashMap<String, Value>` | No |  |
| `last_name` | `String` | No |  |
| `modified` | `String` | No |  |
| `partner` | `std::collections::HashMap<String, Value>` | No |  |
| `phone` | `String` | No |  |
| `user_name` | `String` | No |  |
| `user_role` | `std::collections::HashMap<String, Value>` | No |  |
| `version` | `i64` | No |  |

### Operations

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.user(Value::Noval).load(jo(vec![("id", Value::str("user_id"))]), Value::Noval).unwrap();
```

#### `remove(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Remove the entity matching the given criteria. `Err` on failure.

```rust
let result = client.user(Value::Noval).remove(jo(vec![("id", Value::str("user_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `UserEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```rust
let client = BluefinDecryptxP2peSDK::new(jo(vec![
    ("feature", jo(vec![
        ("test", jo(vec![("active", Value::Bool(true))])),
    ])),
]));
```


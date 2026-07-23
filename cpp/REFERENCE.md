# BluefinDecryptxP2pe C++ SDK Reference

Complete API reference for the BluefinDecryptxP2pe C++ SDK.


## BluefinDecryptxP2peSDK

### Constructor

```cpp
#include "core/sdk.hpp"

using namespace sdk;

auto client = std::make_shared<BluefinDecryptxP2peSDK>(options);
```

Create a new SDK client instance. `options` is an `sdk::Value` map.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Value` | SDK configuration options (a map). |
| `options["apikey"]` | `std::string` | API key for authentication. |
| `options["base"]` | `std::string` | Base URL for API requests. |
| `options["prefix"]` | `std::string` | URL prefix appended after base. |
| `options["suffix"]` | `std::string` | URL suffix appended after path. |
| `options["headers"]` | `Value` | Custom headers for all requests. |
| `options["feature"]` | `Value` | Feature configuration. |
| `options["system"]` | `Value` | System overrides. |


### Static Methods

#### `BluefinDecryptxP2peSDK::testSDK(testopts, sdkopts)`

Create a test client with mock features active. Both arguments may be
`Value::undef()`; a no-arg overload is also provided.

```cpp
auto client = BluefinDecryptxP2peSDK::testSDK();
```


### Instance Methods

#### `attestation(entopts = Value::undef()) -> std::shared_ptr<AttestationEntity>`

Create a new `AttestationEntity` instance bound to this client.

#### `client(entopts = Value::undef()) -> std::shared_ptr<ClientEntity>`

Create a new `ClientEntity` instance bound to this client.

#### `create_result(entopts = Value::undef()) -> std::shared_ptr<CreateResultEntity>`

Create a new `CreateResultEntity` instance bound to this client.

#### `decryption(entopts = Value::undef()) -> std::shared_ptr<DecryptionEntity>`

Create a new `DecryptionEntity` instance bound to this client.

#### `device(entopts = Value::undef()) -> std::shared_ptr<DeviceEntity>`

Create a new `DeviceEntity` instance bound to this client.

#### `device_build(entopts = Value::undef()) -> std::shared_ptr<DeviceBuildEntity>`

Create a new `DeviceBuildEntity` instance bound to this client.

#### `device_custody_detail(entopts = Value::undef()) -> std::shared_ptr<DeviceCustodyDetailEntity>`

Create a new `DeviceCustodyDetailEntity` instance bound to this client.

#### `device_custody_list(entopts = Value::undef()) -> std::shared_ptr<DeviceCustodyListEntity>`

Create a new `DeviceCustodyListEntity` instance bound to this client.

#### `device_list(entopts = Value::undef()) -> std::shared_ptr<DeviceListEntity>`

Create a new `DeviceListEntity` instance bound to this client.

#### `device_receive_result(entopts = Value::undef()) -> std::shared_ptr<DeviceReceiveResultEntity>`

Create a new `DeviceReceiveResultEntity` instance bound to this client.

#### `device_rki_activate_result(entopts = Value::undef()) -> std::shared_ptr<DeviceRkiActivateResultEntity>`

Create a new `DeviceRkiActivateResultEntity` instance bound to this client.

#### `device_state(entopts = Value::undef()) -> std::shared_ptr<DeviceStateEntity>`

Create a new `DeviceStateEntity` instance bound to this client.

#### `device_type(entopts = Value::undef()) -> std::shared_ptr<DeviceTypeEntity>`

Create a new `DeviceTypeEntity` instance bound to this client.

#### `inject_key(entopts = Value::undef()) -> std::shared_ptr<InjectKeyEntity>`

Create a new `InjectKeyEntity` instance bound to this client.

#### `kif(entopts = Value::undef()) -> std::shared_ptr<KifEntity>`

Create a new `KifEntity` instance bound to this client.

#### `location(entopts = Value::undef()) -> std::shared_ptr<LocationEntity>`

Create a new `LocationEntity` instance bound to this client.

#### `partner(entopts = Value::undef()) -> std::shared_ptr<PartnerEntity>`

Create a new `PartnerEntity` instance bound to this client.

#### `shipment(entopts = Value::undef()) -> std::shared_ptr<ShipmentEntity>`

Create a new `ShipmentEntity` instance bound to this client.

#### `success(entopts = Value::undef()) -> std::shared_ptr<SuccessEntity>`

Create a new `SuccessEntity` instance bound to this client.

#### `transaction(entopts = Value::undef()) -> std::shared_ptr<TransactionEntity>`

Create a new `TransactionEntity` instance bound to this client.

#### `update_result(entopts = Value::undef()) -> std::shared_ptr<UpdateResultEntity>`

Create a new `UpdateResultEntity` instance bound to this client.

#### `user(entopts = Value::undef()) -> std::shared_ptr<UserEntity>`

Create a new `UserEntity` instance bound to this client.

#### `optionsMap() -> Value`

Return a deep copy of the current SDK options.

#### `getUtility() -> UtilityPtr`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> Value`

Make a direct HTTP request to any API endpoint. Returns a result `Value` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never throws — branch on `getp(result, "ok")`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `std::string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `std::string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Value` | Path parameter values. |
| `fetchargs["query"]` | `Value` | Query string parameters. |
| `fetchargs["headers"]` | `Value` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Value` | Request body (maps are JSON-serialized). |

**Returns:** `Value` (result map)

#### `prepare(fetchargs) -> Value`

Prepare a fetch definition without sending. Returns the `fetchdef` and throws on error.


---

## AttestationEntity

```cpp
auto attestation = client->attestation();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `std::map<std::string, Value>` | No |  |
| `complete_date` | `std::string` | No |  |
| `created` | `std::string` | No |  |
| `device` | `std::map<std::string, Value>` | No |  |
| `id` | `std::string` | No |  |
| `name` | `std::string` | No |  |
| `note` | `std::string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->attestation()->create(vmap({
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->attestation()->list(Value::undef(), Value::undef());
for (const auto& attestation : *results.as_list()) {
  std::cout << Struct::jsonify(attestation) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->attestation()->load(vmap({{"id", Value("attestation_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `AttestationEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## ClientEntity

```cpp
auto client = client->client();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `std::map<std::string, Value>` | No |  |
| `created` | `std::string` | No |  |
| `direct_partner` | `std::map<std::string, Value>` | No |  |
| `id` | `std::string` | No |  |
| `is_active` | `bool` | No |  |
| `location` | `std::map<std::string, Value>` | Yes |  |
| `mid` | `std::string` | No |  |
| `modified` | `std::string` | No |  |
| `name` | `std::string` | No |  |
| `partner` | `std::map<std::string, Value>` | No |  |
| `version` | `int64_t` | No |  |

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

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->client()->create(vmap({
    {"location", vmap()},  // std::map<std::string, Value>
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->client()->list(Value::undef(), Value::undef());
for (const auto& client : *results.as_list()) {
  std::cout << Struct::jsonify(client) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->client()->load(vmap({{"id", Value("client_id")}}), Value::undef());
```

#### `remove(reqmatch, ctrl) -> Value`

Remove the entity matching the given criteria. Throws on error.

```cpp
Value result = client->client()->remove(vmap({{"id", Value("client_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `ClientEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## CreateResultEntity

```cpp
auto create_result = client->create_result();
```

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->create_result()->create(vmap({
    {"device_type", Value("example_device_type")},  // std::string
    {"serial_number", Value("example_serial_number")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `CreateResultEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DecryptionEntity

```cpp
auto decryption = client->decryption();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->decryption()->create(vmap({
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DecryptionEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceEntity

```cpp
auto device = client->device();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activated_by` | `std::map<std::string, Value>` | Yes |  |
| `activation_date` | `std::string` | No |  |
| `alternate_key` | `std::string` | No |  |
| `audit_next_date` | `std::string` | No |  |
| `audit_notification_date` | `std::string` | No |  |
| `client` | `std::map<std::string, Value>` | No |  |
| `created` | `std::string` | No |  |
| `created_by` | `std::map<std::string, Value>` | Yes |  |
| `device_build` | `std::map<std::string, Value>` | No |  |
| `device_state` | `std::map<std::string, Value>` | No |  |
| `device_type` | `std::map<std::string, Value>` | No |  |
| `error_counter` | `int64_t` | No |  |
| `error_last_date` | `std::string` | No |  |
| `id` | `std::string` | No |  |
| `initialized_by` | `std::map<std::string, Value>` | Yes |  |
| `initialized_date` | `std::string` | No |  |
| `inject_key` | `std::map<std::string, Value>` | No |  |
| `is_virtual` | `bool` | No |  |
| `kif` | `std::map<std::string, Value>` | No |  |
| `last_activity_date` | `std::string` | No |  |
| `location` | `std::map<std::string, Value>` | Yes |  |
| `modified` | `std::string` | No |  |
| `modified_by` | `std::map<std::string, Value>` | Yes |  |
| `name` | `std::string` | No |  |
| `note` | `std::string` | No |  |
| `partner` | `std::map<std::string, Value>` | No |  |
| `serial_number` | `std::string` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->device()->create(vmap({
    {"activated_by", vmap()},  // std::map<std::string, Value>
    {"created_by", vmap()},  // std::map<std::string, Value>
    {"initialized_by", vmap()},  // std::map<std::string, Value>
    {"location", vmap()},  // std::map<std::string, Value>
    {"modified_by", vmap()},  // std::map<std::string, Value>
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->device()->list(Value::undef(), Value::undef());
for (const auto& device : *results.as_list()) {
  std::cout << Struct::jsonify(device) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->device()->load(vmap({{"id", Value("device_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceBuildEntity

```cpp
auto device_build = client->device_build();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_version` | `std::string` | No |  |
| `build_number` | `std::string` | No |  |
| `config_file_name` | `std::string` | No |  |
| `created` | `std::string` | No |  |
| `device_type` | `std::string` | No |  |
| `firmware_version` | `std::string` | No |  |
| `hardware_version` | `std::string` | No |  |
| `id` | `int64_t` | No |  |
| `is_active` | `bool` | No |  |
| `modified` | `std::string` | No |  |
| `name` | `std::string` | No |  |
| `note` | `std::string` | No |  |
| `version` | `int64_t` | No |  |
| `white_listing_bin_range` | `std::string` | No |  |
| `white_listing_used` | `bool` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->device_build()->list(Value::undef(), Value::undef());
for (const auto& device_build : *results.as_list()) {
  std::cout << Struct::jsonify(device_build) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->device_build()->load(vmap({{"id", Value("device_build_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceBuildEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceCustodyDetailEntity

```cpp
auto device_custody_detail = client->device_custody_detail();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `complete_date` | `std::string` | No |  |
| `created` | `std::string` | No |  |
| `created_by` | `std::map<std::string, Value>` | Yes |  |
| `custodian` | `std::map<std::string, Value>` | Yes |  |
| `device` | `std::map<std::string, Value>` | No |  |
| `id` | `int64_t` | No |  |
| `location` | `std::map<std::string, Value>` | Yes |  |
| `modified` | `std::string` | No |  |
| `modified_by` | `std::map<std::string, Value>` | Yes |  |
| `note` | `std::string` | No |  |
| `status` | `std::map<std::string, Value>` | No |  |
| `transfer_method` | `std::map<std::string, Value>` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->device_custody_detail()->load(vmap({{"id", Value("device_custody_detail_id")}, {"device_type", Value("device_type")}, {"serial_number", Value("serial_number")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceCustodyDetailEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceCustodyListEntity

```cpp
auto device_custody_list = client->device_custody_list();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `complete_date` | `std::string` | No |  |
| `created` | `std::string` | No |  |
| `created_by` | `std::map<std::string, Value>` | Yes |  |
| `custodian` | `std::map<std::string, Value>` | Yes |  |
| `device` | `std::map<std::string, Value>` | No |  |
| `id` | `int64_t` | No |  |
| `location` | `std::map<std::string, Value>` | Yes |  |
| `modified` | `std::string` | No |  |
| `modified_by` | `std::map<std::string, Value>` | Yes |  |
| `note` | `std::string` | No |  |
| `status` | `std::map<std::string, Value>` | No |  |
| `transfer_method` | `std::map<std::string, Value>` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->device_custody_list()->list(Value::undef(), Value::undef());
for (const auto& device_custody_list : *results.as_list()) {
  std::cout << Struct::jsonify(device_custody_list) << std::endl;
}
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceCustodyListEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceListEntity

```cpp
auto device_list = client->device_list();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `std::vector<Value>` | No |  |
| `total` | `int64_t` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->device_list()->load(vmap({{"share_partner_to", Value("share_partner_to")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceListEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceReceiveResultEntity

```cpp
auto device_receive_result = client->device_receive_result();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->device_receive_result()->create(vmap({
    {"success", Value(true)},  // bool
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceReceiveResultEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceRkiActivateResultEntity

```cpp
auto device_rki_activate_result = client->device_rki_activate_result();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->device_rki_activate_result()->create(vmap({
    {"success", Value(true)},  // bool
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceRkiActivateResultEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceStateEntity

```cpp
auto device_state = client->device_state();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int64_t` | No |  |
| `name` | `std::string` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->device_state()->list(Value::undef(), Value::undef());
for (const auto& device_state : *results.as_list()) {
  std::cout << Struct::jsonify(device_state) << std::endl;
}
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceStateEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceTypeEntity

```cpp
auto device_type = client->device_type();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `std::string` | No |  |
| `device_type_mode` | `std::string` | No |  |
| `hardware_version` | `std::string` | No |  |
| `id` | `std::string` | No |  |
| `is_active` | `bool` | No |  |
| `manufacturer` | `std::string` | No |  |
| `model` | `std::string` | No |  |
| `modified` | `std::string` | No |  |
| `name` | `std::string` | No |  |
| `photo_url` | `std::string` | No |  |
| `product_name` | `std::string` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->device_type()->list(Value::undef(), Value::undef());
for (const auto& device_type : *results.as_list()) {
  std::cout << Struct::jsonify(device_type) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->device_type()->load(vmap({{"id", Value("device_type_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceTypeEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## InjectKeyEntity

```cpp
auto inject_key = client->inject_key();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `std::string` | No |  |
| `id` | `std::string` | No |  |
| `is_active` | `bool` | No |  |
| `is_p2_pe` | `bool` | No |  |
| `key_type` | `std::string` | No |  |
| `modified` | `std::string` | No |  |
| `name` | `std::string` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->inject_key()->list(Value::undef(), Value::undef());
for (const auto& inject_key : *results.as_list()) {
  std::cout << Struct::jsonify(inject_key) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->inject_key()->load(vmap({{"id", Value("inject_key_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `InjectKeyEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## KifEntity

```cpp
auto kif = client->kif();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int64_t` | No |  |
| `name` | `std::string` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->kif()->list(Value::undef(), Value::undef());
for (const auto& kif : *results.as_list()) {
  std::cout << Struct::jsonify(kif) << std::endl;
}
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `KifEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## LocationEntity

```cpp
auto location = client->location();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address1` | `std::string` | No |  |
| `address2` | `std::string` | No |  |
| `billing_id` | `std::string` | No |  |
| `city` | `std::string` | No |  |
| `country` | `std::string` | No |  |
| `created` | `std::string` | No |  |
| `custom_reference` | `std::string` | No |  |
| `id` | `std::string` | No |  |
| `location_type` | `std::string` | No |  |
| `mail_address1` | `std::string` | No |  |
| `mail_address2` | `std::string` | No |  |
| `mail_city` | `std::string` | No |  |
| `mail_country` | `std::string` | No |  |
| `mail_postal_code` | `std::string` | No |  |
| `mail_state_province` | `std::string` | No |  |
| `modified` | `std::string` | No |  |
| `name` | `std::string` | No |  |
| `name_of_business` | `std::string` | No |  |
| `note` | `std::string` | No |  |
| `postal_code` | `std::string` | No |  |
| `state_province` | `std::string` | No |  |
| `unique_id` | `std::string` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->location()->create(vmap({
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->location()->list(Value::undef(), Value::undef());
for (const auto& location : *results.as_list()) {
  std::cout << Struct::jsonify(location) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->location()->load(vmap({{"id", Value("location_id")}}), Value::undef());
```

#### `remove(reqmatch, ctrl) -> Value`

Remove the entity matching the given criteria. Throws on error.

```cpp
Value result = client->location()->remove(vmap({{"id", Value("location_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `LocationEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## PartnerEntity

```cpp
auto partner = client->partner();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `std::string` | No |  |
| `client_can_order_equipment` | `bool` | No |  |
| `contact` | `std::map<std::string, Value>` | No |  |
| `created` | `std::string` | No |  |
| `id` | `std::string` | No |  |
| `is_active` | `bool` | No |  |
| `location` | `std::map<std::string, Value>` | Yes |  |
| `modified` | `std::string` | No |  |
| `name` | `std::string` | No |  |
| `parent` | `std::map<std::string, Value>` | No |  |
| `partner_id` | `std::string` | No |  |
| `reference` | `std::string` | No |  |
| `verification_phrase` | `std::string` | No |  |
| `version` | `int64_t` | No |  |

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

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->partner()->create(vmap({
    {"location", vmap()},  // std::map<std::string, Value>
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->partner()->list(Value::undef(), Value::undef());
for (const auto& partner : *results.as_list()) {
  std::cout << Struct::jsonify(partner) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->partner()->load(vmap({{"id", Value("partner_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `PartnerEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## ShipmentEntity

```cpp
auto shipment = client->shipment();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `std::string` | No |  |
| `client` | `std::map<std::string, Value>` | No |  |
| `created` | `std::string` | No |  |
| `date_received` | `std::string` | No |  |
| `date_shipped` | `std::string` | No |  |
| `dc_kif` | `std::map<std::string, Value>` | No |  |
| `id` | `std::string` | No |  |
| `item` | `std::vector<Value>` | No |  |
| `kif` | `std::map<std::string, Value>` | No |  |
| `modified` | `std::string` | No |  |
| `partner` | `std::map<std::string, Value>` | No |  |
| `shipment_type` | `std::string` | No |  |
| `tracking` | `std::string` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->shipment()->create(vmap({
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->shipment()->list(Value::undef(), Value::undef());
for (const auto& shipment : *results.as_list()) {
  std::cout << Struct::jsonify(shipment) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->shipment()->load(vmap({{"id", Value("shipment_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `ShipmentEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## SuccessEntity

```cpp
auto success = client->success();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->success()->create(vmap({
    {"share_partner_to", Value("example_share_partner_to")},  // std::string
}), Value::undef());
```

#### `remove(reqmatch, ctrl) -> Value`

Remove the entity matching the given criteria. Throws on error.

```cpp
Value result = client->success()->remove(vmap({{"share_partner_to", Value("share_partner_to")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `SuccessEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## TransactionEntity

```cpp
auto transaction = client->transaction();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternate_key` | `std::string` | No |  |
| `client` | `std::map<std::string, Value>` | No |  |
| `client_ref` | `std::string` | No |  |
| `created` | `std::string` | No |  |
| `decrypted` | `int64_t` | No |  |
| `device_name` | `std::string` | No |  |
| `direct_partner` | `std::map<std::string, Value>` | No |  |
| `encrypted` | `int64_t` | No |  |
| `end_date` | `std::string` | No |  |
| `err_code` | `std::string` | No |  |
| `err_message` | `std::string` | No |  |
| `id` | `std::string` | No |  |
| `ip_address` | `std::string` | No |  |
| `is_virtual` | `bool` | No |  |
| `key_type` | `std::string` | No |  |
| `location` | `std::map<std::string, Value>` | Yes |  |
| `message_id` | `std::string` | No |  |
| `method` | `std::string` | No |  |
| `partner` | `std::map<std::string, Value>` | No |  |
| `reference` | `std::string` | No |  |
| `serial_number` | `std::string` | No |  |
| `start_date` | `std::string` | No |  |
| `success` | `bool` | No |  |
| `transaction_source` | `std::string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->transaction()->create(vmap({
    {"location", vmap()},  // std::map<std::string, Value>
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->transaction()->list(Value::undef(), Value::undef());
for (const auto& transaction : *results.as_list()) {
  std::cout << Struct::jsonify(transaction) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->transaction()->load(vmap({{"id", Value("transaction_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `TransactionEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## UpdateResultEntity

```cpp
auto update_result = client->update_result();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `std::map<std::string, Value>` | No |  |
| `email` | `std::string` | No |  |
| `first_name` | `std::string` | No |  |
| `id` | `std::string` | No |  |
| `is_active` | `bool` | No |  |
| `kif` | `std::map<std::string, Value>` | No |  |
| `last_name` | `std::string` | No |  |
| `partner` | `std::map<std::string, Value>` | No |  |
| `phone` | `std::string` | No |  |
| `user_name` | `std::string` | No |  |
| `user_role` | `std::map<std::string, Value>` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->update_result()->create(vmap({
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->update_result()->list(Value::undef(), Value::undef());
for (const auto& update_result : *results.as_list()) {
  std::cout << Struct::jsonify(update_result) << std::endl;
}
```

#### `update(reqdata, ctrl) -> Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```cpp
Value result = client->update_result()->update(vmap({
    {"id", Value("id")},
    // Fields to update
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `UpdateResultEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## UserEntity

```cpp
auto user = client->user();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `std::map<std::string, Value>` | No |  |
| `created` | `std::string` | No |  |
| `email` | `std::string` | No |  |
| `first_name` | `std::string` | No |  |
| `id` | `std::string` | No |  |
| `is_active` | `bool` | No |  |
| `kif` | `std::map<std::string, Value>` | No |  |
| `last_name` | `std::string` | No |  |
| `modified` | `std::string` | No |  |
| `partner` | `std::map<std::string, Value>` | No |  |
| `phone` | `std::string` | No |  |
| `user_name` | `std::string` | No |  |
| `user_role` | `std::map<std::string, Value>` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->user()->load(vmap({{"id", Value("user_id")}}), Value::undef());
```

#### `remove(reqmatch, ctrl) -> Value`

Remove the entity matching the given criteria. Throws on error.

```cpp
Value result = client->user()->remove(vmap({{"id", Value("user_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `UserEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```cpp
auto client = std::make_shared<BluefinDecryptxP2peSDK>(vmap({
    {"feature", vmap({
        {"test", vmap({{"active", Value(true)}})},
    })},
}));
```


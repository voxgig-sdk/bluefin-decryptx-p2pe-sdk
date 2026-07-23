# BluefinDecryptxP2pe Java SDK Reference

Complete API reference for the BluefinDecryptxP2pe Java SDK.


## BluefinDecryptxP2peSDK

### Constructor

```java
BluefinDecryptxP2peSDK client = new BluefinDecryptxP2peSDK(options);
```

Create a new SDK client instance. `options` is a `Map<String, Object>`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Map` | SDK configuration options. |
| `options["apikey"]` | `String` | API key for authentication. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Map` | Custom headers for all requests. |
| `options["feature"]` | `Map` | Feature configuration. |
| `options["system"]` | `Map` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinDecryptxP2peSDK.testSDK(testopts, sdkopts)`

Create a test client with mock features active. Both arguments may be `null`.

```java
BluefinDecryptxP2peSDK client = BluefinDecryptxP2peSDK.testSDK(null, null);
```


### Instance Methods

#### `attestation(entopts)`

Create a new `Attestation` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `client(entopts)`

Create a new `Client` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `createResult(entopts)`

Create a new `CreateResult` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `decryption(entopts)`

Create a new `Decryption` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `device(entopts)`

Create a new `Device` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `deviceBuild(entopts)`

Create a new `DeviceBuild` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `deviceCustodyDetail(entopts)`

Create a new `DeviceCustodyDetail` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `deviceCustodyList(entopts)`

Create a new `DeviceCustodyList` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `deviceList(entopts)`

Create a new `DeviceList` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `deviceReceiveResult(entopts)`

Create a new `DeviceReceiveResult` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `deviceRkiActivateResult(entopts)`

Create a new `DeviceRkiActivateResult` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `deviceState(entopts)`

Create a new `DeviceState` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `deviceType(entopts)`

Create a new `DeviceType` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `injectKey(entopts)`

Create a new `InjectKey` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `kif(entopts)`

Create a new `Kif` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `location(entopts)`

Create a new `Location` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `partner(entopts)`

Create a new `Partner` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `shipment(entopts)`

Create a new `Shipment` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `success(entopts)`

Create a new `Success` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `transaction(entopts)`

Create a new `Transaction` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `updateResult(entopts)`

Create a new `UpdateResult` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `user(entopts)`

Create a new `User` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `optionsMap() -> Map`

Return a deep copy of the current SDK options.

#### `getUtility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> Map`

Make a direct HTTP request to any API endpoint. Returns a result
`Map<String, Object>` with `ok`, `status`, `headers`, and `data` (or
`err` on failure). This escape hatch never raises — branch on
`result.get("ok")`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Map` | Path parameter values. |
| `fetchargs["query"]` | `Map` | Query string parameters. |
| `fetchargs["headers"]` | `Map` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Object` | Request body (maps are JSON-serialized). |

**Returns:** `Map<String, Object>`

#### `prepare(fetchargs) -> Map`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## Attestation

```java
SdkEntity attestation = client.attestation(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Map<String, Object>` | No |  |
| `complete_date` | `String` | No |  |
| `created` | `String` | No |  |
| `device` | `Map<String, Object>` | No |  |
| `id` | `String` | No |  |
| `name` | `String` | No |  |
| `note` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.attestation(null).create(Map.of(
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.attestation(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.attestation(null).load(Map.of("id", "attestation_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Attestation` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Client

```java
SdkEntity client = client.client(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `Map<String, Object>` | No |  |
| `created` | `String` | No |  |
| `direct_partner` | `Map<String, Object>` | No |  |
| `id` | `String` | No |  |
| `is_active` | `Boolean` | No |  |
| `location` | `Map<String, Object>` | Yes |  |
| `mid` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `partner` | `Map<String, Object>` | No |  |
| `version` | `Long` | No |  |

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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.client(null).create(Map.of(
    "location", Map.of()  // Map<String, Object>
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.client(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.client(null).load(Map.of("id", "client_id"), null);
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```java
Object result = client.client(null).remove(Map.of("id", "client_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Client` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## CreateResult

```java
SdkEntity createResult = client.createResult(null);
```

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.createResult(null).create(Map.of(
    "device_type", "example_device_type",  // String
    "serial_number", "example_serial_number"  // String
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `CreateResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Decryption

```java
SdkEntity decryption = client.decryption(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Boolean` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.decryption(null).create(Map.of(
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Decryption` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Device

```java
SdkEntity device = client.device(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activated_by` | `Map<String, Object>` | Yes |  |
| `activation_date` | `String` | No |  |
| `alternate_key` | `String` | No |  |
| `audit_next_date` | `String` | No |  |
| `audit_notification_date` | `String` | No |  |
| `client` | `Map<String, Object>` | No |  |
| `created` | `String` | No |  |
| `created_by` | `Map<String, Object>` | Yes |  |
| `device_build` | `Map<String, Object>` | No |  |
| `device_state` | `Map<String, Object>` | No |  |
| `device_type` | `Map<String, Object>` | No |  |
| `error_counter` | `Long` | No |  |
| `error_last_date` | `String` | No |  |
| `id` | `String` | No |  |
| `initialized_by` | `Map<String, Object>` | Yes |  |
| `initialized_date` | `String` | No |  |
| `inject_key` | `Map<String, Object>` | No |  |
| `is_virtual` | `Boolean` | No |  |
| `kif` | `Map<String, Object>` | No |  |
| `last_activity_date` | `String` | No |  |
| `location` | `Map<String, Object>` | Yes |  |
| `modified` | `String` | No |  |
| `modified_by` | `Map<String, Object>` | Yes |  |
| `name` | `String` | No |  |
| `note` | `String` | No |  |
| `partner` | `Map<String, Object>` | No |  |
| `serial_number` | `String` | No |  |
| `version` | `Long` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.device(null).create(Map.of(
    "activated_by", Map.of(),  // Map<String, Object>
    "created_by", Map.of(),  // Map<String, Object>
    "initialized_by", Map.of(),  // Map<String, Object>
    "location", Map.of(),  // Map<String, Object>
    "modified_by", Map.of()  // Map<String, Object>
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.device(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.device(null).load(Map.of("id", "device_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Device` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceBuild

```java
SdkEntity deviceBuild = client.deviceBuild(null);
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
| `id` | `Long` | No |  |
| `is_active` | `Boolean` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `note` | `String` | No |  |
| `version` | `Long` | No |  |
| `white_listing_bin_range` | `String` | No |  |
| `white_listing_used` | `Boolean` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.deviceBuild(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.deviceBuild(null).load(Map.of("id", "device_build_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceBuild` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceCustodyDetail

```java
SdkEntity deviceCustodyDetail = client.deviceCustodyDetail(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `complete_date` | `String` | No |  |
| `created` | `String` | No |  |
| `created_by` | `Map<String, Object>` | Yes |  |
| `custodian` | `Map<String, Object>` | Yes |  |
| `device` | `Map<String, Object>` | No |  |
| `id` | `Long` | No |  |
| `location` | `Map<String, Object>` | Yes |  |
| `modified` | `String` | No |  |
| `modified_by` | `Map<String, Object>` | Yes |  |
| `note` | `String` | No |  |
| `status` | `Map<String, Object>` | No |  |
| `transfer_method` | `Map<String, Object>` | No |  |
| `version` | `Long` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.deviceCustodyDetail(null).load(Map.of("id", "device_custody_detail_id", "device_type", "device_type", "serial_number", "serial_number"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceCustodyDetail` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceCustodyList

```java
SdkEntity deviceCustodyList = client.deviceCustodyList(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `complete_date` | `String` | No |  |
| `created` | `String` | No |  |
| `created_by` | `Map<String, Object>` | Yes |  |
| `custodian` | `Map<String, Object>` | Yes |  |
| `device` | `Map<String, Object>` | No |  |
| `id` | `Long` | No |  |
| `location` | `Map<String, Object>` | Yes |  |
| `modified` | `String` | No |  |
| `modified_by` | `Map<String, Object>` | Yes |  |
| `note` | `String` | No |  |
| `status` | `Map<String, Object>` | No |  |
| `transfer_method` | `Map<String, Object>` | No |  |
| `version` | `Long` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.deviceCustodyList(null).list(null, null);
System.out.println(results);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceCustodyList` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceList

```java
SdkEntity deviceList = client.deviceList(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `List<Object>` | No |  |
| `total` | `Long` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.deviceList(null).load(Map.of("share_partner_to", "share_partner_to"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceList` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceReceiveResult

```java
SdkEntity deviceReceiveResult = client.deviceReceiveResult(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Boolean` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.deviceReceiveResult(null).create(Map.of(
    "success", true  // Boolean
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceReceiveResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceRkiActivateResult

```java
SdkEntity deviceRkiActivateResult = client.deviceRkiActivateResult(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Boolean` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.deviceRkiActivateResult(null).create(Map.of(
    "success", true  // Boolean
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceRkiActivateResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceState

```java
SdkEntity deviceState = client.deviceState(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `Long` | No |  |
| `name` | `String` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.deviceState(null).list(null, null);
System.out.println(results);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceState` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceType

```java
SdkEntity deviceType = client.deviceType(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String` | No |  |
| `device_type_mode` | `String` | No |  |
| `hardware_version` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `Boolean` | No |  |
| `manufacturer` | `String` | No |  |
| `model` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `photo_url` | `String` | No |  |
| `product_name` | `String` | No |  |
| `version` | `Long` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.deviceType(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.deviceType(null).load(Map.of("id", "device_type_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceType` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## InjectKey

```java
SdkEntity injectKey = client.injectKey(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `Boolean` | No |  |
| `is_p2_pe` | `Boolean` | No |  |
| `key_type` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `version` | `Long` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.injectKey(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.injectKey(null).load(Map.of("id", "inject_key_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `InjectKey` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Kif

```java
SdkEntity kif = client.kif(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `Long` | No |  |
| `name` | `String` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.kif(null).list(null, null);
System.out.println(results);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Kif` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Location

```java
SdkEntity location = client.location(null);
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
| `version` | `Long` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.location(null).create(Map.of(
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.location(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.location(null).load(Map.of("id", "location_id"), null);
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```java
Object result = client.location(null).remove(Map.of("id", "location_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Location` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Partner

```java
SdkEntity partner = client.partner(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `String` | No |  |
| `client_can_order_equipment` | `Boolean` | No |  |
| `contact` | `Map<String, Object>` | No |  |
| `created` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `Boolean` | No |  |
| `location` | `Map<String, Object>` | Yes |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `parent` | `Map<String, Object>` | No |  |
| `partner_id` | `String` | No |  |
| `reference` | `String` | No |  |
| `verification_phrase` | `String` | No |  |
| `version` | `Long` | No |  |

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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.partner(null).create(Map.of(
    "location", Map.of()  // Map<String, Object>
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.partner(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.partner(null).load(Map.of("id", "partner_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Partner` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Shipment

```java
SdkEntity shipment = client.shipment(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `String` | No |  |
| `client` | `Map<String, Object>` | No |  |
| `created` | `String` | No |  |
| `date_received` | `String` | No |  |
| `date_shipped` | `String` | No |  |
| `dc_kif` | `Map<String, Object>` | No |  |
| `id` | `String` | No |  |
| `item` | `List<Object>` | No |  |
| `kif` | `Map<String, Object>` | No |  |
| `modified` | `String` | No |  |
| `partner` | `Map<String, Object>` | No |  |
| `shipment_type` | `String` | No |  |
| `tracking` | `String` | No |  |
| `version` | `Long` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.shipment(null).create(Map.of(
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.shipment(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.shipment(null).load(Map.of("id", "shipment_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Shipment` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Success

```java
SdkEntity success = client.success(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Boolean` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.success(null).create(Map.of(
    "share_partner_to", "example_share_partner_to"  // String
), null);
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```java
Object result = client.success(null).remove(Map.of("share_partner_to", "share_partner_to"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Success` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Transaction

```java
SdkEntity transaction = client.transaction(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternate_key` | `String` | No |  |
| `client` | `Map<String, Object>` | No |  |
| `client_ref` | `String` | No |  |
| `created` | `String` | No |  |
| `decrypted` | `Long` | No |  |
| `device_name` | `String` | No |  |
| `direct_partner` | `Map<String, Object>` | No |  |
| `encrypted` | `Long` | No |  |
| `end_date` | `String` | No |  |
| `err_code` | `String` | No |  |
| `err_message` | `String` | No |  |
| `id` | `String` | No |  |
| `ip_address` | `String` | No |  |
| `is_virtual` | `Boolean` | No |  |
| `key_type` | `String` | No |  |
| `location` | `Map<String, Object>` | Yes |  |
| `message_id` | `String` | No |  |
| `method` | `String` | No |  |
| `partner` | `Map<String, Object>` | No |  |
| `reference` | `String` | No |  |
| `serial_number` | `String` | No |  |
| `start_date` | `String` | No |  |
| `success` | `Boolean` | No |  |
| `transaction_source` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.transaction(null).create(Map.of(
    "location", Map.of()  // Map<String, Object>
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.transaction(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.transaction(null).load(Map.of("id", "transaction_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Transaction` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## UpdateResult

```java
SdkEntity updateResult = client.updateResult(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Map<String, Object>` | No |  |
| `email` | `String` | No |  |
| `first_name` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `Boolean` | No |  |
| `kif` | `Map<String, Object>` | No |  |
| `last_name` | `String` | No |  |
| `partner` | `Map<String, Object>` | No |  |
| `phone` | `String` | No |  |
| `user_name` | `String` | No |  |
| `user_role` | `Map<String, Object>` | No |  |
| `version` | `Long` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.updateResult(null).create(Map.of(
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.updateResult(null).list(null, null);
System.out.println(results);
```

#### `update(reqdata, ctrl) -> Object`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```java
Object result = client.updateResult(null).update(Map.of(
    "id", "id"
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `UpdateResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## User

```java
SdkEntity user = client.user(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Map<String, Object>` | No |  |
| `created` | `String` | No |  |
| `email` | `String` | No |  |
| `first_name` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `Boolean` | No |  |
| `kif` | `Map<String, Object>` | No |  |
| `last_name` | `String` | No |  |
| `modified` | `String` | No |  |
| `partner` | `Map<String, Object>` | No |  |
| `phone` | `String` | No |  |
| `user_name` | `String` | No |  |
| `user_role` | `Map<String, Object>` | No |  |
| `version` | `Long` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.user(null).load(Map.of("id", "user_id"), null);
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```java
Object result = client.user(null).remove(Map.of("id", "user_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `User` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```java
Map<String, Object> feature = new java.util.LinkedHashMap<>();
feature.put("test", Map.of("active", true));
Map<String, Object> options = new java.util.LinkedHashMap<>();
options.put("feature", feature);
BluefinDecryptxP2peSDK client = new BluefinDecryptxP2peSDK(options);
```


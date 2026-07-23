# BluefinDecryptxP2pe TypeScript SDK Reference

Complete API reference for the BluefinDecryptxP2pe TypeScript SDK.


## BluefinDecryptxP2peSDK

### Constructor

```ts
new BluefinDecryptxP2peSDK(options?: object)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `object` | SDK configuration options. |
| `options.apikey` | `string` | API key for authentication. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `object` | Custom headers for all requests. |
| `options.feature` | `object` | Feature configuration. |
| `options.system` | `object` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinDecryptxP2peSDK.test(testopts?, sdkopts?)`

Create a test client with mock features active.

```ts
const client = BluefinDecryptxP2peSDK.test()
```

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `testopts` | `object` | Test feature options. |
| `sdkopts` | `object` | Additional SDK options merged with test defaults. |

**Returns:** `BluefinDecryptxP2peSDK` instance in test mode.


### Instance Methods

#### `Attestation(data?: object)`

Create a new `Attestation` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `AttestationEntity` instance.

#### `Client(data?: object)`

Create a new `Client` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ClientEntity` instance.

#### `CreateResult(data?: object)`

Create a new `CreateResult` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `CreateResultEntity` instance.

#### `Decryption(data?: object)`

Create a new `Decryption` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `DecryptionEntity` instance.

#### `Device(data?: object)`

Create a new `Device` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `DeviceEntity` instance.

#### `DeviceBuild(data?: object)`

Create a new `DeviceBuild` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `DeviceBuildEntity` instance.

#### `DeviceCustodyDetail(data?: object)`

Create a new `DeviceCustodyDetail` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `DeviceCustodyDetailEntity` instance.

#### `DeviceCustodyList(data?: object)`

Create a new `DeviceCustodyList` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `DeviceCustodyListEntity` instance.

#### `DeviceList(data?: object)`

Create a new `DeviceList` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `DeviceListEntity` instance.

#### `DeviceReceiveResult(data?: object)`

Create a new `DeviceReceiveResult` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `DeviceReceiveResultEntity` instance.

#### `DeviceRkiActivateResult(data?: object)`

Create a new `DeviceRkiActivateResult` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `DeviceRkiActivateResultEntity` instance.

#### `DeviceState(data?: object)`

Create a new `DeviceState` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `DeviceStateEntity` instance.

#### `DeviceType(data?: object)`

Create a new `DeviceType` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `DeviceTypeEntity` instance.

#### `InjectKey(data?: object)`

Create a new `InjectKey` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `InjectKeyEntity` instance.

#### `Kif(data?: object)`

Create a new `Kif` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `KifEntity` instance.

#### `Location(data?: object)`

Create a new `Location` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `LocationEntity` instance.

#### `Partner(data?: object)`

Create a new `Partner` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `PartnerEntity` instance.

#### `Shipment(data?: object)`

Create a new `Shipment` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ShipmentEntity` instance.

#### `Success(data?: object)`

Create a new `Success` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `SuccessEntity` instance.

#### `Transaction(data?: object)`

Create a new `Transaction` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `TransactionEntity` instance.

#### `UpdateResult(data?: object)`

Create a new `UpdateResult` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `UpdateResultEntity` instance.

#### `User(data?: object)`

Create a new `User` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `UserEntity` instance.

#### `options()`

Return a deep copy of the current SDK options.

**Returns:** `object`

#### `utility()`

Return a copy of the SDK utility object.

**Returns:** `object`

#### `direct(fetchargs?: object)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `GET`). |
| `fetchargs.params` | `object` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `object` | Query string parameters. |
| `fetchargs.headers` | `object` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (objects are JSON-serialized). |
| `fetchargs.ctrl` | `object` | Control options (e.g. `{ explain: true }`). |

**Returns:** `Promise<{ ok, status, headers, data } | Error>`

#### `prepare(fetchargs?: object)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `Promise<{ url, method, headers, body } | Error>`

#### `tester(testopts?, sdkopts?)`

Alias for `BluefinDecryptxP2peSDK.test()`.

**Returns:** `BluefinDecryptxP2peSDK` instance in test mode.


---

## AttestationEntity

```ts
const attestation = client.Attestation()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Record<string, any>` | No |  |
| `complete_date` | `string` | No |  |
| `created` | `string` | No |  |
| `device` | `Record<string, any>` | No |  |
| `id` | `string` | No |  |
| `name` | `string` | No |  |
| `note` | `string` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.Attestation().create({
})
```

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Attestation().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Attestation().load({ id: 'attestation_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `AttestationEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## ClientEntity

```ts
const client_ = client.Client()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `Record<string, any>` | No |  |
| `created` | `string` | No |  |
| `direct_partner` | `Record<string, any>` | No |  |
| `id` | `string` | No |  |
| `is_active` | `boolean` | No |  |
| `location` | `Record<string, any>` | Yes |  |
| `mid` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `partner` | `Record<string, any>` | No |  |
| `version` | `number` | No |  |

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

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.Client().create({
  location: {},
})
```

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Client().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Client().load({ id: 'client_id' })
```

#### `remove(match: object, ctrl?: object)`

Remove the entity matching the given criteria.

```ts
const result = await client.Client().remove({ id: 'client_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ClientEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## CreateResultEntity

```ts
const create_result = client.CreateResult()
```

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.CreateResult().create({
  device_type: 'example_device_type',
  serial_number: 'example_serial_number',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `CreateResultEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## DecryptionEntity

```ts
const decryption = client.Decryption()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.Decryption().create({
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `DecryptionEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## DeviceEntity

```ts
const device = client.Device()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activated_by` | `Record<string, any>` | Yes |  |
| `activation_date` | `string` | No |  |
| `alternate_key` | `string` | No |  |
| `audit_next_date` | `string` | No |  |
| `audit_notification_date` | `string` | No |  |
| `client` | `Record<string, any>` | No |  |
| `created` | `string` | No |  |
| `created_by` | `Record<string, any>` | Yes |  |
| `device_build` | `Record<string, any>` | No |  |
| `device_state` | `Record<string, any>` | No |  |
| `device_type` | `Record<string, any>` | No |  |
| `error_counter` | `number` | No |  |
| `error_last_date` | `string` | No |  |
| `id` | `string` | No |  |
| `initialized_by` | `Record<string, any>` | Yes |  |
| `initialized_date` | `string` | No |  |
| `inject_key` | `Record<string, any>` | No |  |
| `is_virtual` | `boolean` | No |  |
| `kif` | `Record<string, any>` | No |  |
| `last_activity_date` | `string` | No |  |
| `location` | `Record<string, any>` | Yes |  |
| `modified` | `string` | No |  |
| `modified_by` | `Record<string, any>` | Yes |  |
| `name` | `string` | No |  |
| `note` | `string` | No |  |
| `partner` | `Record<string, any>` | No |  |
| `serial_number` | `string` | No |  |
| `version` | `number` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.Device().create({
  activated_by: {},
  created_by: {},
  initialized_by: {},
  location: {},
  modified_by: {},
})
```

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Device().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Device().load({ id: 'device_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `DeviceEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## DeviceBuildEntity

```ts
const device_build = client.DeviceBuild()
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
| `id` | `number` | No |  |
| `is_active` | `boolean` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `note` | `string` | No |  |
| `version` | `number` | No |  |
| `white_listing_bin_range` | `string` | No |  |
| `white_listing_used` | `boolean` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.DeviceBuild().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.DeviceBuild().load({ id: 'device_build_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `DeviceBuildEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## DeviceCustodyDetailEntity

```ts
const device_custody_detail = client.DeviceCustodyDetail()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `complete_date` | `string` | No |  |
| `created` | `string` | No |  |
| `created_by` | `Record<string, any>` | Yes |  |
| `custodian` | `Record<string, any>` | Yes |  |
| `device` | `Record<string, any>` | No |  |
| `id` | `number` | No |  |
| `location` | `Record<string, any>` | Yes |  |
| `modified` | `string` | No |  |
| `modified_by` | `Record<string, any>` | Yes |  |
| `note` | `string` | No |  |
| `status` | `Record<string, any>` | No |  |
| `transfer_method` | `Record<string, any>` | No |  |
| `version` | `number` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.DeviceCustodyDetail().load({ id: 'device_custody_detail_id', device_type: 'device_type', serial_number: 'serial_number' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `DeviceCustodyDetailEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## DeviceCustodyListEntity

```ts
const device_custody_list = client.DeviceCustodyList()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `complete_date` | `string` | No |  |
| `created` | `string` | No |  |
| `created_by` | `Record<string, any>` | Yes |  |
| `custodian` | `Record<string, any>` | Yes |  |
| `device` | `Record<string, any>` | No |  |
| `id` | `number` | No |  |
| `location` | `Record<string, any>` | Yes |  |
| `modified` | `string` | No |  |
| `modified_by` | `Record<string, any>` | Yes |  |
| `note` | `string` | No |  |
| `status` | `Record<string, any>` | No |  |
| `transfer_method` | `Record<string, any>` | No |  |
| `version` | `number` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.DeviceCustodyList().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `DeviceCustodyListEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## DeviceListEntity

```ts
const device_list = client.DeviceList()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `any[]` | No |  |
| `total` | `number` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.DeviceList().load({ share_partner_to: 'share_partner_to' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `DeviceListEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## DeviceReceiveResultEntity

```ts
const device_receive_result = client.DeviceReceiveResult()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.DeviceReceiveResult().create({
  success: true,
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `DeviceReceiveResultEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## DeviceRkiActivateResultEntity

```ts
const device_rki_activate_result = client.DeviceRkiActivateResult()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.DeviceRkiActivateResult().create({
  success: true,
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `DeviceRkiActivateResultEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## DeviceStateEntity

```ts
const device_state = client.DeviceState()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `number` | No |  |
| `name` | `string` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.DeviceState().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `DeviceStateEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## DeviceTypeEntity

```ts
const device_type = client.DeviceType()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `string` | No |  |
| `device_type_mode` | `string` | No |  |
| `hardware_version` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `boolean` | No |  |
| `manufacturer` | `string` | No |  |
| `model` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `photo_url` | `string` | No |  |
| `product_name` | `string` | No |  |
| `version` | `number` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.DeviceType().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.DeviceType().load({ id: 'device_type_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `DeviceTypeEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## InjectKeyEntity

```ts
const inject_key = client.InjectKey()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `boolean` | No |  |
| `is_p2_pe` | `boolean` | No |  |
| `key_type` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `version` | `number` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.InjectKey().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.InjectKey().load({ id: 'inject_key_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `InjectKeyEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## KifEntity

```ts
const kif = client.Kif()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `number` | No |  |
| `name` | `string` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Kif().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `KifEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## LocationEntity

```ts
const location = client.Location()
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
| `version` | `number` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.Location().create({
})
```

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Location().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Location().load({ id: 'location_id' })
```

#### `remove(match: object, ctrl?: object)`

Remove the entity matching the given criteria.

```ts
const result = await client.Location().remove({ id: 'location_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `LocationEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## PartnerEntity

```ts
const partner = client.Partner()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `client_can_order_equipment` | `boolean` | No |  |
| `contact` | `Record<string, any>` | No |  |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `boolean` | No |  |
| `location` | `Record<string, any>` | Yes |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `Record<string, any>` | No |  |
| `partner_id` | `string` | No |  |
| `reference` | `string` | No |  |
| `verification_phrase` | `string` | No |  |
| `version` | `number` | No |  |

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

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.Partner().create({
  location: {},
})
```

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Partner().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Partner().load({ id: 'partner_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `PartnerEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## ShipmentEntity

```ts
const shipment = client.Shipment()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `string` | No |  |
| `client` | `Record<string, any>` | No |  |
| `created` | `string` | No |  |
| `date_received` | `string` | No |  |
| `date_shipped` | `string` | No |  |
| `dc_kif` | `Record<string, any>` | No |  |
| `id` | `string` | No |  |
| `item` | `any[]` | No |  |
| `kif` | `Record<string, any>` | No |  |
| `modified` | `string` | No |  |
| `partner` | `Record<string, any>` | No |  |
| `shipment_type` | `string` | No |  |
| `tracking` | `string` | No |  |
| `version` | `number` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.Shipment().create({
})
```

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Shipment().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Shipment().load({ id: 'shipment_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ShipmentEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## SuccessEntity

```ts
const success = client.Success()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.Success().create({
  share_partner_to: 'example_share_partner_to',
})
```

#### `remove(match: object, ctrl?: object)`

Remove the entity matching the given criteria.

```ts
const result = await client.Success().remove({ share_partner_to: 'share_partner_to' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `SuccessEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## TransactionEntity

```ts
const transaction = client.Transaction()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternate_key` | `string` | No |  |
| `client` | `Record<string, any>` | No |  |
| `client_ref` | `string` | No |  |
| `created` | `string` | No |  |
| `decrypted` | `number` | No |  |
| `device_name` | `string` | No |  |
| `direct_partner` | `Record<string, any>` | No |  |
| `encrypted` | `number` | No |  |
| `end_date` | `string` | No |  |
| `err_code` | `string` | No |  |
| `err_message` | `string` | No |  |
| `id` | `string` | No |  |
| `ip_address` | `string` | No |  |
| `is_virtual` | `boolean` | No |  |
| `key_type` | `string` | No |  |
| `location` | `Record<string, any>` | Yes |  |
| `message_id` | `string` | No |  |
| `method` | `string` | No |  |
| `partner` | `Record<string, any>` | No |  |
| `reference` | `string` | No |  |
| `serial_number` | `string` | No |  |
| `start_date` | `string` | No |  |
| `success` | `boolean` | No |  |
| `transaction_source` | `string` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.Transaction().create({
  location: {},
})
```

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Transaction().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Transaction().load({ id: 'transaction_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `TransactionEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## UpdateResultEntity

```ts
const update_result = client.UpdateResult()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Record<string, any>` | No |  |
| `email` | `string` | No |  |
| `first_name` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `boolean` | No |  |
| `kif` | `Record<string, any>` | No |  |
| `last_name` | `string` | No |  |
| `partner` | `Record<string, any>` | No |  |
| `phone` | `string` | No |  |
| `user_name` | `string` | No |  |
| `user_role` | `Record<string, any>` | No |  |
| `version` | `number` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.UpdateResult().create({
})
```

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.UpdateResult().list()
```

#### `update(data: object, ctrl?: object)`

Update an existing entity. The data must include the entity `id`.

```ts
const result = await client.UpdateResult().update({
  id: 'id',
  // Fields to update
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `UpdateResultEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## UserEntity

```ts
const user = client.User()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Record<string, any>` | No |  |
| `created` | `string` | No |  |
| `email` | `string` | No |  |
| `first_name` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `boolean` | No |  |
| `kif` | `Record<string, any>` | No |  |
| `last_name` | `string` | No |  |
| `modified` | `string` | No |  |
| `partner` | `Record<string, any>` | No |  |
| `phone` | `string` | No |  |
| `user_name` | `string` | No |  |
| `user_role` | `Record<string, any>` | No |  |
| `version` | `number` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.User().load({ id: 'user_id' })
```

#### `remove(match: object, ctrl?: object)`

Remove the entity matching the given criteria.

```ts
const result = await client.User().remove({ id: 'user_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `UserEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinDecryptxP2peSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ts
const client = new BluefinDecryptxP2peSDK({
  feature: {
    test: { active: true },
  }
})
```


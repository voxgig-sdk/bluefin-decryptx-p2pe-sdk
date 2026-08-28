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
| `options.secret` | `string` | API secret for authentication. |
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
| `client` | `Record<string, any>` | No | Reference to the associated Client resource. |
| `completeDate` | `string` | No | The date and time that the Attestation took place. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `device` | `Record<string, any>` | No | Reference to the associated Device resource. |
| `id` | `string` | No | This resource's unique identifier. |
| `name` | `string` | No | Text describing the attestation. |
| `notes` | `string` | No | Free form field that allows the Client associate notes with the Attestation. |

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
const results = await client.Attestation().list({ client: "example" })
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
| `contact` | `Record<string, any>` | No | Reference to the associated User resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `Record<string, any>` | No | Reference to the associated Partner. |
| `id` | `string` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the Client account is active or disabled. |
| `location` | `Record<string, any>` | Yes | Reference to the associated Location resource. |
| `mid` | `string` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Client's name. |
| `partner` | `Record<string, any>` | No | Reference to the Client's root Partner. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
const results = await client.Client().list({ partner: "example" })
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
| `success` | `boolean` | No | true if the payload decryption was successful. |

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
| `activatedBy` | `Record<string, any>` | Yes | Reference to the associated User resource. |
| `activationDate` | `string` | No | Timestamp from when the Device was activated. |
| `alternateKey` | `string` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `string` | No | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `string` | No | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `Record<string, any>` | No | Reference to the associated Client resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Record<string, any>` | Yes | Reference to the associated User resource. |
| `deviceBuild` | `Record<string, any>` | No | Reference to the associated Device Build resource. |
| `deviceState` | `Record<string, any>` | No | Reference to the associated Device State resource. |
| `deviceType` | `Record<string, any>` | No | Reference to the associated Device Type resource. |
| `errorCounter` | `number` | No | The number times the Device has been in error. |
| `errorLastDate` | `string` | No | Timestamp from the last time that the Device had an error. |
| `id` | `string` | No | The Device's unique identifier. |
| `initializedBy` | `Record<string, any>` | Yes | Reference to the associated User resource. |
| `initializedDate` | `string` | No | Timestamp from when the Device was initialized. |
| `injectKey` | `Record<string, any>` | No | Reference to the associated Device resource. |
| `isVirtual` | `boolean` | No | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `Record<string, any>` | No | Reference to the associated KIF resource. |
| `lastActivityDate` | `string` | No | Timestamp from the last time that the Device was used. |
| `location` | `Record<string, any>` | Yes | Reference to the associated Location resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `modifiedBy` | `Record<string, any>` | Yes | Reference to the associated User resource. |
| `name` | `string` | No | The Device's name. |
| `notes` | `string` | No | Arbitary note that can be attached to a Device entry. |
| `partner` | `Record<string, any>` | No | Reference to the associated Partner. |
| `serialNumber` | `string` | No | The Device's serial number. |
| `version` | `number` | No | The number of times that this resource has been updated. |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.Device().create({
  activatedBy: {},
  createdBy: {},
  initializedBy: {},
  location: {},
  modifiedBy: {},
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
| `appVersion` | `string` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `string` | No | The Build Number. |
| `configFileName` | `string` | No | The name of the configuration file that is uploaded to the device. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `deviceType` | `string` | No | The Device Type Name. |
| `firmwareVersion` | `string` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `string` | No | A list of hardware versions that this Device Build covers. |
| `id` | `number` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Device Builds's name. |
| `notes` | `string` | No | Notes attached to the device build by Bluefin CISO. |
| `version` | `number` | No | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `string` | No | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `boolean` | No | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

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
| `completeDate` | `string` | No | The date and time that the Custody change took place. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Record<string, any>` | Yes | Reference to the associated User resource. |
| `custodian` | `Record<string, any>` | Yes | Reference to the associated User resource. |
| `device` | `Record<string, any>` | No | Reference to the associated Device resource. |
| `id` | `number` | No | This resource's unique identifier. |
| `location` | `Record<string, any>` | Yes | Reference to the associated Location resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `modifiedBy` | `Record<string, any>` | Yes | Reference to the associated User resource. |
| `notes` | `string` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Record<string, any>` | No | Reference to the associated Custody Status. |
| `transferMethod` | `Record<string, any>` | No | Reference to the associated Transfer Method. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
| `completeDate` | `string` | No | The date and time that the Custody change took place. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Record<string, any>` | Yes | Reference to the associated User resource. |
| `custodian` | `Record<string, any>` | Yes | Reference to the associated User resource. |
| `device` | `Record<string, any>` | No | Reference to the associated Device resource. |
| `id` | `number` | No | This resource's unique identifier. |
| `location` | `Record<string, any>` | Yes | Reference to the associated Location resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `modifiedBy` | `Record<string, any>` | Yes | Reference to the associated User resource. |
| `notes` | `string` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Record<string, any>` | No | Reference to the associated Custody Status. |
| `transferMethod` | `Record<string, any>` | No | Reference to the associated Transfer Method. |
| `version` | `number` | No | The number of times that this resource has been updated. |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.DeviceCustodyList().list({ device_type: "example", serial_number: "example" })
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
| `data` | `any[]` | No | List of Devices. |
| `total` | `number` | No | Total number of Devices available (not the number of Users in the response). |

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
| `success` | `boolean` | Yes | Indicates if the action succeeded. |

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
| `success` | `boolean` | Yes | Indicates if the RKI activation succeeded. |

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
| `id` | `number` | No | Unique identifier for this Device state. |
| `name` | `string` | No | Descriptive name for this Device state. |

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
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `string` | No | The Device type. |
| `hardwareVersion` | `string` | No | The Device hardware version. |
| `id` | `string` | No | Unique idenifier. |
| `isActive` | `boolean` | No | This property indicates if the DeviceType is active. |
| `manufacturer` | `string` | No | The Device manufacturer. |
| `model` | `string` | No | The Device model. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The DeviceType name. |
| `photoUrl` | `string` | No |  |
| `productName` | `string` | No | The Device name. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `id` | `string` | No | unique idenifier |
| `isActive` | `boolean` | No | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `boolean` | No | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `string` | No | The cipher type that the key works with. |
| `modified` | `string` | No | Last modified timestamp in ISO 8601 format. |
| `name` | `string` | No | Key name. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
| `id` | `number` | No | This resource's unique identifier. |
| `name` | `string` | No | The KIF's name. |

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
| `address1` | `string` | No | The Location's street address. |
| `address2` | `string` | No | The Location's street address. |
| `billingId` | `string` | No | \? |
| `city` | `string` | No | The Location's city. |
| `country` | `string` | No | The Location's country. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `customReference` | `string` | No | A Partner specified reference for a location. |
| `id` | `string` | No | This resource's unique identifier. |
| `locationType` | `string` | No | The Location's clasification. |
| `mailAddress1` | `string` | No | The Location's street address. |
| `mailAddress2` | `string` | No | The Location's street address. |
| `mailCity` | `string` | No | The Location's city. |
| `mailCountry` | `string` | No | The Location's street address. |
| `mailPostalCode` | `string` | No | The Location's postal code. |
| `mailStateProvince` | `string` | No | The Location's street state or province. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Location's name. |
| `nameOfBusiness` | `string` | No | The name of the business at this location. |
| `notes` | `string` | No | Note for delivery driver. |
| `postalCode` | `string` | No | The Location's postal code. |
| `stateProvince` | `string` | No | The Location's street state or province. |
| `uniqueId` | `string` | No | Unique Identifier for the Location. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
const results = await client.Location().list({ client: "example" })
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
| `billingId` | `string` | No | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `boolean` | No | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `Record<string, any>` | No | Reference to the associated User resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `id` | `string` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the Parter account is active or disabled. |
| `location` | `Record<string, any>` | Yes | Reference to the associated Location resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Partner's name. |
| `parent` | `Record<string, any>` | No | Reference to the associated Partner. |
| `partnerId` | `string` | No | The Partner's id. |
| `reference` | `string` | No | The Partner's reference string. |
| `verificationPhrase` | `string` | No | The verification phrase is a message that the Partner creates. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
| `carrier` | `string` | No | The name of the courier. |
| `client` | `Record<string, any>` | No | Reference to the associated Client resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `string` | No | The date and time that a package is recieved. |
| `dateShipped` | `string` | No | The date and time that a package is shipped. |
| `dcKif` | `Record<string, any>` | No | Reference to the associated KIF resource. |
| `id` | `string` | No | This resource's unique identifier. |
| `items` | `any[]` | No |  |
| `kif` | `Record<string, any>` | No | Reference to the associated KIF resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `partner` | `Record<string, any>` | No | Reference to the associated Partner. |
| `shipmentType` | `string` | No | The type of shipment. |
| `tracking` | `string` | No | The courier's tracking number. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
const results = await client.Shipment().list({ kif: "example" })
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
| `success` | `boolean` | No | Indicates if the action was a success. |

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
| `alternateKey` | `string` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `Record<string, any>` | No | Reference to the associated Client resource. |
| `clientRef` | `string` | No | Client Reference property that is included in the decrypt API call. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `decrypted` | `number` | No | A Transcation can process muliple decryptions. |
| `deviceName` | `string` | No | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `Record<string, any>` | No | Reference to the associated Partner. |
| `encrypted` | `number` | No | A Transcation can process muliple encryptions. |
| `endDate` | `string` | No | Timestamp from the end of the transaction. |
| `errCode` | `string` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `string` | No | This resource's unique identifier. |
| `ipAddress` | `string` | No | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `boolean` | No | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `string` | No | The type of cipher used during decrytion. |
| `location` | `Record<string, any>` | Yes | Reference to the associated Location resource. |
| `messageId` | `string` | No | Message ID. |
| `method` | `string` | No | The decryption cypher/method. |
| `partner` | `Record<string, any>` | No | Reference to the associated Partner. |
| `reference` | `string` | No | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `string` | No | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `string` | No | Timestamp from the beginning of the transaction. |
| `success` | `boolean` | No | The success indicator. |
| `transactionSource` | `string` | No | The source of the Transaction. |

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
| `client` | `Record<string, any>` | No | Reference to the associated Client resource. |
| `email` | `string` | No | The User's email address. |
| `firstName` | `string` | No | The User's name. |
| `id` | `string` | No | ID of newly created resource |
| `isActive` | `boolean` | No | This property indicates if the User account is active or disabled. |
| `kif` | `Record<string, any>` | No | Reference to the associated KIF resource. |
| `lastName` | `string` | No | The User's Surname. |
| `partner` | `Record<string, any>` | No | Reference to the associated Partner. |
| `phone` | `string` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `string` | No | The User's unique username. |
| `userRole` | `Record<string, any>` | No | Reference to the associated User Role. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
| `client` | `Record<string, any>` | No | Reference to the associated Client resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `email` | `string` | No | The User's email address. |
| `firstName` | `string` | No | The User's name. |
| `id` | `string` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the User account is active or disabled. |
| `kif` | `Record<string, any>` | No | Reference to the associated KIF resource. |
| `lastName` | `string` | No | The User's Surname. |
| `modified` | `string` | No | Last modified timestamp. |
| `partner` | `Record<string, any>` | No | Reference to the associated Partner. |
| `phone` | `string` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `string` | No | The User's unique username. |
| `userRole` | `Record<string, any>` | No | Reference to the associated User Role. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
| `audit` | 0.0.1 | Structured audit trail of operations |
| `clienttrack` | 0.0.1 | Client identity and per-request correlation headers |
| `idempotency` | 0.0.1 | Idempotency keys for safe retries of mutating operations |
| `log` | 0.0.1 | Structured request and response logging |
| `metrics` | 0.0.1 | Statistics capture: per-operation counters and latency |
| `paging` | 0.0.1 | Pagination signals for list operations |
| `ratelimit` | 0.0.1 | Client-side rate limiting via a token bucket |
| `retry` | 0.0.1 | Automatic retry of transient failures with exponential backoff |
| `telemetry` | 0.0.1 | Distributed tracing spans with W3C trace-context propagation |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |
| `timeout` | 0.0.1 | Per-request timeout with transport abort |


Features are activated via the `feature` option:

```ts
const client = new BluefinDecryptxP2peSDK({
  feature: {
    audit: { active: true },
    clienttrack: { active: true },
    idempotency: { active: true },
    log: { active: true },
    metrics: { active: true },
    paging: { active: true },
    ratelimit: { active: true },
    retry: { active: true },
    telemetry: { active: true },
    test: { active: true },
    timeout: { active: true },
  }
})
```


### Configuring features

Each feature is inactive until switched on, and an SDK with no feature
configured does no feature work at all. Every option below keeps its default
unless you name it.

The array form of \`feature\` is significant: several features wrap the
transport, and the order you list them in is the order they nest.

#### Ordering

`ratelimit`, `retry`, `timeout` wrap the transport. Each
wraps whatever is already installed, so **activation order is nesting order**:
a feature activated later sits OUTSIDE one activated earlier, and sees the call
first.

That decides behaviour, not just sequence: a feature that short-circuits the
call, such as a cache serving a hit, stops every feature nested inside it from
ever seeing that call.

`audit`, `clienttrack`, `idempotency`, `log`, `metrics`, `paging`, `telemetry`, `test` attach to pipeline hooks
rather than the transport, so their order does not affect what they observe.

#### `audit`

Structured audit trail of operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.audit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `clienttrack`

Client identity and per-request correlation headers.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.clienttrack.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `idempotency`

Idempotency keys for safe retries of mutating operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.idempotency.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `log`

Structured request and response logging.

**Configuration**

| Option | Default |
|---|---|
| `active` | `true` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.log.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `metrics`

Statistics capture: per-operation counters and latency.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.metrics.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `paging`

Pagination signals for list operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `afterVar` | `'after'` |
| `cursorParam` | `'cursor'` |
| `firstVar` | `'first'` |
| `limitParam` | `'limit'` |
| `pageParam` | `'page'` |
| `startPage` | `1` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.paging.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `ratelimit`

Client-side rate limiting via a token bucket.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.ratelimit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `retry`

Automatic retry of transient failures with exponential backoff.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.retry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `telemetry`

Distributed tracing spans with W3C trace-context propagation.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.telemetry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `test`

In-memory mock transport for testing without a live server.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.test.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Installs the BASE transport that the wrapping features wrap, so it must be
  activated before them.
- Inactive by default: leaving it out costs nothing at runtime.

#### `timeout`

Per-request timeout with transport abort.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.timeout.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.


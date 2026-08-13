# BluefinDecryptxP2pe PHP SDK Reference

Complete API reference for the BluefinDecryptxP2pe PHP SDK.


## BluefinDecryptxP2peSDK

### Constructor

```php
require_once __DIR__ . '/bluefindecryptxp2pe_sdk.php';

$client = new BluefinDecryptxP2peSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["apikey"]` | `string` | API key for authentication. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinDecryptxP2peSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = BluefinDecryptxP2peSDK::test();
```


### Instance Methods

#### `Attestation($data = null)`

Create a new `AttestationEntity` instance. Pass `null` for no initial data.

#### `Client($data = null)`

Create a new `ClientEntity` instance. Pass `null` for no initial data.

#### `CreateResult($data = null)`

Create a new `CreateResultEntity` instance. Pass `null` for no initial data.

#### `Decryption($data = null)`

Create a new `DecryptionEntity` instance. Pass `null` for no initial data.

#### `Device($data = null)`

Create a new `DeviceEntity` instance. Pass `null` for no initial data.

#### `DeviceBuild($data = null)`

Create a new `DeviceBuildEntity` instance. Pass `null` for no initial data.

#### `DeviceCustodyDetail($data = null)`

Create a new `DeviceCustodyDetailEntity` instance. Pass `null` for no initial data.

#### `DeviceCustodyList($data = null)`

Create a new `DeviceCustodyListEntity` instance. Pass `null` for no initial data.

#### `DeviceList($data = null)`

Create a new `DeviceListEntity` instance. Pass `null` for no initial data.

#### `DeviceReceiveResult($data = null)`

Create a new `DeviceReceiveResultEntity` instance. Pass `null` for no initial data.

#### `DeviceRkiActivateResult($data = null)`

Create a new `DeviceRkiActivateResultEntity` instance. Pass `null` for no initial data.

#### `DeviceState($data = null)`

Create a new `DeviceStateEntity` instance. Pass `null` for no initial data.

#### `DeviceType($data = null)`

Create a new `DeviceTypeEntity` instance. Pass `null` for no initial data.

#### `InjectKey($data = null)`

Create a new `InjectKeyEntity` instance. Pass `null` for no initial data.

#### `Kif($data = null)`

Create a new `KifEntity` instance. Pass `null` for no initial data.

#### `Location($data = null)`

Create a new `LocationEntity` instance. Pass `null` for no initial data.

#### `Partner($data = null)`

Create a new `PartnerEntity` instance. Pass `null` for no initial data.

#### `Shipment($data = null)`

Create a new `ShipmentEntity` instance. Pass `null` for no initial data.

#### `Success($data = null)`

Create a new `SuccessEntity` instance. Pass `null` for no initial data.

#### `Transaction($data = null)`

Create a new `TransactionEntity` instance. Pass `null` for no initial data.

#### `UpdateResult($data = null)`

Create a new `UpdateResultEntity` instance. Pass `null` for no initial data.

#### `User($data = null)`

Create a new `UserEntity` instance. Pass `null` for no initial data.

#### `options_map(): array`

Return a deep copy of the current SDK options.

#### `get_utility(): BluefinDecryptxP2peUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. This is the raw-HTTP escape
hatch: it does **not** throw. It returns a result array
`["ok" => bool, "status" => int, "headers" => array, "data" => mixed]`, or
`["ok" => false, "err" => \Exception]` on failure. Branch on `$result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array` — the result dict (see above); never throws.

#### `prepare(array $fetchargs = []): mixed`

Prepare a fetch definition without sending the request. Returns the
`$fetchdef` array. Throws on error.


---

## AttestationEntity

```php
$attestation = $client->Attestation();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `array` | No |  |
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `device` | `array` | No |  |
| `id` | `string` | No |  |
| `name` | `string` | No |  |
| `notes` | `string` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Attestation()->create([
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Attestation()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Attestation()->load(["id" => "attestation_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): AttestationEntity`

Create a new `AttestationEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## ClientEntity

```php
$client = $client->Client();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `array` | No |  |
| `created` | `string` | No |  |
| `directPartner` | `array` | No |  |
| `id` | `string` | No |  |
| `isActive` | `bool` | No |  |
| `location` | `array` | Yes |  |
| `mid` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `partner` | `array` | No |  |
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

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Client()->create([
  "location" => null, // array
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Client()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Client()->load(["id" => "client_id"]);
```

#### `remove(array $reqmatch, ?array $ctrl = null): mixed`

Remove the entity matching the given criteria. Throws on error.

```php
$result = $client->Client()->remove(["id" => "client_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): ClientEntity`

Create a new `ClientEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## CreateResultEntity

```php
$create_result = $client->CreateResult();
```

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->CreateResult()->create([
  "device_type" => null, // string
  "serial_number" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): CreateResultEntity`

Create a new `CreateResultEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## DecryptionEntity

```php
$decryption = $client->Decryption();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Decryption()->create([
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): DecryptionEntity`

Create a new `DecryptionEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## DeviceEntity

```php
$device = $client->Device();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activatedBy` | `array` | Yes |  |
| `activationDate` | `string` | No |  |
| `alternateKey` | `string` | No |  |
| `auditNextDate` | `string` | No |  |
| `auditNotificationDate` | `string` | No |  |
| `client` | `array` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `array` | Yes |  |
| `deviceBuild` | `array` | No |  |
| `deviceState` | `array` | No |  |
| `deviceType` | `array` | No |  |
| `errorCounter` | `int` | No |  |
| `errorLastDate` | `string` | No |  |
| `id` | `string` | No |  |
| `initializedBy` | `array` | Yes |  |
| `initializedDate` | `string` | No |  |
| `injectKey` | `array` | No |  |
| `isVirtual` | `bool` | No |  |
| `kif` | `array` | No |  |
| `lastActivityDate` | `string` | No |  |
| `location` | `array` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `array` | Yes |  |
| `name` | `string` | No |  |
| `notes` | `string` | No |  |
| `partner` | `array` | No |  |
| `serialNumber` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Device()->create([
  "activatedBy" => null, // array
  "createdBy" => null, // array
  "initializedBy" => null, // array
  "location" => null, // array
  "modifiedBy" => null, // array
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Device()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Device()->load(["id" => "device_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): DeviceEntity`

Create a new `DeviceEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## DeviceBuildEntity

```php
$device_build = $client->DeviceBuild();
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

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->DeviceBuild()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->DeviceBuild()->load(["id" => "device_build_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): DeviceBuildEntity`

Create a new `DeviceBuildEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## DeviceCustodyDetailEntity

```php
$device_custody_detail = $client->DeviceCustodyDetail();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `array` | Yes |  |
| `custodian` | `array` | Yes |  |
| `device` | `array` | No |  |
| `id` | `int` | No |  |
| `location` | `array` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `array` | Yes |  |
| `notes` | `string` | No |  |
| `status` | `array` | No |  |
| `transferMethod` | `array` | No |  |
| `version` | `int` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->DeviceCustodyDetail()->load(["id" => "device_custody_detail_id", "device_type" => "device_type", "serial_number" => "serial_number"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): DeviceCustodyDetailEntity`

Create a new `DeviceCustodyDetailEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## DeviceCustodyListEntity

```php
$device_custody_list = $client->DeviceCustodyList();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `array` | Yes |  |
| `custodian` | `array` | Yes |  |
| `device` | `array` | No |  |
| `id` | `int` | No |  |
| `location` | `array` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `array` | Yes |  |
| `notes` | `string` | No |  |
| `status` | `array` | No |  |
| `transferMethod` | `array` | No |  |
| `version` | `int` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->DeviceCustodyList()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): DeviceCustodyListEntity`

Create a new `DeviceCustodyListEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## DeviceListEntity

```php
$device_list = $client->DeviceList();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `array` | No |  |
| `total` | `int` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->DeviceList()->load(["share_partner_to" => "share_partner_to"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): DeviceListEntity`

Create a new `DeviceListEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## DeviceReceiveResultEntity

```php
$device_receive_result = $client->DeviceReceiveResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->DeviceReceiveResult()->create([
  "success" => null, // bool
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): DeviceReceiveResultEntity`

Create a new `DeviceReceiveResultEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## DeviceRkiActivateResultEntity

```php
$device_rki_activate_result = $client->DeviceRkiActivateResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->DeviceRkiActivateResult()->create([
  "success" => null, // bool
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): DeviceRkiActivateResultEntity`

Create a new `DeviceRkiActivateResultEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## DeviceStateEntity

```php
$device_state = $client->DeviceState();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int` | No |  |
| `name` | `string` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->DeviceState()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): DeviceStateEntity`

Create a new `DeviceStateEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## DeviceTypeEntity

```php
$device_type = $client->DeviceType();
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

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->DeviceType()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->DeviceType()->load(["id" => "device_type_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): DeviceTypeEntity`

Create a new `DeviceTypeEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## InjectKeyEntity

```php
$inject_key = $client->InjectKey();
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

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->InjectKey()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->InjectKey()->load(["id" => "inject_key_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): InjectKeyEntity`

Create a new `InjectKeyEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## KifEntity

```php
$kif = $client->Kif();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int` | No |  |
| `name` | `string` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Kif()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): KifEntity`

Create a new `KifEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## LocationEntity

```php
$location = $client->Location();
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

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Location()->create([
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Location()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Location()->load(["id" => "location_id"]);
```

#### `remove(array $reqmatch, ?array $ctrl = null): mixed`

Remove the entity matching the given criteria. Throws on error.

```php
$result = $client->Location()->remove(["id" => "location_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): LocationEntity`

Create a new `LocationEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## PartnerEntity

```php
$partner = $client->Partner();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `string` | No |  |
| `clientCanOrderEquipment` | `bool` | No |  |
| `contact` | `array` | No |  |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `bool` | No |  |
| `location` | `array` | Yes |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `array` | No |  |
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

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Partner()->create([
  "location" => null, // array
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Partner()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Partner()->load(["id" => "partner_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): PartnerEntity`

Create a new `PartnerEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## ShipmentEntity

```php
$shipment = $client->Shipment();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `string` | No |  |
| `client` | `array` | No |  |
| `created` | `string` | No |  |
| `dateReceived` | `string` | No |  |
| `dateShipped` | `string` | No |  |
| `dcKif` | `array` | No |  |
| `id` | `string` | No |  |
| `items` | `array` | No |  |
| `kif` | `array` | No |  |
| `modified` | `string` | No |  |
| `partner` | `array` | No |  |
| `shipmentType` | `string` | No |  |
| `tracking` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Shipment()->create([
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Shipment()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Shipment()->load(["id" => "shipment_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): ShipmentEntity`

Create a new `ShipmentEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## SuccessEntity

```php
$success = $client->Success();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Success()->create([
  "share_partner_to" => null, // string
]);
```

#### `remove(array $reqmatch, ?array $ctrl = null): mixed`

Remove the entity matching the given criteria. Throws on error.

```php
$result = $client->Success()->remove(["share_partner_to" => "share_partner_to"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): SuccessEntity`

Create a new `SuccessEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## TransactionEntity

```php
$transaction = $client->Transaction();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternateKey` | `string` | No |  |
| `client` | `array` | No |  |
| `clientRef` | `string` | No |  |
| `created` | `string` | No |  |
| `decrypted` | `int` | No |  |
| `deviceName` | `string` | No |  |
| `directPartner` | `array` | No |  |
| `encrypted` | `int` | No |  |
| `endDate` | `string` | No |  |
| `errCode` | `string` | No |  |
| `errMessage` | `string` | No |  |
| `id` | `string` | No |  |
| `ipAddress` | `string` | No |  |
| `isVirtual` | `bool` | No |  |
| `keyType` | `string` | No |  |
| `location` | `array` | Yes |  |
| `messageId` | `string` | No |  |
| `method` | `string` | No |  |
| `partner` | `array` | No |  |
| `reference` | `string` | No |  |
| `serialNumber` | `string` | No |  |
| `startDate` | `string` | No |  |
| `success` | `bool` | No |  |
| `transactionSource` | `string` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Transaction()->create([
  "location" => null, // array
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Transaction()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Transaction()->load(["id" => "transaction_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): TransactionEntity`

Create a new `TransactionEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## UpdateResultEntity

```php
$update_result = $client->UpdateResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `array` | No |  |
| `email` | `string` | No |  |
| `firstName` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `bool` | No |  |
| `kif` | `array` | No |  |
| `lastName` | `string` | No |  |
| `partner` | `array` | No |  |
| `phone` | `string` | No |  |
| `userName` | `string` | No |  |
| `userRole` | `array` | No |  |
| `version` | `int` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->UpdateResult()->create([
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->UpdateResult()->list();
```

#### `update(array $reqdata, ?array $ctrl = null): mixed`

Update an existing entity. The data must include the entity `id`. Throws on error.

```php
$result = $client->UpdateResult()->update([
  "id" => "id",
  // Fields to update
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): UpdateResultEntity`

Create a new `UpdateResultEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## UserEntity

```php
$user = $client->User();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `array` | No |  |
| `created` | `string` | No |  |
| `email` | `string` | No |  |
| `firstName` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `bool` | No |  |
| `kif` | `array` | No |  |
| `lastName` | `string` | No |  |
| `modified` | `string` | No |  |
| `partner` | `array` | No |  |
| `phone` | `string` | No |  |
| `userName` | `string` | No |  |
| `userRole` | `array` | No |  |
| `version` | `int` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->User()->load(["id" => "user_id"]);
```

#### `remove(array $reqmatch, ?array $ctrl = null): mixed`

Remove the entity matching the given criteria. Throws on error.

```php
$result = $client->User()->remove(["id" => "user_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): UserEntity`

Create a new `UserEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new BluefinDecryptxP2peSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```


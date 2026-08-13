# BluefinDecryptxP2pe PHP SDK



The PHP SDK for the BluefinDecryptxP2pe API — an entity-oriented client using PHP conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `$client->Attestation()` — with named operations (`list`/`load`/`create`/`update`/`remove`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Packagist. Install it from the
GitHub release tag (`php/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```php
<?php
require_once 'bluefindecryptxp2pe_sdk.php';

$client = new BluefinDecryptxP2peSDK([
    "apikey" => getenv("BLUEFIN_DECRYPTX_P2PE_APIKEY"),
]);
```

### 2. List attestation records

```php
try {
    // list() returns an array of Attestation records — iterate directly.
    $attestations = $client->Attestation()->list();
    foreach ($attestations as $item) {
        echo $item["id"] . " " . $item["client"] . "\n";
    }
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.

```php
try {
    // load() returns the ENTITY — call data_get() for the DeviceCustodyDetail record (throws on error).
    $devicecustodydetail = $client->DeviceCustodyDetail()->load(["device_type" => "example_device_type", "serial_number" => "example_serial_number", "id" => "example_id"]);
    print_r($devicecustodydetail);
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```

### 4. Create, update, and remove

```php
// create() returns the ENTITY — call data_get() for the created Attestation record.
$created = $client->Attestation()->create(["client" => [], "completeDate" => "example_completeDate"]);

```


## Error handling

Entity operations throw a `\Throwable` on failure, so wrap them in
`try` / `catch`:

```php
try {
    $devicetypes = $client->DeviceType()->list();
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```

`direct()` does **not** throw — it returns the result array. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```php
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example_id"],
]);

if (! $result["ok"]) {
    $err = $result["err"] ?? null;
    echo "request failed: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```php
// direct() is the raw-HTTP escape hatch: it returns a result array
// (it does not throw). Branch on $result["ok"].
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);

if ($result["ok"]) {
    echo $result["status"];  // 200
    print_r($result["data"]);  // response body
} else {
    // On an HTTP error status there is no err (only a transport failure sets
    // it), so fall back to the status code.
    $err = $result["err"] ?? null;
    echo "Error: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```

### Prepare a request without sending it

```php
// prepare() throws on error and returns the fetch definition.
$fetchdef = $client->prepare([
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => ["id" => "example"],
]);

echo $fetchdef["url"];
echo $fetchdef["method"];
print_r($fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required. Seed fixture
data via the `entity` option so offline calls resolve without a live server:

```php
$client = BluefinDecryptxP2peSDK::test([
    "entity" => ["devicetype" => ["test01" => ["id" => "test01"]]],
]);

// Entity ops return the ENTITY (throws on error);
// call data_get() for the mock record.
$devicetype = $client->DeviceType()->list();
print_r($devicetype);
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```php
$mock_fetch = function ($url, $init) {
    return [
        [
            "status" => 200,
            "statusText" => "OK",
            "headers" => [],
            "json" => function () { return ["id" => "mock01"]; },
        ],
        null,
    ];
};

$client = new BluefinDecryptxP2peSDK([
    "base" => "http://localhost:8080",
    "system" => [
        "fetch" => $mock_fetch,
    ],
]);
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd php && ./vendor/bin/phpunit test/
```


## Reference

### BluefinDecryptxP2peSDK

```php
require_once 'bluefindecryptxp2pe_sdk.php';
$client = new BluefinDecryptxP2peSDK($options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `array` | Feature activation flags. |
| `extend` | `array` | Additional Feature instances to load. |
| `system` | `array` | System overrides (e.g. custom `fetch` callable). |

### test

```php
$client = BluefinDecryptxP2peSDK::test($testopts, $sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinDecryptxP2peSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `(): array` | Deep copy of current SDK options. |
| `get_utility` | `(): Utility` | Copy of the SDK utility object. |
| `prepare` | `(array $fetchargs): array` | Build an HTTP request definition without sending. |
| `direct` | `(array $fetchargs): array` | Build and send an HTTP request. |
| `Attestation` | `($data): AttestationEntity` | Create an Attestation entity instance. |
| `Client` | `($data): ClientEntity` | Create a Client entity instance. |
| `CreateResult` | `($data): CreateResultEntity` | Create a CreateResult entity instance. |
| `Decryption` | `($data): DecryptionEntity` | Create a Decryption entity instance. |
| `Device` | `($data): DeviceEntity` | Create a Device entity instance. |
| `DeviceBuild` | `($data): DeviceBuildEntity` | Create a DeviceBuild entity instance. |
| `DeviceCustodyDetail` | `($data): DeviceCustodyDetailEntity` | Create a DeviceCustodyDetail entity instance. |
| `DeviceCustodyList` | `($data): DeviceCustodyListEntity` | Create a DeviceCustodyList entity instance. |
| `DeviceList` | `($data): DeviceListEntity` | Create a DeviceList entity instance. |
| `DeviceReceiveResult` | `($data): DeviceReceiveResultEntity` | Create a DeviceReceiveResult entity instance. |
| `DeviceRkiActivateResult` | `($data): DeviceRkiActivateResultEntity` | Create a DeviceRkiActivateResult entity instance. |
| `DeviceState` | `($data): DeviceStateEntity` | Create a DeviceState entity instance. |
| `DeviceType` | `($data): DeviceTypeEntity` | Create a DeviceType entity instance. |
| `InjectKey` | `($data): InjectKeyEntity` | Create an InjectKey entity instance. |
| `Kif` | `($data): KifEntity` | Create a Kif entity instance. |
| `Location` | `($data): LocationEntity` | Create a Location entity instance. |
| `Partner` | `($data): PartnerEntity` | Create a Partner entity instance. |
| `Shipment` | `($data): ShipmentEntity` | Create a Shipment entity instance. |
| `Success` | `($data): SuccessEntity` | Create a Success entity instance. |
| `Transaction` | `($data): TransactionEntity` | Create a Transaction entity instance. |
| `UpdateResult` | `($data): UpdateResultEntity` | Create an UpdateResult entity instance. |
| `User` | `($data): UserEntity` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `($reqmatch, $ctrl): array` | Load a single entity by match criteria. |
| `list` | `(?array $reqmatch = null, $ctrl): array` | List entities matching the criteria (call with no argument to list all). |
| `create` | `($reqdata, $ctrl): array` | Create a new entity. |
| `update` | `($reqdata, $ctrl): array` | Update an existing entity. |
| `remove` | `($reqmatch, $ctrl): array` | Remove an entity. |
| `data_get` | `(): array` | Get entity data. |
| `data_set` | `($data): void` | Set entity data. |
| `match_get` | `(): array` | Get entity match criteria. |
| `match_set` | `($match): void` | Set entity match criteria. |
| `make` | `(): Entity` | Create a new instance with the same options. |
| `get_name` | `(): string` | Return the entity name. |

### Result shape

Entity operations return the ENTITY (call data_get() for the record) (an `array` for single-entity
ops, a `list` for `list`) and throw on error. Wrap calls in
`try`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `array`
you branch on via `$result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `array` | Response headers. |
| `data` | `mixed` | Parsed JSON response body. |

On error, `ok` is `false` and `$err` contains the error value.

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

Create an instance: `$attestation = $client->Attestation();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `array` |  |
| `completeDate` | `string` |  |
| `created` | `string` |  |
| `device` | `array` |  |
| `id` | `string` |  |
| `name` | `string` |  |
| `notes` | `string` |  |

#### Example: Load

```php
// load() returns the ENTITY — call data_get() for the Attestation record (throws on error).
$attestation = $client->Attestation()->load(["id" => "attestation_id"]);
```

#### Example: List

```php
// list() returns an array of Attestation records (throws on error).
$attestations = $client->Attestation()->list();
```

#### Example: Create

```php
$attestation = $client->Attestation()->create([
]);
```


### Client

Create an instance: `$client = $client->Client();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `array` |  |
| `created` | `string` |  |
| `directPartner` | `array` |  |
| `id` | `string` |  |
| `isActive` | `bool` |  |
| `location` | `array` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `array` |  |
| `version` | `int` |  |

#### Example: Load

```php
// load() returns the ENTITY — call data_get() for the Client record (throws on error).
$client = $client->Client()->load(["id" => "client_id"]);
```

#### Example: List

```php
// list() returns an array of Client records (throws on error).
$clients = $client->Client()->list();
```

#### Example: Create

```php
$client = $client->Client()->create([
    "location" => null, // array
]);
```


### CreateResult

Create an instance: `$create_result = $client->CreateResult();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Example: Create

```php
$create_result = $client->CreateResult()->create([
    "device_type" => null, // string
    "serial_number" => null, // string
]);
```


### Decryption

Create an instance: `$decryption = $client->Decryption();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```php
$decryption = $client->Decryption()->create([
]);
```


### Device

Create an instance: `$device = $client->Device();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `array` |  |
| `activationDate` | `string` |  |
| `alternateKey` | `string` |  |
| `auditNextDate` | `string` |  |
| `auditNotificationDate` | `string` |  |
| `client` | `array` |  |
| `created` | `string` |  |
| `createdBy` | `array` |  |
| `deviceBuild` | `array` |  |
| `deviceState` | `array` |  |
| `deviceType` | `array` |  |
| `errorCounter` | `int` |  |
| `errorLastDate` | `string` |  |
| `id` | `string` |  |
| `initializedBy` | `array` |  |
| `initializedDate` | `string` |  |
| `injectKey` | `array` |  |
| `isVirtual` | `bool` |  |
| `kif` | `array` |  |
| `lastActivityDate` | `string` |  |
| `location` | `array` |  |
| `modified` | `string` |  |
| `modifiedBy` | `array` |  |
| `name` | `string` |  |
| `notes` | `string` |  |
| `partner` | `array` |  |
| `serialNumber` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```php
// load() returns the ENTITY — call data_get() for the Device record (throws on error).
$device = $client->Device()->load(["id" => "device_id"]);
```

#### Example: List

```php
// list() returns an array of Device records (throws on error).
$devices = $client->Device()->list();
```

#### Example: Create

```php
$device = $client->Device()->create([
    "activatedBy" => null, // array
    "createdBy" => null, // array
    "initializedBy" => null, // array
    "location" => null, // array
    "modifiedBy" => null, // array
]);
```


### DeviceBuild

Create an instance: `$device_build = $client->DeviceBuild();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

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

```php
// load() returns the ENTITY — call data_get() for the DeviceBuild record (throws on error).
$device_build = $client->DeviceBuild()->load(["id" => "device_build_id"]);
```

#### Example: List

```php
// list() returns an array of DeviceBuild records (throws on error).
$device_builds = $client->DeviceBuild()->list();
```


### DeviceCustodyDetail

Create an instance: `$device_custody_detail = $client->DeviceCustodyDetail();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `string` |  |
| `created` | `string` |  |
| `createdBy` | `array` |  |
| `custodian` | `array` |  |
| `device` | `array` |  |
| `id` | `int` |  |
| `location` | `array` |  |
| `modified` | `string` |  |
| `modifiedBy` | `array` |  |
| `notes` | `string` |  |
| `status` | `array` |  |
| `transferMethod` | `array` |  |
| `version` | `int` |  |

#### Example: Load

```php
// load() returns the ENTITY — call data_get() for the DeviceCustodyDetail record (throws on error).
$device_custody_detail = $client->DeviceCustodyDetail()->load(["id" => "device_custody_detail_id", "device_type" => "device_type", "serial_number" => "serial_number"]);
```


### DeviceCustodyList

Create an instance: `$device_custody_list = $client->DeviceCustodyList();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `string` |  |
| `created` | `string` |  |
| `createdBy` | `array` |  |
| `custodian` | `array` |  |
| `device` | `array` |  |
| `id` | `int` |  |
| `location` | `array` |  |
| `modified` | `string` |  |
| `modifiedBy` | `array` |  |
| `notes` | `string` |  |
| `status` | `array` |  |
| `transferMethod` | `array` |  |
| `version` | `int` |  |

#### Example: List

```php
// list() returns an array of DeviceCustodyList records (throws on error).
$device_custody_lists = $client->DeviceCustodyList()->list();
```


### DeviceList

Create an instance: `$device_list = $client->DeviceList();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `array` |  |
| `total` | `int` |  |

#### Example: Load

```php
// load() returns the ENTITY — call data_get() for the DeviceList record (throws on error).
$device_list = $client->DeviceList()->load(["share_partner_to" => "share_partner_to"]);
```


### DeviceReceiveResult

Create an instance: `$device_receive_result = $client->DeviceReceiveResult();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```php
$device_receive_result = $client->DeviceReceiveResult()->create([
    "success" => null, // bool
]);
```


### DeviceRkiActivateResult

Create an instance: `$device_rki_activate_result = $client->DeviceRkiActivateResult();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```php
$device_rki_activate_result = $client->DeviceRkiActivateResult()->create([
    "success" => null, // bool
]);
```


### DeviceState

Create an instance: `$device_state = $client->DeviceState();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` |  |
| `name` | `string` |  |

#### Example: List

```php
// list() returns an array of DeviceState records (throws on error).
$device_states = $client->DeviceState()->list();
```


### DeviceType

Create an instance: `$device_type = $client->DeviceType();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

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

```php
// load() returns the ENTITY — call data_get() for the DeviceType record (throws on error).
$device_type = $client->DeviceType()->load(["id" => "device_type_id"]);
```

#### Example: List

```php
// list() returns an array of DeviceType records (throws on error).
$device_types = $client->DeviceType()->list();
```


### InjectKey

Create an instance: `$inject_key = $client->InjectKey();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

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

```php
// load() returns the ENTITY — call data_get() for the InjectKey record (throws on error).
$inject_key = $client->InjectKey()->load(["id" => "inject_key_id"]);
```

#### Example: List

```php
// list() returns an array of InjectKey records (throws on error).
$inject_keys = $client->InjectKey()->list();
```


### Kif

Create an instance: `$kif = $client->Kif();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` |  |
| `name` | `string` |  |

#### Example: List

```php
// list() returns an array of Kif records (throws on error).
$kifs = $client->Kif()->list();
```


### Location

Create an instance: `$location = $client->Location();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

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

```php
// load() returns the ENTITY — call data_get() for the Location record (throws on error).
$location = $client->Location()->load(["id" => "location_id"]);
```

#### Example: List

```php
// list() returns an array of Location records (throws on error).
$locations = $client->Location()->list();
```

#### Example: Create

```php
$location = $client->Location()->create([
]);
```


### Partner

Create an instance: `$partner = $client->Partner();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `string` |  |
| `clientCanOrderEquipment` | `bool` |  |
| `contact` | `array` |  |
| `created` | `string` |  |
| `id` | `string` |  |
| `isActive` | `bool` |  |
| `location` | `array` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `array` |  |
| `partnerId` | `string` |  |
| `reference` | `string` |  |
| `verificationPhrase` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```php
// load() returns the ENTITY — call data_get() for the Partner record (throws on error).
$partner = $client->Partner()->load(["id" => "partner_id"]);
```

#### Example: List

```php
// list() returns an array of Partner records (throws on error).
$partners = $client->Partner()->list();
```

#### Example: Create

```php
$partner = $client->Partner()->create([
    "location" => null, // array
]);
```


### Shipment

Create an instance: `$shipment = $client->Shipment();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `string` |  |
| `client` | `array` |  |
| `created` | `string` |  |
| `dateReceived` | `string` |  |
| `dateShipped` | `string` |  |
| `dcKif` | `array` |  |
| `id` | `string` |  |
| `items` | `array` |  |
| `kif` | `array` |  |
| `modified` | `string` |  |
| `partner` | `array` |  |
| `shipmentType` | `string` |  |
| `tracking` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```php
// load() returns the ENTITY — call data_get() for the Shipment record (throws on error).
$shipment = $client->Shipment()->load(["id" => "shipment_id"]);
```

#### Example: List

```php
// list() returns an array of Shipment records (throws on error).
$shipments = $client->Shipment()->list();
```

#### Example: Create

```php
$shipment = $client->Shipment()->create([
]);
```


### Success

Create an instance: `$success = $client->Success();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```php
$success = $client->Success()->create([
    "share_partner_to" => null, // string
]);
```


### Transaction

Create an instance: `$transaction = $client->Transaction();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `string` |  |
| `client` | `array` |  |
| `clientRef` | `string` |  |
| `created` | `string` |  |
| `decrypted` | `int` |  |
| `deviceName` | `string` |  |
| `directPartner` | `array` |  |
| `encrypted` | `int` |  |
| `endDate` | `string` |  |
| `errCode` | `string` |  |
| `errMessage` | `string` |  |
| `id` | `string` |  |
| `ipAddress` | `string` |  |
| `isVirtual` | `bool` |  |
| `keyType` | `string` |  |
| `location` | `array` |  |
| `messageId` | `string` |  |
| `method` | `string` |  |
| `partner` | `array` |  |
| `reference` | `string` |  |
| `serialNumber` | `string` |  |
| `startDate` | `string` |  |
| `success` | `bool` |  |
| `transactionSource` | `string` |  |

#### Example: Load

```php
// load() returns the ENTITY — call data_get() for the Transaction record (throws on error).
$transaction = $client->Transaction()->load(["id" => "transaction_id"]);
```

#### Example: List

```php
// list() returns an array of Transaction records (throws on error).
$transactions = $client->Transaction()->list();
```

#### Example: Create

```php
$transaction = $client->Transaction()->create([
    "location" => null, // array
]);
```


### UpdateResult

Create an instance: `$update_result = $client->UpdateResult();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `array` |  |
| `email` | `string` |  |
| `firstName` | `string` |  |
| `id` | `string` |  |
| `isActive` | `bool` |  |
| `kif` | `array` |  |
| `lastName` | `string` |  |
| `partner` | `array` |  |
| `phone` | `string` |  |
| `userName` | `string` |  |
| `userRole` | `array` |  |
| `version` | `int` |  |

#### Example: List

```php
// list() returns an array of UpdateResult records (throws on error).
$update_results = $client->UpdateResult()->list();
```

#### Example: Create

```php
$update_result = $client->UpdateResult()->create([
]);
```


### User

Create an instance: `$user = $client->User();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `array` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `firstName` | `string` |  |
| `id` | `string` |  |
| `isActive` | `bool` |  |
| `kif` | `array` |  |
| `lastName` | `string` |  |
| `modified` | `string` |  |
| `partner` | `array` |  |
| `phone` | `string` |  |
| `userName` | `string` |  |
| `userRole` | `array` |  |
| `version` | `int` |  |

#### Example: Load

```php
// load() returns the ENTITY — call data_get() for the User record (throws on error).
$user = $client->User()->load(["id" => "user_id"]);
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

Features are the extension mechanism. A feature is a PHP class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as arrays

The PHP SDK uses plain PHP associative arrays throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers::to_map()` to safely validate that a value is an array.

### Directory structure

```
php/
├── bluefindecryptxp2pe_sdk.php          -- Main SDK class
├── config.php                     -- Configuration
├── features.php                   -- Feature factory
├── core/                          -- Core types and context
├── entity/                        -- Entity implementations
├── feature/                       -- Built-in features (Base, Test, Log)
├── utility/                       -- Utility functions and struct library
└── test/                          -- Test suites
```

The main class (`bluefindecryptxp2pe_sdk.php`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```php
$devicetype = $client->DeviceType();
$devicetype->list();

// $devicetype->data_get() now returns the devicetype data from the last list
// $devicetype->match_get() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.

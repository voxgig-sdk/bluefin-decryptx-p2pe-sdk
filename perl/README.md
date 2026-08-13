# BluefinDecryptxP2pe Perl SDK



The Perl SDK for the BluefinDecryptxP2pe API — an entity-oriented client
following idiomatic Perl conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `$client->Attestation` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to CPAN. Install it from the GitHub
release tag (`perl/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)) or
from a source checkout.

The SDK is pure Perl with zero non-core runtime dependencies, so no build
step is required — just put its `lib` directory on `@INC`:

```perl
use lib 'lib';
use BluefinDecryptxP2peSDK;
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```perl
use lib 'lib';
use BluefinDecryptxP2peSDK;

my $client = BluefinDecryptxP2peSDK->new({
    'apikey' => $ENV{'BLUEFIN_DECRYPTX_P2PE_APIKEY'},
});
```

### 2. List attestation records

`list()` returns an `arrayref` of records (each a `hashref`) and dies on
error — iterate it directly.

```perl
my $attestations = eval { $client->Attestation->list };
if (my $err = $@) {
    print "list failed: $err\n";
}
else {
    for my $attestation (@$attestations) {
        print "$attestation->{id}\n";
    }
}
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`load()` returns the ENTITY — call data_get for the record — and dies on error.

```perl
my $devicecustodydetail = eval { $client->DeviceCustodyDetail->load({ 'device_type' => 'example_device_type', 'serial_number' => 'example_serial_number', 'id' => 'example_id' }) };
if (my $err = $@) {
    print "load failed: $err\n";
}
else {
    print "$devicecustodydetail->{id}\n";
}
```

### 4. Create, update, and remove

```perl
# Create — returns the ENTITY (call data_get for the record)
my $created = $client->Attestation->create({ 'client' => {}, 'completeDate' => 'example_completeDate' });

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

```perl
my $result = $client->direct({
    'path' => '/api/resource/{id}',
    'method' => 'GET',
    'params' => { 'id' => 'example' },
});

if ($result->{ok}) {
    print $result->{status}, "\n";  # 200
    print $result->{data}, "\n";    # response body
}
else {
    # A non-2xx response carries status + data (the error body); a
    # transport-level failure carries err instead. Only one is present, so
    # read whichever is defined.
    print $result->{status}, ' ', ($result->{err} // ''), "\n";
}
```

### Prepare a request without sending it

```perl
# prepare() returns the fetch definition and dies on error.
my $fetchdef = $client->prepare({
    'path' => '/api/resource/{id}',
    'method' => 'DELETE',
    'params' => { 'id' => 'example' },
});

print $fetchdef->{url}, "\n";
print $fetchdef->{method}, "\n";
print $fetchdef->{headers}, "\n";
```

### Use test mode

Create a mock client for unit testing — no server required:

```perl
my $client = BluefinDecryptxP2peSDK->test(undef, undef);

# Entity ops return the ENTITY and dies on error;
# call data_get for the record.
my $devicetype = $client->DeviceType->list();
# $devicetype contains the mock response record
```

### Use a custom fetch function

Replace the HTTP transport with your own coderef:

```perl
my $mock_fetch = sub {
    my ($url, $init) = @_;
    return ({
        'status' => 200,
        'statusText' => 'OK',
        'headers' => {},
        'json' => sub { { 'id' => 'mock01' } },
    }, undef);
};

my $client = BluefinDecryptxP2peSDK->new({
    'base' => 'http://localhost:8080',
    'system' => { 'fetch' => $mock_fetch },
});
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd perl && prove -Ilib t/
```


## Reference

### BluefinDecryptxP2peSDK

```perl
use lib 'lib';
use BluefinDecryptxP2peSDK;

my $client = BluefinDecryptxP2peSDK->new($options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `hashref` | Feature activation flags. |
| `extend` | `arrayref` | Additional feature instances to load. |
| `system` | `hashref` | System overrides (e.g. custom `fetch` coderef). |

### test

```perl
my $client = BluefinDecryptxP2peSDK->test($testopts, $sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `undef`.

### BluefinDecryptxP2peSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> hashref` | Deep copy of current SDK options. |
| `get_utility` | `() -> utility` | Copy of the SDK utility object. |
| `prepare` | `($fetchargs) -> hashref` | Build an HTTP request definition without sending. Dies on error. |
| `direct` | `($fetchargs) -> hashref` | Build and send an HTTP request. Returns a result hashref (branch on `ok`). |
| `Attestation` | `($data) -> Attestation entity` | Create an Attestation entity instance. |
| `Client` | `($data) -> Client entity` | Create a Client entity instance. |
| `CreateResult` | `($data) -> CreateResult entity` | Create a CreateResult entity instance. |
| `Decryption` | `($data) -> Decryption entity` | Create a Decryption entity instance. |
| `Device` | `($data) -> Device entity` | Create a Device entity instance. |
| `DeviceBuild` | `($data) -> DeviceBuild entity` | Create a DeviceBuild entity instance. |
| `DeviceCustodyDetail` | `($data) -> DeviceCustodyDetail entity` | Create a DeviceCustodyDetail entity instance. |
| `DeviceCustodyList` | `($data) -> DeviceCustodyList entity` | Create a DeviceCustodyList entity instance. |
| `DeviceList` | `($data) -> DeviceList entity` | Create a DeviceList entity instance. |
| `DeviceReceiveResult` | `($data) -> DeviceReceiveResult entity` | Create a DeviceReceiveResult entity instance. |
| `DeviceRkiActivateResult` | `($data) -> DeviceRkiActivateResult entity` | Create a DeviceRkiActivateResult entity instance. |
| `DeviceState` | `($data) -> DeviceState entity` | Create a DeviceState entity instance. |
| `DeviceType` | `($data) -> DeviceType entity` | Create a DeviceType entity instance. |
| `InjectKey` | `($data) -> InjectKey entity` | Create an InjectKey entity instance. |
| `Kif` | `($data) -> Kif entity` | Create a Kif entity instance. |
| `Location` | `($data) -> Location entity` | Create a Location entity instance. |
| `Partner` | `($data) -> Partner entity` | Create a Partner entity instance. |
| `Shipment` | `($data) -> Shipment entity` | Create a Shipment entity instance. |
| `Success` | `($data) -> Success entity` | Create a Success entity instance. |
| `Transaction` | `($data) -> Transaction entity` | Create a Transaction entity instance. |
| `UpdateResult` | `($data) -> UpdateResult entity` | Create an UpdateResult entity instance. |
| `User` | `($data) -> User entity` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `($reqmatch, $ctrl) -> hashref` | Load a single entity by match criteria. Dies on error. |
| `list` | `($reqmatch, $ctrl) -> arrayref` | List entities matching the criteria. Dies on error. |
| `create` | `($reqdata, $ctrl) -> hashref` | Create a new entity. Dies on error. |
| `update` | `($reqdata, $ctrl) -> hashref` | Update an existing entity. Dies on error. |
| `remove` | `($reqmatch, $ctrl) -> hashref` | Remove an entity. Dies on error. |
| `data_get` | `() -> hashref` | Get entity data. |
| `data_set` | `($data)` | Set entity data. |
| `match_get` | `() -> hashref` | Get entity match criteria. |
| `match_set` | `($match)` | Set entity match criteria. |
| `make` | `() -> entity` | Create a new instance with the same options. |
| `get_name` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return the ENTITY (call data_get for the record) (a `hashref` for single-entity
ops, an `arrayref` for `list`) and die on error. Wrap calls in
`eval { ... }` and inspect `$@` to handle failures.

The `direct()` escape hatch never dies — it returns a result `hashref`
you branch on via `$result->{ok}`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `boolean` | True if the HTTP status is 2xx. |
| `status` | `integer` | HTTP status code. |
| `headers` | `hashref` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is false and `err` contains the error value.

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

Create an instance: `my $attestation = $client->Attestation;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `hashref` |  |
| `completeDate` | `string` |  |
| `created` | `string` |  |
| `device` | `hashref` |  |
| `id` | `string` |  |
| `name` | `string` |  |
| `notes` | `string` |  |

#### Example: Load

```perl
my $attestation = $client->Attestation->load({ 'id' => 'attestation_id' });
```

#### Example: List

```perl
my $attestations = $client->Attestation->list;
```

#### Example: Create

```perl
my $attestation = $client->Attestation->create({
});
```


### Client

Create an instance: `my $client = $client->Client;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |
| `remove($match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `hashref` |  |
| `created` | `string` |  |
| `directPartner` | `hashref` |  |
| `id` | `string` |  |
| `isActive` | `boolean` |  |
| `location` | `hashref` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `hashref` |  |
| `version` | `integer` |  |

#### Example: Load

```perl
my $client = $client->Client->load({ 'id' => 'client_id' });
```

#### Example: List

```perl
my $clients = $client->Client->list;
```

#### Example: Create

```perl
my $client = $client->Client->create({
    'location' => {},  # hashref
});
```


### CreateResult

Create an instance: `my $create_result = $client->CreateResult;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Example: Create

```perl
my $create_result = $client->CreateResult->create({
    'device_type' => 'example_device_type',  # string
    'serial_number' => 'example_serial_number',  # string
});
```


### Decryption

Create an instance: `my $decryption = $client->Decryption;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean` |  |

#### Example: Create

```perl
my $decryption = $client->Decryption->create({
});
```


### Device

Create an instance: `my $device = $client->Device;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `hashref` |  |
| `activationDate` | `string` |  |
| `alternateKey` | `string` |  |
| `auditNextDate` | `string` |  |
| `auditNotificationDate` | `string` |  |
| `client` | `hashref` |  |
| `created` | `string` |  |
| `createdBy` | `hashref` |  |
| `deviceBuild` | `hashref` |  |
| `deviceState` | `hashref` |  |
| `deviceType` | `hashref` |  |
| `errorCounter` | `integer` |  |
| `errorLastDate` | `string` |  |
| `id` | `string` |  |
| `initializedBy` | `hashref` |  |
| `initializedDate` | `string` |  |
| `injectKey` | `hashref` |  |
| `isVirtual` | `boolean` |  |
| `kif` | `hashref` |  |
| `lastActivityDate` | `string` |  |
| `location` | `hashref` |  |
| `modified` | `string` |  |
| `modifiedBy` | `hashref` |  |
| `name` | `string` |  |
| `notes` | `string` |  |
| `partner` | `hashref` |  |
| `serialNumber` | `string` |  |
| `version` | `integer` |  |

#### Example: Load

```perl
my $device = $client->Device->load({ 'id' => 'device_id' });
```

#### Example: List

```perl
my $devices = $client->Device->list;
```

#### Example: Create

```perl
my $device = $client->Device->create({
    'activatedBy' => {},  # hashref
    'createdBy' => {},  # hashref
    'initializedBy' => {},  # hashref
    'location' => {},  # hashref
    'modifiedBy' => {},  # hashref
});
```


### DeviceBuild

Create an instance: `my $device_build = $client->DeviceBuild;`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

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
| `id` | `integer` |  |
| `isActive` | `boolean` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `notes` | `string` |  |
| `version` | `integer` |  |
| `whiteListingBinRanges` | `string` |  |
| `whiteListingUsed` | `boolean` |  |

#### Example: Load

```perl
my $device_build = $client->DeviceBuild->load({ 'id' => 'device_build_id' });
```

#### Example: List

```perl
my $device_builds = $client->DeviceBuild->list;
```


### DeviceCustodyDetail

Create an instance: `my $device_custody_detail = $client->DeviceCustodyDetail;`

#### Operations

| Method | Description |
| --- | --- |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `string` |  |
| `created` | `string` |  |
| `createdBy` | `hashref` |  |
| `custodian` | `hashref` |  |
| `device` | `hashref` |  |
| `id` | `integer` |  |
| `location` | `hashref` |  |
| `modified` | `string` |  |
| `modifiedBy` | `hashref` |  |
| `notes` | `string` |  |
| `status` | `hashref` |  |
| `transferMethod` | `hashref` |  |
| `version` | `integer` |  |

#### Example: Load

```perl
my $device_custody_detail = $client->DeviceCustodyDetail->load({ 'id' => 'device_custody_detail_id', 'device_type' => 'device_type', 'serial_number' => 'serial_number' });
```


### DeviceCustodyList

Create an instance: `my $device_custody_list = $client->DeviceCustodyList;`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `string` |  |
| `created` | `string` |  |
| `createdBy` | `hashref` |  |
| `custodian` | `hashref` |  |
| `device` | `hashref` |  |
| `id` | `integer` |  |
| `location` | `hashref` |  |
| `modified` | `string` |  |
| `modifiedBy` | `hashref` |  |
| `notes` | `string` |  |
| `status` | `hashref` |  |
| `transferMethod` | `hashref` |  |
| `version` | `integer` |  |

#### Example: List

```perl
my $device_custody_lists = $client->DeviceCustodyList->list;
```


### DeviceList

Create an instance: `my $device_list = $client->DeviceList;`

#### Operations

| Method | Description |
| --- | --- |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `arrayref` |  |
| `total` | `integer` |  |

#### Example: Load

```perl
my $device_list = $client->DeviceList->load({ 'share_partner_to' => 'share_partner_to' });
```


### DeviceReceiveResult

Create an instance: `my $device_receive_result = $client->DeviceReceiveResult;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean` |  |

#### Example: Create

```perl
my $device_receive_result = $client->DeviceReceiveResult->create({
    'success' => 1,  # boolean
});
```


### DeviceRkiActivateResult

Create an instance: `my $device_rki_activate_result = $client->DeviceRkiActivateResult;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean` |  |

#### Example: Create

```perl
my $device_rki_activate_result = $client->DeviceRkiActivateResult->create({
    'success' => 1,  # boolean
});
```


### DeviceState

Create an instance: `my $device_state = $client->DeviceState;`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `integer` |  |
| `name` | `string` |  |

#### Example: List

```perl
my $device_states = $client->DeviceState->list;
```


### DeviceType

Create an instance: `my $device_type = $client->DeviceType;`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `string` |  |
| `deviceTypeMode` | `string` |  |
| `hardwareVersion` | `string` |  |
| `id` | `string` |  |
| `isActive` | `boolean` |  |
| `manufacturer` | `string` |  |
| `model` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `photoUrl` | `string` |  |
| `productName` | `string` |  |
| `version` | `integer` |  |

#### Example: Load

```perl
my $device_type = $client->DeviceType->load({ 'id' => 'device_type_id' });
```

#### Example: List

```perl
my $device_types = $client->DeviceType->list;
```


### InjectKey

Create an instance: `my $inject_key = $client->InjectKey;`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `string` |  |
| `id` | `string` |  |
| `isActive` | `boolean` |  |
| `isP2PE` | `boolean` |  |
| `keyType` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `version` | `integer` |  |

#### Example: Load

```perl
my $inject_key = $client->InjectKey->load({ 'id' => 'inject_key_id' });
```

#### Example: List

```perl
my $inject_keys = $client->InjectKey->list;
```


### Kif

Create an instance: `my $kif = $client->Kif;`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `integer` |  |
| `name` | `string` |  |

#### Example: List

```perl
my $kifs = $client->Kif->list;
```


### Location

Create an instance: `my $location = $client->Location;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |
| `remove($match)` | Remove the matching entity. |

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
| `version` | `integer` |  |

#### Example: Load

```perl
my $location = $client->Location->load({ 'id' => 'location_id' });
```

#### Example: List

```perl
my $locations = $client->Location->list;
```

#### Example: Create

```perl
my $location = $client->Location->create({
});
```


### Partner

Create an instance: `my $partner = $client->Partner;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `string` |  |
| `clientCanOrderEquipment` | `boolean` |  |
| `contact` | `hashref` |  |
| `created` | `string` |  |
| `id` | `string` |  |
| `isActive` | `boolean` |  |
| `location` | `hashref` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `hashref` |  |
| `partnerId` | `string` |  |
| `reference` | `string` |  |
| `verificationPhrase` | `string` |  |
| `version` | `integer` |  |

#### Example: Load

```perl
my $partner = $client->Partner->load({ 'id' => 'partner_id' });
```

#### Example: List

```perl
my $partners = $client->Partner->list;
```

#### Example: Create

```perl
my $partner = $client->Partner->create({
    'location' => {},  # hashref
});
```


### Shipment

Create an instance: `my $shipment = $client->Shipment;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `string` |  |
| `client` | `hashref` |  |
| `created` | `string` |  |
| `dateReceived` | `string` |  |
| `dateShipped` | `string` |  |
| `dcKif` | `hashref` |  |
| `id` | `string` |  |
| `items` | `arrayref` |  |
| `kif` | `hashref` |  |
| `modified` | `string` |  |
| `partner` | `hashref` |  |
| `shipmentType` | `string` |  |
| `tracking` | `string` |  |
| `version` | `integer` |  |

#### Example: Load

```perl
my $shipment = $client->Shipment->load({ 'id' => 'shipment_id' });
```

#### Example: List

```perl
my $shipments = $client->Shipment->list;
```

#### Example: Create

```perl
my $shipment = $client->Shipment->create({
});
```


### Success

Create an instance: `my $success = $client->Success;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `remove($match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean` |  |

#### Example: Create

```perl
my $success = $client->Success->create({
    'share_partner_to' => 'example_share_partner_to',  # string
});
```


### Transaction

Create an instance: `my $transaction = $client->Transaction;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `string` |  |
| `client` | `hashref` |  |
| `clientRef` | `string` |  |
| `created` | `string` |  |
| `decrypted` | `integer` |  |
| `deviceName` | `string` |  |
| `directPartner` | `hashref` |  |
| `encrypted` | `integer` |  |
| `endDate` | `string` |  |
| `errCode` | `string` |  |
| `errMessage` | `string` |  |
| `id` | `string` |  |
| `ipAddress` | `string` |  |
| `isVirtual` | `boolean` |  |
| `keyType` | `string` |  |
| `location` | `hashref` |  |
| `messageId` | `string` |  |
| `method` | `string` |  |
| `partner` | `hashref` |  |
| `reference` | `string` |  |
| `serialNumber` | `string` |  |
| `startDate` | `string` |  |
| `success` | `boolean` |  |
| `transactionSource` | `string` |  |

#### Example: Load

```perl
my $transaction = $client->Transaction->load({ 'id' => 'transaction_id' });
```

#### Example: List

```perl
my $transactions = $client->Transaction->list;
```

#### Example: Create

```perl
my $transaction = $client->Transaction->create({
    'location' => {},  # hashref
});
```


### UpdateResult

Create an instance: `my $update_result = $client->UpdateResult;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `update($data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `hashref` |  |
| `email` | `string` |  |
| `firstName` | `string` |  |
| `id` | `string` |  |
| `isActive` | `boolean` |  |
| `kif` | `hashref` |  |
| `lastName` | `string` |  |
| `partner` | `hashref` |  |
| `phone` | `string` |  |
| `userName` | `string` |  |
| `userRole` | `hashref` |  |
| `version` | `integer` |  |

#### Example: List

```perl
my $update_results = $client->UpdateResult->list;
```

#### Example: Create

```perl
my $update_result = $client->UpdateResult->create({
});
```


### User

Create an instance: `my $user = $client->User;`

#### Operations

| Method | Description |
| --- | --- |
| `load($match)` | Load a single entity by match criteria. |
| `remove($match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `hashref` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `firstName` | `string` |  |
| `id` | `string` |  |
| `isActive` | `boolean` |  |
| `kif` | `hashref` |  |
| `lastName` | `string` |  |
| `modified` | `string` |  |
| `partner` | `hashref` |  |
| `phone` | `string` |  |
| `userName` | `string` |  |
| `userRole` | `hashref` |  |
| `version` | `integer` |  |

#### Example: Load

```perl
my $user = $client->User->load({ 'id' => 'user_id' });
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

### Data as hashrefs

The Perl SDK uses plain hashrefs and arrayrefs throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Use `BluefinDecryptxP2peHelpers::to_map()` to safely validate that a value
is a hashref.

### Module structure

```
perl/
├── lib/BluefinDecryptxP2peSDK.pm    -- Main SDK module (package BluefinDecryptxP2peSDK)
├── config.pm                    -- Configuration
├── features.pm                  -- Feature factory
├── core/                        -- Core types and context
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (base, test, log)
├── utility/                     -- Utility functions
├── lib/Voxgig/Struct.pm         -- Vendored struct library
└── t/                           -- Test suites
```

Load the main module with `use lib 'lib'; use BluefinDecryptxP2peSDK;` — it
pulls in the config, features, and core modules for you. Require entity or
utility modules directly only when needed.

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

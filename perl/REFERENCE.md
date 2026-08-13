# BluefinDecryptxP2pe Perl SDK Reference

Complete API reference for the BluefinDecryptxP2pe Perl SDK.


## BluefinDecryptxP2peSDK

### Constructor

```perl
use lib 'lib';
use BluefinDecryptxP2peSDK;

my $client = BluefinDecryptxP2peSDK->new($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `hashref` | SDK configuration options. |
| `$options->{apikey}` | `string` | API key for authentication. |
| `$options->{base}` | `string` | Base URL for API requests. |
| `$options->{prefix}` | `string` | URL prefix appended after base. |
| `$options->{suffix}` | `string` | URL suffix appended after path. |
| `$options->{headers}` | `hashref` | Custom headers for all requests. |
| `$options->{feature}` | `hashref` | Feature configuration. |
| `$options->{system}` | `hashref` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinDecryptxP2peSDK->test($testopts, $sdkopts)`

Create a test client with mock features active. Both arguments may be `undef`.

```perl
my $client = BluefinDecryptxP2peSDK->test();
```


### Instance Methods

#### `Attestation($data)`

Create a new `Attestation` entity instance. Pass `undef` for no initial data.

#### `Client($data)`

Create a new `Client` entity instance. Pass `undef` for no initial data.

#### `CreateResult($data)`

Create a new `CreateResult` entity instance. Pass `undef` for no initial data.

#### `Decryption($data)`

Create a new `Decryption` entity instance. Pass `undef` for no initial data.

#### `Device($data)`

Create a new `Device` entity instance. Pass `undef` for no initial data.

#### `DeviceBuild($data)`

Create a new `DeviceBuild` entity instance. Pass `undef` for no initial data.

#### `DeviceCustodyDetail($data)`

Create a new `DeviceCustodyDetail` entity instance. Pass `undef` for no initial data.

#### `DeviceCustodyList($data)`

Create a new `DeviceCustodyList` entity instance. Pass `undef` for no initial data.

#### `DeviceList($data)`

Create a new `DeviceList` entity instance. Pass `undef` for no initial data.

#### `DeviceReceiveResult($data)`

Create a new `DeviceReceiveResult` entity instance. Pass `undef` for no initial data.

#### `DeviceRkiActivateResult($data)`

Create a new `DeviceRkiActivateResult` entity instance. Pass `undef` for no initial data.

#### `DeviceState($data)`

Create a new `DeviceState` entity instance. Pass `undef` for no initial data.

#### `DeviceType($data)`

Create a new `DeviceType` entity instance. Pass `undef` for no initial data.

#### `InjectKey($data)`

Create a new `InjectKey` entity instance. Pass `undef` for no initial data.

#### `Kif($data)`

Create a new `Kif` entity instance. Pass `undef` for no initial data.

#### `Location($data)`

Create a new `Location` entity instance. Pass `undef` for no initial data.

#### `Partner($data)`

Create a new `Partner` entity instance. Pass `undef` for no initial data.

#### `Shipment($data)`

Create a new `Shipment` entity instance. Pass `undef` for no initial data.

#### `Success($data)`

Create a new `Success` entity instance. Pass `undef` for no initial data.

#### `Transaction($data)`

Create a new `Transaction` entity instance. Pass `undef` for no initial data.

#### `UpdateResult($data)`

Create a new `UpdateResult` entity instance. Pass `undef` for no initial data.

#### `User($data)`

Create a new `User` entity instance. Pass `undef` for no initial data.

#### `options_map() -> hashref`

Return a deep copy of the current SDK options.

#### `get_utility() -> utility`

Return a copy of the SDK utility object.

#### `direct($fetchargs) -> hashref`

Make a direct HTTP request to any API endpoint. Returns a result `hashref` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never dies — branch on `$result->{ok}`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs->{path}` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs->{method}` | `string` | HTTP method (default: `'GET'`). |
| `$fetchargs->{params}` | `hashref` | Path parameter values. |
| `$fetchargs->{query}` | `hashref` | Query string parameters. |
| `$fetchargs->{headers}` | `hashref` | Request headers (merged with defaults). |
| `$fetchargs->{body}` | `any` | Request body (hashrefs are JSON-serialized). |

**Returns:** `hashref`

#### `prepare($fetchargs) -> hashref`

Prepare a fetch definition without sending. Returns the `fetchdef` and dies on error.


---

## Attestation entity

```perl
my $attestation = $client->Attestation;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `hashref` | No |  |
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `device` | `hashref` | No |  |
| `id` | `string` | No |  |
| `name` | `string` | No |  |
| `notes` | `string` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->Attestation->create({
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->Attestation->list;
for my $attestation (@$results) {
    print "$attestation->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->Attestation->load({ 'id' => 'attestation_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Attestation` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Client entity

```perl
my $client = $client->Client;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `hashref` | No |  |
| `created` | `string` | No |  |
| `directPartner` | `hashref` | No |  |
| `id` | `string` | No |  |
| `isActive` | `boolean` | No |  |
| `location` | `hashref` | Yes |  |
| `mid` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `partner` | `hashref` | No |  |
| `version` | `integer` | No |  |

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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->Client->create({
    'location' => {},  # hashref
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->Client->list;
for my $client (@$results) {
    print "$client->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->Client->load({ 'id' => 'client_id' });
```

#### `remove($reqmatch, $ctrl) -> hashref`

Remove the entity matching the given criteria. Dies on error.

```perl
my $result = $client->Client->remove({ 'id' => 'client_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Client` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## CreateResult entity

```perl
my $create_result = $client->CreateResult;
```

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->CreateResult->create({
    'device_type' => 'example_device_type',  # string
    'serial_number' => 'example_serial_number',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `CreateResult` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Decryption entity

```perl
my $decryption = $client->Decryption;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->Decryption->create({
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Decryption` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Device entity

```perl
my $device = $client->Device;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activatedBy` | `hashref` | Yes |  |
| `activationDate` | `string` | No |  |
| `alternateKey` | `string` | No |  |
| `auditNextDate` | `string` | No |  |
| `auditNotificationDate` | `string` | No |  |
| `client` | `hashref` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `hashref` | Yes |  |
| `deviceBuild` | `hashref` | No |  |
| `deviceState` | `hashref` | No |  |
| `deviceType` | `hashref` | No |  |
| `errorCounter` | `integer` | No |  |
| `errorLastDate` | `string` | No |  |
| `id` | `string` | No |  |
| `initializedBy` | `hashref` | Yes |  |
| `initializedDate` | `string` | No |  |
| `injectKey` | `hashref` | No |  |
| `isVirtual` | `boolean` | No |  |
| `kif` | `hashref` | No |  |
| `lastActivityDate` | `string` | No |  |
| `location` | `hashref` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `hashref` | Yes |  |
| `name` | `string` | No |  |
| `notes` | `string` | No |  |
| `partner` | `hashref` | No |  |
| `serialNumber` | `string` | No |  |
| `version` | `integer` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->Device->create({
    'activatedBy' => {},  # hashref
    'createdBy' => {},  # hashref
    'initializedBy' => {},  # hashref
    'location' => {},  # hashref
    'modifiedBy' => {},  # hashref
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->Device->list;
for my $device (@$results) {
    print "$device->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->Device->load({ 'id' => 'device_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Device` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## DeviceBuild entity

```perl
my $device_build = $client->DeviceBuild;
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
| `id` | `integer` | No |  |
| `isActive` | `boolean` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `notes` | `string` | No |  |
| `version` | `integer` | No |  |
| `whiteListingBinRanges` | `string` | No |  |
| `whiteListingUsed` | `boolean` | No |  |

### Operations

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->DeviceBuild->list;
for my $device_build (@$results) {
    print "$device_build->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->DeviceBuild->load({ 'id' => 'device_build_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `DeviceBuild` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## DeviceCustodyDetail entity

```perl
my $device_custody_detail = $client->DeviceCustodyDetail;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `hashref` | Yes |  |
| `custodian` | `hashref` | Yes |  |
| `device` | `hashref` | No |  |
| `id` | `integer` | No |  |
| `location` | `hashref` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `hashref` | Yes |  |
| `notes` | `string` | No |  |
| `status` | `hashref` | No |  |
| `transferMethod` | `hashref` | No |  |
| `version` | `integer` | No |  |

### Operations

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->DeviceCustodyDetail->load({ 'id' => 'device_custody_detail_id', 'device_type' => 'device_type', 'serial_number' => 'serial_number' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `DeviceCustodyDetail` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## DeviceCustodyList entity

```perl
my $device_custody_list = $client->DeviceCustodyList;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `hashref` | Yes |  |
| `custodian` | `hashref` | Yes |  |
| `device` | `hashref` | No |  |
| `id` | `integer` | No |  |
| `location` | `hashref` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `hashref` | Yes |  |
| `notes` | `string` | No |  |
| `status` | `hashref` | No |  |
| `transferMethod` | `hashref` | No |  |
| `version` | `integer` | No |  |

### Operations

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->DeviceCustodyList->list;
for my $device_custody_list (@$results) {
    print "$device_custody_list->{id}\n";
}
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `DeviceCustodyList` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## DeviceList entity

```perl
my $device_list = $client->DeviceList;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `arrayref` | No |  |
| `total` | `integer` | No |  |

### Operations

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->DeviceList->load({ 'share_partner_to' => 'share_partner_to' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `DeviceList` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## DeviceReceiveResult entity

```perl
my $device_receive_result = $client->DeviceReceiveResult;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean` | Yes |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->DeviceReceiveResult->create({
    'success' => 1,  # boolean
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `DeviceReceiveResult` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## DeviceRkiActivateResult entity

```perl
my $device_rki_activate_result = $client->DeviceRkiActivateResult;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean` | Yes |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->DeviceRkiActivateResult->create({
    'success' => 1,  # boolean
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `DeviceRkiActivateResult` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## DeviceState entity

```perl
my $device_state = $client->DeviceState;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `integer` | No |  |
| `name` | `string` | No |  |

### Operations

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->DeviceState->list;
for my $device_state (@$results) {
    print "$device_state->{id}\n";
}
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `DeviceState` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## DeviceType entity

```perl
my $device_type = $client->DeviceType;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `string` | No |  |
| `deviceTypeMode` | `string` | No |  |
| `hardwareVersion` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `boolean` | No |  |
| `manufacturer` | `string` | No |  |
| `model` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `photoUrl` | `string` | No |  |
| `productName` | `string` | No |  |
| `version` | `integer` | No |  |

### Operations

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->DeviceType->list;
for my $device_type (@$results) {
    print "$device_type->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->DeviceType->load({ 'id' => 'device_type_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `DeviceType` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## InjectKey entity

```perl
my $inject_key = $client->InjectKey;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `boolean` | No |  |
| `isP2PE` | `boolean` | No |  |
| `keyType` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `version` | `integer` | No |  |

### Operations

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->InjectKey->list;
for my $inject_key (@$results) {
    print "$inject_key->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->InjectKey->load({ 'id' => 'inject_key_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `InjectKey` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Kif entity

```perl
my $kif = $client->Kif;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `integer` | No |  |
| `name` | `string` | No |  |

### Operations

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->Kif->list;
for my $kif (@$results) {
    print "$kif->{id}\n";
}
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Kif` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Location entity

```perl
my $location = $client->Location;
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
| `version` | `integer` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->Location->create({
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->Location->list;
for my $location (@$results) {
    print "$location->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->Location->load({ 'id' => 'location_id' });
```

#### `remove($reqmatch, $ctrl) -> hashref`

Remove the entity matching the given criteria. Dies on error.

```perl
my $result = $client->Location->remove({ 'id' => 'location_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Location` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Partner entity

```perl
my $partner = $client->Partner;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `string` | No |  |
| `clientCanOrderEquipment` | `boolean` | No |  |
| `contact` | `hashref` | No |  |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `boolean` | No |  |
| `location` | `hashref` | Yes |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `hashref` | No |  |
| `partnerId` | `string` | No |  |
| `reference` | `string` | No |  |
| `verificationPhrase` | `string` | No |  |
| `version` | `integer` | No |  |

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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->Partner->create({
    'location' => {},  # hashref
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->Partner->list;
for my $partner (@$results) {
    print "$partner->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->Partner->load({ 'id' => 'partner_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Partner` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Shipment entity

```perl
my $shipment = $client->Shipment;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `string` | No |  |
| `client` | `hashref` | No |  |
| `created` | `string` | No |  |
| `dateReceived` | `string` | No |  |
| `dateShipped` | `string` | No |  |
| `dcKif` | `hashref` | No |  |
| `id` | `string` | No |  |
| `items` | `arrayref` | No |  |
| `kif` | `hashref` | No |  |
| `modified` | `string` | No |  |
| `partner` | `hashref` | No |  |
| `shipmentType` | `string` | No |  |
| `tracking` | `string` | No |  |
| `version` | `integer` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->Shipment->create({
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->Shipment->list;
for my $shipment (@$results) {
    print "$shipment->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->Shipment->load({ 'id' => 'shipment_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Shipment` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Success entity

```perl
my $success = $client->Success;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->Success->create({
    'share_partner_to' => 'example_share_partner_to',  # string
});
```

#### `remove($reqmatch, $ctrl) -> hashref`

Remove the entity matching the given criteria. Dies on error.

```perl
my $result = $client->Success->remove({ 'share_partner_to' => 'share_partner_to' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Success` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Transaction entity

```perl
my $transaction = $client->Transaction;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternateKey` | `string` | No |  |
| `client` | `hashref` | No |  |
| `clientRef` | `string` | No |  |
| `created` | `string` | No |  |
| `decrypted` | `integer` | No |  |
| `deviceName` | `string` | No |  |
| `directPartner` | `hashref` | No |  |
| `encrypted` | `integer` | No |  |
| `endDate` | `string` | No |  |
| `errCode` | `string` | No |  |
| `errMessage` | `string` | No |  |
| `id` | `string` | No |  |
| `ipAddress` | `string` | No |  |
| `isVirtual` | `boolean` | No |  |
| `keyType` | `string` | No |  |
| `location` | `hashref` | Yes |  |
| `messageId` | `string` | No |  |
| `method` | `string` | No |  |
| `partner` | `hashref` | No |  |
| `reference` | `string` | No |  |
| `serialNumber` | `string` | No |  |
| `startDate` | `string` | No |  |
| `success` | `boolean` | No |  |
| `transactionSource` | `string` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->Transaction->create({
    'location' => {},  # hashref
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->Transaction->list;
for my $transaction (@$results) {
    print "$transaction->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->Transaction->load({ 'id' => 'transaction_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Transaction` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## UpdateResult entity

```perl
my $update_result = $client->UpdateResult;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `hashref` | No |  |
| `email` | `string` | No |  |
| `firstName` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `boolean` | No |  |
| `kif` | `hashref` | No |  |
| `lastName` | `string` | No |  |
| `partner` | `hashref` | No |  |
| `phone` | `string` | No |  |
| `userName` | `string` | No |  |
| `userRole` | `hashref` | No |  |
| `version` | `integer` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->UpdateResult->create({
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->UpdateResult->list;
for my $update_result (@$results) {
    print "$update_result->{id}\n";
}
```

#### `update($reqdata, $ctrl) -> hashref`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and dies on error.

```perl
my $result = $client->UpdateResult->update({
    'id' => 'id',
    # Fields to update
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `UpdateResult` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## User entity

```perl
my $user = $client->User;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `hashref` | No |  |
| `created` | `string` | No |  |
| `email` | `string` | No |  |
| `firstName` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `boolean` | No |  |
| `kif` | `hashref` | No |  |
| `lastName` | `string` | No |  |
| `modified` | `string` | No |  |
| `partner` | `hashref` | No |  |
| `phone` | `string` | No |  |
| `userName` | `string` | No |  |
| `userRole` | `hashref` | No |  |
| `version` | `integer` | No |  |

### Operations

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->User->load({ 'id' => 'user_id' });
```

#### `remove($reqmatch, $ctrl) -> hashref`

Remove the entity matching the given criteria. Dies on error.

```perl
my $result = $client->User->remove({ 'id' => 'user_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `User` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```perl
my $client = BluefinDecryptxP2peSDK->new({
    'feature' => {
        'test' => { 'active' => 1 },
    },
});
```


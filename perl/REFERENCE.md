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

#### `DeviceCustodyListItem($data)`

Create a new `DeviceCustodyListItem` entity instance. Pass `undef` for no initial data.

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

#### `VirtualDevice($data)`

Create a new `VirtualDevice` entity instance. Pass `undef` for no initial data.

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
| `client` | `hashref` | No | Reference to the associated Client resource. |
| `completeDate` | `string` | No | The date and time that the Attestation took place. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `device` | `hashref` | No | Reference to the associated Device resource. |
| `devices` | `arrayref` | Yes |  |
| `id` | `string` | No | This resource's unique identifier. |
| `name` | `string` | No | Text describing the attestation. |
| `notes` | `string` | No | Free form field that allows the Client associate notes with the Attestation. |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `client` | - | - | Yes |
| `completeDate` | - | - | Yes |
| `created` | - | - | - |
| `device` | - | - | - |
| `devices` | - | - | - |
| `id` | - | - | - |
| `name` | - | - | Yes |
| `notes` | - | - | - |

### Operations

#### `create($reqdata, $ctrl) -> AttestationEntity`

Create a new entity with the given data. Returns the created entity and dies on error.

```perl
my $result = $client->Attestation->create({
    'devices' => [],  # arrayref
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref of entities, one per record (`data_get` reads each record), and dies on error.

```perl
my $results = $client->Attestation->list({ 'client' => 'example' });
for my $attestation (@$results) {
    print $attestation->data_get->{id}, "\n";
}
```

#### `load($reqmatch, $ctrl) -> AttestationEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get` reads, and dies on error.

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
| `contact` | `hashref` | No | Reference to the associated User resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `hashref` | No | Reference to the associated Partner. |
| `id` | `string` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the Client account is active or disabled. |
| `location` | `hashref` | Yes | Reference to the associated Location resource. |
| `mid` | `string` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Client's name. |
| `partner` | `hashref` | No | Reference to the Client's root Partner. |
| `version` | `integer` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create | remove |
| --- | --- | --- | --- | --- |
| `contact` | - | Yes | Yes | - |
| `created` | - | - | - | - |
| `directPartner` | - | - | Yes | - |
| `id` | - | - | - | - |
| `isActive` | - | - | - | - |
| `location` | - | - | - | - |
| `mid` | - | - | - | - |
| `modified` | - | - | - | - |
| `name` | - | - | Yes | - |
| `partner` | - | - | - | - |
| `version` | - | - | - | - |

### Operations

#### `create($reqdata, $ctrl) -> ClientEntity`

Create a new entity with the given data. Returns the created entity and dies on error.

```perl
my $result = $client->Client->create({
    'location' => {},  # hashref
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref of entities, one per record (`data_get` reads each record), and dies on error.

```perl
my $results = $client->Client->list({ 'partner' => 'example' });
for my $client (@$results) {
    print $client->data_get->{id}, "\n";
}
```

#### `load($reqmatch, $ctrl) -> ClientEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get` reads, and dies on error.

```perl
my $result = $client->Client->load({ 'id' => 'client_id' });
```

#### `remove($reqmatch, $ctrl) -> ClientEntity`

Remove the entity matching the given criteria. Returns the entity, marked as deleted, and dies on error.

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

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `string` | No | The date and time that the Custody change took place. |
| `custodian` | `hashref` | Yes | Reference to the associated User resource. |
| `location` | `hashref` | Yes | Reference to the associated Location resource. |
| `notes` | `string` | No | Free form field that allows the Client associate notes with the Custody Change. |

### Operations

#### `create($reqdata, $ctrl) -> CreateResultEntity`

Create a new entity with the given data. Returns the created entity and dies on error.

```perl
my $result = $client->CreateResult->create({
    'device_type' => 'example_device_type',  # string
    'serial_number' => 'example_serial_number',  # string
    'custodian' => {},  # hashref
    'location' => {},  # hashref
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
| `cbcVector` | `string` | No | Base64 or hex encoded initial vector obtained from device. |
| `deviceType` | `string` | Yes | The device Type. |
| `encoding` | `string` | No | The payload encoding |
| `encrypted` | `arrayref` | Yes |  |
| `hasCcData` | `string` | No | Validation flag that indicates whether inbound and outbound data should be checked for credit card numbers. |
| `reference` | `string` | No | A string (of up to 50 characters) that helps partners identify individual API calls. |
| `sequenceNumber` | `string` | No | Sequence number obtained from device in base 64 or hex encoded format. |
| `serialNumber` | `string` | Yes | The serial number of the device. |
| `success` | `boolean` | No | true if the payload decryption was successful. |

### Operations

#### `create($reqdata, $ctrl) -> DecryptionEntity`

Create a new entity with the given data. Returns the created entity and dies on error.

```perl
my $result = $client->Decryption->create({
    'deviceType' => 'example_deviceType',  # string
    'encrypted' => [],  # arrayref
    'serialNumber' => 'example_serialNumber',  # string
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
| `activatedBy` | `hashref` | Yes | Reference to the associated User resource. |
| `activationDate` | `string` | No | Timestamp from when the Device was activated. |
| `alternateKey` | `string` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `string` | No | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `string` | No | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `hashref` | No | Reference to the associated Client resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `hashref` | Yes | Reference to the associated User resource. |
| `deviceBuild` | `hashref` | No | Reference to the associated Device Build resource. |
| `deviceState` | `hashref` | No | Reference to the associated Device State resource. |
| `deviceType` | `hashref` | No | Reference to the associated Device Type resource. |
| `errorCounter` | `integer` | No | The number times the Device has been in error. |
| `errorLastDate` | `string` | No | Timestamp from the last time that the Device had an error. |
| `id` | `string` | No | The Device's unique identifier. |
| `initializedBy` | `hashref` | Yes | Reference to the associated User resource. |
| `initializedDate` | `string` | No | Timestamp from when the Device was initialized. |
| `injectKey` | `hashref` | No | Reference to the associated Device resource. |
| `isVirtual` | `boolean` | No | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `hashref` | No | Reference to the associated KIF resource. |
| `lastActivityDate` | `string` | No | Timestamp from the last time that the Device was used. |
| `location` | `hashref` | Yes | Reference to the associated Location resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `modifiedBy` | `hashref` | Yes | Reference to the associated User resource. |
| `name` | `string` | No | The Device's name. |
| `notes` | `string` | No | Arbitary note that can be attached to a Device entry. |
| `partner` | `hashref` | No | Reference to the associated Partner. |
| `serialNumber` | `string` | No | The Device's serial number. |
| `version` | `integer` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `activatedBy` | - | - | - |
| `activationDate` | - | - | - |
| `alternateKey` | - | - | - |
| `auditNextDate` | - | - | - |
| `auditNotificationDate` | - | - | - |
| `client` | - | - | - |
| `created` | - | - | - |
| `createdBy` | - | - | - |
| `deviceBuild` | - | - | - |
| `deviceState` | - | - | - |
| `deviceType` | - | - | Yes |
| `errorCounter` | - | - | - |
| `errorLastDate` | - | - | - |
| `id` | - | - | - |
| `initializedBy` | - | - | - |
| `initializedDate` | - | - | - |
| `injectKey` | - | - | - |
| `isVirtual` | - | - | - |
| `kif` | - | - | Yes |
| `lastActivityDate` | - | - | - |
| `location` | - | - | - |
| `modified` | - | - | - |
| `modifiedBy` | - | - | - |
| `name` | - | - | - |
| `notes` | - | - | - |
| `partner` | - | - | - |
| `serialNumber` | - | - | Yes |
| `version` | - | - | - |

### Operations

#### `create($reqdata, $ctrl) -> DeviceEntity`

Create a new entity with the given data. Returns the created entity and dies on error.

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

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref of entities, one per record (`data_get` reads each record), and dies on error.

```perl
my $results = $client->Device->list;
for my $device (@$results) {
    print $device->data_get->{id}, "\n";
}
```

#### `load($reqmatch, $ctrl) -> DeviceEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get` reads, and dies on error.

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
| `appVersion` | `string` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `string` | No | The Build Number. |
| `configFileName` | `string` | No | The name of the configuration file that is uploaded to the device. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `deviceType` | `string` | No | The Device Type Name. |
| `firmwareVersion` | `string` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `string` | No | A list of hardware versions that this Device Build covers. |
| `id` | `integer` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Device Builds's name. |
| `notes` | `string` | No | Notes attached to the device build by Bluefin CISO. |
| `version` | `integer` | No | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `string` | No | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `boolean` | No | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

### Operations

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref of entities, one per record (`data_get` reads each record), and dies on error.

```perl
my $results = $client->DeviceBuild->list;
for my $device_build (@$results) {
    print $device_build->data_get->{id}, "\n";
}
```

#### `load($reqmatch, $ctrl) -> DeviceBuildEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get` reads, and dies on error.

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
| `completeDate` | `string` | No | The date and time that the Custody change took place. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `hashref` | Yes | Reference to the associated User resource. |
| `custodian` | `hashref` | Yes | Reference to the associated User resource. |
| `device` | `hashref` | No | Reference to the associated Device resource. |
| `id` | `integer` | No | This resource's unique identifier. |
| `location` | `hashref` | Yes | Reference to the associated Location resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `modifiedBy` | `hashref` | Yes | Reference to the associated User resource. |
| `notes` | `string` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `hashref` | No | Reference to the associated Custody Status. |
| `transferMethod` | `hashref` | No | Reference to the associated Transfer Method. |
| `version` | `integer` | No | The number of times that this resource has been updated. |

### Operations

#### `load($reqmatch, $ctrl) -> DeviceCustodyDetailEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get` reads, and dies on error.

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

## DeviceCustodyListItem entity

```perl
my $device_custody_list_item = $client->DeviceCustodyListItem;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `string` | No | The date and time that the Custody change took place. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `hashref` | Yes | Reference to the associated User resource. |
| `custodian` | `hashref` | Yes | Reference to the associated User resource. |
| `device` | `hashref` | No | Reference to the associated Device resource. |
| `id` | `integer` | No | This resource's unique identifier. |
| `location` | `hashref` | Yes | Reference to the associated Location resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `modifiedBy` | `hashref` | Yes | Reference to the associated User resource. |
| `notes` | `string` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `hashref` | No | Reference to the associated Custody Status. |
| `transferMethod` | `hashref` | No | Reference to the associated Transfer Method. |
| `version` | `integer` | No | The number of times that this resource has been updated. |

### Operations

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref of entities, one per record (`data_get` reads each record), and dies on error.

```perl
my $results = $client->DeviceCustodyListItem->list({ 'device_type' => 'example', 'serial_number' => 'example' });
for my $device_custody_list_item (@$results) {
    print $device_custody_list_item->data_get->{id}, "\n";
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

Create a new `DeviceCustodyListItem` entity instance with the same options.

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
| `serialNumber` | `string` | Yes | The serial number of the Device that is shipped. |
| `success` | `boolean` | Yes | Indicates if the action succeeded. |
| `tamperLabel` | `string` | Yes | The code that is printed the tamper label of the Device that is shipped. |

### Operations

#### `create($reqdata, $ctrl) -> DeviceReceiveResultEntity`

Create a new entity with the given data. Returns the created entity and dies on error.

```perl
my $result = $client->DeviceReceiveResult->create({
    'serialNumber' => 'example_serialNumber',  # string
    'success' => 1,  # boolean
    'tamperLabel' => 'example_tamperLabel',  # string
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
| `appVersion` | `string` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildName` | `string` | No | The Device Builds's name. |
| `buildNumber` | `string` | No | The Build Number. |
| `configFile` | `string` | No | \? |
| `firmwareVersion` | `string` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `string` | No | A list of hardware versions that this Device Build covers. |
| `serialNumber` | `string` | Yes | The referenced Device's serial number. |
| `success` | `boolean` | Yes | Indicates if the RKI activation succeeded. |
| `whiteListingBinRanges` | `string` | No | \? |

### Operations

#### `create($reqdata, $ctrl) -> DeviceRkiActivateResultEntity`

Create a new entity with the given data. Returns the created entity and dies on error.

```perl
my $result = $client->DeviceRkiActivateResult->create({
    'serialNumber' => 'example_serialNumber',  # string
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
| `id` | `integer` | No | Unique identifier for this Device state. |
| `name` | `string` | No | Descriptive name for this Device state. |

### Operations

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref of entities, one per record (`data_get` reads each record), and dies on error.

```perl
my $results = $client->DeviceState->list;
for my $device_state (@$results) {
    print $device_state->data_get->{id}, "\n";
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
| `version` | `integer` | No | The number of times that this resource has been updated. |

### Operations

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref of entities, one per record (`data_get` reads each record), and dies on error.

```perl
my $results = $client->DeviceType->list;
for my $device_type (@$results) {
    print $device_type->data_get->{id}, "\n";
}
```

#### `load($reqmatch, $ctrl) -> DeviceTypeEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get` reads, and dies on error.

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
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `id` | `string` | No | unique idenifier |
| `isActive` | `boolean` | No | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `boolean` | No | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `string` | No | The cipher type that the key works with. |
| `modified` | `string` | No | Last modified timestamp in ISO 8601 format. |
| `name` | `string` | No | Key name. |
| `version` | `integer` | No | The number of times that this resource has been updated. |

### Operations

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref of entities, one per record (`data_get` reads each record), and dies on error.

```perl
my $results = $client->InjectKey->list;
for my $inject_key (@$results) {
    print $inject_key->data_get->{id}, "\n";
}
```

#### `load($reqmatch, $ctrl) -> InjectKeyEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get` reads, and dies on error.

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
| `id` | `integer` | No | This resource's unique identifier. |
| `name` | `string` | No | The KIF's name. |

### Operations

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref of entities, one per record (`data_get` reads each record), and dies on error.

```perl
my $results = $client->Kif->list;
for my $kif (@$results) {
    print $kif->data_get->{id}, "\n";
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
| `address1` | `string` | No | The Location's street address. |
| `address2` | `string` | No | The Location's street address. |
| `billingId` | `string` | No | \? |
| `city` | `string` | No | The Location's city. |
| `client` | `hashref` | No | Reference to the associated Client resource. |
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
| `version` | `integer` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create | remove |
| --- | --- | --- | --- | --- |
| `address1` | - | - | Yes | - |
| `address2` | - | - | - | - |
| `billingId` | - | - | - | - |
| `city` | - | - | Yes | - |
| `client` | - | - | - | - |
| `country` | - | - | Yes | - |
| `created` | - | - | - | - |
| `customReference` | - | - | - | - |
| `id` | - | - | - | - |
| `locationType` | - | - | Yes | - |
| `mailAddress1` | - | - | - | - |
| `mailAddress2` | - | - | - | - |
| `mailCity` | - | - | - | - |
| `mailCountry` | - | - | - | - |
| `mailPostalCode` | - | - | - | - |
| `mailStateProvince` | - | - | - | - |
| `modified` | - | - | - | - |
| `name` | - | - | Yes | - |
| `nameOfBusiness` | - | - | - | - |
| `notes` | - | - | - | - |
| `postalCode` | - | - | - | - |
| `stateProvince` | - | - | - | - |
| `uniqueId` | - | - | - | - |
| `version` | - | - | - | - |

### Operations

#### `create($reqdata, $ctrl) -> LocationEntity`

Create a new entity with the given data. Returns the created entity and dies on error.

```perl
my $result = $client->Location->create({
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref of entities, one per record (`data_get` reads each record), and dies on error.

```perl
my $results = $client->Location->list({ 'client' => 'example' });
for my $location (@$results) {
    print $location->data_get->{id}, "\n";
}
```

#### `load($reqmatch, $ctrl) -> LocationEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get` reads, and dies on error.

```perl
my $result = $client->Location->load({ 'id' => 'location_id' });
```

#### `remove($reqmatch, $ctrl) -> LocationEntity`

Remove the entity matching the given criteria. Returns the entity, marked as deleted, and dies on error.

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
| `billingId` | `string` | No | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `boolean` | No | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `hashref` | No | Reference to the associated User resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `id` | `string` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the Parter account is active or disabled. |
| `location` | `hashref` | Yes | Reference to the associated Location resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Partner's name. |
| `parent` | `hashref` | No | Reference to the associated Partner. |
| `partnerId` | `string` | No | The Partner's id. |
| `reference` | `string` | No | The Partner's reference string. |
| `verificationPhrase` | `string` | No | The verification phrase is a message that the Partner creates. |
| `version` | `integer` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `billingId` | - | - | - |
| `clientCanOrderEquipment` | - | - | - |
| `contact` | - | Yes | Yes |
| `created` | - | - | - |
| `id` | - | - | - |
| `isActive` | - | - | - |
| `location` | - | - | - |
| `modified` | - | - | - |
| `name` | - | - | Yes |
| `parent` | - | - | Yes |
| `partnerId` | - | - | - |
| `reference` | - | - | Yes |
| `verificationPhrase` | - | - | - |
| `version` | - | - | - |

### Operations

#### `create($reqdata, $ctrl) -> PartnerEntity`

Create a new entity with the given data. Returns the created entity and dies on error.

```perl
my $result = $client->Partner->create({
    'location' => {},  # hashref
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref of entities, one per record (`data_get` reads each record), and dies on error.

```perl
my $results = $client->Partner->list;
for my $partner (@$results) {
    print $partner->data_get->{id}, "\n";
}
```

#### `load($reqmatch, $ctrl) -> PartnerEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get` reads, and dies on error.

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
| `carrier` | `string` | No | The name of the courier. |
| `client` | `hashref` | No | Reference to the associated Client resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `string` | No | The date and time that a package is recieved. |
| `dateShipped` | `string` | No | The date and time that a package is shipped. |
| `dcKif` | `hashref` | No | Reference to the associated KIF resource. |
| `id` | `string` | No | This resource's unique identifier. |
| `items` | `arrayref` | No |  |
| `kif` | `hashref` | No | Reference to the associated KIF resource. |
| `location` | `hashref` | Yes | Reference to the associated Location resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `partner` | `hashref` | No | Reference to the associated Partner. |
| `shipmentType` | `string` | No | The type of shipment. |
| `tracking` | `string` | No | The courier's tracking number. |
| `version` | `integer` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `carrier` | - | - | Yes |
| `client` | - | - | Yes |
| `created` | - | - | - |
| `dateReceived` | - | - | - |
| `dateShipped` | - | - | Yes |
| `dcKif` | - | - | - |
| `id` | - | - | - |
| `items` | - | - | Yes |
| `kif` | - | - | Yes |
| `location` | - | - | - |
| `modified` | - | - | - |
| `partner` | - | - | Yes |
| `shipmentType` | - | - | - |
| `tracking` | - | - | Yes |
| `version` | - | - | - |

### Operations

#### `create($reqdata, $ctrl) -> ShipmentEntity`

Create a new entity with the given data. Returns the created entity and dies on error.

```perl
my $result = $client->Shipment->create({
    'location' => {},  # hashref
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref of entities, one per record (`data_get` reads each record), and dies on error.

```perl
my $results = $client->Shipment->list({ 'kif' => 'example' });
for my $shipment (@$results) {
    print $shipment->data_get->{id}, "\n";
}
```

#### `load($reqmatch, $ctrl) -> ShipmentEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get` reads, and dies on error.

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
| `devices` | `arrayref` | Yes | An array of Device ids to share with partner. |
| `sharePartnerFrom` | `hashref` | Yes | Reference to the associated Partner. |
| `success` | `boolean` | No | Indicates if the action was a success. |

### Operations

#### `create($reqdata, $ctrl) -> SuccessEntity`

Create a new entity with the given data. Returns the created entity and dies on error.

```perl
my $result = $client->Success->create({
    'share_partner_to' => 'example_share_partner_to',  # string
    'devices' => [],  # arrayref
    'sharePartnerFrom' => {},  # hashref
});
```

#### `remove($reqmatch, $ctrl) -> SuccessEntity`

Remove the entity matching the given criteria. Returns the entity, marked as deleted, and dies on error.

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
| `alternateKey` | `string` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `hashref` | No | Reference to the associated Client resource. |
| `clientRef` | `string` | No | Client Reference property that is included in the decrypt API call. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `decrypted` | `integer` | No | A Transcation can process muliple decryptions. |
| `device` | `hashref` | Yes | Reference to the associated Device resource. |
| `deviceName` | `string` | No | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `hashref` | No | Reference to the associated Partner. |
| `encrypted` | `integer` | No | A Transcation can process muliple encryptions. |
| `endDate` | `string` | No | Timestamp from the end of the transaction. |
| `errCode` | `string` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `string` | No | This resource's unique identifier. |
| `ipAddress` | `string` | No | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `boolean` | No | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `string` | No | The type of cipher used during decrytion. |
| `location` | `hashref` | Yes | Reference to the associated Location resource. |
| `messageId` | `string` | No | Message ID. |
| `method` | `string` | No | The decryption cypher/method. |
| `partner` | `hashref` | No | Reference to the associated Partner. |
| `reference` | `string` | No | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `string` | No | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `string` | No | Timestamp from the beginning of the transaction. |
| `success` | `boolean` | No | The success indicator. |
| `transactionSource` | `string` | No | The source of the Transaction. |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `alternateKey` | - | - | - |
| `client` | - | - | Yes |
| `clientRef` | - | - | - |
| `created` | - | - | - |
| `decrypted` | - | - | - |
| `device` | - | - | - |
| `deviceName` | - | - | - |
| `directPartner` | - | - | - |
| `encrypted` | - | - | - |
| `endDate` | - | - | - |
| `errCode` | - | - | - |
| `errMessage` | - | - | - |
| `id` | - | - | - |
| `ipAddress` | - | - | Yes |
| `isVirtual` | - | - | - |
| `keyType` | - | - | Yes |
| `location` | - | - | - |
| `messageId` | - | - | - |
| `method` | - | - | Yes |
| `partner` | - | - | Yes |
| `reference` | - | - | - |
| `serialNumber` | - | - | - |
| `startDate` | - | - | - |
| `success` | - | - | - |
| `transactionSource` | - | - | - |

### Operations

#### `create($reqdata, $ctrl) -> TransactionEntity`

Create a new entity with the given data. Returns the created entity and dies on error.

```perl
my $result = $client->Transaction->create({
    'device' => {},  # hashref
    'location' => {},  # hashref
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref of entities, one per record (`data_get` reads each record), and dies on error.

```perl
my $results = $client->Transaction->list;
for my $transaction (@$results) {
    print $transaction->data_get->{id}, "\n";
}
```

#### `load($reqmatch, $ctrl) -> TransactionEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get` reads, and dies on error.

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
| `address1` | `string` | No | The Location's street address. |
| `address2` | `string` | No | The Location's street address. |
| `alternateKey` | `string` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `string` | No | Date and time that the Device is due its next PCI Audit. |
| `billingId` | `string` | No | \? |
| `city` | `string` | No | The Location's city. |
| `client` | `hashref` | No | Reference to the associated Client resource. |
| `clientCanOrderEquipment` | `boolean` | No | This property indicates if the Partner is allowed to order Equipment. |
| `clientRef` | `string` | No | Client Reference property that is included in the decrypt API call. |
| `contact` | `hashref` | Yes | Reference to the associated User resource. |
| `country` | `hashref` | No | Reference to the associated Country. |
| `customReference` | `string` | No | A Partner specified reference for a location. |
| `dateShipped` | `string` | No | The date and time that a package is shipped. |
| `decrypted` | `integer` | No | A Transcation can process muliple decryptions. |
| `device` | `hashref` | No | Reference to the associated Device resource. |
| `deviceBuild` | `hashref` | No | Reference to the associated Device Build resource. |
| `deviceType` | `hashref` | No | Reference to the associated Device Type resource. |
| `directPartner` | `hashref` | No | Reference to the associated Partner. |
| `email` | `string` | Yes | The User's email address. |
| `encrypted` | `integer` | No | A Transcation can process muliple encryptions. |
| `endDate` | `string` | No | Timestamp from the end of the transaction. |
| `errCode` | `string` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | No | The error messge that is sent in response to a failed decrypt API call. |
| `firstName` | `string` | Yes | The User's name. |
| `id` | `string` | No | ID of newly created resource |
| `injectKey` | `hashref` | No | Reference to the associated Device resource. |
| `ipAddress` | `string` | No | The IP address of the http client that makes the decrypt API call. |
| `isActive` | `boolean` | Yes | This property indicates if the User account is active or disabled. |
| `items` | `arrayref` | No |  |
| `keyType` | `string` | No | The type of cipher used during decrytion. |
| `kif` | `hashref` | No | Reference to the associated KIF resource. |
| `lastName` | `string` | Yes | The User's Surname. |
| `location` | `hashref` | Yes | Reference to the associated Location resource. |
| `locationType` | `string` | No | The Location's clasification. |
| `mailAddress1` | `string` | No | The Location's street address. |
| `mailAddress2` | `string` | No | The Location's street address. |
| `mailCity` | `string` | No | The Location's city. |
| `mailCountry` | `string` | No | The Location's street address. |
| `mailPostalCode` | `string` | No | The Location's postal code. |
| `mailStateProvince` | `string` | No | The Location's street state or province. |
| `messageId` | `string` | No | Message ID. |
| `method` | `string` | No | The decryption cypher/method. |
| `mid` | `string` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `string` | No | The Client's name. |
| `nameOfBusiness` | `string` | No | The name of the business at this location. |
| `notes` | `string` | No | Arbitary note that can be attached to a Device entry. |
| `parent` | `hashref` | No | Reference to the associated Partner. |
| `partner` | `hashref` | No | Reference to the associated Partner. |
| `partnerId` | `string` | No | The Partner's id. |
| `phone` | `string` | Yes | The User's phone number without dashes, spaces, or brackets. |
| `postalCode` | `string` | No | The Location's postal code. |
| `reference` | `string` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `boolean` | No | If this property is set to '*true*' the newly created user will be sent a welcome email. |
| `serialNumber` | `string` | No | The Device's serial number. |
| `startDate` | `string` | No | Timestamp from the beginning of the transaction. |
| `stateProvince` | `string` | No | The Location's street state or province. |
| `success` | `boolean` | No | The success indicator. |
| `tracking` | `string` | No | The courier's tracking number. |
| `uniqueId` | `string` | No | Unique Identifier for the Location. |
| `userName` | `string` | Yes | The User's unique username. |
| `userRole` | `hashref` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `string` | No | The verification phrase is a message that the Partner creates. |
| `version` | `integer` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | list | create | update |
| --- | --- | --- | --- |
| `address1` | - | - | - |
| `address2` | - | - | - |
| `alternateKey` | - | - | - |
| `auditNextDate` | - | - | - |
| `billingId` | - | - | - |
| `city` | - | - | - |
| `client` | - | - | - |
| `clientCanOrderEquipment` | - | - | - |
| `clientRef` | - | - | - |
| `contact` | - | - | - |
| `country` | - | - | - |
| `customReference` | - | - | - |
| `dateShipped` | - | - | - |
| `decrypted` | - | - | - |
| `device` | - | - | - |
| `deviceBuild` | - | - | - |
| `deviceType` | - | - | - |
| `directPartner` | - | - | - |
| `email` | Yes | - | Yes |
| `encrypted` | - | - | - |
| `endDate` | - | - | - |
| `errCode` | - | - | - |
| `errMessage` | - | - | - |
| `firstName` | Yes | - | Yes |
| `id` | - | - | - |
| `injectKey` | - | - | - |
| `ipAddress` | - | - | - |
| `isActive` | Yes | - | Yes |
| `items` | - | - | - |
| `keyType` | - | - | - |
| `kif` | - | - | - |
| `lastName` | Yes | - | Yes |
| `location` | - | - | - |
| `locationType` | - | - | - |
| `mailAddress1` | - | - | - |
| `mailAddress2` | - | - | - |
| `mailCity` | - | - | - |
| `mailCountry` | - | - | - |
| `mailPostalCode` | - | - | - |
| `mailStateProvince` | - | - | - |
| `messageId` | - | - | - |
| `method` | - | - | - |
| `mid` | - | - | - |
| `name` | - | - | - |
| `nameOfBusiness` | - | - | - |
| `notes` | - | - | - |
| `parent` | - | - | - |
| `partner` | - | - | - |
| `partnerId` | - | - | - |
| `phone` | Yes | - | Yes |
| `postalCode` | - | - | - |
| `reference` | - | - | - |
| `sendWelcomeEmail` | - | - | - |
| `serialNumber` | - | - | - |
| `startDate` | - | - | - |
| `stateProvince` | - | - | - |
| `success` | - | - | - |
| `tracking` | - | - | - |
| `uniqueId` | - | - | - |
| `userName` | Yes | - | Yes |
| `userRole` | Yes | - | Yes |
| `verificationPhrase` | - | - | - |
| `version` | - | - | - |

### Operations

#### `create($reqdata, $ctrl) -> UpdateResultEntity`

Create a new entity with the given data. Returns the created entity and dies on error.

```perl
my $result = $client->UpdateResult->create({
    'contact' => {},  # hashref
    'email' => 'example_email',  # string
    'firstName' => 'example_firstName',  # string
    'isActive' => 1,  # boolean
    'lastName' => 'example_lastName',  # string
    'location' => {},  # hashref
    'phone' => 'example_phone',  # string
    'userName' => 'example_userName',  # string
    'userRole' => {},  # hashref
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref of entities, one per record (`data_get` reads each record), and dies on error.

```perl
my $results = $client->UpdateResult->list;
for my $update_result (@$results) {
    print $update_result->data_get->{id}, "\n";
}
```

#### `update($reqdata, $ctrl) -> UpdateResultEntity`

Update an existing entity. The data must include the entity `id`. Returns the updated entity and dies on error.

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
| `client` | `hashref` | No | Reference to the associated Client resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `email` | `string` | No | The User's email address. |
| `firstName` | `string` | No | The User's name. |
| `id` | `string` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the User account is active or disabled. |
| `kif` | `hashref` | No | Reference to the associated KIF resource. |
| `lastName` | `string` | No | The User's Surname. |
| `modified` | `string` | No | Last modified timestamp. |
| `partner` | `hashref` | No | Reference to the associated Partner. |
| `phone` | `string` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `string` | No | The User's unique username. |
| `userRole` | `hashref` | No | Reference to the associated User Role. |
| `version` | `integer` | No | The number of times that this resource has been updated. |

### Operations

#### `load($reqmatch, $ctrl) -> UserEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get` reads, and dies on error.

```perl
my $result = $client->User->load({ 'id' => 'user_id' });
```

#### `remove($reqmatch, $ctrl) -> UserEntity`

Remove the entity matching the given criteria. Returns the entity, marked as deleted, and dies on error.

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

## VirtualDevice entity

```perl
my $virtual_device = $client->VirtualDevice;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `arrayref` | No | List of Devices. |
| `id` | `string` | No |  |
| `total` | `integer` | No | Total number of Devices available (not the number of Users in the response). |

### Operations

#### `load($reqmatch, $ctrl) -> VirtualDeviceEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get` reads, and dies on error.

```perl
my $result = $client->VirtualDevice->load({ 'id' => 'virtual_device_id' });
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

Create a new `VirtualDevice` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `audit` | 0.0.1 | Audit trail |
| `clienttrack` | 0.0.1 | Client tracking |
| `debug` | 0.0.1 | Debug capture |
| `idempotency` | 0.0.1 | Idempotency |
| `log` | 0.0.1 | Logging |
| `metrics` | 0.0.1 | Metrics |
| `paging` | 0.0.1 | Paging |
| `ratelimit` | 0.0.1 | Rate limiting |
| `retry` | 0.0.1 | Retry |
| `telemetry` | 0.0.1 | Telemetry |
| `test` | 0.0.1 | Test transport |
| `timeout` | 0.0.1 | Timeout |


Features are activated via the `feature` option:

```perl
my $client = BluefinDecryptxP2peSDK->new({
    'feature' => {
        'audit' => { 'active' => 1 },
        'clienttrack' => { 'active' => 1 },
        'debug' => { 'active' => 1 },
        'idempotency' => { 'active' => 1 },
        'log' => { 'active' => 1 },
        'metrics' => { 'active' => 1 },
        'paging' => { 'active' => 1 },
        'ratelimit' => { 'active' => 1 },
        'retry' => { 'active' => 1 },
        'telemetry' => { 'active' => 1 },
        'test' => { 'active' => 1 },
        'timeout' => { 'active' => 1 },
    },
});
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

`audit`, `clienttrack`, `debug`, `idempotency`, `log`, `metrics`, `paging`, `telemetry`, `test` attach to pipeline hooks
rather than the transport, so their order does not affect what they observe.

#### `audit`

Audit trail.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

| Option | Type |
|---|---|
| `now` | function |
| `sink` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.audit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `clienttrack`

Client tracking.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

| Option | Type |
|---|---|
| `clientName` | string |
| `headers` | map |
| `idgen` | function |
| `sessionId` | string |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.clienttrack.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `debug`

Debug capture.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `max` | `100` |
| `redact` | `['authorization', 'cookie', 'set-cookie', 'api-key', 'apikey', 'x-api-key', 'idempotency-key']` |

| Option | Type |
|---|---|
| `now` | function |
| `onEntry` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.debug.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `idempotency`

Idempotency.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

| Option | Type |
|---|---|
| `keygen` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.idempotency.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `log`

Logging.

**Configuration**

| Option | Default |
|---|---|
| `active` | `true` |

| Option | Type |
|---|---|
| `level` | string |
| `logger` | any |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.log.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `metrics`

Metrics.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `now` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.metrics.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `paging`

Paging.

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

| Option | Type |
|---|---|
| `limit` | number |
| `ops` | list |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.paging.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `ratelimit`

Rate limiting.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

| Option | Type |
|---|---|
| `now` | function |
| `sleep` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.ratelimit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `retry`

Retry.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

| Option | Type |
|---|---|
| `jitter` | boolean |
| `sleep` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.retry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `telemetry`

Telemetry.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `exporter` | function |
| `headers` | map |
| `idgen` | function |
| `now` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.telemetry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `test`

Test transport.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `entity` | map |
| `net` | map |

These take no default: the feature behaves one way when you supply them and
another when you do not.

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

Timeout.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

| Option | Type |
|---|---|
| `clearTimer` | function |
| `now` | function |
| `setTimer` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.timeout.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.


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
| `complete_date` | `string` | No |  |
| `created` | `string` | No |  |
| `device` | `hashref` | No |  |
| `id` | `string` | No |  |
| `name` | `string` | No |  |
| `note` | `string` | No |  |

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
| `direct_partner` | `hashref` | No |  |
| `id` | `string` | No |  |
| `is_active` | `boolean` | No |  |
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
| `activated_by` | `hashref` | Yes |  |
| `activation_date` | `string` | No |  |
| `alternate_key` | `string` | No |  |
| `audit_next_date` | `string` | No |  |
| `audit_notification_date` | `string` | No |  |
| `client` | `hashref` | No |  |
| `created` | `string` | No |  |
| `created_by` | `hashref` | Yes |  |
| `device_build` | `hashref` | No |  |
| `device_state` | `hashref` | No |  |
| `device_type` | `hashref` | No |  |
| `error_counter` | `integer` | No |  |
| `error_last_date` | `string` | No |  |
| `id` | `string` | No |  |
| `initialized_by` | `hashref` | Yes |  |
| `initialized_date` | `string` | No |  |
| `inject_key` | `hashref` | No |  |
| `is_virtual` | `boolean` | No |  |
| `kif` | `hashref` | No |  |
| `last_activity_date` | `string` | No |  |
| `location` | `hashref` | Yes |  |
| `modified` | `string` | No |  |
| `modified_by` | `hashref` | Yes |  |
| `name` | `string` | No |  |
| `note` | `string` | No |  |
| `partner` | `hashref` | No |  |
| `serial_number` | `string` | No |  |
| `version` | `integer` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->Device->create({
    'activated_by' => {},  # hashref
    'created_by' => {},  # hashref
    'initialized_by' => {},  # hashref
    'location' => {},  # hashref
    'modified_by' => {},  # hashref
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
| `app_version` | `string` | No |  |
| `build_number` | `string` | No |  |
| `config_file_name` | `string` | No |  |
| `created` | `string` | No |  |
| `device_type` | `string` | No |  |
| `firmware_version` | `string` | No |  |
| `hardware_version` | `string` | No |  |
| `id` | `integer` | No |  |
| `is_active` | `boolean` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `note` | `string` | No |  |
| `version` | `integer` | No |  |
| `white_listing_bin_range` | `string` | No |  |
| `white_listing_used` | `boolean` | No |  |

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
| `complete_date` | `string` | No |  |
| `created` | `string` | No |  |
| `created_by` | `hashref` | Yes |  |
| `custodian` | `hashref` | Yes |  |
| `device` | `hashref` | No |  |
| `id` | `integer` | No |  |
| `location` | `hashref` | Yes |  |
| `modified` | `string` | No |  |
| `modified_by` | `hashref` | Yes |  |
| `note` | `string` | No |  |
| `status` | `hashref` | No |  |
| `transfer_method` | `hashref` | No |  |
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
| `complete_date` | `string` | No |  |
| `created` | `string` | No |  |
| `created_by` | `hashref` | Yes |  |
| `custodian` | `hashref` | Yes |  |
| `device` | `hashref` | No |  |
| `id` | `integer` | No |  |
| `location` | `hashref` | Yes |  |
| `modified` | `string` | No |  |
| `modified_by` | `hashref` | Yes |  |
| `note` | `string` | No |  |
| `status` | `hashref` | No |  |
| `transfer_method` | `hashref` | No |  |
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
| `is_active` | `boolean` | No |  |
| `is_p2_pe` | `boolean` | No |  |
| `key_type` | `string` | No |  |
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
| `billing_id` | `string` | No |  |
| `client_can_order_equipment` | `boolean` | No |  |
| `contact` | `hashref` | No |  |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `boolean` | No |  |
| `location` | `hashref` | Yes |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `hashref` | No |  |
| `partner_id` | `string` | No |  |
| `reference` | `string` | No |  |
| `verification_phrase` | `string` | No |  |
| `version` | `integer` | No |  |

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
| `date_received` | `string` | No |  |
| `date_shipped` | `string` | No |  |
| `dc_kif` | `hashref` | No |  |
| `id` | `string` | No |  |
| `item` | `arrayref` | No |  |
| `kif` | `hashref` | No |  |
| `modified` | `string` | No |  |
| `partner` | `hashref` | No |  |
| `shipment_type` | `string` | No |  |
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
| `alternate_key` | `string` | No |  |
| `client` | `hashref` | No |  |
| `client_ref` | `string` | No |  |
| `created` | `string` | No |  |
| `decrypted` | `integer` | No |  |
| `device_name` | `string` | No |  |
| `direct_partner` | `hashref` | No |  |
| `encrypted` | `integer` | No |  |
| `end_date` | `string` | No |  |
| `err_code` | `string` | No |  |
| `err_message` | `string` | No |  |
| `id` | `string` | No |  |
| `ip_address` | `string` | No |  |
| `is_virtual` | `boolean` | No |  |
| `key_type` | `string` | No |  |
| `location` | `hashref` | Yes |  |
| `message_id` | `string` | No |  |
| `method` | `string` | No |  |
| `partner` | `hashref` | No |  |
| `reference` | `string` | No |  |
| `serial_number` | `string` | No |  |
| `start_date` | `string` | No |  |
| `success` | `boolean` | No |  |
| `transaction_source` | `string` | No |  |

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
| `first_name` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `boolean` | No |  |
| `kif` | `hashref` | No |  |
| `last_name` | `string` | No |  |
| `partner` | `hashref` | No |  |
| `phone` | `string` | No |  |
| `user_name` | `string` | No |  |
| `user_role` | `hashref` | No |  |
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
| `first_name` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `boolean` | No |  |
| `kif` | `hashref` | No |  |
| `last_name` | `string` | No |  |
| `modified` | `string` | No |  |
| `partner` | `hashref` | No |  |
| `phone` | `string` | No |  |
| `user_name` | `string` | No |  |
| `user_role` | `hashref` | No |  |
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


# BluefinDecryptxP2pe Python SDK Reference

Complete API reference for the BluefinDecryptxP2pe Python SDK.


## BluefinDecryptxP2peSDK

### Constructor

```python
from bluefindecryptxp2pe_sdk import BluefinDecryptxP2peSDK

client = BluefinDecryptxP2peSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["apikey"]` | `str` | API key for authentication. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinDecryptxP2peSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = BluefinDecryptxP2peSDK.test()
```


### Instance Methods

#### `Attestation(data=None)`

Create a new `AttestationEntity` instance. Pass `None` for no initial data.

#### `Client(data=None)`

Create a new `ClientEntity` instance. Pass `None` for no initial data.

#### `CreateResult(data=None)`

Create a new `CreateResultEntity` instance. Pass `None` for no initial data.

#### `Decryption(data=None)`

Create a new `DecryptionEntity` instance. Pass `None` for no initial data.

#### `Device(data=None)`

Create a new `DeviceEntity` instance. Pass `None` for no initial data.

#### `DeviceBuild(data=None)`

Create a new `DeviceBuildEntity` instance. Pass `None` for no initial data.

#### `DeviceCustodyDetail(data=None)`

Create a new `DeviceCustodyDetailEntity` instance. Pass `None` for no initial data.

#### `DeviceCustodyList(data=None)`

Create a new `DeviceCustodyListEntity` instance. Pass `None` for no initial data.

#### `DeviceList(data=None)`

Create a new `DeviceListEntity` instance. Pass `None` for no initial data.

#### `DeviceReceiveResult(data=None)`

Create a new `DeviceReceiveResultEntity` instance. Pass `None` for no initial data.

#### `DeviceRkiActivateResult(data=None)`

Create a new `DeviceRkiActivateResultEntity` instance. Pass `None` for no initial data.

#### `DeviceState(data=None)`

Create a new `DeviceStateEntity` instance. Pass `None` for no initial data.

#### `DeviceType(data=None)`

Create a new `DeviceTypeEntity` instance. Pass `None` for no initial data.

#### `InjectKey(data=None)`

Create a new `InjectKeyEntity` instance. Pass `None` for no initial data.

#### `Kif(data=None)`

Create a new `KifEntity` instance. Pass `None` for no initial data.

#### `Location(data=None)`

Create a new `LocationEntity` instance. Pass `None` for no initial data.

#### `Partner(data=None)`

Create a new `PartnerEntity` instance. Pass `None` for no initial data.

#### `Shipment(data=None)`

Create a new `ShipmentEntity` instance. Pass `None` for no initial data.

#### `Success(data=None)`

Create a new `SuccessEntity` instance. Pass `None` for no initial data.

#### `Transaction(data=None)`

Create a new `TransactionEntity` instance. Pass `None` for no initial data.

#### `UpdateResult(data=None)`

Create a new `UpdateResultEntity` instance. Pass `None` for no initial data.

#### `User(data=None)`

Create a new `UserEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## AttestationEntity

```python
attestation = client.Attestation()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `dict` | No |  |
| `completeDate` | `str` | No |  |
| `created` | `str` | No |  |
| `device` | `dict` | No |  |
| `id` | `str` | No |  |
| `name` | `str` | No |  |
| `notes` | `str` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Attestation().create({
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Attestation().list()
for attestation in results:
    print(attestation)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Attestation().load({"id": "attestation_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AttestationEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## ClientEntity

```python
client_ = client.Client()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `dict` | No |  |
| `created` | `str` | No |  |
| `directPartner` | `dict` | No |  |
| `id` | `str` | No |  |
| `isActive` | `bool` | No |  |
| `location` | `dict` | Yes |  |
| `mid` | `str` | No |  |
| `modified` | `str` | No |  |
| `name` | `str` | No |  |
| `partner` | `dict` | No |  |
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

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Client().create({
    "location": {},  # dict
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Client().list()
for client_ in results:
    print(client_)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Client().load({"id": "client_id"})
```

#### `remove(reqmatch, ctrl=None) -> dict`

Remove the entity matching the given criteria. Raises on error.

```python
result = client.Client().remove({"id": "client_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ClientEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## CreateResultEntity

```python
create_result = client.CreateResult()
```

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.CreateResult().create({
    "device_type": "example_device_type",  # str
    "serial_number": "example_serial_number",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CreateResultEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## DecryptionEntity

```python
decryption = client.Decryption()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Decryption().create({
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DecryptionEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## DeviceEntity

```python
device = client.Device()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activatedBy` | `dict` | Yes |  |
| `activationDate` | `str` | No |  |
| `alternateKey` | `str` | No |  |
| `auditNextDate` | `str` | No |  |
| `auditNotificationDate` | `str` | No |  |
| `client` | `dict` | No |  |
| `created` | `str` | No |  |
| `createdBy` | `dict` | Yes |  |
| `deviceBuild` | `dict` | No |  |
| `deviceState` | `dict` | No |  |
| `deviceType` | `dict` | No |  |
| `errorCounter` | `int` | No |  |
| `errorLastDate` | `str` | No |  |
| `id` | `str` | No |  |
| `initializedBy` | `dict` | Yes |  |
| `initializedDate` | `str` | No |  |
| `injectKey` | `dict` | No |  |
| `isVirtual` | `bool` | No |  |
| `kif` | `dict` | No |  |
| `lastActivityDate` | `str` | No |  |
| `location` | `dict` | Yes |  |
| `modified` | `str` | No |  |
| `modifiedBy` | `dict` | Yes |  |
| `name` | `str` | No |  |
| `notes` | `str` | No |  |
| `partner` | `dict` | No |  |
| `serialNumber` | `str` | No |  |
| `version` | `int` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Device().create({
    "activatedBy": {},  # dict
    "createdBy": {},  # dict
    "initializedBy": {},  # dict
    "location": {},  # dict
    "modifiedBy": {},  # dict
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Device().list()
for device in results:
    print(device)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Device().load({"id": "device_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## DeviceBuildEntity

```python
device_build = client.DeviceBuild()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appVersion` | `str` | No |  |
| `buildNumber` | `str` | No |  |
| `configFileName` | `str` | No |  |
| `created` | `str` | No |  |
| `deviceType` | `str` | No |  |
| `firmwareVersion` | `str` | No |  |
| `hardwareVersion` | `str` | No |  |
| `id` | `int` | No |  |
| `isActive` | `bool` | No |  |
| `modified` | `str` | No |  |
| `name` | `str` | No |  |
| `notes` | `str` | No |  |
| `version` | `int` | No |  |
| `whiteListingBinRanges` | `str` | No |  |
| `whiteListingUsed` | `bool` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.DeviceBuild().list()
for device_build in results:
    print(device_build)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.DeviceBuild().load({"id": "device_build_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceBuildEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## DeviceCustodyDetailEntity

```python
device_custody_detail = client.DeviceCustodyDetail()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `str` | No |  |
| `created` | `str` | No |  |
| `createdBy` | `dict` | Yes |  |
| `custodian` | `dict` | Yes |  |
| `device` | `dict` | No |  |
| `id` | `int` | No |  |
| `location` | `dict` | Yes |  |
| `modified` | `str` | No |  |
| `modifiedBy` | `dict` | Yes |  |
| `notes` | `str` | No |  |
| `status` | `dict` | No |  |
| `transferMethod` | `dict` | No |  |
| `version` | `int` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.DeviceCustodyDetail().load({"id": "device_custody_detail_id", "device_type": "device_type", "serial_number": "serial_number"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceCustodyDetailEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## DeviceCustodyListEntity

```python
device_custody_list = client.DeviceCustodyList()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `str` | No |  |
| `created` | `str` | No |  |
| `createdBy` | `dict` | Yes |  |
| `custodian` | `dict` | Yes |  |
| `device` | `dict` | No |  |
| `id` | `int` | No |  |
| `location` | `dict` | Yes |  |
| `modified` | `str` | No |  |
| `modifiedBy` | `dict` | Yes |  |
| `notes` | `str` | No |  |
| `status` | `dict` | No |  |
| `transferMethod` | `dict` | No |  |
| `version` | `int` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.DeviceCustodyList().list({"device_type": "example", "serial_number": "example"})
for device_custody_list in results:
    print(device_custody_list)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceCustodyListEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## DeviceListEntity

```python
device_list = client.DeviceList()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `list` | No |  |
| `total` | `int` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.DeviceList().load({"share_partner_to": "share_partner_to"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceListEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## DeviceReceiveResultEntity

```python
device_receive_result = client.DeviceReceiveResult()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.DeviceReceiveResult().create({
    "success": True,  # bool
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceReceiveResultEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## DeviceRkiActivateResultEntity

```python
device_rki_activate_result = client.DeviceRkiActivateResult()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.DeviceRkiActivateResult().create({
    "success": True,  # bool
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceRkiActivateResultEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## DeviceStateEntity

```python
device_state = client.DeviceState()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int` | No |  |
| `name` | `str` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.DeviceState().list()
for device_state in results:
    print(device_state)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceStateEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## DeviceTypeEntity

```python
device_type = client.DeviceType()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `str` | No |  |
| `deviceTypeMode` | `str` | No |  |
| `hardwareVersion` | `str` | No |  |
| `id` | `str` | No |  |
| `isActive` | `bool` | No |  |
| `manufacturer` | `str` | No |  |
| `model` | `str` | No |  |
| `modified` | `str` | No |  |
| `name` | `str` | No |  |
| `photoUrl` | `str` | No |  |
| `productName` | `str` | No |  |
| `version` | `int` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.DeviceType().list()
for device_type in results:
    print(device_type)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.DeviceType().load({"id": "device_type_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceTypeEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## InjectKeyEntity

```python
inject_key = client.InjectKey()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `str` | No |  |
| `id` | `str` | No |  |
| `isActive` | `bool` | No |  |
| `isP2PE` | `bool` | No |  |
| `keyType` | `str` | No |  |
| `modified` | `str` | No |  |
| `name` | `str` | No |  |
| `version` | `int` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.InjectKey().list()
for inject_key in results:
    print(inject_key)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.InjectKey().load({"id": "inject_key_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `InjectKeyEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## KifEntity

```python
kif = client.Kif()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int` | No |  |
| `name` | `str` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Kif().list()
for kif in results:
    print(kif)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `KifEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## LocationEntity

```python
location = client.Location()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address1` | `str` | No |  |
| `address2` | `str` | No |  |
| `billingId` | `str` | No |  |
| `city` | `str` | No |  |
| `country` | `str` | No |  |
| `created` | `str` | No |  |
| `customReference` | `str` | No |  |
| `id` | `str` | No |  |
| `locationType` | `str` | No |  |
| `mailAddress1` | `str` | No |  |
| `mailAddress2` | `str` | No |  |
| `mailCity` | `str` | No |  |
| `mailCountry` | `str` | No |  |
| `mailPostalCode` | `str` | No |  |
| `mailStateProvince` | `str` | No |  |
| `modified` | `str` | No |  |
| `name` | `str` | No |  |
| `nameOfBusiness` | `str` | No |  |
| `notes` | `str` | No |  |
| `postalCode` | `str` | No |  |
| `stateProvince` | `str` | No |  |
| `uniqueId` | `str` | No |  |
| `version` | `int` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Location().create({
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Location().list()
for location in results:
    print(location)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Location().load({"id": "location_id"})
```

#### `remove(reqmatch, ctrl=None) -> dict`

Remove the entity matching the given criteria. Raises on error.

```python
result = client.Location().remove({"id": "location_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `LocationEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## PartnerEntity

```python
partner = client.Partner()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `str` | No |  |
| `clientCanOrderEquipment` | `bool` | No |  |
| `contact` | `dict` | No |  |
| `created` | `str` | No |  |
| `id` | `str` | No |  |
| `isActive` | `bool` | No |  |
| `location` | `dict` | Yes |  |
| `modified` | `str` | No |  |
| `name` | `str` | No |  |
| `parent` | `dict` | No |  |
| `partnerId` | `str` | No |  |
| `reference` | `str` | No |  |
| `verificationPhrase` | `str` | No |  |
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

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Partner().create({
    "location": {},  # dict
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Partner().list()
for partner in results:
    print(partner)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Partner().load({"id": "partner_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PartnerEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## ShipmentEntity

```python
shipment = client.Shipment()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `str` | No |  |
| `client` | `dict` | No |  |
| `created` | `str` | No |  |
| `dateReceived` | `str` | No |  |
| `dateShipped` | `str` | No |  |
| `dcKif` | `dict` | No |  |
| `id` | `str` | No |  |
| `items` | `list` | No |  |
| `kif` | `dict` | No |  |
| `modified` | `str` | No |  |
| `partner` | `dict` | No |  |
| `shipmentType` | `str` | No |  |
| `tracking` | `str` | No |  |
| `version` | `int` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Shipment().create({
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Shipment().list()
for shipment in results:
    print(shipment)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Shipment().load({"id": "shipment_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ShipmentEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## SuccessEntity

```python
success = client.Success()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Success().create({
    "share_partner_to": "example_share_partner_to",  # str
})
```

#### `remove(reqmatch, ctrl=None) -> dict`

Remove the entity matching the given criteria. Raises on error.

```python
result = client.Success().remove({"share_partner_to": "share_partner_to"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SuccessEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## TransactionEntity

```python
transaction = client.Transaction()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternateKey` | `str` | No |  |
| `client` | `dict` | No |  |
| `clientRef` | `str` | No |  |
| `created` | `str` | No |  |
| `decrypted` | `int` | No |  |
| `deviceName` | `str` | No |  |
| `directPartner` | `dict` | No |  |
| `encrypted` | `int` | No |  |
| `endDate` | `str` | No |  |
| `errCode` | `str` | No |  |
| `errMessage` | `str` | No |  |
| `id` | `str` | No |  |
| `ipAddress` | `str` | No |  |
| `isVirtual` | `bool` | No |  |
| `keyType` | `str` | No |  |
| `location` | `dict` | Yes |  |
| `messageId` | `str` | No |  |
| `method` | `str` | No |  |
| `partner` | `dict` | No |  |
| `reference` | `str` | No |  |
| `serialNumber` | `str` | No |  |
| `startDate` | `str` | No |  |
| `success` | `bool` | No |  |
| `transactionSource` | `str` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Transaction().create({
    "location": {},  # dict
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Transaction().list()
for transaction in results:
    print(transaction)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Transaction().load({"id": "transaction_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TransactionEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## UpdateResultEntity

```python
update_result = client.UpdateResult()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `dict` | No |  |
| `email` | `str` | No |  |
| `firstName` | `str` | No |  |
| `id` | `str` | No |  |
| `isActive` | `bool` | No |  |
| `kif` | `dict` | No |  |
| `lastName` | `str` | No |  |
| `partner` | `dict` | No |  |
| `phone` | `str` | No |  |
| `userName` | `str` | No |  |
| `userRole` | `dict` | No |  |
| `version` | `int` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.UpdateResult().create({
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.UpdateResult().list()
for update_result in results:
    print(update_result)
```

#### `update(reqdata, ctrl=None) -> dict`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```python
result = client.UpdateResult().update({
    "id": "id",
    # Fields to update
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `UpdateResultEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## UserEntity

```python
user = client.User()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `dict` | No |  |
| `created` | `str` | No |  |
| `email` | `str` | No |  |
| `firstName` | `str` | No |  |
| `id` | `str` | No |  |
| `isActive` | `bool` | No |  |
| `kif` | `dict` | No |  |
| `lastName` | `str` | No |  |
| `modified` | `str` | No |  |
| `partner` | `dict` | No |  |
| `phone` | `str` | No |  |
| `userName` | `str` | No |  |
| `userRole` | `dict` | No |  |
| `version` | `int` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.User().load({"id": "user_id"})
```

#### `remove(reqmatch, ctrl=None) -> dict`

Remove the entity matching the given criteria. Raises on error.

```python
result = client.User().remove({"id": "user_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `UserEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```python
client = BluefinDecryptxP2peSDK({
    "feature": {
        "test": {"active": True},
    },
})
```


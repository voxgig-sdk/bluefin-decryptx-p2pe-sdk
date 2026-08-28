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
| `client` | `dict` | No | Reference to the associated Client resource. |
| `completeDate` | `str` | No | The date and time that the Attestation took place. |
| `created` | `str` | No | Creation timestamp in ISO 8601 format. |
| `device` | `dict` | No | Reference to the associated Device resource. |
| `id` | `str` | No | This resource's unique identifier. |
| `name` | `str` | No | Text describing the attestation. |
| `notes` | `str` | No | Free form field that allows the Client associate notes with the Attestation. |

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
results = client.Attestation().list({"client": "example"})
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
| `contact` | `dict` | No | Reference to the associated User resource. |
| `created` | `str` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `dict` | No | Reference to the associated Partner. |
| `id` | `str` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Client account is active or disabled. |
| `location` | `dict` | Yes | Reference to the associated Location resource. |
| `mid` | `str` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `str` | No | Last modified timestamp. |
| `name` | `str` | No | The Client's name. |
| `partner` | `dict` | No | Reference to the Client's root Partner. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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
results = client.Client().list({"partner": "example"})
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
| `success` | `bool` | No | true if the payload decryption was successful. |

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
| `activatedBy` | `dict` | Yes | Reference to the associated User resource. |
| `activationDate` | `str` | No | Timestamp from when the Device was activated. |
| `alternateKey` | `str` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `str` | No | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `str` | No | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `dict` | No | Reference to the associated Client resource. |
| `created` | `str` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `dict` | Yes | Reference to the associated User resource. |
| `deviceBuild` | `dict` | No | Reference to the associated Device Build resource. |
| `deviceState` | `dict` | No | Reference to the associated Device State resource. |
| `deviceType` | `dict` | No | Reference to the associated Device Type resource. |
| `errorCounter` | `int` | No | The number times the Device has been in error. |
| `errorLastDate` | `str` | No | Timestamp from the last time that the Device had an error. |
| `id` | `str` | No | The Device's unique identifier. |
| `initializedBy` | `dict` | Yes | Reference to the associated User resource. |
| `initializedDate` | `str` | No | Timestamp from when the Device was initialized. |
| `injectKey` | `dict` | No | Reference to the associated Device resource. |
| `isVirtual` | `bool` | No | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `dict` | No | Reference to the associated KIF resource. |
| `lastActivityDate` | `str` | No | Timestamp from the last time that the Device was used. |
| `location` | `dict` | Yes | Reference to the associated Location resource. |
| `modified` | `str` | No | Last modified timestamp. |
| `modifiedBy` | `dict` | Yes | Reference to the associated User resource. |
| `name` | `str` | No | The Device's name. |
| `notes` | `str` | No | Arbitary note that can be attached to a Device entry. |
| `partner` | `dict` | No | Reference to the associated Partner. |
| `serialNumber` | `str` | No | The Device's serial number. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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
| `appVersion` | `str` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `str` | No | The Build Number. |
| `configFileName` | `str` | No | The name of the configuration file that is uploaded to the device. |
| `created` | `str` | No | Creation timestamp in ISO 8601 format. |
| `deviceType` | `str` | No | The Device Type Name. |
| `firmwareVersion` | `str` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `str` | No | A list of hardware versions that this Device Build covers. |
| `id` | `int` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `str` | No | Last modified timestamp. |
| `name` | `str` | No | The Device Builds's name. |
| `notes` | `str` | No | Notes attached to the device build by Bluefin CISO. |
| `version` | `int` | No | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `str` | No | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `bool` | No | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

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
| `completeDate` | `str` | No | The date and time that the Custody change took place. |
| `created` | `str` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `dict` | Yes | Reference to the associated User resource. |
| `custodian` | `dict` | Yes | Reference to the associated User resource. |
| `device` | `dict` | No | Reference to the associated Device resource. |
| `id` | `int` | No | This resource's unique identifier. |
| `location` | `dict` | Yes | Reference to the associated Location resource. |
| `modified` | `str` | No | Last modified timestamp. |
| `modifiedBy` | `dict` | Yes | Reference to the associated User resource. |
| `notes` | `str` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `dict` | No | Reference to the associated Custody Status. |
| `transferMethod` | `dict` | No | Reference to the associated Transfer Method. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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
| `completeDate` | `str` | No | The date and time that the Custody change took place. |
| `created` | `str` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `dict` | Yes | Reference to the associated User resource. |
| `custodian` | `dict` | Yes | Reference to the associated User resource. |
| `device` | `dict` | No | Reference to the associated Device resource. |
| `id` | `int` | No | This resource's unique identifier. |
| `location` | `dict` | Yes | Reference to the associated Location resource. |
| `modified` | `str` | No | Last modified timestamp. |
| `modifiedBy` | `dict` | Yes | Reference to the associated User resource. |
| `notes` | `str` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `dict` | No | Reference to the associated Custody Status. |
| `transferMethod` | `dict` | No | Reference to the associated Transfer Method. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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
| `data` | `list` | No | List of Devices. |
| `total` | `int` | No | Total number of Devices available (not the number of Users in the response). |

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
| `success` | `bool` | Yes | Indicates if the action succeeded. |

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
| `success` | `bool` | Yes | Indicates if the RKI activation succeeded. |

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
| `id` | `int` | No | Unique identifier for this Device state. |
| `name` | `str` | No | Descriptive name for this Device state. |

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
| `created` | `str` | No | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `str` | No | The Device type. |
| `hardwareVersion` | `str` | No | The Device hardware version. |
| `id` | `str` | No | Unique idenifier. |
| `isActive` | `bool` | No | This property indicates if the DeviceType is active. |
| `manufacturer` | `str` | No | The Device manufacturer. |
| `model` | `str` | No | The Device model. |
| `modified` | `str` | No | Last modified timestamp. |
| `name` | `str` | No | The DeviceType name. |
| `photoUrl` | `str` | No |  |
| `productName` | `str` | No | The Device name. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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
| `created` | `str` | No | Creation timestamp in ISO 8601 format. |
| `id` | `str` | No | unique idenifier |
| `isActive` | `bool` | No | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `bool` | No | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `str` | No | The cipher type that the key works with. |
| `modified` | `str` | No | Last modified timestamp in ISO 8601 format. |
| `name` | `str` | No | Key name. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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
| `id` | `int` | No | This resource's unique identifier. |
| `name` | `str` | No | The KIF's name. |

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
| `address1` | `str` | No | The Location's street address. |
| `address2` | `str` | No | The Location's street address. |
| `billingId` | `str` | No | \? |
| `city` | `str` | No | The Location's city. |
| `country` | `str` | No | The Location's country. |
| `created` | `str` | No | Creation timestamp in ISO 8601 format. |
| `customReference` | `str` | No | A Partner specified reference for a location. |
| `id` | `str` | No | This resource's unique identifier. |
| `locationType` | `str` | No | The Location's clasification. |
| `mailAddress1` | `str` | No | The Location's street address. |
| `mailAddress2` | `str` | No | The Location's street address. |
| `mailCity` | `str` | No | The Location's city. |
| `mailCountry` | `str` | No | The Location's street address. |
| `mailPostalCode` | `str` | No | The Location's postal code. |
| `mailStateProvince` | `str` | No | The Location's street state or province. |
| `modified` | `str` | No | Last modified timestamp. |
| `name` | `str` | No | The Location's name. |
| `nameOfBusiness` | `str` | No | The name of the business at this location. |
| `notes` | `str` | No | Note for delivery driver. |
| `postalCode` | `str` | No | The Location's postal code. |
| `stateProvince` | `str` | No | The Location's street state or province. |
| `uniqueId` | `str` | No | Unique Identifier for the Location. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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
results = client.Location().list({"client": "example"})
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
| `billingId` | `str` | No | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `bool` | No | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `dict` | No | Reference to the associated User resource. |
| `created` | `str` | No | Creation timestamp in ISO 8601 format. |
| `id` | `str` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Parter account is active or disabled. |
| `location` | `dict` | Yes | Reference to the associated Location resource. |
| `modified` | `str` | No | Last modified timestamp. |
| `name` | `str` | No | The Partner's name. |
| `parent` | `dict` | No | Reference to the associated Partner. |
| `partnerId` | `str` | No | The Partner's id. |
| `reference` | `str` | No | The Partner's reference string. |
| `verificationPhrase` | `str` | No | The verification phrase is a message that the Partner creates. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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
| `carrier` | `str` | No | The name of the courier. |
| `client` | `dict` | No | Reference to the associated Client resource. |
| `created` | `str` | No | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `str` | No | The date and time that a package is recieved. |
| `dateShipped` | `str` | No | The date and time that a package is shipped. |
| `dcKif` | `dict` | No | Reference to the associated KIF resource. |
| `id` | `str` | No | This resource's unique identifier. |
| `items` | `list` | No |  |
| `kif` | `dict` | No | Reference to the associated KIF resource. |
| `modified` | `str` | No | Last modified timestamp. |
| `partner` | `dict` | No | Reference to the associated Partner. |
| `shipmentType` | `str` | No | The type of shipment. |
| `tracking` | `str` | No | The courier's tracking number. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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
results = client.Shipment().list({"kif": "example"})
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
| `success` | `bool` | No | Indicates if the action was a success. |

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
| `alternateKey` | `str` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `dict` | No | Reference to the associated Client resource. |
| `clientRef` | `str` | No | Client Reference property that is included in the decrypt API call. |
| `created` | `str` | No | Creation timestamp in ISO 8601 format. |
| `decrypted` | `int` | No | A Transcation can process muliple decryptions. |
| `deviceName` | `str` | No | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `dict` | No | Reference to the associated Partner. |
| `encrypted` | `int` | No | A Transcation can process muliple encryptions. |
| `endDate` | `str` | No | Timestamp from the end of the transaction. |
| `errCode` | `str` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `str` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `str` | No | This resource's unique identifier. |
| `ipAddress` | `str` | No | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `bool` | No | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `str` | No | The type of cipher used during decrytion. |
| `location` | `dict` | Yes | Reference to the associated Location resource. |
| `messageId` | `str` | No | Message ID. |
| `method` | `str` | No | The decryption cypher/method. |
| `partner` | `dict` | No | Reference to the associated Partner. |
| `reference` | `str` | No | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `str` | No | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `str` | No | Timestamp from the beginning of the transaction. |
| `success` | `bool` | No | The success indicator. |
| `transactionSource` | `str` | No | The source of the Transaction. |

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
| `client` | `dict` | No | Reference to the associated Client resource. |
| `email` | `str` | No | The User's email address. |
| `firstName` | `str` | No | The User's name. |
| `id` | `str` | No | ID of newly created resource |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `kif` | `dict` | No | Reference to the associated KIF resource. |
| `lastName` | `str` | No | The User's Surname. |
| `partner` | `dict` | No | Reference to the associated Partner. |
| `phone` | `str` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `str` | No | The User's unique username. |
| `userRole` | `dict` | No | Reference to the associated User Role. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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
| `client` | `dict` | No | Reference to the associated Client resource. |
| `created` | `str` | No | Creation timestamp in ISO 8601 format. |
| `email` | `str` | No | The User's email address. |
| `firstName` | `str` | No | The User's name. |
| `id` | `str` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `kif` | `dict` | No | Reference to the associated KIF resource. |
| `lastName` | `str` | No | The User's Surname. |
| `modified` | `str` | No | Last modified timestamp. |
| `partner` | `dict` | No | Reference to the associated Partner. |
| `phone` | `str` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `str` | No | The User's unique username. |
| `userRole` | `dict` | No | Reference to the associated User Role. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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

```python
client = BluefinDecryptxP2peSDK({
    "feature": {
        "audit": {"active": True},
        "clienttrack": {"active": True},
        "idempotency": {"active": True},
        "log": {"active": True},
        "metrics": {"active": True},
        "paging": {"active": True},
        "ratelimit": {"active": True},
        "retry": {"active": True},
        "telemetry": {"active": True},
        "test": {"active": True},
        "timeout": {"active": True},
    },
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


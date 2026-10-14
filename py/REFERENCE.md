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

#### `DeviceCustodyListItem(data=None)`

Create a new `DeviceCustodyListItemEntity` instance. Pass `None` for no initial data.

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

#### `VirtualDevice(data=None)`

Create a new `VirtualDeviceEntity` instance. Pass `None` for no initial data.

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
| `devices` | `list` | Yes |  |
| `id` | `str` | No | This resource's unique identifier. |
| `name` | `str` | No | Text describing the attestation. |
| `notes` | `str` | No | Free form field that allows the Client associate notes with the Attestation. |

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

#### `create(reqdata, ctrl=None) -> AttestationEntity`

Create a new entity with the given data. Returns the created entity and raises on error.

```python
result = client.Attestation().create({
    "devices": [],  # list
})
```

#### `list(reqmatch=None, ctrl=None) -> list[AttestationEntity]`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and raises on error.

```python
results = client.Attestation().list({"client": "example"})
for attestation in results:
    print(attestation.data_get())
```

#### `load(reqmatch, ctrl=None) -> AttestationEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get()` reads, and raises on error.

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

#### `create(reqdata, ctrl=None) -> ClientEntity`

Create a new entity with the given data. Returns the created entity and raises on error.

```python
result = client.Client().create({
    "location": {},  # dict
})
```

#### `list(reqmatch=None, ctrl=None) -> list[ClientEntity]`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and raises on error.

```python
results = client.Client().list({"partner": "example"})
for client_ in results:
    print(client_.data_get())
```

#### `load(reqmatch, ctrl=None) -> ClientEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get()` reads, and raises on error.

```python
result = client.Client().load({"id": "client_id"})
```

#### `remove(reqmatch, ctrl=None) -> ClientEntity`

Remove the entity matching the given criteria. Returns the entity, marked as deleted, and raises on error.

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

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `str` | No | The date and time that the Custody change took place. |
| `custodian` | `dict` | Yes | Reference to the associated User resource. |
| `location` | `dict` | Yes | Reference to the associated Location resource. |
| `notes` | `str` | No | Free form field that allows the Client associate notes with the Custody Change. |

### Operations

#### `create(reqdata, ctrl=None) -> CreateResultEntity`

Create a new entity with the given data. Returns the created entity and raises on error.

```python
result = client.CreateResult().create({
    "device_type": "example_device_type",  # str
    "serial_number": "example_serial_number",  # str
    "custodian": {},  # dict
    "location": {},  # dict
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
| `cbcVector` | `str` | No | Base64 or hex encoded initial vector obtained from device. |
| `deviceType` | `str` | Yes | The device Type. |
| `encoding` | `str` | No | The payload encoding |
| `encrypted` | `list` | Yes |  |
| `hasCcData` | `str` | No | Validation flag that indicates whether inbound and outbound data should be checked for credit card numbers. |
| `reference` | `str` | No | A string (of up to 50 characters) that helps partners identify individual API calls. |
| `sequenceNumber` | `str` | No | Sequence number obtained from device in base 64 or hex encoded format. |
| `serialNumber` | `str` | Yes | The serial number of the device. |
| `success` | `bool` | No | true if the payload decryption was successful. |

### Operations

#### `create(reqdata, ctrl=None) -> DecryptionEntity`

Create a new entity with the given data. Returns the created entity and raises on error.

```python
result = client.Decryption().create({
    "deviceType": "example_deviceType",  # str
    "encrypted": [],  # list
    "serialNumber": "example_serialNumber",  # str
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

#### `create(reqdata, ctrl=None) -> DeviceEntity`

Create a new entity with the given data. Returns the created entity and raises on error.

```python
result = client.Device().create({
    "activatedBy": {},  # dict
    "createdBy": {},  # dict
    "initializedBy": {},  # dict
    "location": {},  # dict
    "modifiedBy": {},  # dict
})
```

#### `list(reqmatch=None, ctrl=None) -> list[DeviceEntity]`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and raises on error.

```python
results = client.Device().list()
for device in results:
    print(device.data_get())
```

#### `load(reqmatch, ctrl=None) -> DeviceEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get()` reads, and raises on error.

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

#### `list(reqmatch=None, ctrl=None) -> list[DeviceBuildEntity]`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and raises on error.

```python
results = client.DeviceBuild().list()
for device_build in results:
    print(device_build.data_get())
```

#### `load(reqmatch, ctrl=None) -> DeviceBuildEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get()` reads, and raises on error.

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

#### `load(reqmatch, ctrl=None) -> DeviceCustodyDetailEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get()` reads, and raises on error.

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

## DeviceCustodyListItemEntity

```python
device_custody_list_item = client.DeviceCustodyListItem()
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

#### `list(reqmatch=None, ctrl=None) -> list[DeviceCustodyListItemEntity]`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and raises on error.

```python
results = client.DeviceCustodyListItem().list({"device_type": "example", "serial_number": "example"})
for device_custody_list_item in results:
    print(device_custody_list_item.data_get())
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

Create a new `DeviceCustodyListItemEntity` instance with the same options.

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
| `serialNumber` | `str` | Yes | The serial number of the Device that is shipped. |
| `success` | `bool` | Yes | Indicates if the action succeeded. |
| `tamperLabel` | `str` | Yes | The code that is printed the tamper label of the Device that is shipped. |

### Operations

#### `create(reqdata, ctrl=None) -> DeviceReceiveResultEntity`

Create a new entity with the given data. Returns the created entity and raises on error.

```python
result = client.DeviceReceiveResult().create({
    "serialNumber": "example_serialNumber",  # str
    "success": True,  # bool
    "tamperLabel": "example_tamperLabel",  # str
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
| `appVersion` | `str` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildName` | `str` | No | The Device Builds's name. |
| `buildNumber` | `str` | No | The Build Number. |
| `configFile` | `str` | No | \? |
| `firmwareVersion` | `str` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `str` | No | A list of hardware versions that this Device Build covers. |
| `serialNumber` | `str` | Yes | The referenced Device's serial number. |
| `success` | `bool` | Yes | Indicates if the RKI activation succeeded. |
| `whiteListingBinRanges` | `str` | No | \? |

### Operations

#### `create(reqdata, ctrl=None) -> DeviceRkiActivateResultEntity`

Create a new entity with the given data. Returns the created entity and raises on error.

```python
result = client.DeviceRkiActivateResult().create({
    "serialNumber": "example_serialNumber",  # str
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

#### `list(reqmatch=None, ctrl=None) -> list[DeviceStateEntity]`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and raises on error.

```python
results = client.DeviceState().list()
for device_state in results:
    print(device_state.data_get())
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

#### `list(reqmatch=None, ctrl=None) -> list[DeviceTypeEntity]`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and raises on error.

```python
results = client.DeviceType().list()
for device_type in results:
    print(device_type.data_get())
```

#### `load(reqmatch, ctrl=None) -> DeviceTypeEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get()` reads, and raises on error.

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

#### `list(reqmatch=None, ctrl=None) -> list[InjectKeyEntity]`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and raises on error.

```python
results = client.InjectKey().list()
for inject_key in results:
    print(inject_key.data_get())
```

#### `load(reqmatch, ctrl=None) -> InjectKeyEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get()` reads, and raises on error.

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

#### `list(reqmatch=None, ctrl=None) -> list[KifEntity]`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and raises on error.

```python
results = client.Kif().list()
for kif in results:
    print(kif.data_get())
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
| `client` | `dict` | No | Reference to the associated Client resource. |
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

#### `create(reqdata, ctrl=None) -> LocationEntity`

Create a new entity with the given data. Returns the created entity and raises on error.

```python
result = client.Location().create({
})
```

#### `list(reqmatch=None, ctrl=None) -> list[LocationEntity]`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and raises on error.

```python
results = client.Location().list({"client": "example"})
for location in results:
    print(location.data_get())
```

#### `load(reqmatch, ctrl=None) -> LocationEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get()` reads, and raises on error.

```python
result = client.Location().load({"id": "location_id"})
```

#### `remove(reqmatch, ctrl=None) -> LocationEntity`

Remove the entity matching the given criteria. Returns the entity, marked as deleted, and raises on error.

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

#### `create(reqdata, ctrl=None) -> PartnerEntity`

Create a new entity with the given data. Returns the created entity and raises on error.

```python
result = client.Partner().create({
    "location": {},  # dict
})
```

#### `list(reqmatch=None, ctrl=None) -> list[PartnerEntity]`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and raises on error.

```python
results = client.Partner().list()
for partner in results:
    print(partner.data_get())
```

#### `load(reqmatch, ctrl=None) -> PartnerEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get()` reads, and raises on error.

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
| `location` | `dict` | Yes | Reference to the associated Location resource. |
| `modified` | `str` | No | Last modified timestamp. |
| `partner` | `dict` | No | Reference to the associated Partner. |
| `shipmentType` | `str` | No | The type of shipment. |
| `tracking` | `str` | No | The courier's tracking number. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata, ctrl=None) -> ShipmentEntity`

Create a new entity with the given data. Returns the created entity and raises on error.

```python
result = client.Shipment().create({
    "location": {},  # dict
})
```

#### `list(reqmatch=None, ctrl=None) -> list[ShipmentEntity]`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and raises on error.

```python
results = client.Shipment().list({"kif": "example"})
for shipment in results:
    print(shipment.data_get())
```

#### `load(reqmatch, ctrl=None) -> ShipmentEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get()` reads, and raises on error.

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
| `devices` | `list` | Yes | An array of Device ids to share with partner. |
| `sharePartnerFrom` | `dict` | Yes | Reference to the associated Partner. |
| `success` | `bool` | No | Indicates if the action was a success. |

### Operations

#### `create(reqdata, ctrl=None) -> SuccessEntity`

Create a new entity with the given data. Returns the created entity and raises on error.

```python
result = client.Success().create({
    "share_partner_to": "example_share_partner_to",  # str
    "devices": [],  # list
    "sharePartnerFrom": {},  # dict
})
```

#### `remove(reqmatch, ctrl=None) -> SuccessEntity`

Remove the entity matching the given criteria. Returns the entity, marked as deleted, and raises on error.

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
| `device` | `dict` | Yes | Reference to the associated Device resource. |
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

#### `create(reqdata, ctrl=None) -> TransactionEntity`

Create a new entity with the given data. Returns the created entity and raises on error.

```python
result = client.Transaction().create({
    "device": {},  # dict
    "location": {},  # dict
})
```

#### `list(reqmatch=None, ctrl=None) -> list[TransactionEntity]`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and raises on error.

```python
results = client.Transaction().list()
for transaction in results:
    print(transaction.data_get())
```

#### `load(reqmatch, ctrl=None) -> TransactionEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get()` reads, and raises on error.

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
| `address1` | `str` | No | The Location's street address. |
| `address2` | `str` | No | The Location's street address. |
| `alternateKey` | `str` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `str` | No | Date and time that the Device is due its next PCI Audit. |
| `billingId` | `str` | No | \? |
| `city` | `str` | No | The Location's city. |
| `client` | `dict` | No | Reference to the associated Client resource. |
| `clientCanOrderEquipment` | `bool` | No | This property indicates if the Partner is allowed to order Equipment. |
| `clientRef` | `str` | No | Client Reference property that is included in the decrypt API call. |
| `contact` | `dict` | Yes | Reference to the associated User resource. |
| `country` | `dict` | No | Reference to the associated Country. |
| `customReference` | `str` | No | A Partner specified reference for a location. |
| `dateShipped` | `str` | No | The date and time that a package is shipped. |
| `decrypted` | `int` | No | A Transcation can process muliple decryptions. |
| `device` | `dict` | No | Reference to the associated Device resource. |
| `deviceBuild` | `dict` | No | Reference to the associated Device Build resource. |
| `deviceType` | `dict` | No | Reference to the associated Device Type resource. |
| `directPartner` | `dict` | No | Reference to the associated Partner. |
| `email` | `str` | Yes | The User's email address. |
| `encrypted` | `int` | No | A Transcation can process muliple encryptions. |
| `endDate` | `str` | No | Timestamp from the end of the transaction. |
| `errCode` | `str` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `str` | No | The error messge that is sent in response to a failed decrypt API call. |
| `firstName` | `str` | Yes | The User's name. |
| `id` | `str` | No | ID of newly created resource |
| `injectKey` | `dict` | No | Reference to the associated Device resource. |
| `ipAddress` | `str` | No | The IP address of the http client that makes the decrypt API call. |
| `isActive` | `bool` | Yes | This property indicates if the User account is active or disabled. |
| `items` | `list` | No |  |
| `keyType` | `str` | No | The type of cipher used during decrytion. |
| `kif` | `dict` | No | Reference to the associated KIF resource. |
| `lastName` | `str` | Yes | The User's Surname. |
| `location` | `dict` | Yes | Reference to the associated Location resource. |
| `locationType` | `str` | No | The Location's clasification. |
| `mailAddress1` | `str` | No | The Location's street address. |
| `mailAddress2` | `str` | No | The Location's street address. |
| `mailCity` | `str` | No | The Location's city. |
| `mailCountry` | `str` | No | The Location's street address. |
| `mailPostalCode` | `str` | No | The Location's postal code. |
| `mailStateProvince` | `str` | No | The Location's street state or province. |
| `messageId` | `str` | No | Message ID. |
| `method` | `str` | No | The decryption cypher/method. |
| `mid` | `str` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `str` | No | The Client's name. |
| `nameOfBusiness` | `str` | No | The name of the business at this location. |
| `notes` | `str` | No | Arbitary note that can be attached to a Device entry. |
| `parent` | `dict` | No | Reference to the associated Partner. |
| `partner` | `dict` | No | Reference to the associated Partner. |
| `partnerId` | `str` | No | The Partner's id. |
| `phone` | `str` | Yes | The User's phone number without dashes, spaces, or brackets. |
| `postalCode` | `str` | No | The Location's postal code. |
| `reference` | `str` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | No | If this property is set to '*true*' the newly created user will be sent a welcome email. |
| `serialNumber` | `str` | No | The Device's serial number. |
| `startDate` | `str` | No | Timestamp from the beginning of the transaction. |
| `stateProvince` | `str` | No | The Location's street state or province. |
| `success` | `bool` | No | The success indicator. |
| `tracking` | `str` | No | The courier's tracking number. |
| `uniqueId` | `str` | No | Unique Identifier for the Location. |
| `userName` | `str` | Yes | The User's unique username. |
| `userRole` | `dict` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `str` | No | The verification phrase is a message that the Partner creates. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata, ctrl=None) -> UpdateResultEntity`

Create a new entity with the given data. Returns the created entity and raises on error.

```python
result = client.UpdateResult().create({
    "contact": {},  # dict
    "email": "example_email",  # str
    "firstName": "example_firstName",  # str
    "isActive": True,  # bool
    "lastName": "example_lastName",  # str
    "location": {},  # dict
    "phone": "example_phone",  # str
    "userName": "example_userName",  # str
    "userRole": {},  # dict
})
```

#### `list(reqmatch=None, ctrl=None) -> list[UpdateResultEntity]`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and raises on error.

```python
results = client.UpdateResult().list()
for update_result in results:
    print(update_result.data_get())
```

#### `update(reqdata, ctrl=None) -> UpdateResultEntity`

Update an existing entity. The data must include the entity `id`. Returns the updated entity and raises on error.

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

#### `load(reqmatch, ctrl=None) -> UserEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get()` reads, and raises on error.

```python
result = client.User().load({"id": "user_id"})
```

#### `remove(reqmatch, ctrl=None) -> UserEntity`

Remove the entity matching the given criteria. Returns the entity, marked as deleted, and raises on error.

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

## VirtualDeviceEntity

```python
virtual_device = client.VirtualDevice()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `list` | No | List of Devices. |
| `id` | `str` | No |  |
| `total` | `int` | No | Total number of Devices available (not the number of Users in the response). |

### Operations

#### `load(reqmatch, ctrl=None) -> VirtualDeviceEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get()` reads, and raises on error.

```python
result = client.VirtualDevice().load({"id": "virtual_device_id"})
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

Create a new `VirtualDeviceEntity` instance with the same options.

#### `get_name() -> str`

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

```python
client = BluefinDecryptxP2peSDK({
    "feature": {
        "audit": {"active": True},
        "clienttrack": {"active": True},
        "debug": {"active": True},
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


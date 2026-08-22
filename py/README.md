# BluefinDecryptxP2pe Python SDK



The Python SDK for the BluefinDecryptxP2pe API — an entity-oriented client following Pythonic conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.Attestation()` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to PyPI. Install it from the GitHub
release tag (`py/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)) or
from a source checkout:

```bash
pip install -e .
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```python
import os
from bluefindecryptxp2pe_sdk import BluefinDecryptxP2peSDK

client = BluefinDecryptxP2peSDK({
    "apikey": os.environ.get("BLUEFIN_DECRYPTX_P2PE_APIKEY"),
})
```

### 2. List attestation records

`list()` returns a `list` of records (each a `dict`) and raises on
error — iterate it directly.

```python
try:
    attestations = client.Attestation().list()
    for attestation in attestations:
        print(attestation)
except Exception as err:
    print(f"list failed: {err}")
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`load()` returns the ENTITY — call data_get() for the record — and raises on error.

```python
try:
    devicecustodydetail = client.DeviceCustodyDetail().load({"device_type": "example_device_type", "serial_number": "example_serial_number", "id": "example_id"})
    print(devicecustodydetail)
except Exception as err:
    print(f"load failed: {err}")
```

### 4. Create, update, and remove

```python
# Create — returns the ENTITY (call data_get() for the record)
created = client.Attestation().create({"client": {}, "completeDate": "example_completeDate"})

```


## Error handling

Entity operations raise on failure, so wrap them in `try` / `except`:

```python
try:
    devicetypes = client.DeviceType().list()
    print(devicetypes)
except Exception as err:
    print(f"list failed: {err}")
```

`direct()` does **not** raise — it returns the result envelope. Branch
on `ok`; on failure `status` holds the HTTP status (for error responses)
and `err` holds a transport error, so read both defensively:

```python
result = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example_id"},
})

if not result["ok"]:
    print("request failed:", result.get("status"), result.get("err"))
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```python
result = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})

if result["ok"]:
    print(result["status"])  # 200
    print(result["data"])    # response body
else:
    # A non-2xx response carries status + data (the error body); a
    # transport-level failure carries err instead. Only one is present, so
    # read both with .get() rather than indexing a key that may be absent.
    print(result.get("status"), result.get("err"))
```

### Prepare a request without sending it

```python
# prepare() returns the fetch definition and raises on error.
fetchdef = client.prepare({
    "path": "/api/resource/{id}",
    "method": "DELETE",
    "params": {"id": "example"},
})

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```python
client = BluefinDecryptxP2peSDK.test()

# Entity ops return the ENTITY and raises on error;
# call data_get() for the record.
devicetype = client.DeviceType().list()
# devicetype contains the mock response record
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```python
def mock_fetch(url, init):
    return {
        "status": 200,
        "statusText": "OK",
        "headers": {},
        "json": lambda: {"id": "mock01"},
    }, None

client = BluefinDecryptxP2peSDK({
    "base": "http://localhost:8080",
    "system": {
        "fetch": mock_fetch,
    },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd py && pytest test/
```


## Reference

### BluefinDecryptxP2peSDK

```python
from bluefindecryptxp2pe_sdk import BluefinDecryptxP2peSDK

client = BluefinDecryptxP2peSDK(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `str` | API key for authentication. |
| `base` | `str` | Base URL of the API server. |
| `prefix` | `str` | URL path prefix prepended to all requests. |
| `suffix` | `str` | URL path suffix appended to all requests. |
| `feature` | `dict` | Feature activation flags. |
| `extend` | `list` | Additional Feature instances to load. |
| `system` | `dict` | System overrides (e.g. custom `fetch` function). |

### test

```python
client = BluefinDecryptxP2peSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `None`.

### BluefinDecryptxP2peSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> dict` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> dict` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> dict` | Build and send an HTTP request. Returns a result dict (branch on `ok`). |
| `Attestation` | `(data) -> AttestationEntity` | Create an Attestation entity instance. |
| `Client` | `(data) -> ClientEntity` | Create a Client entity instance. |
| `CreateResult` | `(data) -> CreateResultEntity` | Create a CreateResult entity instance. |
| `Decryption` | `(data) -> DecryptionEntity` | Create a Decryption entity instance. |
| `Device` | `(data) -> DeviceEntity` | Create a Device entity instance. |
| `DeviceBuild` | `(data) -> DeviceBuildEntity` | Create a DeviceBuild entity instance. |
| `DeviceCustodyDetail` | `(data) -> DeviceCustodyDetailEntity` | Create a DeviceCustodyDetail entity instance. |
| `DeviceCustodyList` | `(data) -> DeviceCustodyListEntity` | Create a DeviceCustodyList entity instance. |
| `DeviceList` | `(data) -> DeviceListEntity` | Create a DeviceList entity instance. |
| `DeviceReceiveResult` | `(data) -> DeviceReceiveResultEntity` | Create a DeviceReceiveResult entity instance. |
| `DeviceRkiActivateResult` | `(data) -> DeviceRkiActivateResultEntity` | Create a DeviceRkiActivateResult entity instance. |
| `DeviceState` | `(data) -> DeviceStateEntity` | Create a DeviceState entity instance. |
| `DeviceType` | `(data) -> DeviceTypeEntity` | Create a DeviceType entity instance. |
| `InjectKey` | `(data) -> InjectKeyEntity` | Create an InjectKey entity instance. |
| `Kif` | `(data) -> KifEntity` | Create a Kif entity instance. |
| `Location` | `(data) -> LocationEntity` | Create a Location entity instance. |
| `Partner` | `(data) -> PartnerEntity` | Create a Partner entity instance. |
| `Shipment` | `(data) -> ShipmentEntity` | Create a Shipment entity instance. |
| `Success` | `(data) -> SuccessEntity` | Create a Success entity instance. |
| `Transaction` | `(data) -> TransactionEntity` | Create a Transaction entity instance. |
| `UpdateResult` | `(data) -> UpdateResultEntity` | Create an UpdateResult entity instance. |
| `User` | `(data) -> UserEntity` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch, ctrl) -> list` | List entities matching the criteria. Raises on error. |
| `create` | `(reqdata, ctrl) -> any` | Create a new entity. Raises on error. |
| `update` | `(reqdata, ctrl) -> any` | Update an existing entity. Raises on error. |
| `remove` | `(reqmatch, ctrl) -> any` | Remove an entity. Raises on error. |
| `data_get` | `() -> dict` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> dict` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> str` | Return the entity name. |

### Result shape

Entity operations return the ENTITY (call data_get() for the record) (a `dict` for single-entity
ops, a `list` for `list`) and raise on error. Wrap calls in
`try`/`except` to handle failures.

The `direct()` escape hatch never raises — it returns a result `dict`
you branch on via `result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `True` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `dict` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `False` and `err` contains the error value.

### Entities

#### Attestation

| Field | Description |
| --- | --- |
| `client` | Reference to the associated Client resource. |
| `completeDate` | The date and time that the Attestation took place. |
| `created` | Creation timestamp in ISO 8601 format. |
| `device` | Reference to the associated Device resource. |
| `id` | This resource's unique identifier. |
| `name` | Text describing the attestation. |
| `notes` | Free form field that allows the Client associate notes with the Attestation. |

Operations: Create, List, Load.

API path: `/attestations`

#### Client

| Field | Description |
| --- | --- |
| `contact` | Reference to the associated User resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `directPartner` | Reference to the associated Partner. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the Client account is active or disabled. |
| `location` | Reference to the associated Location resource. |
| `mid` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | Last modified timestamp. |
| `name` | The Client's name. |
| `partner` | Reference to the Client's root Partner. |
| `version` | The number of times that this resource has been updated. |

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
| `success` | true if the payload decryption was successful. |

Operations: Create.

API path: `/decryption`

#### Device

| Field | Description |
| --- | --- |
| `activatedBy` | Reference to the associated User resource. |
| `activationDate` | Timestamp from when the Device was activated. |
| `alternateKey` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | Reference to the associated Client resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `createdBy` | Reference to the associated User resource. |
| `deviceBuild` | Reference to the associated Device Build resource. |
| `deviceState` | Reference to the associated Device State resource. |
| `deviceType` | Reference to the associated Device Type resource. |
| `errorCounter` | The number times the Device has been in error. |
| `errorLastDate` | Timestamp from the last time that the Device had an error. |
| `id` | The Device's unique identifier. |
| `initializedBy` | Reference to the associated User resource. |
| `initializedDate` | Timestamp from when the Device was initialized. |
| `injectKey` | Reference to the associated Device resource. |
| `isVirtual` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | Reference to the associated KIF resource. |
| `lastActivityDate` | Timestamp from the last time that the Device was used. |
| `location` | Reference to the associated Location resource. |
| `modified` | Last modified timestamp. |
| `modifiedBy` | Reference to the associated User resource. |
| `name` | The Device's name. |
| `notes` | Arbitary note that can be attached to a Device entry. |
| `partner` | Reference to the associated Partner. |
| `serialNumber` | The Device's serial number. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/devices`

#### DeviceBuild

| Field | Description |
| --- | --- |
| `appVersion` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | The Build Number. |
| `configFileName` | The name of the configuration file that is uploaded to the device. |
| `created` | Creation timestamp in ISO 8601 format. |
| `deviceType` | The Device Type Name. |
| `firmwareVersion` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | A list of hardware versions that this Device Build covers. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | Last modified timestamp. |
| `name` | The Device Builds's name. |
| `notes` | Notes attached to the device build by Bluefin CISO. |
| `version` | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

Operations: List, Load.

API path: `/deviceBuilds`

#### DeviceCustodyDetail

| Field | Description |
| --- | --- |
| `completeDate` | The date and time that the Custody change took place. |
| `created` | Creation timestamp in ISO 8601 format. |
| `createdBy` | Reference to the associated User resource. |
| `custodian` | Reference to the associated User resource. |
| `device` | Reference to the associated Device resource. |
| `id` | This resource's unique identifier. |
| `location` | Reference to the associated Location resource. |
| `modified` | Last modified timestamp. |
| `modifiedBy` | Reference to the associated User resource. |
| `notes` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | Reference to the associated Custody Status. |
| `transferMethod` | Reference to the associated Transfer Method. |
| `version` | The number of times that this resource has been updated. |

Operations: Load.

API path: `/devices/{serialNumber}/{deviceType}/custody/{id}`

#### DeviceCustodyList

| Field | Description |
| --- | --- |
| `completeDate` | The date and time that the Custody change took place. |
| `created` | Creation timestamp in ISO 8601 format. |
| `createdBy` | Reference to the associated User resource. |
| `custodian` | Reference to the associated User resource. |
| `device` | Reference to the associated Device resource. |
| `id` | This resource's unique identifier. |
| `location` | Reference to the associated Location resource. |
| `modified` | Last modified timestamp. |
| `modifiedBy` | Reference to the associated User resource. |
| `notes` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | Reference to the associated Custody Status. |
| `transferMethod` | Reference to the associated Transfer Method. |
| `version` | The number of times that this resource has been updated. |

Operations: List.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### DeviceList

| Field | Description |
| --- | --- |
| `data` | List of Devices. |
| `total` | Total number of Devices available (not the number of Users in the response). |

Operations: Load.

API path: `/virtualDevices/{sharePartnerTo}`

#### DeviceReceiveResult

| Field | Description |
| --- | --- |
| `success` | Indicates if the action succeeded. |

Operations: Create.

API path: `/devices/receive`

#### DeviceRkiActivateResult

| Field | Description |
| --- | --- |
| `success` | Indicates if the RKI activation succeeded. |

Operations: Create.

API path: `/devices/rki/activate`

#### DeviceState

| Field | Description |
| --- | --- |
| `id` | Unique identifier for this Device state. |
| `name` | Descriptive name for this Device state. |

Operations: List.

API path: `/deviceStates`

#### DeviceType

| Field | Description |
| --- | --- |
| `created` | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | The Device type. |
| `hardwareVersion` | The Device hardware version. |
| `id` | Unique idenifier. |
| `isActive` | This property indicates if the DeviceType is active. |
| `manufacturer` | The Device manufacturer. |
| `model` | The Device model. |
| `modified` | Last modified timestamp. |
| `name` | The DeviceType name. |
| `photoUrl` |  |
| `productName` | The Device name. |
| `version` | The number of times that this resource has been updated. |

Operations: List, Load.

API path: `/deviceTypes`

#### InjectKey

| Field | Description |
| --- | --- |
| `created` | Creation timestamp in ISO 8601 format. |
| `id` | unique idenifier |
| `isActive` | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | The cipher type that the key works with. |
| `modified` | Last modified timestamp in ISO 8601 format. |
| `name` | Key name. |
| `version` | The number of times that this resource has been updated. |

Operations: List, Load.

API path: `/injectKeys`

#### Kif

| Field | Description |
| --- | --- |
| `id` | This resource's unique identifier. |
| `name` | The KIF's name. |

Operations: List.

API path: `/kifs`

#### Location

| Field | Description |
| --- | --- |
| `address1` | The Location's street address. |
| `address2` | The Location's street address. |
| `billingId` | \? |
| `city` | The Location's city. |
| `country` | The Location's country. |
| `created` | Creation timestamp in ISO 8601 format. |
| `customReference` | A Partner specified reference for a location. |
| `id` | This resource's unique identifier. |
| `locationType` | The Location's clasification. |
| `mailAddress1` | The Location's street address. |
| `mailAddress2` | The Location's street address. |
| `mailCity` | The Location's city. |
| `mailCountry` | The Location's street address. |
| `mailPostalCode` | The Location's postal code. |
| `mailStateProvince` | The Location's street state or province. |
| `modified` | Last modified timestamp. |
| `name` | The Location's name. |
| `nameOfBusiness` | The name of the business at this location. |
| `notes` | Note for delivery driver. |
| `postalCode` | The Location's postal code. |
| `stateProvince` | The Location's street state or province. |
| `uniqueId` | Unique Identifier for the Location. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load, Remove.

API path: `/locations`

#### Partner

| Field | Description |
| --- | --- |
| `billingId` | The Partner's billing identifier. |
| `clientCanOrderEquipment` | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | Reference to the associated User resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the Parter account is active or disabled. |
| `location` | Reference to the associated Location resource. |
| `modified` | Last modified timestamp. |
| `name` | The Partner's name. |
| `parent` | Reference to the associated Partner. |
| `partnerId` | The Partner's id. |
| `reference` | The Partner's reference string. |
| `verificationPhrase` | The verification phrase is a message that the Partner creates. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/partners`

#### Shipment

| Field | Description |
| --- | --- |
| `carrier` | The name of the courier. |
| `client` | Reference to the associated Client resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `dateReceived` | The date and time that a package is recieved. |
| `dateShipped` | The date and time that a package is shipped. |
| `dcKif` | Reference to the associated KIF resource. |
| `id` | This resource's unique identifier. |
| `items` |  |
| `kif` | Reference to the associated KIF resource. |
| `modified` | Last modified timestamp. |
| `partner` | Reference to the associated Partner. |
| `shipmentType` | The type of shipment. |
| `tracking` | The courier's tracking number. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/shipments`

#### Success

| Field | Description |
| --- | --- |
| `success` | Indicates if the action was a success. |

Operations: Create, Remove.

API path: `/virtualDevices/{sharePartnerTo}`

#### Transaction

| Field | Description |
| --- | --- |
| `alternateKey` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | Reference to the associated Client resource. |
| `clientRef` | Client Reference property that is included in the decrypt API call. |
| `created` | Creation timestamp in ISO 8601 format. |
| `decrypted` | A Transcation can process muliple decryptions. |
| `deviceName` | The name of the Device that generated the payload to decrypt. |
| `directPartner` | Reference to the associated Partner. |
| `encrypted` | A Transcation can process muliple encryptions. |
| `endDate` | Timestamp from the end of the transaction. |
| `errCode` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | This resource's unique identifier. |
| `ipAddress` | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | Indicates if the Transaction came from a virtual Device. |
| `keyType` | The type of cipher used during decrytion. |
| `location` | Reference to the associated Location resource. |
| `messageId` | Message ID. |
| `method` | The decryption cypher/method. |
| `partner` | Reference to the associated Partner. |
| `reference` | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | Timestamp from the beginning of the transaction. |
| `success` | The success indicator. |
| `transactionSource` | The source of the Transaction. |

Operations: Create, List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `client` | Reference to the associated Client resource. |
| `email` | The User's email address. |
| `firstName` | The User's name. |
| `id` | ID of newly created resource |
| `isActive` | This property indicates if the User account is active or disabled. |
| `kif` | Reference to the associated KIF resource. |
| `lastName` | The User's Surname. |
| `partner` | Reference to the associated Partner. |
| `phone` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | The User's unique username. |
| `userRole` | Reference to the associated User Role. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` | Reference to the associated Client resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `email` | The User's email address. |
| `firstName` | The User's name. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the User account is active or disabled. |
| `kif` | Reference to the associated KIF resource. |
| `lastName` | The User's Surname. |
| `modified` | Last modified timestamp. |
| `partner` | Reference to the associated Partner. |
| `phone` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | The User's unique username. |
| `userRole` | Reference to the associated User Role. |
| `version` | The number of times that this resource has been updated. |

Operations: Load, Remove.

API path: `/users/{id}`



## Entities


### Attestation

Create an instance: `attestation = client.Attestation()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `dict` | Reference to the associated Client resource. |
| `completeDate` | `str` | The date and time that the Attestation took place. |
| `created` | `str` | Creation timestamp in ISO 8601 format. |
| `device` | `dict` | Reference to the associated Device resource. |
| `id` | `str` | This resource's unique identifier. |
| `name` | `str` | Text describing the attestation. |
| `notes` | `str` | Free form field that allows the Client associate notes with the Attestation. |

#### Example: Load

```python
attestation = client.Attestation().load({"id": "attestation_id"})
```

#### Example: List

```python
attestations = client.Attestation().list()
```

#### Example: Create

```python
attestation = client.Attestation().create({
})
```


### Client

Create an instance: `client_ = client.Client()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `dict` | Reference to the associated User resource. |
| `created` | `str` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `dict` | Reference to the associated Partner. |
| `id` | `str` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Client account is active or disabled. |
| `location` | `dict` | Reference to the associated Location resource. |
| `mid` | `str` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `str` | Last modified timestamp. |
| `name` | `str` | The Client's name. |
| `partner` | `dict` | Reference to the Client's root Partner. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```python
client_ = client.Client().load({"id": "client_id"})
```

#### Example: List

```python
client_s = client.Client().list()
```

#### Example: Create

```python
client_ = client.Client().create({
    "location": {},  # dict
})
```


### CreateResult

Create an instance: `create_result = client.CreateResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Example: Create

```python
create_result = client.CreateResult().create({
    "device_type": "example_device_type",  # str
    "serial_number": "example_serial_number",  # str
})
```


### Decryption

Create an instance: `decryption = client.Decryption()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` | true if the payload decryption was successful. |

#### Example: Create

```python
decryption = client.Decryption().create({
})
```


### Device

Create an instance: `device = client.Device()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `dict` | Reference to the associated User resource. |
| `activationDate` | `str` | Timestamp from when the Device was activated. |
| `alternateKey` | `str` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `str` | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `str` | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `dict` | Reference to the associated Client resource. |
| `created` | `str` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `dict` | Reference to the associated User resource. |
| `deviceBuild` | `dict` | Reference to the associated Device Build resource. |
| `deviceState` | `dict` | Reference to the associated Device State resource. |
| `deviceType` | `dict` | Reference to the associated Device Type resource. |
| `errorCounter` | `int` | The number times the Device has been in error. |
| `errorLastDate` | `str` | Timestamp from the last time that the Device had an error. |
| `id` | `str` | The Device's unique identifier. |
| `initializedBy` | `dict` | Reference to the associated User resource. |
| `initializedDate` | `str` | Timestamp from when the Device was initialized. |
| `injectKey` | `dict` | Reference to the associated Device resource. |
| `isVirtual` | `bool` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `dict` | Reference to the associated KIF resource. |
| `lastActivityDate` | `str` | Timestamp from the last time that the Device was used. |
| `location` | `dict` | Reference to the associated Location resource. |
| `modified` | `str` | Last modified timestamp. |
| `modifiedBy` | `dict` | Reference to the associated User resource. |
| `name` | `str` | The Device's name. |
| `notes` | `str` | Arbitary note that can be attached to a Device entry. |
| `partner` | `dict` | Reference to the associated Partner. |
| `serialNumber` | `str` | The Device's serial number. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```python
device = client.Device().load({"id": "device_id"})
```

#### Example: List

```python
devices = client.Device().list()
```

#### Example: Create

```python
device = client.Device().create({
    "activatedBy": {},  # dict
    "createdBy": {},  # dict
    "initializedBy": {},  # dict
    "location": {},  # dict
    "modifiedBy": {},  # dict
})
```


### DeviceBuild

Create an instance: `device_build = client.DeviceBuild()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appVersion` | `str` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `str` | The Build Number. |
| `configFileName` | `str` | The name of the configuration file that is uploaded to the device. |
| `created` | `str` | Creation timestamp in ISO 8601 format. |
| `deviceType` | `str` | The Device Type Name. |
| `firmwareVersion` | `str` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `str` | A list of hardware versions that this Device Build covers. |
| `id` | `int` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `str` | Last modified timestamp. |
| `name` | `str` | The Device Builds's name. |
| `notes` | `str` | Notes attached to the device build by Bluefin CISO. |
| `version` | `int` | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `str` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `bool` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

#### Example: Load

```python
device_build = client.DeviceBuild().load({"id": "device_build_id"})
```

#### Example: List

```python
device_builds = client.DeviceBuild().list()
```


### DeviceCustodyDetail

Create an instance: `device_custody_detail = client.DeviceCustodyDetail()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `str` | The date and time that the Custody change took place. |
| `created` | `str` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `dict` | Reference to the associated User resource. |
| `custodian` | `dict` | Reference to the associated User resource. |
| `device` | `dict` | Reference to the associated Device resource. |
| `id` | `int` | This resource's unique identifier. |
| `location` | `dict` | Reference to the associated Location resource. |
| `modified` | `str` | Last modified timestamp. |
| `modifiedBy` | `dict` | Reference to the associated User resource. |
| `notes` | `str` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `dict` | Reference to the associated Custody Status. |
| `transferMethod` | `dict` | Reference to the associated Transfer Method. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```python
device_custody_detail = client.DeviceCustodyDetail().load({"id": "device_custody_detail_id", "device_type": "device_type", "serial_number": "serial_number"})
```


### DeviceCustodyList

Create an instance: `device_custody_list = client.DeviceCustodyList()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `str` | The date and time that the Custody change took place. |
| `created` | `str` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `dict` | Reference to the associated User resource. |
| `custodian` | `dict` | Reference to the associated User resource. |
| `device` | `dict` | Reference to the associated Device resource. |
| `id` | `int` | This resource's unique identifier. |
| `location` | `dict` | Reference to the associated Location resource. |
| `modified` | `str` | Last modified timestamp. |
| `modifiedBy` | `dict` | Reference to the associated User resource. |
| `notes` | `str` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `dict` | Reference to the associated Custody Status. |
| `transferMethod` | `dict` | Reference to the associated Transfer Method. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: List

```python
device_custody_lists = client.DeviceCustodyList().list({"device_type": "example", "serial_number": "example"})
```


### DeviceList

Create an instance: `device_list = client.DeviceList()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `list` | List of Devices. |
| `total` | `int` | Total number of Devices available (not the number of Users in the response). |

#### Example: Load

```python
device_list = client.DeviceList().load({"share_partner_to": "share_partner_to"})
```


### DeviceReceiveResult

Create an instance: `device_receive_result = client.DeviceReceiveResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` | Indicates if the action succeeded. |

#### Example: Create

```python
device_receive_result = client.DeviceReceiveResult().create({
    "success": True,  # bool
})
```


### DeviceRkiActivateResult

Create an instance: `device_rki_activate_result = client.DeviceRkiActivateResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` | Indicates if the RKI activation succeeded. |

#### Example: Create

```python
device_rki_activate_result = client.DeviceRkiActivateResult().create({
    "success": True,  # bool
})
```


### DeviceState

Create an instance: `device_state = client.DeviceState()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` | Unique identifier for this Device state. |
| `name` | `str` | Descriptive name for this Device state. |

#### Example: List

```python
device_states = client.DeviceState().list()
```


### DeviceType

Create an instance: `device_type = client.DeviceType()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `str` | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `str` | The Device type. |
| `hardwareVersion` | `str` | The Device hardware version. |
| `id` | `str` | Unique idenifier. |
| `isActive` | `bool` | This property indicates if the DeviceType is active. |
| `manufacturer` | `str` | The Device manufacturer. |
| `model` | `str` | The Device model. |
| `modified` | `str` | Last modified timestamp. |
| `name` | `str` | The DeviceType name. |
| `photoUrl` | `str` |  |
| `productName` | `str` | The Device name. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```python
device_type = client.DeviceType().load({"id": "device_type_id"})
```

#### Example: List

```python
device_types = client.DeviceType().list()
```


### InjectKey

Create an instance: `inject_key = client.InjectKey()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `str` | Creation timestamp in ISO 8601 format. |
| `id` | `str` | unique idenifier |
| `isActive` | `bool` | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `bool` | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `str` | The cipher type that the key works with. |
| `modified` | `str` | Last modified timestamp in ISO 8601 format. |
| `name` | `str` | Key name. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```python
inject_key = client.InjectKey().load({"id": "inject_key_id"})
```

#### Example: List

```python
inject_keys = client.InjectKey().list()
```


### Kif

Create an instance: `kif = client.Kif()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` | This resource's unique identifier. |
| `name` | `str` | The KIF's name. |

#### Example: List

```python
kifs = client.Kif().list()
```


### Location

Create an instance: `location = client.Location()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address1` | `str` | The Location's street address. |
| `address2` | `str` | The Location's street address. |
| `billingId` | `str` | \? |
| `city` | `str` | The Location's city. |
| `country` | `str` | The Location's country. |
| `created` | `str` | Creation timestamp in ISO 8601 format. |
| `customReference` | `str` | A Partner specified reference for a location. |
| `id` | `str` | This resource's unique identifier. |
| `locationType` | `str` | The Location's clasification. |
| `mailAddress1` | `str` | The Location's street address. |
| `mailAddress2` | `str` | The Location's street address. |
| `mailCity` | `str` | The Location's city. |
| `mailCountry` | `str` | The Location's street address. |
| `mailPostalCode` | `str` | The Location's postal code. |
| `mailStateProvince` | `str` | The Location's street state or province. |
| `modified` | `str` | Last modified timestamp. |
| `name` | `str` | The Location's name. |
| `nameOfBusiness` | `str` | The name of the business at this location. |
| `notes` | `str` | Note for delivery driver. |
| `postalCode` | `str` | The Location's postal code. |
| `stateProvince` | `str` | The Location's street state or province. |
| `uniqueId` | `str` | Unique Identifier for the Location. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```python
location = client.Location().load({"id": "location_id"})
```

#### Example: List

```python
locations = client.Location().list()
```

#### Example: Create

```python
location = client.Location().create({
})
```


### Partner

Create an instance: `partner = client.Partner()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `str` | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `bool` | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `dict` | Reference to the associated User resource. |
| `created` | `str` | Creation timestamp in ISO 8601 format. |
| `id` | `str` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Parter account is active or disabled. |
| `location` | `dict` | Reference to the associated Location resource. |
| `modified` | `str` | Last modified timestamp. |
| `name` | `str` | The Partner's name. |
| `parent` | `dict` | Reference to the associated Partner. |
| `partnerId` | `str` | The Partner's id. |
| `reference` | `str` | The Partner's reference string. |
| `verificationPhrase` | `str` | The verification phrase is a message that the Partner creates. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```python
partner = client.Partner().load({"id": "partner_id"})
```

#### Example: List

```python
partners = client.Partner().list()
```

#### Example: Create

```python
partner = client.Partner().create({
    "location": {},  # dict
})
```


### Shipment

Create an instance: `shipment = client.Shipment()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `str` | The name of the courier. |
| `client` | `dict` | Reference to the associated Client resource. |
| `created` | `str` | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `str` | The date and time that a package is recieved. |
| `dateShipped` | `str` | The date and time that a package is shipped. |
| `dcKif` | `dict` | Reference to the associated KIF resource. |
| `id` | `str` | This resource's unique identifier. |
| `items` | `list` |  |
| `kif` | `dict` | Reference to the associated KIF resource. |
| `modified` | `str` | Last modified timestamp. |
| `partner` | `dict` | Reference to the associated Partner. |
| `shipmentType` | `str` | The type of shipment. |
| `tracking` | `str` | The courier's tracking number. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```python
shipment = client.Shipment().load({"id": "shipment_id"})
```

#### Example: List

```python
shipments = client.Shipment().list()
```

#### Example: Create

```python
shipment = client.Shipment().create({
})
```


### Success

Create an instance: `success = client.Success()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` | Indicates if the action was a success. |

#### Example: Create

```python
success = client.Success().create({
    "share_partner_to": "example_share_partner_to",  # str
})
```


### Transaction

Create an instance: `transaction = client.Transaction()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `str` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `dict` | Reference to the associated Client resource. |
| `clientRef` | `str` | Client Reference property that is included in the decrypt API call. |
| `created` | `str` | Creation timestamp in ISO 8601 format. |
| `decrypted` | `int` | A Transcation can process muliple decryptions. |
| `deviceName` | `str` | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `dict` | Reference to the associated Partner. |
| `encrypted` | `int` | A Transcation can process muliple encryptions. |
| `endDate` | `str` | Timestamp from the end of the transaction. |
| `errCode` | `str` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `str` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `str` | This resource's unique identifier. |
| `ipAddress` | `str` | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `bool` | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `str` | The type of cipher used during decrytion. |
| `location` | `dict` | Reference to the associated Location resource. |
| `messageId` | `str` | Message ID. |
| `method` | `str` | The decryption cypher/method. |
| `partner` | `dict` | Reference to the associated Partner. |
| `reference` | `str` | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `str` | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `str` | Timestamp from the beginning of the transaction. |
| `success` | `bool` | The success indicator. |
| `transactionSource` | `str` | The source of the Transaction. |

#### Example: Load

```python
transaction = client.Transaction().load({"id": "transaction_id"})
```

#### Example: List

```python
transactions = client.Transaction().list()
```

#### Example: Create

```python
transaction = client.Transaction().create({
    "location": {},  # dict
})
```


### UpdateResult

Create an instance: `update_result = client.UpdateResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `dict` | Reference to the associated Client resource. |
| `email` | `str` | The User's email address. |
| `firstName` | `str` | The User's name. |
| `id` | `str` | ID of newly created resource |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `kif` | `dict` | Reference to the associated KIF resource. |
| `lastName` | `str` | The User's Surname. |
| `partner` | `dict` | Reference to the associated Partner. |
| `phone` | `str` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `str` | The User's unique username. |
| `userRole` | `dict` | Reference to the associated User Role. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: List

```python
update_results = client.UpdateResult().list()
```

#### Example: Create

```python
update_result = client.UpdateResult().create({
})
```


### User

Create an instance: `user = client.User()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `dict` | Reference to the associated Client resource. |
| `created` | `str` | Creation timestamp in ISO 8601 format. |
| `email` | `str` | The User's email address. |
| `firstName` | `str` | The User's name. |
| `id` | `str` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `kif` | `dict` | Reference to the associated KIF resource. |
| `lastName` | `str` | The User's Surname. |
| `modified` | `str` | Last modified timestamp. |
| `partner` | `dict` | Reference to the associated Partner. |
| `phone` | `str` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `str` | The User's unique username. |
| `userRole` | `dict` | Reference to the associated User Role. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```python
user = client.User().load({"id": "user_id"})
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

Features are the extension mechanism. A feature is a Python class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as dicts

The Python SDK uses plain dicts throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a dict.

### Module structure

```
py/
├── bluefindecryptxp2pe_sdk.py         -- Main SDK module
├── config.py                    -- Configuration
├── features.py                  -- Feature factory
├── core/                        -- Core types and context
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (Base, Test, Log)
├── utility/                     -- Utility functions and struct library
└── test/                        -- Test suites
```

The main module (`bluefindecryptxp2pe_sdk`) exports the SDK class.
Import entity or utility modules directly only when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```python
devicetype = client.DeviceType()
devicetype.list()

# devicetype.data_get() now returns the devicetype data from the last list
# devicetype.match_get() returns the last match criteria
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

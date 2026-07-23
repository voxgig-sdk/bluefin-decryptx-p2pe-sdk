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
`load()` returns the bare record (a `dict`) and raises on error.

```python
try:
    devicecustodydetail = client.DeviceCustodyDetail().load({"device_type": "example_device_type", "serial_number": "example_serial_number", "id": "example_id"})
    print(devicecustodydetail)
except Exception as err:
    print(f"load failed: {err}")
```

### 4. Create, update, and remove

```python
# Create — returns the bare created record (a dict)
created = client.Attestation().create({"client": {}, "complete_date": "example_complete_date"})

```


## Error handling

Entity operations raise on failure, so wrap them in `try` / `except`:

```python
try:
    attestations = client.Attestation().list()
    print(attestations)
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

# Entity ops return the bare record and raise on error.
attestation = client.Attestation().list()
# attestation contains the mock response record
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

Entity operations return the bare result data (a `dict` for single-entity
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
| `client` |  |
| `complete_date` |  |
| `created` |  |
| `device` |  |
| `id` |  |
| `name` |  |
| `note` |  |

Operations: Create, List, Load.

API path: `/attestations`

#### Client

| Field | Description |
| --- | --- |
| `contact` |  |
| `created` |  |
| `direct_partner` |  |
| `id` |  |
| `is_active` |  |
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
| `activated_by` |  |
| `activation_date` |  |
| `alternate_key` |  |
| `audit_next_date` |  |
| `audit_notification_date` |  |
| `client` |  |
| `created` |  |
| `created_by` |  |
| `device_build` |  |
| `device_state` |  |
| `device_type` |  |
| `error_counter` |  |
| `error_last_date` |  |
| `id` |  |
| `initialized_by` |  |
| `initialized_date` |  |
| `inject_key` |  |
| `is_virtual` |  |
| `kif` |  |
| `last_activity_date` |  |
| `location` |  |
| `modified` |  |
| `modified_by` |  |
| `name` |  |
| `note` |  |
| `partner` |  |
| `serial_number` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/devices`

#### DeviceBuild

| Field | Description |
| --- | --- |
| `app_version` |  |
| `build_number` |  |
| `config_file_name` |  |
| `created` |  |
| `device_type` |  |
| `firmware_version` |  |
| `hardware_version` |  |
| `id` |  |
| `is_active` |  |
| `modified` |  |
| `name` |  |
| `note` |  |
| `version` |  |
| `white_listing_bin_range` |  |
| `white_listing_used` |  |

Operations: List, Load.

API path: `/deviceBuilds`

#### DeviceCustodyDetail

| Field | Description |
| --- | --- |
| `complete_date` |  |
| `created` |  |
| `created_by` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modified_by` |  |
| `note` |  |
| `status` |  |
| `transfer_method` |  |
| `version` |  |

Operations: Load.

API path: `/devices/{serialNumber}/{deviceType}/custody/{id}`

#### DeviceCustodyList

| Field | Description |
| --- | --- |
| `complete_date` |  |
| `created` |  |
| `created_by` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modified_by` |  |
| `note` |  |
| `status` |  |
| `transfer_method` |  |
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
| `device_type_mode` |  |
| `hardware_version` |  |
| `id` |  |
| `is_active` |  |
| `manufacturer` |  |
| `model` |  |
| `modified` |  |
| `name` |  |
| `photo_url` |  |
| `product_name` |  |
| `version` |  |

Operations: List, Load.

API path: `/deviceTypes`

#### InjectKey

| Field | Description |
| --- | --- |
| `created` |  |
| `id` |  |
| `is_active` |  |
| `is_p2_pe` |  |
| `key_type` |  |
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
| `billing_id` |  |
| `city` |  |
| `country` |  |
| `created` |  |
| `custom_reference` |  |
| `id` |  |
| `location_type` |  |
| `mail_address1` |  |
| `mail_address2` |  |
| `mail_city` |  |
| `mail_country` |  |
| `mail_postal_code` |  |
| `mail_state_province` |  |
| `modified` |  |
| `name` |  |
| `name_of_business` |  |
| `note` |  |
| `postal_code` |  |
| `state_province` |  |
| `unique_id` |  |
| `version` |  |

Operations: Create, List, Load, Remove.

API path: `/locations`

#### Partner

| Field | Description |
| --- | --- |
| `billing_id` |  |
| `client_can_order_equipment` |  |
| `contact` |  |
| `created` |  |
| `id` |  |
| `is_active` |  |
| `location` |  |
| `modified` |  |
| `name` |  |
| `parent` |  |
| `partner_id` |  |
| `reference` |  |
| `verification_phrase` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/partners`

#### Shipment

| Field | Description |
| --- | --- |
| `carrier` |  |
| `client` |  |
| `created` |  |
| `date_received` |  |
| `date_shipped` |  |
| `dc_kif` |  |
| `id` |  |
| `item` |  |
| `kif` |  |
| `modified` |  |
| `partner` |  |
| `shipment_type` |  |
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
| `alternate_key` |  |
| `client` |  |
| `client_ref` |  |
| `created` |  |
| `decrypted` |  |
| `device_name` |  |
| `direct_partner` |  |
| `encrypted` |  |
| `end_date` |  |
| `err_code` |  |
| `err_message` |  |
| `id` |  |
| `ip_address` |  |
| `is_virtual` |  |
| `key_type` |  |
| `location` |  |
| `message_id` |  |
| `method` |  |
| `partner` |  |
| `reference` |  |
| `serial_number` |  |
| `start_date` |  |
| `success` |  |
| `transaction_source` |  |

Operations: Create, List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `client` |  |
| `email` |  |
| `first_name` |  |
| `id` |  |
| `is_active` |  |
| `kif` |  |
| `last_name` |  |
| `partner` |  |
| `phone` |  |
| `user_name` |  |
| `user_role` |  |
| `version` |  |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` |  |
| `created` |  |
| `email` |  |
| `first_name` |  |
| `id` |  |
| `is_active` |  |
| `kif` |  |
| `last_name` |  |
| `modified` |  |
| `partner` |  |
| `phone` |  |
| `user_name` |  |
| `user_role` |  |
| `version` |  |

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
| `client` | `dict` |  |
| `complete_date` | `str` |  |
| `created` | `str` |  |
| `device` | `dict` |  |
| `id` | `str` |  |
| `name` | `str` |  |
| `note` | `str` |  |

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
| `contact` | `dict` |  |
| `created` | `str` |  |
| `direct_partner` | `dict` |  |
| `id` | `str` |  |
| `is_active` | `bool` |  |
| `location` | `dict` |  |
| `mid` | `str` |  |
| `modified` | `str` |  |
| `name` | `str` |  |
| `partner` | `dict` |  |
| `version` | `int` |  |

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
| `success` | `bool` |  |

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
| `activated_by` | `dict` |  |
| `activation_date` | `str` |  |
| `alternate_key` | `str` |  |
| `audit_next_date` | `str` |  |
| `audit_notification_date` | `str` |  |
| `client` | `dict` |  |
| `created` | `str` |  |
| `created_by` | `dict` |  |
| `device_build` | `dict` |  |
| `device_state` | `dict` |  |
| `device_type` | `dict` |  |
| `error_counter` | `int` |  |
| `error_last_date` | `str` |  |
| `id` | `str` |  |
| `initialized_by` | `dict` |  |
| `initialized_date` | `str` |  |
| `inject_key` | `dict` |  |
| `is_virtual` | `bool` |  |
| `kif` | `dict` |  |
| `last_activity_date` | `str` |  |
| `location` | `dict` |  |
| `modified` | `str` |  |
| `modified_by` | `dict` |  |
| `name` | `str` |  |
| `note` | `str` |  |
| `partner` | `dict` |  |
| `serial_number` | `str` |  |
| `version` | `int` |  |

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
    "activated_by": {},  # dict
    "created_by": {},  # dict
    "initialized_by": {},  # dict
    "location": {},  # dict
    "modified_by": {},  # dict
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
| `app_version` | `str` |  |
| `build_number` | `str` |  |
| `config_file_name` | `str` |  |
| `created` | `str` |  |
| `device_type` | `str` |  |
| `firmware_version` | `str` |  |
| `hardware_version` | `str` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `modified` | `str` |  |
| `name` | `str` |  |
| `note` | `str` |  |
| `version` | `int` |  |
| `white_listing_bin_range` | `str` |  |
| `white_listing_used` | `bool` |  |

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
| `complete_date` | `str` |  |
| `created` | `str` |  |
| `created_by` | `dict` |  |
| `custodian` | `dict` |  |
| `device` | `dict` |  |
| `id` | `int` |  |
| `location` | `dict` |  |
| `modified` | `str` |  |
| `modified_by` | `dict` |  |
| `note` | `str` |  |
| `status` | `dict` |  |
| `transfer_method` | `dict` |  |
| `version` | `int` |  |

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
| `complete_date` | `str` |  |
| `created` | `str` |  |
| `created_by` | `dict` |  |
| `custodian` | `dict` |  |
| `device` | `dict` |  |
| `id` | `int` |  |
| `location` | `dict` |  |
| `modified` | `str` |  |
| `modified_by` | `dict` |  |
| `note` | `str` |  |
| `status` | `dict` |  |
| `transfer_method` | `dict` |  |
| `version` | `int` |  |

#### Example: List

```python
device_custody_lists = client.DeviceCustodyList().list()
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
| `data` | `list` |  |
| `total` | `int` |  |

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
| `success` | `bool` |  |

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
| `success` | `bool` |  |

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
| `id` | `int` |  |
| `name` | `str` |  |

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
| `created` | `str` |  |
| `device_type_mode` | `str` |  |
| `hardware_version` | `str` |  |
| `id` | `str` |  |
| `is_active` | `bool` |  |
| `manufacturer` | `str` |  |
| `model` | `str` |  |
| `modified` | `str` |  |
| `name` | `str` |  |
| `photo_url` | `str` |  |
| `product_name` | `str` |  |
| `version` | `int` |  |

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
| `created` | `str` |  |
| `id` | `str` |  |
| `is_active` | `bool` |  |
| `is_p2_pe` | `bool` |  |
| `key_type` | `str` |  |
| `modified` | `str` |  |
| `name` | `str` |  |
| `version` | `int` |  |

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
| `id` | `int` |  |
| `name` | `str` |  |

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
| `address1` | `str` |  |
| `address2` | `str` |  |
| `billing_id` | `str` |  |
| `city` | `str` |  |
| `country` | `str` |  |
| `created` | `str` |  |
| `custom_reference` | `str` |  |
| `id` | `str` |  |
| `location_type` | `str` |  |
| `mail_address1` | `str` |  |
| `mail_address2` | `str` |  |
| `mail_city` | `str` |  |
| `mail_country` | `str` |  |
| `mail_postal_code` | `str` |  |
| `mail_state_province` | `str` |  |
| `modified` | `str` |  |
| `name` | `str` |  |
| `name_of_business` | `str` |  |
| `note` | `str` |  |
| `postal_code` | `str` |  |
| `state_province` | `str` |  |
| `unique_id` | `str` |  |
| `version` | `int` |  |

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
| `billing_id` | `str` |  |
| `client_can_order_equipment` | `bool` |  |
| `contact` | `dict` |  |
| `created` | `str` |  |
| `id` | `str` |  |
| `is_active` | `bool` |  |
| `location` | `dict` |  |
| `modified` | `str` |  |
| `name` | `str` |  |
| `parent` | `dict` |  |
| `partner_id` | `str` |  |
| `reference` | `str` |  |
| `verification_phrase` | `str` |  |
| `version` | `int` |  |

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
| `carrier` | `str` |  |
| `client` | `dict` |  |
| `created` | `str` |  |
| `date_received` | `str` |  |
| `date_shipped` | `str` |  |
| `dc_kif` | `dict` |  |
| `id` | `str` |  |
| `item` | `list` |  |
| `kif` | `dict` |  |
| `modified` | `str` |  |
| `partner` | `dict` |  |
| `shipment_type` | `str` |  |
| `tracking` | `str` |  |
| `version` | `int` |  |

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
| `success` | `bool` |  |

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
| `alternate_key` | `str` |  |
| `client` | `dict` |  |
| `client_ref` | `str` |  |
| `created` | `str` |  |
| `decrypted` | `int` |  |
| `device_name` | `str` |  |
| `direct_partner` | `dict` |  |
| `encrypted` | `int` |  |
| `end_date` | `str` |  |
| `err_code` | `str` |  |
| `err_message` | `str` |  |
| `id` | `str` |  |
| `ip_address` | `str` |  |
| `is_virtual` | `bool` |  |
| `key_type` | `str` |  |
| `location` | `dict` |  |
| `message_id` | `str` |  |
| `method` | `str` |  |
| `partner` | `dict` |  |
| `reference` | `str` |  |
| `serial_number` | `str` |  |
| `start_date` | `str` |  |
| `success` | `bool` |  |
| `transaction_source` | `str` |  |

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
| `client` | `dict` |  |
| `email` | `str` |  |
| `first_name` | `str` |  |
| `id` | `str` |  |
| `is_active` | `bool` |  |
| `kif` | `dict` |  |
| `last_name` | `str` |  |
| `partner` | `dict` |  |
| `phone` | `str` |  |
| `user_name` | `str` |  |
| `user_role` | `dict` |  |
| `version` | `int` |  |

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
| `client` | `dict` |  |
| `created` | `str` |  |
| `email` | `str` |  |
| `first_name` | `str` |  |
| `id` | `str` |  |
| `is_active` | `bool` |  |
| `kif` | `dict` |  |
| `last_name` | `str` |  |
| `modified` | `str` |  |
| `partner` | `dict` |  |
| `phone` | `str` |  |
| `user_name` | `str` |  |
| `user_role` | `dict` |  |
| `version` | `int` |  |

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
attestation = client.Attestation()
attestation.list()

# attestation.data_get() now returns the attestation data from the last list
# attestation.match_get() returns the last match criteria
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

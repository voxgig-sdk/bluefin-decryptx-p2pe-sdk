# BluefinDecryptxP2pe C SDK Reference

Complete API reference for the BluefinDecryptxP2pe C SDK.


## BluefinDecryptxP2peSDK

### Constructor

```c
#include "core/api.h"

BluefinDecryptxP2peSDK* client = bluefindecryptxp2pe_sdk_new(options);
```

Create a new SDK client instance. `options` is a `voxgig_value*` map
(`NULL` for none).

**Parameters (`options` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides. |


### Test Constructor

#### `BluefinDecryptxP2peSDK* test_sdk(voxgig_value* testopts, voxgig_value* sdkopts)`

Create a test client with mock features active. Both arguments may be
`NULL`.

```c
BluefinDecryptxP2peSDK* client = test_sdk(NULL, NULL);
```


### Entity Accessors

#### `Entity* bluefindecryptxp2pe_attestation(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `Attestation` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_client(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `Client` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_create_result(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `CreateResult` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_decryption(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `Decryption` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_device(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `Device` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_device_build(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `DeviceBuild` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_device_custody_detail(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `DeviceCustodyDetail` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_device_custody_list(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `DeviceCustodyList` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_device_list(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `DeviceList` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_device_receive_result(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `DeviceReceiveResult` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_device_rki_activate_result(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `DeviceRkiActivateResult` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_device_state(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `DeviceState` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_device_type(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `DeviceType` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_inject_key(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `InjectKey` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_kif(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `Kif` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_location(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `Location` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_partner(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `Partner` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_shipment(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `Shipment` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_success(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `Success` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_transaction(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `Transaction` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_update_result(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `UpdateResult` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefindecryptxp2pe_user(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `User` entity instance. Pass `NULL` for no initial
options.

#### `voxgig_value* sdk_direct(BluefinDecryptxP2peSDK* client, voxgig_value* fetchargs, PNError** err)`

Make a direct HTTP request to any API endpoint. Returns a result map with
`ok`, `status`, `headers`, and `data` (or `err` on failure). This escape
hatch never sets `*err` for a non-2xx response — branch on
`getp(result, "ok")`.

**Parameters (`fetchargs` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

#### `voxgig_value* sdk_prepare(BluefinDecryptxP2peSDK* client, voxgig_value* fetchargs, PNError** err)`

Prepare a fetch definition without sending. Returns the fetchdef and sets
`*err` on failure.


---

## Attestation

```c
Entity* attestation = bluefindecryptxp2pe_attestation(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `voxgig_value* (map)` | No |  |
| `completeDate` | `char*` | No |  |
| `created` | `char*` | No |  |
| `device` | `voxgig_value* (map)` | No |  |
| `id` | `char*` | No |  |
| `name` | `char*` | No |  |
| `notes` | `char*` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* attestation = bluefindecryptxp2pe_attestation(client, NULL);
voxgig_value* result = attestation->vt->create(attestation, NULL, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* attestation = bluefindecryptxp2pe_attestation(client, NULL);
voxgig_value* results = attestation->vt->list(attestation, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* attestation = bluefindecryptxp2pe_attestation(client, NULL);
voxgig_value* result = attestation->vt->load(attestation, cmap(1, "id", v_str("attestation_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Attestation` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Client

```c
Entity* client = bluefindecryptxp2pe_client(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `voxgig_value* (map)` | No |  |
| `created` | `char*` | No |  |
| `directPartner` | `voxgig_value* (map)` | No |  |
| `id` | `char*` | No |  |
| `isActive` | `bool` | No |  |
| `location` | `voxgig_value* (map)` | Yes |  |
| `mid` | `char*` | No |  |
| `modified` | `char*` | No |  |
| `name` | `char*` | No |  |
| `partner` | `voxgig_value* (map)` | No |  |
| `version` | `int64_t` | No |  |

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

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* client = bluefindecryptxp2pe_client(client, NULL);
voxgig_value* result = client->vt->create(client, cmap(1,
    "location", v_map())  // voxgig_value* (map)
, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* client = bluefindecryptxp2pe_client(client, NULL);
voxgig_value* results = client->vt->list(client, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* client = bluefindecryptxp2pe_client(client, NULL);
voxgig_value* result = client->vt->load(client, cmap(1, "id", v_str("client_id")), NULL, &err);
```

#### `vt->remove(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Remove the entity matching the given criteria. Sets `*err` on failure.

```c
Entity* client = bluefindecryptxp2pe_client(client, NULL);
voxgig_value* result = client->vt->remove(client, cmap(1, "id", v_str("client_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Client` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## CreateResult

```c
Entity* create_result = bluefindecryptxp2pe_create_result(client, NULL);
```

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* create_result = bluefindecryptxp2pe_create_result(client, NULL);
voxgig_value* result = create_result->vt->create(create_result, cmap(2,
    "device_type", v_str("example_device_type"),  // char*
    "serial_number", v_str("example_serial_number"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `CreateResult` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Decryption

```c
Entity* decryption = bluefindecryptxp2pe_decryption(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* decryption = bluefindecryptxp2pe_decryption(client, NULL);
voxgig_value* result = decryption->vt->create(decryption, NULL, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Decryption` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Device

```c
Entity* device = bluefindecryptxp2pe_device(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activatedBy` | `voxgig_value* (map)` | Yes |  |
| `activationDate` | `char*` | No |  |
| `alternateKey` | `char*` | No |  |
| `auditNextDate` | `char*` | No |  |
| `auditNotificationDate` | `char*` | No |  |
| `client` | `voxgig_value* (map)` | No |  |
| `created` | `char*` | No |  |
| `createdBy` | `voxgig_value* (map)` | Yes |  |
| `deviceBuild` | `voxgig_value* (map)` | No |  |
| `deviceState` | `voxgig_value* (map)` | No |  |
| `deviceType` | `voxgig_value* (map)` | No |  |
| `errorCounter` | `int64_t` | No |  |
| `errorLastDate` | `char*` | No |  |
| `id` | `char*` | No |  |
| `initializedBy` | `voxgig_value* (map)` | Yes |  |
| `initializedDate` | `char*` | No |  |
| `injectKey` | `voxgig_value* (map)` | No |  |
| `isVirtual` | `bool` | No |  |
| `kif` | `voxgig_value* (map)` | No |  |
| `lastActivityDate` | `char*` | No |  |
| `location` | `voxgig_value* (map)` | Yes |  |
| `modified` | `char*` | No |  |
| `modifiedBy` | `voxgig_value* (map)` | Yes |  |
| `name` | `char*` | No |  |
| `notes` | `char*` | No |  |
| `partner` | `voxgig_value* (map)` | No |  |
| `serialNumber` | `char*` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* device = bluefindecryptxp2pe_device(client, NULL);
voxgig_value* result = device->vt->create(device, cmap(5,
    "activatedBy", v_map(),  // voxgig_value* (map)
    "createdBy", v_map(),  // voxgig_value* (map)
    "initializedBy", v_map(),  // voxgig_value* (map)
    "location", v_map(),  // voxgig_value* (map)
    "modifiedBy", v_map())  // voxgig_value* (map)
, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* device = bluefindecryptxp2pe_device(client, NULL);
voxgig_value* results = device->vt->list(device, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* device = bluefindecryptxp2pe_device(client, NULL);
voxgig_value* result = device->vt->load(device, cmap(1, "id", v_str("device_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Device` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## DeviceBuild

```c
Entity* device_build = bluefindecryptxp2pe_device_build(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appVersion` | `char*` | No |  |
| `buildNumber` | `char*` | No |  |
| `configFileName` | `char*` | No |  |
| `created` | `char*` | No |  |
| `deviceType` | `char*` | No |  |
| `firmwareVersion` | `char*` | No |  |
| `hardwareVersion` | `char*` | No |  |
| `id` | `int64_t` | No |  |
| `isActive` | `bool` | No |  |
| `modified` | `char*` | No |  |
| `name` | `char*` | No |  |
| `notes` | `char*` | No |  |
| `version` | `int64_t` | No |  |
| `whiteListingBinRanges` | `char*` | No |  |
| `whiteListingUsed` | `bool` | No |  |

### Operations

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* device_build = bluefindecryptxp2pe_device_build(client, NULL);
voxgig_value* results = device_build->vt->list(device_build, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* device_build = bluefindecryptxp2pe_device_build(client, NULL);
voxgig_value* result = device_build->vt->load(device_build, cmap(1, "id", v_str("device_build_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `DeviceBuild` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## DeviceCustodyDetail

```c
Entity* device_custody_detail = bluefindecryptxp2pe_device_custody_detail(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `char*` | No |  |
| `created` | `char*` | No |  |
| `createdBy` | `voxgig_value* (map)` | Yes |  |
| `custodian` | `voxgig_value* (map)` | Yes |  |
| `device` | `voxgig_value* (map)` | No |  |
| `id` | `int64_t` | No |  |
| `location` | `voxgig_value* (map)` | Yes |  |
| `modified` | `char*` | No |  |
| `modifiedBy` | `voxgig_value* (map)` | Yes |  |
| `notes` | `char*` | No |  |
| `status` | `voxgig_value* (map)` | No |  |
| `transferMethod` | `voxgig_value* (map)` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* device_custody_detail = bluefindecryptxp2pe_device_custody_detail(client, NULL);
voxgig_value* result = device_custody_detail->vt->load(device_custody_detail, cmap(3, "id", v_str("device_custody_detail_id"), "device_type", v_str("device_type"), "serial_number", v_str("serial_number")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `DeviceCustodyDetail` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## DeviceCustodyList

```c
Entity* device_custody_list = bluefindecryptxp2pe_device_custody_list(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `char*` | No |  |
| `created` | `char*` | No |  |
| `createdBy` | `voxgig_value* (map)` | Yes |  |
| `custodian` | `voxgig_value* (map)` | Yes |  |
| `device` | `voxgig_value* (map)` | No |  |
| `id` | `int64_t` | No |  |
| `location` | `voxgig_value* (map)` | Yes |  |
| `modified` | `char*` | No |  |
| `modifiedBy` | `voxgig_value* (map)` | Yes |  |
| `notes` | `char*` | No |  |
| `status` | `voxgig_value* (map)` | No |  |
| `transferMethod` | `voxgig_value* (map)` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* device_custody_list = bluefindecryptxp2pe_device_custody_list(client, NULL);
voxgig_value* results = device_custody_list->vt->list(device_custody_list, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `DeviceCustodyList` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## DeviceList

```c
Entity* device_list = bluefindecryptxp2pe_device_list(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `voxgig_value* (list)` | No |  |
| `total` | `int64_t` | No |  |

### Operations

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* device_list = bluefindecryptxp2pe_device_list(client, NULL);
voxgig_value* result = device_list->vt->load(device_list, cmap(1, "share_partner_to", v_str("share_partner_to")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `DeviceList` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## DeviceReceiveResult

```c
Entity* device_receive_result = bluefindecryptxp2pe_device_receive_result(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* device_receive_result = bluefindecryptxp2pe_device_receive_result(client, NULL);
voxgig_value* result = device_receive_result->vt->create(device_receive_result, cmap(1,
    "success", v_bool(true))  // bool
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `DeviceReceiveResult` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## DeviceRkiActivateResult

```c
Entity* device_rki_activate_result = bluefindecryptxp2pe_device_rki_activate_result(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* device_rki_activate_result = bluefindecryptxp2pe_device_rki_activate_result(client, NULL);
voxgig_value* result = device_rki_activate_result->vt->create(device_rki_activate_result, cmap(1,
    "success", v_bool(true))  // bool
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `DeviceRkiActivateResult` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## DeviceState

```c
Entity* device_state = bluefindecryptxp2pe_device_state(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int64_t` | No |  |
| `name` | `char*` | No |  |

### Operations

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* device_state = bluefindecryptxp2pe_device_state(client, NULL);
voxgig_value* results = device_state->vt->list(device_state, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `DeviceState` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## DeviceType

```c
Entity* device_type = bluefindecryptxp2pe_device_type(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `char*` | No |  |
| `deviceTypeMode` | `char*` | No |  |
| `hardwareVersion` | `char*` | No |  |
| `id` | `char*` | No |  |
| `isActive` | `bool` | No |  |
| `manufacturer` | `char*` | No |  |
| `model` | `char*` | No |  |
| `modified` | `char*` | No |  |
| `name` | `char*` | No |  |
| `photoUrl` | `char*` | No |  |
| `productName` | `char*` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* device_type = bluefindecryptxp2pe_device_type(client, NULL);
voxgig_value* results = device_type->vt->list(device_type, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* device_type = bluefindecryptxp2pe_device_type(client, NULL);
voxgig_value* result = device_type->vt->load(device_type, cmap(1, "id", v_str("device_type_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `DeviceType` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## InjectKey

```c
Entity* inject_key = bluefindecryptxp2pe_inject_key(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `char*` | No |  |
| `id` | `char*` | No |  |
| `isActive` | `bool` | No |  |
| `isP2PE` | `bool` | No |  |
| `keyType` | `char*` | No |  |
| `modified` | `char*` | No |  |
| `name` | `char*` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* inject_key = bluefindecryptxp2pe_inject_key(client, NULL);
voxgig_value* results = inject_key->vt->list(inject_key, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* inject_key = bluefindecryptxp2pe_inject_key(client, NULL);
voxgig_value* result = inject_key->vt->load(inject_key, cmap(1, "id", v_str("inject_key_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `InjectKey` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Kif

```c
Entity* kif = bluefindecryptxp2pe_kif(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int64_t` | No |  |
| `name` | `char*` | No |  |

### Operations

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* kif = bluefindecryptxp2pe_kif(client, NULL);
voxgig_value* results = kif->vt->list(kif, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Kif` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Location

```c
Entity* location = bluefindecryptxp2pe_location(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address1` | `char*` | No |  |
| `address2` | `char*` | No |  |
| `billingId` | `char*` | No |  |
| `city` | `char*` | No |  |
| `country` | `char*` | No |  |
| `created` | `char*` | No |  |
| `customReference` | `char*` | No |  |
| `id` | `char*` | No |  |
| `locationType` | `char*` | No |  |
| `mailAddress1` | `char*` | No |  |
| `mailAddress2` | `char*` | No |  |
| `mailCity` | `char*` | No |  |
| `mailCountry` | `char*` | No |  |
| `mailPostalCode` | `char*` | No |  |
| `mailStateProvince` | `char*` | No |  |
| `modified` | `char*` | No |  |
| `name` | `char*` | No |  |
| `nameOfBusiness` | `char*` | No |  |
| `notes` | `char*` | No |  |
| `postalCode` | `char*` | No |  |
| `stateProvince` | `char*` | No |  |
| `uniqueId` | `char*` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* location = bluefindecryptxp2pe_location(client, NULL);
voxgig_value* result = location->vt->create(location, NULL, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* location = bluefindecryptxp2pe_location(client, NULL);
voxgig_value* results = location->vt->list(location, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* location = bluefindecryptxp2pe_location(client, NULL);
voxgig_value* result = location->vt->load(location, cmap(1, "id", v_str("location_id")), NULL, &err);
```

#### `vt->remove(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Remove the entity matching the given criteria. Sets `*err` on failure.

```c
Entity* location = bluefindecryptxp2pe_location(client, NULL);
voxgig_value* result = location->vt->remove(location, cmap(1, "id", v_str("location_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Location` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Partner

```c
Entity* partner = bluefindecryptxp2pe_partner(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `char*` | No |  |
| `clientCanOrderEquipment` | `bool` | No |  |
| `contact` | `voxgig_value* (map)` | No |  |
| `created` | `char*` | No |  |
| `id` | `char*` | No |  |
| `isActive` | `bool` | No |  |
| `location` | `voxgig_value* (map)` | Yes |  |
| `modified` | `char*` | No |  |
| `name` | `char*` | No |  |
| `parent` | `voxgig_value* (map)` | No |  |
| `partnerId` | `char*` | No |  |
| `reference` | `char*` | No |  |
| `verificationPhrase` | `char*` | No |  |
| `version` | `int64_t` | No |  |

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

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* partner = bluefindecryptxp2pe_partner(client, NULL);
voxgig_value* result = partner->vt->create(partner, cmap(1,
    "location", v_map())  // voxgig_value* (map)
, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* partner = bluefindecryptxp2pe_partner(client, NULL);
voxgig_value* results = partner->vt->list(partner, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* partner = bluefindecryptxp2pe_partner(client, NULL);
voxgig_value* result = partner->vt->load(partner, cmap(1, "id", v_str("partner_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Partner` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Shipment

```c
Entity* shipment = bluefindecryptxp2pe_shipment(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `char*` | No |  |
| `client` | `voxgig_value* (map)` | No |  |
| `created` | `char*` | No |  |
| `dateReceived` | `char*` | No |  |
| `dateShipped` | `char*` | No |  |
| `dcKif` | `voxgig_value* (map)` | No |  |
| `id` | `char*` | No |  |
| `items` | `voxgig_value* (list)` | No |  |
| `kif` | `voxgig_value* (map)` | No |  |
| `modified` | `char*` | No |  |
| `partner` | `voxgig_value* (map)` | No |  |
| `shipmentType` | `char*` | No |  |
| `tracking` | `char*` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* shipment = bluefindecryptxp2pe_shipment(client, NULL);
voxgig_value* result = shipment->vt->create(shipment, NULL, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* shipment = bluefindecryptxp2pe_shipment(client, NULL);
voxgig_value* results = shipment->vt->list(shipment, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* shipment = bluefindecryptxp2pe_shipment(client, NULL);
voxgig_value* result = shipment->vt->load(shipment, cmap(1, "id", v_str("shipment_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Shipment` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Success

```c
Entity* success = bluefindecryptxp2pe_success(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* success = bluefindecryptxp2pe_success(client, NULL);
voxgig_value* result = success->vt->create(success, cmap(1,
    "share_partner_to", v_str("example_share_partner_to"))  // char*
, NULL, &err);
```

#### `vt->remove(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Remove the entity matching the given criteria. Sets `*err` on failure.

```c
Entity* success = bluefindecryptxp2pe_success(client, NULL);
voxgig_value* result = success->vt->remove(success, cmap(1, "share_partner_to", v_str("share_partner_to")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Success` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Transaction

```c
Entity* transaction = bluefindecryptxp2pe_transaction(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternateKey` | `char*` | No |  |
| `client` | `voxgig_value* (map)` | No |  |
| `clientRef` | `char*` | No |  |
| `created` | `char*` | No |  |
| `decrypted` | `int64_t` | No |  |
| `deviceName` | `char*` | No |  |
| `directPartner` | `voxgig_value* (map)` | No |  |
| `encrypted` | `int64_t` | No |  |
| `endDate` | `char*` | No |  |
| `errCode` | `char*` | No |  |
| `errMessage` | `char*` | No |  |
| `id` | `char*` | No |  |
| `ipAddress` | `char*` | No |  |
| `isVirtual` | `bool` | No |  |
| `keyType` | `char*` | No |  |
| `location` | `voxgig_value* (map)` | Yes |  |
| `messageId` | `char*` | No |  |
| `method` | `char*` | No |  |
| `partner` | `voxgig_value* (map)` | No |  |
| `reference` | `char*` | No |  |
| `serialNumber` | `char*` | No |  |
| `startDate` | `char*` | No |  |
| `success` | `bool` | No |  |
| `transactionSource` | `char*` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* transaction = bluefindecryptxp2pe_transaction(client, NULL);
voxgig_value* result = transaction->vt->create(transaction, cmap(1,
    "location", v_map())  // voxgig_value* (map)
, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* transaction = bluefindecryptxp2pe_transaction(client, NULL);
voxgig_value* results = transaction->vt->list(transaction, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* transaction = bluefindecryptxp2pe_transaction(client, NULL);
voxgig_value* result = transaction->vt->load(transaction, cmap(1, "id", v_str("transaction_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Transaction` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## UpdateResult

```c
Entity* update_result = bluefindecryptxp2pe_update_result(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `voxgig_value* (map)` | No |  |
| `email` | `char*` | No |  |
| `firstName` | `char*` | No |  |
| `id` | `char*` | No |  |
| `isActive` | `bool` | No |  |
| `kif` | `voxgig_value* (map)` | No |  |
| `lastName` | `char*` | No |  |
| `partner` | `voxgig_value* (map)` | No |  |
| `phone` | `char*` | No |  |
| `userName` | `char*` | No |  |
| `userRole` | `voxgig_value* (map)` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* update_result = bluefindecryptxp2pe_update_result(client, NULL);
voxgig_value* result = update_result->vt->create(update_result, NULL, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* update_result = bluefindecryptxp2pe_update_result(client, NULL);
voxgig_value* results = update_result->vt->list(update_result, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->update(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Update an existing entity. The data must include the entity id. Returns the updated entity data.

```c
Entity* update_result = bluefindecryptxp2pe_update_result(client, NULL);
voxgig_value* result = update_result->vt->update(update_result, cmap(1, "id", v_str("id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `UpdateResult` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## User

```c
Entity* user = bluefindecryptxp2pe_user(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `voxgig_value* (map)` | No |  |
| `created` | `char*` | No |  |
| `email` | `char*` | No |  |
| `firstName` | `char*` | No |  |
| `id` | `char*` | No |  |
| `isActive` | `bool` | No |  |
| `kif` | `voxgig_value* (map)` | No |  |
| `lastName` | `char*` | No |  |
| `modified` | `char*` | No |  |
| `partner` | `voxgig_value* (map)` | No |  |
| `phone` | `char*` | No |  |
| `userName` | `char*` | No |  |
| `userRole` | `voxgig_value* (map)` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* user = bluefindecryptxp2pe_user(client, NULL);
voxgig_value* result = user->vt->load(user, cmap(1, "id", v_str("user_id")), NULL, &err);
```

#### `vt->remove(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Remove the entity matching the given criteria. Sets `*err` on failure.

```c
Entity* user = bluefindecryptxp2pe_user(client, NULL);
voxgig_value* result = user->vt->remove(user, cmap(1, "id", v_str("user_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `User` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```c
BluefinDecryptxP2peSDK* client = bluefindecryptxp2pe_sdk_new(cmap(1,
    "feature", cmap(1,
        "test", cmap(1, "active", v_bool(true)))
));
```


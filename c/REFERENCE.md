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
| `client` | `voxgig_value* (map)` | No | Reference to the associated Client resource. |
| `completeDate` | `char*` | No | The date and time that the Attestation took place. |
| `created` | `char*` | No | Creation timestamp in ISO 8601 format. |
| `device` | `voxgig_value* (map)` | No | Reference to the associated Device resource. |
| `id` | `char*` | No | This resource's unique identifier. |
| `name` | `char*` | No | Text describing the attestation. |
| `notes` | `char*` | No | Free form field that allows the Client associate notes with the Attestation. |

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
| `contact` | `voxgig_value* (map)` | No | Reference to the associated User resource. |
| `created` | `char*` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `id` | `char*` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Client account is active or disabled. |
| `location` | `voxgig_value* (map)` | Yes | Reference to the associated Location resource. |
| `mid` | `char*` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `char*` | No | Last modified timestamp. |
| `name` | `char*` | No | The Client's name. |
| `partner` | `voxgig_value* (map)` | No | Reference to the Client's root Partner. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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
| `success` | `bool` | No | true if the payload decryption was successful. |

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
| `activatedBy` | `voxgig_value* (map)` | Yes | Reference to the associated User resource. |
| `activationDate` | `char*` | No | Timestamp from when the Device was activated. |
| `alternateKey` | `char*` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `char*` | No | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `char*` | No | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `voxgig_value* (map)` | No | Reference to the associated Client resource. |
| `created` | `char*` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `voxgig_value* (map)` | Yes | Reference to the associated User resource. |
| `deviceBuild` | `voxgig_value* (map)` | No | Reference to the associated Device Build resource. |
| `deviceState` | `voxgig_value* (map)` | No | Reference to the associated Device State resource. |
| `deviceType` | `voxgig_value* (map)` | No | Reference to the associated Device Type resource. |
| `errorCounter` | `int64_t` | No | The number times the Device has been in error. |
| `errorLastDate` | `char*` | No | Timestamp from the last time that the Device had an error. |
| `id` | `char*` | No | The Device's unique identifier. |
| `initializedBy` | `voxgig_value* (map)` | Yes | Reference to the associated User resource. |
| `initializedDate` | `char*` | No | Timestamp from when the Device was initialized. |
| `injectKey` | `voxgig_value* (map)` | No | Reference to the associated Device resource. |
| `isVirtual` | `bool` | No | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `voxgig_value* (map)` | No | Reference to the associated KIF resource. |
| `lastActivityDate` | `char*` | No | Timestamp from the last time that the Device was used. |
| `location` | `voxgig_value* (map)` | Yes | Reference to the associated Location resource. |
| `modified` | `char*` | No | Last modified timestamp. |
| `modifiedBy` | `voxgig_value* (map)` | Yes | Reference to the associated User resource. |
| `name` | `char*` | No | The Device's name. |
| `notes` | `char*` | No | Arbitary note that can be attached to a Device entry. |
| `partner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `serialNumber` | `char*` | No | The Device's serial number. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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
| `appVersion` | `char*` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `char*` | No | The Build Number. |
| `configFileName` | `char*` | No | The name of the configuration file that is uploaded to the device. |
| `created` | `char*` | No | Creation timestamp in ISO 8601 format. |
| `deviceType` | `char*` | No | The Device Type Name. |
| `firmwareVersion` | `char*` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `char*` | No | A list of hardware versions that this Device Build covers. |
| `id` | `int64_t` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `char*` | No | Last modified timestamp. |
| `name` | `char*` | No | The Device Builds's name. |
| `notes` | `char*` | No | Notes attached to the device build by Bluefin CISO. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `char*` | No | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `bool` | No | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

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
| `completeDate` | `char*` | No | The date and time that the Custody change took place. |
| `created` | `char*` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `voxgig_value* (map)` | Yes | Reference to the associated User resource. |
| `custodian` | `voxgig_value* (map)` | Yes | Reference to the associated User resource. |
| `device` | `voxgig_value* (map)` | No | Reference to the associated Device resource. |
| `id` | `int64_t` | No | This resource's unique identifier. |
| `location` | `voxgig_value* (map)` | Yes | Reference to the associated Location resource. |
| `modified` | `char*` | No | Last modified timestamp. |
| `modifiedBy` | `voxgig_value* (map)` | Yes | Reference to the associated User resource. |
| `notes` | `char*` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `voxgig_value* (map)` | No | Reference to the associated Custody Status. |
| `transferMethod` | `voxgig_value* (map)` | No | Reference to the associated Transfer Method. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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
| `completeDate` | `char*` | No | The date and time that the Custody change took place. |
| `created` | `char*` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `voxgig_value* (map)` | Yes | Reference to the associated User resource. |
| `custodian` | `voxgig_value* (map)` | Yes | Reference to the associated User resource. |
| `device` | `voxgig_value* (map)` | No | Reference to the associated Device resource. |
| `id` | `int64_t` | No | This resource's unique identifier. |
| `location` | `voxgig_value* (map)` | Yes | Reference to the associated Location resource. |
| `modified` | `char*` | No | Last modified timestamp. |
| `modifiedBy` | `voxgig_value* (map)` | Yes | Reference to the associated User resource. |
| `notes` | `char*` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `voxgig_value* (map)` | No | Reference to the associated Custody Status. |
| `transferMethod` | `voxgig_value* (map)` | No | Reference to the associated Transfer Method. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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
| `data` | `voxgig_value* (list)` | No | List of Devices. |
| `total` | `int64_t` | No | Total number of Devices available (not the number of Users in the response). |

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
| `success` | `bool` | Yes | Indicates if the action succeeded. |

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
| `success` | `bool` | Yes | Indicates if the RKI activation succeeded. |

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
| `id` | `int64_t` | No | Unique identifier for this Device state. |
| `name` | `char*` | No | Descriptive name for this Device state. |

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
| `created` | `char*` | No | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `char*` | No | The Device type. |
| `hardwareVersion` | `char*` | No | The Device hardware version. |
| `id` | `char*` | No | Unique idenifier. |
| `isActive` | `bool` | No | This property indicates if the DeviceType is active. |
| `manufacturer` | `char*` | No | The Device manufacturer. |
| `model` | `char*` | No | The Device model. |
| `modified` | `char*` | No | Last modified timestamp. |
| `name` | `char*` | No | The DeviceType name. |
| `photoUrl` | `char*` | No |  |
| `productName` | `char*` | No | The Device name. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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
| `created` | `char*` | No | Creation timestamp in ISO 8601 format. |
| `id` | `char*` | No | unique idenifier |
| `isActive` | `bool` | No | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `bool` | No | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `char*` | No | The cipher type that the key works with. |
| `modified` | `char*` | No | Last modified timestamp in ISO 8601 format. |
| `name` | `char*` | No | Key name. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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
| `id` | `int64_t` | No | This resource's unique identifier. |
| `name` | `char*` | No | The KIF's name. |

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
| `address1` | `char*` | No | The Location's street address. |
| `address2` | `char*` | No | The Location's street address. |
| `billingId` | `char*` | No | \? |
| `city` | `char*` | No | The Location's city. |
| `country` | `char*` | No | The Location's country. |
| `created` | `char*` | No | Creation timestamp in ISO 8601 format. |
| `customReference` | `char*` | No | A Partner specified reference for a location. |
| `id` | `char*` | No | This resource's unique identifier. |
| `locationType` | `char*` | No | The Location's clasification. |
| `mailAddress1` | `char*` | No | The Location's street address. |
| `mailAddress2` | `char*` | No | The Location's street address. |
| `mailCity` | `char*` | No | The Location's city. |
| `mailCountry` | `char*` | No | The Location's street address. |
| `mailPostalCode` | `char*` | No | The Location's postal code. |
| `mailStateProvince` | `char*` | No | The Location's street state or province. |
| `modified` | `char*` | No | Last modified timestamp. |
| `name` | `char*` | No | The Location's name. |
| `nameOfBusiness` | `char*` | No | The name of the business at this location. |
| `notes` | `char*` | No | Note for delivery driver. |
| `postalCode` | `char*` | No | The Location's postal code. |
| `stateProvince` | `char*` | No | The Location's street state or province. |
| `uniqueId` | `char*` | No | Unique Identifier for the Location. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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
| `billingId` | `char*` | No | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `bool` | No | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `voxgig_value* (map)` | No | Reference to the associated User resource. |
| `created` | `char*` | No | Creation timestamp in ISO 8601 format. |
| `id` | `char*` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Parter account is active or disabled. |
| `location` | `voxgig_value* (map)` | Yes | Reference to the associated Location resource. |
| `modified` | `char*` | No | Last modified timestamp. |
| `name` | `char*` | No | The Partner's name. |
| `parent` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `partnerId` | `char*` | No | The Partner's id. |
| `reference` | `char*` | No | The Partner's reference string. |
| `verificationPhrase` | `char*` | No | The verification phrase is a message that the Partner creates. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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
| `carrier` | `char*` | No | The name of the courier. |
| `client` | `voxgig_value* (map)` | No | Reference to the associated Client resource. |
| `created` | `char*` | No | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `char*` | No | The date and time that a package is recieved. |
| `dateShipped` | `char*` | No | The date and time that a package is shipped. |
| `dcKif` | `voxgig_value* (map)` | No | Reference to the associated KIF resource. |
| `id` | `char*` | No | This resource's unique identifier. |
| `items` | `voxgig_value* (list)` | No |  |
| `kif` | `voxgig_value* (map)` | No | Reference to the associated KIF resource. |
| `modified` | `char*` | No | Last modified timestamp. |
| `partner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `shipmentType` | `char*` | No | The type of shipment. |
| `tracking` | `char*` | No | The courier's tracking number. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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
| `success` | `bool` | No | Indicates if the action was a success. |

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
| `alternateKey` | `char*` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `voxgig_value* (map)` | No | Reference to the associated Client resource. |
| `clientRef` | `char*` | No | Client Reference property that is included in the decrypt API call. |
| `created` | `char*` | No | Creation timestamp in ISO 8601 format. |
| `decrypted` | `int64_t` | No | A Transcation can process muliple decryptions. |
| `deviceName` | `char*` | No | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `encrypted` | `int64_t` | No | A Transcation can process muliple encryptions. |
| `endDate` | `char*` | No | Timestamp from the end of the transaction. |
| `errCode` | `char*` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `char*` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `char*` | No | This resource's unique identifier. |
| `ipAddress` | `char*` | No | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `bool` | No | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `char*` | No | The type of cipher used during decrytion. |
| `location` | `voxgig_value* (map)` | Yes | Reference to the associated Location resource. |
| `messageId` | `char*` | No | Message ID. |
| `method` | `char*` | No | The decryption cypher/method. |
| `partner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `reference` | `char*` | No | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `char*` | No | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `char*` | No | Timestamp from the beginning of the transaction. |
| `success` | `bool` | No | The success indicator. |
| `transactionSource` | `char*` | No | The source of the Transaction. |

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
| `client` | `voxgig_value* (map)` | No | Reference to the associated Client resource. |
| `email` | `char*` | No | The User's email address. |
| `firstName` | `char*` | No | The User's name. |
| `id` | `char*` | No | ID of newly created resource |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `kif` | `voxgig_value* (map)` | No | Reference to the associated KIF resource. |
| `lastName` | `char*` | No | The User's Surname. |
| `partner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `phone` | `char*` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `char*` | No | The User's unique username. |
| `userRole` | `voxgig_value* (map)` | No | Reference to the associated User Role. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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
| `client` | `voxgig_value* (map)` | No | Reference to the associated Client resource. |
| `created` | `char*` | No | Creation timestamp in ISO 8601 format. |
| `email` | `char*` | No | The User's email address. |
| `firstName` | `char*` | No | The User's name. |
| `id` | `char*` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `kif` | `voxgig_value* (map)` | No | Reference to the associated KIF resource. |
| `lastName` | `char*` | No | The User's Surname. |
| `modified` | `char*` | No | Last modified timestamp. |
| `partner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `phone` | `char*` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `char*` | No | The User's unique username. |
| `userRole` | `voxgig_value* (map)` | No | Reference to the associated User Role. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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

```c
BluefinDecryptxP2peSDK* client = bluefindecryptxp2pe_sdk_new(cmap(1,
    "feature", cmap(11,
        "audit", cmap(1, "active", v_bool(true)),
        "clienttrack", cmap(1, "active", v_bool(true)),
        "idempotency", cmap(1, "active", v_bool(true)),
        "log", cmap(1, "active", v_bool(true)),
        "metrics", cmap(1, "active", v_bool(true)),
        "paging", cmap(1, "active", v_bool(true)),
        "ratelimit", cmap(1, "active", v_bool(true)),
        "retry", cmap(1, "active", v_bool(true)),
        "telemetry", cmap(1, "active", v_bool(true)),
        "test", cmap(1, "active", v_bool(true)),
        "timeout", cmap(1, "active", v_bool(true)))
));
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


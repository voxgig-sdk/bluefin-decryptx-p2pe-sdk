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

#### `Entity* bluefindecryptxp2pe_device_custody_list_item(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `DeviceCustodyListItem` entity instance. Pass `NULL` for no initial
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

#### `Entity* bluefindecryptxp2pe_virtual_device(BluefinDecryptxP2peSDK* client, voxgig_value* entopts)`

Create a new `VirtualDevice` entity instance. Pass `NULL` for no initial
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
| `devices` | `voxgig_value* (list)` | Yes |  |
| `id` | `char*` | No | This resource's unique identifier. |
| `name` | `char*` | No | Text describing the attestation. |
| `notes` | `char*` | No | Free form field that allows the Client associate notes with the Attestation. |

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

#### `Entity* vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity, or `NULL` with `*err` set on failure.

```c
Entity* attestation = bluefindecryptxp2pe_attestation(client, NULL);
Entity* result = attestation->vt->create(attestation, cmap(1,
    "devices", v_list())  // voxgig_value* (list)
, NULL, &err);
```

#### `Entity** vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a `NULL`-terminated array of entities, one per record, or `NULL` with `*err` set on failure.

```c
Entity* attestation = bluefindecryptxp2pe_attestation(client, NULL);
Entity** results = attestation->vt->list(attestation, cmap(1, "client", v_str("example")), NULL, &err);
for (size_t i = 0; results && results[i]; i++) {
    printf("%s\n", voxgig_to_json(results[i]->vt->data(results[i], NULL)));
}
```

#### `Entity* vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity, whose record `vt->data` reads, or `NULL` with `*err` set on failure.

```c
Entity* attestation = bluefindecryptxp2pe_attestation(client, NULL);
Entity* result = attestation->vt->load(attestation, cmap(1, "id", v_str("attestation_id")), NULL, &err);
if (result) {
    printf("%s\n", voxgig_to_json(result->vt->data(result, NULL)));
}
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

#### `Entity* vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity, or `NULL` with `*err` set on failure.

```c
Entity* client = bluefindecryptxp2pe_client(client, NULL);
Entity* result = client->vt->create(client, cmap(1,
    "location", v_map())  // voxgig_value* (map)
, NULL, &err);
```

#### `Entity** vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a `NULL`-terminated array of entities, one per record, or `NULL` with `*err` set on failure.

```c
Entity* client = bluefindecryptxp2pe_client(client, NULL);
Entity** results = client->vt->list(client, cmap(1, "partner", v_str("example")), NULL, &err);
for (size_t i = 0; results && results[i]; i++) {
    printf("%s\n", voxgig_to_json(results[i]->vt->data(results[i], NULL)));
}
```

#### `Entity* vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity, whose record `vt->data` reads, or `NULL` with `*err` set on failure.

```c
Entity* client = bluefindecryptxp2pe_client(client, NULL);
Entity* result = client->vt->load(client, cmap(1, "id", v_str("client_id")), NULL, &err);
if (result) {
    printf("%s\n", voxgig_to_json(result->vt->data(result, NULL)));
}
```

#### `Entity* vt->remove(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Remove the entity matching the given criteria. Returns the entity, marked as deleted, or `NULL` with `*err` set on failure.

```c
Entity* client = bluefindecryptxp2pe_client(client, NULL);
Entity* result = client->vt->remove(client, cmap(1, "id", v_str("client_id")), NULL, &err);
if (result) {
    printf("%s\n", voxgig_to_json(result->vt->data(result, NULL)));
}
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

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `char*` | No | The date and time that the Custody change took place. |
| `custodian` | `voxgig_value* (map)` | Yes | Reference to the associated User resource. |
| `location` | `voxgig_value* (map)` | Yes | Reference to the associated Location resource. |
| `notes` | `char*` | No | Free form field that allows the Client associate notes with the Custody Change. |

### Operations

#### `Entity* vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity, or `NULL` with `*err` set on failure.

```c
Entity* create_result = bluefindecryptxp2pe_create_result(client, NULL);
Entity* result = create_result->vt->create(create_result, cmap(4,
    "device_type", v_str("example_device_type"),  // char*
    "serial_number", v_str("example_serial_number"),  // char*
    "custodian", v_map(),  // voxgig_value* (map)
    "location", v_map())  // voxgig_value* (map)
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
| `cbcVector` | `char*` | No | Base64 or hex encoded initial vector obtained from device. |
| `deviceType` | `char*` | Yes | The device Type. |
| `encoding` | `char*` | No | The payload encoding |
| `encrypted` | `voxgig_value* (list)` | Yes |  |
| `hasCcData` | `char*` | No | Validation flag that indicates whether inbound and outbound data should be checked for credit card numbers. |
| `reference` | `char*` | No | A string (of up to 50 characters) that helps partners identify individual API calls. |
| `sequenceNumber` | `char*` | No | Sequence number obtained from device in base 64 or hex encoded format. |
| `serialNumber` | `char*` | Yes | The serial number of the device. |
| `success` | `bool` | No | true if the payload decryption was successful. |

### Operations

#### `Entity* vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity, or `NULL` with `*err` set on failure.

```c
Entity* decryption = bluefindecryptxp2pe_decryption(client, NULL);
Entity* result = decryption->vt->create(decryption, cmap(3,
    "deviceType", v_str("example_deviceType"),  // char*
    "encrypted", v_list(),  // voxgig_value* (list)
    "serialNumber", v_str("example_serialNumber"))  // char*
, NULL, &err);
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

#### `Entity* vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity, or `NULL` with `*err` set on failure.

```c
Entity* device = bluefindecryptxp2pe_device(client, NULL);
Entity* result = device->vt->create(device, cmap(5,
    "activatedBy", v_map(),  // voxgig_value* (map)
    "createdBy", v_map(),  // voxgig_value* (map)
    "initializedBy", v_map(),  // voxgig_value* (map)
    "location", v_map(),  // voxgig_value* (map)
    "modifiedBy", v_map())  // voxgig_value* (map)
, NULL, &err);
```

#### `Entity** vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a `NULL`-terminated array of entities, one per record, or `NULL` with `*err` set on failure.

```c
Entity* device = bluefindecryptxp2pe_device(client, NULL);
Entity** results = device->vt->list(device, NULL, NULL, &err);
for (size_t i = 0; results && results[i]; i++) {
    printf("%s\n", voxgig_to_json(results[i]->vt->data(results[i], NULL)));
}
```

#### `Entity* vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity, whose record `vt->data` reads, or `NULL` with `*err` set on failure.

```c
Entity* device = bluefindecryptxp2pe_device(client, NULL);
Entity* result = device->vt->load(device, cmap(1, "id", v_str("device_id")), NULL, &err);
if (result) {
    printf("%s\n", voxgig_to_json(result->vt->data(result, NULL)));
}
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

#### `Entity** vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a `NULL`-terminated array of entities, one per record, or `NULL` with `*err` set on failure.

```c
Entity* device_build = bluefindecryptxp2pe_device_build(client, NULL);
Entity** results = device_build->vt->list(device_build, NULL, NULL, &err);
for (size_t i = 0; results && results[i]; i++) {
    printf("%s\n", voxgig_to_json(results[i]->vt->data(results[i], NULL)));
}
```

#### `Entity* vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity, whose record `vt->data` reads, or `NULL` with `*err` set on failure.

```c
Entity* device_build = bluefindecryptxp2pe_device_build(client, NULL);
Entity* result = device_build->vt->load(device_build, cmap(1, "id", v_str("device_build_id")), NULL, &err);
if (result) {
    printf("%s\n", voxgig_to_json(result->vt->data(result, NULL)));
}
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

#### `Entity* vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity, whose record `vt->data` reads, or `NULL` with `*err` set on failure.

```c
Entity* device_custody_detail = bluefindecryptxp2pe_device_custody_detail(client, NULL);
Entity* result = device_custody_detail->vt->load(device_custody_detail, cmap(3, "id", v_str("device_custody_detail_id"), "device_type", v_str("device_type"), "serial_number", v_str("serial_number")), NULL, &err);
if (result) {
    printf("%s\n", voxgig_to_json(result->vt->data(result, NULL)));
}
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

## DeviceCustodyListItem

```c
Entity* device_custody_list_item = bluefindecryptxp2pe_device_custody_list_item(client, NULL);
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

#### `Entity** vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a `NULL`-terminated array of entities, one per record, or `NULL` with `*err` set on failure.

```c
Entity* device_custody_list_item = bluefindecryptxp2pe_device_custody_list_item(client, NULL);
Entity** results = device_custody_list_item->vt->list(device_custody_list_item, cmap(2, "device_type", v_str("example"), "serial_number", v_str("example")), NULL, &err);
for (size_t i = 0; results && results[i]; i++) {
    printf("%s\n", voxgig_to_json(results[i]->vt->data(results[i], NULL)));
}
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `DeviceCustodyListItem` entity instance with the same options.

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
| `serialNumber` | `char*` | Yes | The serial number of the Device that is shipped. |
| `success` | `bool` | Yes | Indicates if the action succeeded. |
| `tamperLabel` | `char*` | Yes | The code that is printed the tamper label of the Device that is shipped. |

### Operations

#### `Entity* vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity, or `NULL` with `*err` set on failure.

```c
Entity* device_receive_result = bluefindecryptxp2pe_device_receive_result(client, NULL);
Entity* result = device_receive_result->vt->create(device_receive_result, cmap(3,
    "serialNumber", v_str("example_serialNumber"),  // char*
    "success", v_bool(true),  // bool
    "tamperLabel", v_str("example_tamperLabel"))  // char*
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
| `appVersion` | `char*` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildName` | `char*` | No | The Device Builds's name. |
| `buildNumber` | `char*` | No | The Build Number. |
| `configFile` | `char*` | No | \? |
| `firmwareVersion` | `char*` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `char*` | No | A list of hardware versions that this Device Build covers. |
| `serialNumber` | `char*` | Yes | The referenced Device's serial number. |
| `success` | `bool` | Yes | Indicates if the RKI activation succeeded. |
| `whiteListingBinRanges` | `char*` | No | \? |

### Operations

#### `Entity* vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity, or `NULL` with `*err` set on failure.

```c
Entity* device_rki_activate_result = bluefindecryptxp2pe_device_rki_activate_result(client, NULL);
Entity* result = device_rki_activate_result->vt->create(device_rki_activate_result, cmap(2,
    "serialNumber", v_str("example_serialNumber"),  // char*
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

#### `Entity** vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a `NULL`-terminated array of entities, one per record, or `NULL` with `*err` set on failure.

```c
Entity* device_state = bluefindecryptxp2pe_device_state(client, NULL);
Entity** results = device_state->vt->list(device_state, NULL, NULL, &err);
for (size_t i = 0; results && results[i]; i++) {
    printf("%s\n", voxgig_to_json(results[i]->vt->data(results[i], NULL)));
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

#### `Entity** vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a `NULL`-terminated array of entities, one per record, or `NULL` with `*err` set on failure.

```c
Entity* device_type = bluefindecryptxp2pe_device_type(client, NULL);
Entity** results = device_type->vt->list(device_type, NULL, NULL, &err);
for (size_t i = 0; results && results[i]; i++) {
    printf("%s\n", voxgig_to_json(results[i]->vt->data(results[i], NULL)));
}
```

#### `Entity* vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity, whose record `vt->data` reads, or `NULL` with `*err` set on failure.

```c
Entity* device_type = bluefindecryptxp2pe_device_type(client, NULL);
Entity* result = device_type->vt->load(device_type, cmap(1, "id", v_str("device_type_id")), NULL, &err);
if (result) {
    printf("%s\n", voxgig_to_json(result->vt->data(result, NULL)));
}
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

#### `Entity** vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a `NULL`-terminated array of entities, one per record, or `NULL` with `*err` set on failure.

```c
Entity* inject_key = bluefindecryptxp2pe_inject_key(client, NULL);
Entity** results = inject_key->vt->list(inject_key, NULL, NULL, &err);
for (size_t i = 0; results && results[i]; i++) {
    printf("%s\n", voxgig_to_json(results[i]->vt->data(results[i], NULL)));
}
```

#### `Entity* vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity, whose record `vt->data` reads, or `NULL` with `*err` set on failure.

```c
Entity* inject_key = bluefindecryptxp2pe_inject_key(client, NULL);
Entity* result = inject_key->vt->load(inject_key, cmap(1, "id", v_str("inject_key_id")), NULL, &err);
if (result) {
    printf("%s\n", voxgig_to_json(result->vt->data(result, NULL)));
}
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

#### `Entity** vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a `NULL`-terminated array of entities, one per record, or `NULL` with `*err` set on failure.

```c
Entity* kif = bluefindecryptxp2pe_kif(client, NULL);
Entity** results = kif->vt->list(kif, NULL, NULL, &err);
for (size_t i = 0; results && results[i]; i++) {
    printf("%s\n", voxgig_to_json(results[i]->vt->data(results[i], NULL)));
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
| `client` | `voxgig_value* (map)` | No | Reference to the associated Client resource. |
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

#### `Entity* vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity, or `NULL` with `*err` set on failure.

```c
Entity* location = bluefindecryptxp2pe_location(client, NULL);
Entity* result = location->vt->create(location, NULL, NULL, &err);
```

#### `Entity** vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a `NULL`-terminated array of entities, one per record, or `NULL` with `*err` set on failure.

```c
Entity* location = bluefindecryptxp2pe_location(client, NULL);
Entity** results = location->vt->list(location, cmap(1, "client", v_str("example")), NULL, &err);
for (size_t i = 0; results && results[i]; i++) {
    printf("%s\n", voxgig_to_json(results[i]->vt->data(results[i], NULL)));
}
```

#### `Entity* vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity, whose record `vt->data` reads, or `NULL` with `*err` set on failure.

```c
Entity* location = bluefindecryptxp2pe_location(client, NULL);
Entity* result = location->vt->load(location, cmap(1, "id", v_str("location_id")), NULL, &err);
if (result) {
    printf("%s\n", voxgig_to_json(result->vt->data(result, NULL)));
}
```

#### `Entity* vt->remove(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Remove the entity matching the given criteria. Returns the entity, marked as deleted, or `NULL` with `*err` set on failure.

```c
Entity* location = bluefindecryptxp2pe_location(client, NULL);
Entity* result = location->vt->remove(location, cmap(1, "id", v_str("location_id")), NULL, &err);
if (result) {
    printf("%s\n", voxgig_to_json(result->vt->data(result, NULL)));
}
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

#### `Entity* vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity, or `NULL` with `*err` set on failure.

```c
Entity* partner = bluefindecryptxp2pe_partner(client, NULL);
Entity* result = partner->vt->create(partner, cmap(1,
    "location", v_map())  // voxgig_value* (map)
, NULL, &err);
```

#### `Entity** vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a `NULL`-terminated array of entities, one per record, or `NULL` with `*err` set on failure.

```c
Entity* partner = bluefindecryptxp2pe_partner(client, NULL);
Entity** results = partner->vt->list(partner, NULL, NULL, &err);
for (size_t i = 0; results && results[i]; i++) {
    printf("%s\n", voxgig_to_json(results[i]->vt->data(results[i], NULL)));
}
```

#### `Entity* vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity, whose record `vt->data` reads, or `NULL` with `*err` set on failure.

```c
Entity* partner = bluefindecryptxp2pe_partner(client, NULL);
Entity* result = partner->vt->load(partner, cmap(1, "id", v_str("partner_id")), NULL, &err);
if (result) {
    printf("%s\n", voxgig_to_json(result->vt->data(result, NULL)));
}
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
| `location` | `voxgig_value* (map)` | Yes | Reference to the associated Location resource. |
| `modified` | `char*` | No | Last modified timestamp. |
| `partner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `shipmentType` | `char*` | No | The type of shipment. |
| `tracking` | `char*` | No | The courier's tracking number. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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

#### `Entity* vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity, or `NULL` with `*err` set on failure.

```c
Entity* shipment = bluefindecryptxp2pe_shipment(client, NULL);
Entity* result = shipment->vt->create(shipment, cmap(1,
    "location", v_map())  // voxgig_value* (map)
, NULL, &err);
```

#### `Entity** vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a `NULL`-terminated array of entities, one per record, or `NULL` with `*err` set on failure.

```c
Entity* shipment = bluefindecryptxp2pe_shipment(client, NULL);
Entity** results = shipment->vt->list(shipment, cmap(1, "kif", v_str("example")), NULL, &err);
for (size_t i = 0; results && results[i]; i++) {
    printf("%s\n", voxgig_to_json(results[i]->vt->data(results[i], NULL)));
}
```

#### `Entity* vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity, whose record `vt->data` reads, or `NULL` with `*err` set on failure.

```c
Entity* shipment = bluefindecryptxp2pe_shipment(client, NULL);
Entity* result = shipment->vt->load(shipment, cmap(1, "id", v_str("shipment_id")), NULL, &err);
if (result) {
    printf("%s\n", voxgig_to_json(result->vt->data(result, NULL)));
}
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
| `devices` | `voxgig_value* (list)` | Yes | An array of Device ids to share with partner. |
| `sharePartnerFrom` | `voxgig_value* (map)` | Yes | Reference to the associated Partner. |
| `success` | `bool` | No | Indicates if the action was a success. |

### Operations

#### `Entity* vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity, or `NULL` with `*err` set on failure.

```c
Entity* success = bluefindecryptxp2pe_success(client, NULL);
Entity* result = success->vt->create(success, cmap(3,
    "share_partner_to", v_str("example_share_partner_to"),  // char*
    "devices", v_list(),  // voxgig_value* (list)
    "sharePartnerFrom", v_map())  // voxgig_value* (map)
, NULL, &err);
```

#### `Entity* vt->remove(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Remove the entity matching the given criteria. Returns the entity, marked as deleted, or `NULL` with `*err` set on failure.

```c
Entity* success = bluefindecryptxp2pe_success(client, NULL);
Entity* result = success->vt->remove(success, cmap(1, "share_partner_to", v_str("share_partner_to")), NULL, &err);
if (result) {
    printf("%s\n", voxgig_to_json(result->vt->data(result, NULL)));
}
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
| `device` | `voxgig_value* (map)` | Yes | Reference to the associated Device resource. |
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

#### `Entity* vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity, or `NULL` with `*err` set on failure.

```c
Entity* transaction = bluefindecryptxp2pe_transaction(client, NULL);
Entity* result = transaction->vt->create(transaction, cmap(2,
    "device", v_map(),  // voxgig_value* (map)
    "location", v_map())  // voxgig_value* (map)
, NULL, &err);
```

#### `Entity** vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a `NULL`-terminated array of entities, one per record, or `NULL` with `*err` set on failure.

```c
Entity* transaction = bluefindecryptxp2pe_transaction(client, NULL);
Entity** results = transaction->vt->list(transaction, NULL, NULL, &err);
for (size_t i = 0; results && results[i]; i++) {
    printf("%s\n", voxgig_to_json(results[i]->vt->data(results[i], NULL)));
}
```

#### `Entity* vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity, whose record `vt->data` reads, or `NULL` with `*err` set on failure.

```c
Entity* transaction = bluefindecryptxp2pe_transaction(client, NULL);
Entity* result = transaction->vt->load(transaction, cmap(1, "id", v_str("transaction_id")), NULL, &err);
if (result) {
    printf("%s\n", voxgig_to_json(result->vt->data(result, NULL)));
}
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
| `address1` | `char*` | No | The Location's street address. |
| `address2` | `char*` | No | The Location's street address. |
| `alternateKey` | `char*` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `char*` | No | Date and time that the Device is due its next PCI Audit. |
| `billingId` | `char*` | No | \? |
| `city` | `char*` | No | The Location's city. |
| `client` | `voxgig_value* (map)` | No | Reference to the associated Client resource. |
| `clientCanOrderEquipment` | `bool` | No | This property indicates if the Partner is allowed to order Equipment. |
| `clientRef` | `char*` | No | Client Reference property that is included in the decrypt API call. |
| `contact` | `voxgig_value* (map)` | Yes | Reference to the associated User resource. |
| `country` | `voxgig_value* (map)` | No | Reference to the associated Country. |
| `customReference` | `char*` | No | A Partner specified reference for a location. |
| `dateShipped` | `char*` | No | The date and time that a package is shipped. |
| `decrypted` | `int64_t` | No | A Transcation can process muliple decryptions. |
| `device` | `voxgig_value* (map)` | No | Reference to the associated Device resource. |
| `deviceBuild` | `voxgig_value* (map)` | No | Reference to the associated Device Build resource. |
| `deviceType` | `voxgig_value* (map)` | No | Reference to the associated Device Type resource. |
| `directPartner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `email` | `char*` | Yes | The User's email address. |
| `encrypted` | `int64_t` | No | A Transcation can process muliple encryptions. |
| `endDate` | `char*` | No | Timestamp from the end of the transaction. |
| `errCode` | `char*` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `char*` | No | The error messge that is sent in response to a failed decrypt API call. |
| `firstName` | `char*` | Yes | The User's name. |
| `id` | `char*` | No | ID of newly created resource |
| `injectKey` | `voxgig_value* (map)` | No | Reference to the associated Device resource. |
| `ipAddress` | `char*` | No | The IP address of the http client that makes the decrypt API call. |
| `isActive` | `bool` | Yes | This property indicates if the User account is active or disabled. |
| `items` | `voxgig_value* (list)` | No |  |
| `keyType` | `char*` | No | The type of cipher used during decrytion. |
| `kif` | `voxgig_value* (map)` | No | Reference to the associated KIF resource. |
| `lastName` | `char*` | Yes | The User's Surname. |
| `location` | `voxgig_value* (map)` | Yes | Reference to the associated Location resource. |
| `locationType` | `char*` | No | The Location's clasification. |
| `mailAddress1` | `char*` | No | The Location's street address. |
| `mailAddress2` | `char*` | No | The Location's street address. |
| `mailCity` | `char*` | No | The Location's city. |
| `mailCountry` | `char*` | No | The Location's street address. |
| `mailPostalCode` | `char*` | No | The Location's postal code. |
| `mailStateProvince` | `char*` | No | The Location's street state or province. |
| `messageId` | `char*` | No | Message ID. |
| `method` | `char*` | No | The decryption cypher/method. |
| `mid` | `char*` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `char*` | No | The Client's name. |
| `nameOfBusiness` | `char*` | No | The name of the business at this location. |
| `notes` | `char*` | No | Arbitary note that can be attached to a Device entry. |
| `parent` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `partner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `partnerId` | `char*` | No | The Partner's id. |
| `phone` | `char*` | Yes | The User's phone number without dashes, spaces, or brackets. |
| `postalCode` | `char*` | No | The Location's postal code. |
| `reference` | `char*` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | No | If this property is set to '*true*' the newly created user will be sent a welcome email. |
| `serialNumber` | `char*` | No | The Device's serial number. |
| `startDate` | `char*` | No | Timestamp from the beginning of the transaction. |
| `stateProvince` | `char*` | No | The Location's street state or province. |
| `success` | `bool` | No | The success indicator. |
| `tracking` | `char*` | No | The courier's tracking number. |
| `uniqueId` | `char*` | No | Unique Identifier for the Location. |
| `userName` | `char*` | Yes | The User's unique username. |
| `userRole` | `voxgig_value* (map)` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `char*` | No | The verification phrase is a message that the Partner creates. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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

#### `Entity* vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity, or `NULL` with `*err` set on failure.

```c
Entity* update_result = bluefindecryptxp2pe_update_result(client, NULL);
Entity* result = update_result->vt->create(update_result, cmap(9,
    "contact", v_map(),  // voxgig_value* (map)
    "email", v_str("example_email"),  // char*
    "firstName", v_str("example_firstName"),  // char*
    "isActive", v_bool(true),  // bool
    "lastName", v_str("example_lastName"),  // char*
    "location", v_map(),  // voxgig_value* (map)
    "phone", v_str("example_phone"),  // char*
    "userName", v_str("example_userName"),  // char*
    "userRole", v_map())  // voxgig_value* (map)
, NULL, &err);
```

#### `Entity** vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a `NULL`-terminated array of entities, one per record, or `NULL` with `*err` set on failure.

```c
Entity* update_result = bluefindecryptxp2pe_update_result(client, NULL);
Entity** results = update_result->vt->list(update_result, NULL, NULL, &err);
for (size_t i = 0; results && results[i]; i++) {
    printf("%s\n", voxgig_to_json(results[i]->vt->data(results[i], NULL)));
}
```

#### `Entity* vt->update(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Update an existing entity. The data must include the entity id. Returns the updated entity, or `NULL` with `*err` set on failure.

```c
Entity* update_result = bluefindecryptxp2pe_update_result(client, NULL);
Entity* result = update_result->vt->update(update_result, cmap(1, "id", v_str("id")), NULL, &err);
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

#### `Entity* vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity, whose record `vt->data` reads, or `NULL` with `*err` set on failure.

```c
Entity* user = bluefindecryptxp2pe_user(client, NULL);
Entity* result = user->vt->load(user, cmap(1, "id", v_str("user_id")), NULL, &err);
if (result) {
    printf("%s\n", voxgig_to_json(result->vt->data(result, NULL)));
}
```

#### `Entity* vt->remove(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Remove the entity matching the given criteria. Returns the entity, marked as deleted, or `NULL` with `*err` set on failure.

```c
Entity* user = bluefindecryptxp2pe_user(client, NULL);
Entity* result = user->vt->remove(user, cmap(1, "id", v_str("user_id")), NULL, &err);
if (result) {
    printf("%s\n", voxgig_to_json(result->vt->data(result, NULL)));
}
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

## VirtualDevice

```c
Entity* virtual_device = bluefindecryptxp2pe_virtual_device(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `voxgig_value* (list)` | No | List of Devices. |
| `id` | `char*` | No |  |
| `total` | `int64_t` | No | Total number of Devices available (not the number of Users in the response). |

### Operations

#### `Entity* vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity, whose record `vt->data` reads, or `NULL` with `*err` set on failure.

```c
Entity* virtual_device = bluefindecryptxp2pe_virtual_device(client, NULL);
Entity* result = virtual_device->vt->load(virtual_device, cmap(1, "id", v_str("virtual_device_id")), NULL, &err);
if (result) {
    printf("%s\n", voxgig_to_json(result->vt->data(result, NULL)));
}
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `VirtualDevice` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

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

```c
BluefinDecryptxP2peSDK* client = bluefindecryptxp2pe_sdk_new(cmap(1,
    "feature", cmap(12,
        "audit", cmap(1, "active", v_bool(true)),
        "clienttrack", cmap(1, "active", v_bool(true)),
        "debug", cmap(1, "active", v_bool(true)),
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


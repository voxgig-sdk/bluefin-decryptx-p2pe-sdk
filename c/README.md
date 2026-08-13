# BluefinDecryptxP2pe C SDK



The C SDK for the BluefinDecryptxP2pe API — an entity-oriented client following idiomatic C conventions (explicit structs, function-pointer vtables, and a trailing `PNError**` out-param for errors).

The SDK exposes the API as capitalised, semantic **Entities** — for example `bluefindecryptxp2pe_attestation(client, NULL)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
C has no central package registry — a release is the git tag
(`c/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)). Build from a
source checkout with the bundled `Makefile`; the voxgig struct library is
vendored under `utility/struct`, so there are no external dependencies to
fetch:

```bash
cd c && make          # builds libsdk.a
cd c && make test     # builds + runs the test binaries
```

Link your program against `libsdk.a` and include `core/api.h`:

```bash
cc -I c/core -I c/utility/struct \
   myapp.c c/libsdk.a -lm -o myapp
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```c
#include "core/api.h"

BluefinDecryptxP2peSDK* client = bluefindecryptxp2pe_sdk_new(cmap(1,
    "apikey", v_str(getenv("BLUEFIN_DECRYPTX_P2PE_APIKEY"))));
PNError* err = NULL;
```

### 2. List attestation records

`list()` returns a List of records and sets `*err` on failure — check
`err` after the call.

```c
Entity* attestation = bluefindecryptxp2pe_attestation(client, NULL);
voxgig_value* attestations = attestation->vt->list(attestation, NULL, NULL, &err);
if (err) {
    fprintf(stderr, "list failed: %s\n", err->msg);
} else {
    for (size_t i = 0; i < (size_t)voxgig_size(attestations); i++) {
        printf("%s\n", voxgig_to_json(voxgig_getelem(attestations, v_int(i), NULL)));
    }
}
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`load()` returns the bare record and sets `*err` on failure.

```c
Entity* device_custody_detail = bluefindecryptxp2pe_device_custody_detail(client, NULL);
voxgig_value* device_custody_detail_rec = device_custody_detail->vt->load(device_custody_detail, cmap(3, "device_type", v_str("example_device_type"), "serial_number", v_str("example_serial_number"), "id", v_str("example_id")), NULL, &err);
if (err) {
    fprintf(stderr, "load failed: %s\n", err->msg);
} else {
    printf("%s\n", voxgig_to_json(device_custody_detail_rec));
}
```

### 4. Create, update, and remove

```c
// Create — returns the bare created record
voxgig_value* created = attestation->vt->create(attestation, cmap(2, "client", v_map(), "completeDate", v_str("example_completeDate")), NULL, &err);

```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const devicetypes = await client.DeviceType().list()
  console.log(devicetypes)
} catch (err) {
  console.error('list failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity operations:

```c
PNError* err = NULL;
voxgig_value* result = sdk_direct(client, cmap(3,
    "path", v_str("/api/resource/{id}"),
    "method", v_str("GET"),
    "params", cmap(1, "id", v_str("example"))), &err);

if (voxgig_as_bool(getp(result, "ok"))) {
    printf("%lld\n", (long long)to_int(getp(result, "status")));  // 200
    printf("%s\n", voxgig_to_json(getp(result, "data")));         // response body
} else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present.
    printf("%s\n", voxgig_to_json(getp(result, "err")));
}
```

`sdk_direct()` never sets `*err` for a non-2xx response — it always returns
a result map you branch on via `getp(result, "ok")`.

### Prepare a request without sending it

```c
PNError* err = NULL;
voxgig_value* fetchdef = sdk_prepare(client, cmap(3,
    "path", v_str("/api/resource/{id}"),
    "method", v_str("DELETE"),
    "params", cmap(1, "id", v_str("example"))), &err);

printf("%s\n", get_str(fetchdef, "url"));
printf("%s\n", get_str(fetchdef, "method"));
printf("%s\n", voxgig_to_json(getp(fetchdef, "headers")));
```

### Use test mode

Create a mock client for unit testing — no server required:

```c
BluefinDecryptxP2peSDK* client = test_sdk(NULL, NULL);
PNError* err = NULL;

// Entity ops return the bare record and set *err on failure.
Entity* device_type = bluefindecryptxp2pe_device_type(client, NULL);
voxgig_value* device_type_rec = device_type->vt->list(device_type, NULL, NULL, &err);
// device_type_rec contains the mock response record
```

### Use a custom fetch function

Replace the HTTP transport with your own function (the same shape the test
transport uses):

```c
static voxgig_value* mock_fetch(void* ud, voxgig_value* args) {
    (void)ud; (void)args;
    return cmap(4,
        "status", v_num(200),
        "statusText", v_str("OK"),
        "headers", v_map(),
        "json", json_thunk(cmap(1, "id", v_str("mock01"))));
}

BluefinDecryptxP2peSDK* client = bluefindecryptxp2pe_sdk_new(cmap(2,
    "base", v_str("http://localhost:8080"),
    "system", cmap(1, "fetch", vfn(mock_fetch, NULL))));
```

### Point at a different server

Override the base URL to reach a local or staging server:

```c
BluefinDecryptxP2peSDK* client = bluefindecryptxp2pe_sdk_new(cmap(1,
    "base", v_str("http://localhost:8080")));
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd c && make test
```


## Reference

### BluefinDecryptxP2peSDK

```c
#include "core/api.h"

BluefinDecryptxP2peSDK* client = bluefindecryptxp2pe_sdk_new(options);
```

Creates a new SDK client. `options` is a `voxgig_value*` map (`NULL` for
none) carrying any of the following keys:

| Option | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `system` | `map` | System overrides (e.g. a custom `fetch`). |

### test_sdk

```c
BluefinDecryptxP2peSDK* client = test_sdk(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`NULL`.

### BluefinDecryptxP2peSDK functions

| Function | Signature | Description |
| --- | --- | --- |
| `sdk_prepare` | `(BluefinDecryptxP2peSDK*, fetchargs, PNError**) -> voxgig_value*` | Build an HTTP request definition without sending. |
| `sdk_direct` | `(BluefinDecryptxP2peSDK*, fetchargs, PNError**) -> voxgig_value*` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `bluefindecryptxp2pe_attestation` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create an Attestation entity instance. |
| `bluefindecryptxp2pe_client` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a Client entity instance. |
| `bluefindecryptxp2pe_create_result` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a CreateResult entity instance. |
| `bluefindecryptxp2pe_decryption` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a Decryption entity instance. |
| `bluefindecryptxp2pe_device` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a Device entity instance. |
| `bluefindecryptxp2pe_device_build` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a DeviceBuild entity instance. |
| `bluefindecryptxp2pe_device_custody_detail` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a DeviceCustodyDetail entity instance. |
| `bluefindecryptxp2pe_device_custody_list` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a DeviceCustodyList entity instance. |
| `bluefindecryptxp2pe_device_list` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a DeviceList entity instance. |
| `bluefindecryptxp2pe_device_receive_result` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a DeviceReceiveResult entity instance. |
| `bluefindecryptxp2pe_device_rki_activate_result` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a DeviceRkiActivateResult entity instance. |
| `bluefindecryptxp2pe_device_state` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a DeviceState entity instance. |
| `bluefindecryptxp2pe_device_type` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a DeviceType entity instance. |
| `bluefindecryptxp2pe_inject_key` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create an InjectKey entity instance. |
| `bluefindecryptxp2pe_kif` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a Kif entity instance. |
| `bluefindecryptxp2pe_location` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a Location entity instance. |
| `bluefindecryptxp2pe_partner` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a Partner entity instance. |
| `bluefindecryptxp2pe_shipment` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a Shipment entity instance. |
| `bluefindecryptxp2pe_success` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a Success entity instance. |
| `bluefindecryptxp2pe_transaction` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create a Transaction entity instance. |
| `bluefindecryptxp2pe_update_result` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create an UpdateResult entity instance. |
| `bluefindecryptxp2pe_user` | `(BluefinDecryptxP2peSDK*, entopts) -> Entity*` | Create an User entity instance. |

### Entity interface (vtable)

All entities share the same `EntityVT` vtable, reached via `e->vt->...`.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(Entity*, reqmatch, ctrl, PNError**) -> voxgig_value*` | Load a single entity by match criteria. |
| `list` | `(Entity*, reqmatch, ctrl, PNError**) -> voxgig_value*` | List entities matching the criteria (a List). |
| `create` | `(Entity*, reqdata, ctrl, PNError**) -> voxgig_value*` | Create a new entity. |
| `update` | `(Entity*, reqdata, ctrl, PNError**) -> voxgig_value*` | Update an existing entity. |
| `remove` | `(Entity*, reqmatch, ctrl, PNError**) -> voxgig_value*` | Remove an entity. |
| `data` | `(Entity*, args) -> voxgig_value*` | Get entity data (pass a map to set). |
| `matchv` | `(Entity*, args) -> voxgig_value*` | Get entity match criteria (pass a map to set). |
| `make` | `(Entity*) -> Entity*` | Create a new instance with the same options. |
| `get_name` | `(Entity*) -> const char*` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `voxgig_value` map for
single-entity ops, a List for `list`) and set `*err` to a `PNError*` on
failure. Always initialise `PNError* err = NULL;` and check it after the
call.

The `sdk_direct()` escape hatch never sets `*err` for a non-2xx response —
it returns a result map you branch on via `getp(result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `number` | HTTP status code. |
| `headers` | `map` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `false` and `err` carries the error value.

### Entities

#### Attestation

| Field | Description |
| --- | --- |
| `client` |  |
| `completeDate` |  |
| `created` |  |
| `device` |  |
| `id` |  |
| `name` |  |
| `notes` |  |

Operations: Create, List, Load.

API path: `/attestations`

#### Client

| Field | Description |
| --- | --- |
| `contact` |  |
| `created` |  |
| `directPartner` |  |
| `id` |  |
| `isActive` |  |
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
| `activatedBy` |  |
| `activationDate` |  |
| `alternateKey` |  |
| `auditNextDate` |  |
| `auditNotificationDate` |  |
| `client` |  |
| `created` |  |
| `createdBy` |  |
| `deviceBuild` |  |
| `deviceState` |  |
| `deviceType` |  |
| `errorCounter` |  |
| `errorLastDate` |  |
| `id` |  |
| `initializedBy` |  |
| `initializedDate` |  |
| `injectKey` |  |
| `isVirtual` |  |
| `kif` |  |
| `lastActivityDate` |  |
| `location` |  |
| `modified` |  |
| `modifiedBy` |  |
| `name` |  |
| `notes` |  |
| `partner` |  |
| `serialNumber` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/devices`

#### DeviceBuild

| Field | Description |
| --- | --- |
| `appVersion` |  |
| `buildNumber` |  |
| `configFileName` |  |
| `created` |  |
| `deviceType` |  |
| `firmwareVersion` |  |
| `hardwareVersion` |  |
| `id` |  |
| `isActive` |  |
| `modified` |  |
| `name` |  |
| `notes` |  |
| `version` |  |
| `whiteListingBinRanges` |  |
| `whiteListingUsed` |  |

Operations: List, Load.

API path: `/deviceBuilds`

#### DeviceCustodyDetail

| Field | Description |
| --- | --- |
| `completeDate` |  |
| `created` |  |
| `createdBy` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modifiedBy` |  |
| `notes` |  |
| `status` |  |
| `transferMethod` |  |
| `version` |  |

Operations: Load.

API path: `/devices/{serialNumber}/{deviceType}/custody/{id}`

#### DeviceCustodyList

| Field | Description |
| --- | --- |
| `completeDate` |  |
| `created` |  |
| `createdBy` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modifiedBy` |  |
| `notes` |  |
| `status` |  |
| `transferMethod` |  |
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
| `deviceTypeMode` |  |
| `hardwareVersion` |  |
| `id` |  |
| `isActive` |  |
| `manufacturer` |  |
| `model` |  |
| `modified` |  |
| `name` |  |
| `photoUrl` |  |
| `productName` |  |
| `version` |  |

Operations: List, Load.

API path: `/deviceTypes`

#### InjectKey

| Field | Description |
| --- | --- |
| `created` |  |
| `id` |  |
| `isActive` |  |
| `isP2PE` |  |
| `keyType` |  |
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
| `billingId` |  |
| `city` |  |
| `country` |  |
| `created` |  |
| `customReference` |  |
| `id` |  |
| `locationType` |  |
| `mailAddress1` |  |
| `mailAddress2` |  |
| `mailCity` |  |
| `mailCountry` |  |
| `mailPostalCode` |  |
| `mailStateProvince` |  |
| `modified` |  |
| `name` |  |
| `nameOfBusiness` |  |
| `notes` |  |
| `postalCode` |  |
| `stateProvince` |  |
| `uniqueId` |  |
| `version` |  |

Operations: Create, List, Load, Remove.

API path: `/locations`

#### Partner

| Field | Description |
| --- | --- |
| `billingId` |  |
| `clientCanOrderEquipment` |  |
| `contact` |  |
| `created` |  |
| `id` |  |
| `isActive` |  |
| `location` |  |
| `modified` |  |
| `name` |  |
| `parent` |  |
| `partnerId` |  |
| `reference` |  |
| `verificationPhrase` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/partners`

#### Shipment

| Field | Description |
| --- | --- |
| `carrier` |  |
| `client` |  |
| `created` |  |
| `dateReceived` |  |
| `dateShipped` |  |
| `dcKif` |  |
| `id` |  |
| `items` |  |
| `kif` |  |
| `modified` |  |
| `partner` |  |
| `shipmentType` |  |
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
| `alternateKey` |  |
| `client` |  |
| `clientRef` |  |
| `created` |  |
| `decrypted` |  |
| `deviceName` |  |
| `directPartner` |  |
| `encrypted` |  |
| `endDate` |  |
| `errCode` |  |
| `errMessage` |  |
| `id` |  |
| `ipAddress` |  |
| `isVirtual` |  |
| `keyType` |  |
| `location` |  |
| `messageId` |  |
| `method` |  |
| `partner` |  |
| `reference` |  |
| `serialNumber` |  |
| `startDate` |  |
| `success` |  |
| `transactionSource` |  |

Operations: Create, List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `client` |  |
| `email` |  |
| `firstName` |  |
| `id` |  |
| `isActive` |  |
| `kif` |  |
| `lastName` |  |
| `partner` |  |
| `phone` |  |
| `userName` |  |
| `userRole` |  |
| `version` |  |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` |  |
| `created` |  |
| `email` |  |
| `firstName` |  |
| `id` |  |
| `isActive` |  |
| `kif` |  |
| `lastName` |  |
| `modified` |  |
| `partner` |  |
| `phone` |  |
| `userName` |  |
| `userRole` |  |
| `version` |  |

Operations: Load, Remove.

API path: `/users/{id}`



## Entities


### Attestation

Create an instance: `Entity* attestation = bluefindecryptxp2pe_attestation(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `voxgig_value* (map)` |  |
| `completeDate` | `char*` |  |
| `created` | `char*` |  |
| `device` | `voxgig_value* (map)` |  |
| `id` | `char*` |  |
| `name` | `char*` |  |
| `notes` | `char*` |  |

#### Example: Load

```c
Entity* attestation = bluefindecryptxp2pe_attestation(client, NULL);
voxgig_value* attestation_rec = attestation->vt->load(attestation, cmap(1, "id", v_str("attestation_id")), NULL, &err);
```

#### Example: List

```c
Entity* attestation = bluefindecryptxp2pe_attestation(client, NULL);
voxgig_value* attestations = attestation->vt->list(attestation, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* attestation = bluefindecryptxp2pe_attestation(client, NULL);
voxgig_value* attestation_rec = attestation->vt->create(attestation, NULL, NULL, &err);
```


### Client

Create an instance: `Entity* client = bluefindecryptxp2pe_client(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |
| `vt->remove(e, reqmatch, ctrl, &err)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `voxgig_value* (map)` |  |
| `created` | `char*` |  |
| `directPartner` | `voxgig_value* (map)` |  |
| `id` | `char*` |  |
| `isActive` | `bool` |  |
| `location` | `voxgig_value* (map)` |  |
| `mid` | `char*` |  |
| `modified` | `char*` |  |
| `name` | `char*` |  |
| `partner` | `voxgig_value* (map)` |  |
| `version` | `int64_t` |  |

#### Example: Load

```c
Entity* client = bluefindecryptxp2pe_client(client, NULL);
voxgig_value* client_rec = client->vt->load(client, cmap(1, "id", v_str("client_id")), NULL, &err);
```

#### Example: List

```c
Entity* client = bluefindecryptxp2pe_client(client, NULL);
voxgig_value* clients = client->vt->list(client, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* client = bluefindecryptxp2pe_client(client, NULL);
voxgig_value* client_rec = client->vt->create(client, cmap(1,
    "location", v_map())  // voxgig_value* (map)
, NULL, &err);
```


### CreateResult

Create an instance: `Entity* create_result = bluefindecryptxp2pe_create_result(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Example: Create

```c
Entity* create_result = bluefindecryptxp2pe_create_result(client, NULL);
voxgig_value* create_result_rec = create_result->vt->create(create_result, cmap(2,
    "device_type", v_str("example_device_type"),  // char*
    "serial_number", v_str("example_serial_number"))  // char*
, NULL, &err);
```


### Decryption

Create an instance: `Entity* decryption = bluefindecryptxp2pe_decryption(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```c
Entity* decryption = bluefindecryptxp2pe_decryption(client, NULL);
voxgig_value* decryption_rec = decryption->vt->create(decryption, NULL, NULL, &err);
```


### Device

Create an instance: `Entity* device = bluefindecryptxp2pe_device(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `voxgig_value* (map)` |  |
| `activationDate` | `char*` |  |
| `alternateKey` | `char*` |  |
| `auditNextDate` | `char*` |  |
| `auditNotificationDate` | `char*` |  |
| `client` | `voxgig_value* (map)` |  |
| `created` | `char*` |  |
| `createdBy` | `voxgig_value* (map)` |  |
| `deviceBuild` | `voxgig_value* (map)` |  |
| `deviceState` | `voxgig_value* (map)` |  |
| `deviceType` | `voxgig_value* (map)` |  |
| `errorCounter` | `int64_t` |  |
| `errorLastDate` | `char*` |  |
| `id` | `char*` |  |
| `initializedBy` | `voxgig_value* (map)` |  |
| `initializedDate` | `char*` |  |
| `injectKey` | `voxgig_value* (map)` |  |
| `isVirtual` | `bool` |  |
| `kif` | `voxgig_value* (map)` |  |
| `lastActivityDate` | `char*` |  |
| `location` | `voxgig_value* (map)` |  |
| `modified` | `char*` |  |
| `modifiedBy` | `voxgig_value* (map)` |  |
| `name` | `char*` |  |
| `notes` | `char*` |  |
| `partner` | `voxgig_value* (map)` |  |
| `serialNumber` | `char*` |  |
| `version` | `int64_t` |  |

#### Example: Load

```c
Entity* device = bluefindecryptxp2pe_device(client, NULL);
voxgig_value* device_rec = device->vt->load(device, cmap(1, "id", v_str("device_id")), NULL, &err);
```

#### Example: List

```c
Entity* device = bluefindecryptxp2pe_device(client, NULL);
voxgig_value* devices = device->vt->list(device, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* device = bluefindecryptxp2pe_device(client, NULL);
voxgig_value* device_rec = device->vt->create(device, cmap(5,
    "activatedBy", v_map(),  // voxgig_value* (map)
    "createdBy", v_map(),  // voxgig_value* (map)
    "initializedBy", v_map(),  // voxgig_value* (map)
    "location", v_map(),  // voxgig_value* (map)
    "modifiedBy", v_map())  // voxgig_value* (map)
, NULL, &err);
```


### DeviceBuild

Create an instance: `Entity* device_build = bluefindecryptxp2pe_device_build(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appVersion` | `char*` |  |
| `buildNumber` | `char*` |  |
| `configFileName` | `char*` |  |
| `created` | `char*` |  |
| `deviceType` | `char*` |  |
| `firmwareVersion` | `char*` |  |
| `hardwareVersion` | `char*` |  |
| `id` | `int64_t` |  |
| `isActive` | `bool` |  |
| `modified` | `char*` |  |
| `name` | `char*` |  |
| `notes` | `char*` |  |
| `version` | `int64_t` |  |
| `whiteListingBinRanges` | `char*` |  |
| `whiteListingUsed` | `bool` |  |

#### Example: Load

```c
Entity* device_build = bluefindecryptxp2pe_device_build(client, NULL);
voxgig_value* device_build_rec = device_build->vt->load(device_build, cmap(1, "id", v_str("device_build_id")), NULL, &err);
```

#### Example: List

```c
Entity* device_build = bluefindecryptxp2pe_device_build(client, NULL);
voxgig_value* device_builds = device_build->vt->list(device_build, NULL, NULL, &err);
```


### DeviceCustodyDetail

Create an instance: `Entity* device_custody_detail = bluefindecryptxp2pe_device_custody_detail(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `char*` |  |
| `created` | `char*` |  |
| `createdBy` | `voxgig_value* (map)` |  |
| `custodian` | `voxgig_value* (map)` |  |
| `device` | `voxgig_value* (map)` |  |
| `id` | `int64_t` |  |
| `location` | `voxgig_value* (map)` |  |
| `modified` | `char*` |  |
| `modifiedBy` | `voxgig_value* (map)` |  |
| `notes` | `char*` |  |
| `status` | `voxgig_value* (map)` |  |
| `transferMethod` | `voxgig_value* (map)` |  |
| `version` | `int64_t` |  |

#### Example: Load

```c
Entity* device_custody_detail = bluefindecryptxp2pe_device_custody_detail(client, NULL);
voxgig_value* device_custody_detail_rec = device_custody_detail->vt->load(device_custody_detail, cmap(3, "id", v_str("device_custody_detail_id"), "device_type", v_str("device_type"), "serial_number", v_str("serial_number")), NULL, &err);
```


### DeviceCustodyList

Create an instance: `Entity* device_custody_list = bluefindecryptxp2pe_device_custody_list(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `char*` |  |
| `created` | `char*` |  |
| `createdBy` | `voxgig_value* (map)` |  |
| `custodian` | `voxgig_value* (map)` |  |
| `device` | `voxgig_value* (map)` |  |
| `id` | `int64_t` |  |
| `location` | `voxgig_value* (map)` |  |
| `modified` | `char*` |  |
| `modifiedBy` | `voxgig_value* (map)` |  |
| `notes` | `char*` |  |
| `status` | `voxgig_value* (map)` |  |
| `transferMethod` | `voxgig_value* (map)` |  |
| `version` | `int64_t` |  |

#### Example: List

```c
Entity* device_custody_list = bluefindecryptxp2pe_device_custody_list(client, NULL);
voxgig_value* device_custody_lists = device_custody_list->vt->list(device_custody_list, NULL, NULL, &err);
```


### DeviceList

Create an instance: `Entity* device_list = bluefindecryptxp2pe_device_list(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `voxgig_value* (list)` |  |
| `total` | `int64_t` |  |

#### Example: Load

```c
Entity* device_list = bluefindecryptxp2pe_device_list(client, NULL);
voxgig_value* device_list_rec = device_list->vt->load(device_list, cmap(1, "share_partner_to", v_str("share_partner_to")), NULL, &err);
```


### DeviceReceiveResult

Create an instance: `Entity* device_receive_result = bluefindecryptxp2pe_device_receive_result(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```c
Entity* device_receive_result = bluefindecryptxp2pe_device_receive_result(client, NULL);
voxgig_value* device_receive_result_rec = device_receive_result->vt->create(device_receive_result, cmap(1,
    "success", v_bool(true))  // bool
, NULL, &err);
```


### DeviceRkiActivateResult

Create an instance: `Entity* device_rki_activate_result = bluefindecryptxp2pe_device_rki_activate_result(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```c
Entity* device_rki_activate_result = bluefindecryptxp2pe_device_rki_activate_result(client, NULL);
voxgig_value* device_rki_activate_result_rec = device_rki_activate_result->vt->create(device_rki_activate_result, cmap(1,
    "success", v_bool(true))  // bool
, NULL, &err);
```


### DeviceState

Create an instance: `Entity* device_state = bluefindecryptxp2pe_device_state(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int64_t` |  |
| `name` | `char*` |  |

#### Example: List

```c
Entity* device_state = bluefindecryptxp2pe_device_state(client, NULL);
voxgig_value* device_states = device_state->vt->list(device_state, NULL, NULL, &err);
```


### DeviceType

Create an instance: `Entity* device_type = bluefindecryptxp2pe_device_type(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `char*` |  |
| `deviceTypeMode` | `char*` |  |
| `hardwareVersion` | `char*` |  |
| `id` | `char*` |  |
| `isActive` | `bool` |  |
| `manufacturer` | `char*` |  |
| `model` | `char*` |  |
| `modified` | `char*` |  |
| `name` | `char*` |  |
| `photoUrl` | `char*` |  |
| `productName` | `char*` |  |
| `version` | `int64_t` |  |

#### Example: Load

```c
Entity* device_type = bluefindecryptxp2pe_device_type(client, NULL);
voxgig_value* device_type_rec = device_type->vt->load(device_type, cmap(1, "id", v_str("device_type_id")), NULL, &err);
```

#### Example: List

```c
Entity* device_type = bluefindecryptxp2pe_device_type(client, NULL);
voxgig_value* device_types = device_type->vt->list(device_type, NULL, NULL, &err);
```


### InjectKey

Create an instance: `Entity* inject_key = bluefindecryptxp2pe_inject_key(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `char*` |  |
| `id` | `char*` |  |
| `isActive` | `bool` |  |
| `isP2PE` | `bool` |  |
| `keyType` | `char*` |  |
| `modified` | `char*` |  |
| `name` | `char*` |  |
| `version` | `int64_t` |  |

#### Example: Load

```c
Entity* inject_key = bluefindecryptxp2pe_inject_key(client, NULL);
voxgig_value* inject_key_rec = inject_key->vt->load(inject_key, cmap(1, "id", v_str("inject_key_id")), NULL, &err);
```

#### Example: List

```c
Entity* inject_key = bluefindecryptxp2pe_inject_key(client, NULL);
voxgig_value* inject_keys = inject_key->vt->list(inject_key, NULL, NULL, &err);
```


### Kif

Create an instance: `Entity* kif = bluefindecryptxp2pe_kif(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int64_t` |  |
| `name` | `char*` |  |

#### Example: List

```c
Entity* kif = bluefindecryptxp2pe_kif(client, NULL);
voxgig_value* kifs = kif->vt->list(kif, NULL, NULL, &err);
```


### Location

Create an instance: `Entity* location = bluefindecryptxp2pe_location(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |
| `vt->remove(e, reqmatch, ctrl, &err)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address1` | `char*` |  |
| `address2` | `char*` |  |
| `billingId` | `char*` |  |
| `city` | `char*` |  |
| `country` | `char*` |  |
| `created` | `char*` |  |
| `customReference` | `char*` |  |
| `id` | `char*` |  |
| `locationType` | `char*` |  |
| `mailAddress1` | `char*` |  |
| `mailAddress2` | `char*` |  |
| `mailCity` | `char*` |  |
| `mailCountry` | `char*` |  |
| `mailPostalCode` | `char*` |  |
| `mailStateProvince` | `char*` |  |
| `modified` | `char*` |  |
| `name` | `char*` |  |
| `nameOfBusiness` | `char*` |  |
| `notes` | `char*` |  |
| `postalCode` | `char*` |  |
| `stateProvince` | `char*` |  |
| `uniqueId` | `char*` |  |
| `version` | `int64_t` |  |

#### Example: Load

```c
Entity* location = bluefindecryptxp2pe_location(client, NULL);
voxgig_value* location_rec = location->vt->load(location, cmap(1, "id", v_str("location_id")), NULL, &err);
```

#### Example: List

```c
Entity* location = bluefindecryptxp2pe_location(client, NULL);
voxgig_value* locations = location->vt->list(location, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* location = bluefindecryptxp2pe_location(client, NULL);
voxgig_value* location_rec = location->vt->create(location, NULL, NULL, &err);
```


### Partner

Create an instance: `Entity* partner = bluefindecryptxp2pe_partner(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `char*` |  |
| `clientCanOrderEquipment` | `bool` |  |
| `contact` | `voxgig_value* (map)` |  |
| `created` | `char*` |  |
| `id` | `char*` |  |
| `isActive` | `bool` |  |
| `location` | `voxgig_value* (map)` |  |
| `modified` | `char*` |  |
| `name` | `char*` |  |
| `parent` | `voxgig_value* (map)` |  |
| `partnerId` | `char*` |  |
| `reference` | `char*` |  |
| `verificationPhrase` | `char*` |  |
| `version` | `int64_t` |  |

#### Example: Load

```c
Entity* partner = bluefindecryptxp2pe_partner(client, NULL);
voxgig_value* partner_rec = partner->vt->load(partner, cmap(1, "id", v_str("partner_id")), NULL, &err);
```

#### Example: List

```c
Entity* partner = bluefindecryptxp2pe_partner(client, NULL);
voxgig_value* partners = partner->vt->list(partner, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* partner = bluefindecryptxp2pe_partner(client, NULL);
voxgig_value* partner_rec = partner->vt->create(partner, cmap(1,
    "location", v_map())  // voxgig_value* (map)
, NULL, &err);
```


### Shipment

Create an instance: `Entity* shipment = bluefindecryptxp2pe_shipment(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `char*` |  |
| `client` | `voxgig_value* (map)` |  |
| `created` | `char*` |  |
| `dateReceived` | `char*` |  |
| `dateShipped` | `char*` |  |
| `dcKif` | `voxgig_value* (map)` |  |
| `id` | `char*` |  |
| `items` | `voxgig_value* (list)` |  |
| `kif` | `voxgig_value* (map)` |  |
| `modified` | `char*` |  |
| `partner` | `voxgig_value* (map)` |  |
| `shipmentType` | `char*` |  |
| `tracking` | `char*` |  |
| `version` | `int64_t` |  |

#### Example: Load

```c
Entity* shipment = bluefindecryptxp2pe_shipment(client, NULL);
voxgig_value* shipment_rec = shipment->vt->load(shipment, cmap(1, "id", v_str("shipment_id")), NULL, &err);
```

#### Example: List

```c
Entity* shipment = bluefindecryptxp2pe_shipment(client, NULL);
voxgig_value* shipments = shipment->vt->list(shipment, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* shipment = bluefindecryptxp2pe_shipment(client, NULL);
voxgig_value* shipment_rec = shipment->vt->create(shipment, NULL, NULL, &err);
```


### Success

Create an instance: `Entity* success = bluefindecryptxp2pe_success(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->remove(e, reqmatch, ctrl, &err)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```c
Entity* success = bluefindecryptxp2pe_success(client, NULL);
voxgig_value* success_rec = success->vt->create(success, cmap(1,
    "share_partner_to", v_str("example_share_partner_to"))  // char*
, NULL, &err);
```


### Transaction

Create an instance: `Entity* transaction = bluefindecryptxp2pe_transaction(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `char*` |  |
| `client` | `voxgig_value* (map)` |  |
| `clientRef` | `char*` |  |
| `created` | `char*` |  |
| `decrypted` | `int64_t` |  |
| `deviceName` | `char*` |  |
| `directPartner` | `voxgig_value* (map)` |  |
| `encrypted` | `int64_t` |  |
| `endDate` | `char*` |  |
| `errCode` | `char*` |  |
| `errMessage` | `char*` |  |
| `id` | `char*` |  |
| `ipAddress` | `char*` |  |
| `isVirtual` | `bool` |  |
| `keyType` | `char*` |  |
| `location` | `voxgig_value* (map)` |  |
| `messageId` | `char*` |  |
| `method` | `char*` |  |
| `partner` | `voxgig_value* (map)` |  |
| `reference` | `char*` |  |
| `serialNumber` | `char*` |  |
| `startDate` | `char*` |  |
| `success` | `bool` |  |
| `transactionSource` | `char*` |  |

#### Example: Load

```c
Entity* transaction = bluefindecryptxp2pe_transaction(client, NULL);
voxgig_value* transaction_rec = transaction->vt->load(transaction, cmap(1, "id", v_str("transaction_id")), NULL, &err);
```

#### Example: List

```c
Entity* transaction = bluefindecryptxp2pe_transaction(client, NULL);
voxgig_value* transactions = transaction->vt->list(transaction, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* transaction = bluefindecryptxp2pe_transaction(client, NULL);
voxgig_value* transaction_rec = transaction->vt->create(transaction, cmap(1,
    "location", v_map())  // voxgig_value* (map)
, NULL, &err);
```


### UpdateResult

Create an instance: `Entity* update_result = bluefindecryptxp2pe_update_result(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->update(e, reqdata, ctrl, &err)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `voxgig_value* (map)` |  |
| `email` | `char*` |  |
| `firstName` | `char*` |  |
| `id` | `char*` |  |
| `isActive` | `bool` |  |
| `kif` | `voxgig_value* (map)` |  |
| `lastName` | `char*` |  |
| `partner` | `voxgig_value* (map)` |  |
| `phone` | `char*` |  |
| `userName` | `char*` |  |
| `userRole` | `voxgig_value* (map)` |  |
| `version` | `int64_t` |  |

#### Example: List

```c
Entity* update_result = bluefindecryptxp2pe_update_result(client, NULL);
voxgig_value* update_results = update_result->vt->list(update_result, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* update_result = bluefindecryptxp2pe_update_result(client, NULL);
voxgig_value* update_result_rec = update_result->vt->create(update_result, NULL, NULL, &err);
```


### User

Create an instance: `Entity* user = bluefindecryptxp2pe_user(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |
| `vt->remove(e, reqmatch, ctrl, &err)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `voxgig_value* (map)` |  |
| `created` | `char*` |  |
| `email` | `char*` |  |
| `firstName` | `char*` |  |
| `id` | `char*` |  |
| `isActive` | `bool` |  |
| `kif` | `voxgig_value* (map)` |  |
| `lastName` | `char*` |  |
| `modified` | `char*` |  |
| `partner` | `voxgig_value* (map)` |  |
| `phone` | `char*` |  |
| `userName` | `char*` |  |
| `userRole` | `voxgig_value* (map)` |  |
| `version` | `int64_t` |  |

#### Example: Load

```c
Entity* user = bluefindecryptxp2pe_user(client, NULL);
voxgig_value* user_rec = user->vt->load(user, cmap(1, "id", v_str("user_id")), NULL, &err);
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

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as `voxgig_value*`

The C SDK uses a single dynamic `voxgig_value*` type throughout rather than
a typed struct per entity. `voxgig_value` is the vendored voxgig struct
port (a JSON-shaped tagged union: string, number, bool, list, map, null,
undef). This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with the `cmap` / `clist` / `v_str` / `v_num` /
`v_bool` helper builders, and read fields back with `getp` (or the typed
`get_str` / `get_bool` / `to_int`); use `to_map` to safely coerce a
value to a map.

Memory follows a retain-heavy, never-free discipline — pipeline values are
never released. This is safe (no use-after-free) and leaks are acceptable
for the short-lived SDK and test binaries.

### Error handling

Fallible functions return a `voxgig_value*` (or a struct pointer) and take a
trailing `PNError** err` out-param. On success `*err` is left `NULL`; on
failure `*err` points to a heap `PNError` carrying `code` and `msg`.
Always initialise `PNError* err = NULL;` and branch on it after each call.

### Project structure

```
c/
├── core/          -- Pipeline types, config, client (client.c), api.h + sdk.h
├── entity/        -- Per-entity implementations (one .c each)
├── feature/       -- Built-in features (base, test, log, ...)
├── utility/       -- Utilities + the vendored voxgig struct port (utility/struct)
├── tests/         -- Test binaries (each a standalone main())
└── Makefile       -- Builds libsdk.a and runs every tests/*.c
```

The public entry header is `core/api.h` — it includes `core/sdk.h` (the
umbrella runtime header) and declares each entity's constructor and SDK
accessor. Include it and link against `libsdk.a`.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const devicetype = client.DeviceType()
await devicetype.list()

// devicetype.data() now returns the devicetype data from the last `list`
// devicetype.match() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.

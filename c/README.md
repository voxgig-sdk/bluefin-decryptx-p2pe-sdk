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
| `client` | `voxgig_value* (map)` | Reference to the associated Client resource. |
| `completeDate` | `char*` | The date and time that the Attestation took place. |
| `created` | `char*` | Creation timestamp in ISO 8601 format. |
| `device` | `voxgig_value* (map)` | Reference to the associated Device resource. |
| `id` | `char*` | This resource's unique identifier. |
| `name` | `char*` | Text describing the attestation. |
| `notes` | `char*` | Free form field that allows the Client associate notes with the Attestation. |

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
| `contact` | `voxgig_value* (map)` | Reference to the associated User resource. |
| `created` | `char*` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `id` | `char*` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Client account is active or disabled. |
| `location` | `voxgig_value* (map)` | Reference to the associated Location resource. |
| `mid` | `char*` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `char*` | Last modified timestamp. |
| `name` | `char*` | The Client's name. |
| `partner` | `voxgig_value* (map)` | Reference to the Client's root Partner. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `success` | `bool` | true if the payload decryption was successful. |

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
| `activatedBy` | `voxgig_value* (map)` | Reference to the associated User resource. |
| `activationDate` | `char*` | Timestamp from when the Device was activated. |
| `alternateKey` | `char*` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `char*` | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `char*` | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `voxgig_value* (map)` | Reference to the associated Client resource. |
| `created` | `char*` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `voxgig_value* (map)` | Reference to the associated User resource. |
| `deviceBuild` | `voxgig_value* (map)` | Reference to the associated Device Build resource. |
| `deviceState` | `voxgig_value* (map)` | Reference to the associated Device State resource. |
| `deviceType` | `voxgig_value* (map)` | Reference to the associated Device Type resource. |
| `errorCounter` | `int64_t` | The number times the Device has been in error. |
| `errorLastDate` | `char*` | Timestamp from the last time that the Device had an error. |
| `id` | `char*` | The Device's unique identifier. |
| `initializedBy` | `voxgig_value* (map)` | Reference to the associated User resource. |
| `initializedDate` | `char*` | Timestamp from when the Device was initialized. |
| `injectKey` | `voxgig_value* (map)` | Reference to the associated Device resource. |
| `isVirtual` | `bool` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `voxgig_value* (map)` | Reference to the associated KIF resource. |
| `lastActivityDate` | `char*` | Timestamp from the last time that the Device was used. |
| `location` | `voxgig_value* (map)` | Reference to the associated Location resource. |
| `modified` | `char*` | Last modified timestamp. |
| `modifiedBy` | `voxgig_value* (map)` | Reference to the associated User resource. |
| `name` | `char*` | The Device's name. |
| `notes` | `char*` | Arbitary note that can be attached to a Device entry. |
| `partner` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `serialNumber` | `char*` | The Device's serial number. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `appVersion` | `char*` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `char*` | The Build Number. |
| `configFileName` | `char*` | The name of the configuration file that is uploaded to the device. |
| `created` | `char*` | Creation timestamp in ISO 8601 format. |
| `deviceType` | `char*` | The Device Type Name. |
| `firmwareVersion` | `char*` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `char*` | A list of hardware versions that this Device Build covers. |
| `id` | `int64_t` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `char*` | Last modified timestamp. |
| `name` | `char*` | The Device Builds's name. |
| `notes` | `char*` | Notes attached to the device build by Bluefin CISO. |
| `version` | `int64_t` | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `char*` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `bool` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

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
| `completeDate` | `char*` | The date and time that the Custody change took place. |
| `created` | `char*` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `voxgig_value* (map)` | Reference to the associated User resource. |
| `custodian` | `voxgig_value* (map)` | Reference to the associated User resource. |
| `device` | `voxgig_value* (map)` | Reference to the associated Device resource. |
| `id` | `int64_t` | This resource's unique identifier. |
| `location` | `voxgig_value* (map)` | Reference to the associated Location resource. |
| `modified` | `char*` | Last modified timestamp. |
| `modifiedBy` | `voxgig_value* (map)` | Reference to the associated User resource. |
| `notes` | `char*` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `voxgig_value* (map)` | Reference to the associated Custody Status. |
| `transferMethod` | `voxgig_value* (map)` | Reference to the associated Transfer Method. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `completeDate` | `char*` | The date and time that the Custody change took place. |
| `created` | `char*` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `voxgig_value* (map)` | Reference to the associated User resource. |
| `custodian` | `voxgig_value* (map)` | Reference to the associated User resource. |
| `device` | `voxgig_value* (map)` | Reference to the associated Device resource. |
| `id` | `int64_t` | This resource's unique identifier. |
| `location` | `voxgig_value* (map)` | Reference to the associated Location resource. |
| `modified` | `char*` | Last modified timestamp. |
| `modifiedBy` | `voxgig_value* (map)` | Reference to the associated User resource. |
| `notes` | `char*` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `voxgig_value* (map)` | Reference to the associated Custody Status. |
| `transferMethod` | `voxgig_value* (map)` | Reference to the associated Transfer Method. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `data` | `voxgig_value* (list)` | List of Devices. |
| `total` | `int64_t` | Total number of Devices available (not the number of Users in the response). |

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
| `success` | `bool` | Indicates if the action succeeded. |

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
| `success` | `bool` | Indicates if the RKI activation succeeded. |

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
| `id` | `int64_t` | Unique identifier for this Device state. |
| `name` | `char*` | Descriptive name for this Device state. |

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
| `created` | `char*` | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `char*` | The Device type. |
| `hardwareVersion` | `char*` | The Device hardware version. |
| `id` | `char*` | Unique idenifier. |
| `isActive` | `bool` | This property indicates if the DeviceType is active. |
| `manufacturer` | `char*` | The Device manufacturer. |
| `model` | `char*` | The Device model. |
| `modified` | `char*` | Last modified timestamp. |
| `name` | `char*` | The DeviceType name. |
| `photoUrl` | `char*` |  |
| `productName` | `char*` | The Device name. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `created` | `char*` | Creation timestamp in ISO 8601 format. |
| `id` | `char*` | unique idenifier |
| `isActive` | `bool` | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `bool` | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `char*` | The cipher type that the key works with. |
| `modified` | `char*` | Last modified timestamp in ISO 8601 format. |
| `name` | `char*` | Key name. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `id` | `int64_t` | This resource's unique identifier. |
| `name` | `char*` | The KIF's name. |

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
| `address1` | `char*` | The Location's street address. |
| `address2` | `char*` | The Location's street address. |
| `billingId` | `char*` | \? |
| `city` | `char*` | The Location's city. |
| `country` | `char*` | The Location's country. |
| `created` | `char*` | Creation timestamp in ISO 8601 format. |
| `customReference` | `char*` | A Partner specified reference for a location. |
| `id` | `char*` | This resource's unique identifier. |
| `locationType` | `char*` | The Location's clasification. |
| `mailAddress1` | `char*` | The Location's street address. |
| `mailAddress2` | `char*` | The Location's street address. |
| `mailCity` | `char*` | The Location's city. |
| `mailCountry` | `char*` | The Location's street address. |
| `mailPostalCode` | `char*` | The Location's postal code. |
| `mailStateProvince` | `char*` | The Location's street state or province. |
| `modified` | `char*` | Last modified timestamp. |
| `name` | `char*` | The Location's name. |
| `nameOfBusiness` | `char*` | The name of the business at this location. |
| `notes` | `char*` | Note for delivery driver. |
| `postalCode` | `char*` | The Location's postal code. |
| `stateProvince` | `char*` | The Location's street state or province. |
| `uniqueId` | `char*` | Unique Identifier for the Location. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `billingId` | `char*` | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `bool` | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `voxgig_value* (map)` | Reference to the associated User resource. |
| `created` | `char*` | Creation timestamp in ISO 8601 format. |
| `id` | `char*` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Parter account is active or disabled. |
| `location` | `voxgig_value* (map)` | Reference to the associated Location resource. |
| `modified` | `char*` | Last modified timestamp. |
| `name` | `char*` | The Partner's name. |
| `parent` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `partnerId` | `char*` | The Partner's id. |
| `reference` | `char*` | The Partner's reference string. |
| `verificationPhrase` | `char*` | The verification phrase is a message that the Partner creates. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `carrier` | `char*` | The name of the courier. |
| `client` | `voxgig_value* (map)` | Reference to the associated Client resource. |
| `created` | `char*` | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `char*` | The date and time that a package is recieved. |
| `dateShipped` | `char*` | The date and time that a package is shipped. |
| `dcKif` | `voxgig_value* (map)` | Reference to the associated KIF resource. |
| `id` | `char*` | This resource's unique identifier. |
| `items` | `voxgig_value* (list)` |  |
| `kif` | `voxgig_value* (map)` | Reference to the associated KIF resource. |
| `modified` | `char*` | Last modified timestamp. |
| `partner` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `shipmentType` | `char*` | The type of shipment. |
| `tracking` | `char*` | The courier's tracking number. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `success` | `bool` | Indicates if the action was a success. |

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
| `alternateKey` | `char*` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `voxgig_value* (map)` | Reference to the associated Client resource. |
| `clientRef` | `char*` | Client Reference property that is included in the decrypt API call. |
| `created` | `char*` | Creation timestamp in ISO 8601 format. |
| `decrypted` | `int64_t` | A Transcation can process muliple decryptions. |
| `deviceName` | `char*` | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `encrypted` | `int64_t` | A Transcation can process muliple encryptions. |
| `endDate` | `char*` | Timestamp from the end of the transaction. |
| `errCode` | `char*` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `char*` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `char*` | This resource's unique identifier. |
| `ipAddress` | `char*` | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `bool` | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `char*` | The type of cipher used during decrytion. |
| `location` | `voxgig_value* (map)` | Reference to the associated Location resource. |
| `messageId` | `char*` | Message ID. |
| `method` | `char*` | The decryption cypher/method. |
| `partner` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `reference` | `char*` | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `char*` | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `char*` | Timestamp from the beginning of the transaction. |
| `success` | `bool` | The success indicator. |
| `transactionSource` | `char*` | The source of the Transaction. |

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
| `client` | `voxgig_value* (map)` | Reference to the associated Client resource. |
| `email` | `char*` | The User's email address. |
| `firstName` | `char*` | The User's name. |
| `id` | `char*` | ID of newly created resource |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `kif` | `voxgig_value* (map)` | Reference to the associated KIF resource. |
| `lastName` | `char*` | The User's Surname. |
| `partner` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `phone` | `char*` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `char*` | The User's unique username. |
| `userRole` | `voxgig_value* (map)` | Reference to the associated User Role. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `client` | `voxgig_value* (map)` | Reference to the associated Client resource. |
| `created` | `char*` | Creation timestamp in ISO 8601 format. |
| `email` | `char*` | The User's email address. |
| `firstName` | `char*` | The User's name. |
| `id` | `char*` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `kif` | `voxgig_value* (map)` | Reference to the associated KIF resource. |
| `lastName` | `char*` | The User's Surname. |
| `modified` | `char*` | Last modified timestamp. |
| `partner` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `phone` | `char*` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `char*` | The User's unique username. |
| `userRole` | `voxgig_value* (map)` | Reference to the associated User Role. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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

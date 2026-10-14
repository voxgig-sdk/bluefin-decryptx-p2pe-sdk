# BluefinDecryptxP2pe Perl SDK



The Perl SDK for the BluefinDecryptxP2pe API — an entity-oriented client
following idiomatic Perl conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `$client->Attestation` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
The SDK needs perl 5.18 or later.

This package is not yet published to CPAN. Install it from the GitHub
release tag (`perl/vX.Y.Z`, see [Tags](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/tags)) or
from a source checkout.

The SDK is pure Perl with zero non-core runtime dependencies, so no build
step is required — just put its `lib` directory on `@INC`:

```perl
use lib 'lib';
use BluefinDecryptxP2peSDK;
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```perl
use lib 'lib';
use BluefinDecryptxP2peSDK;

my $client = BluefinDecryptxP2peSDK->new({
    'apikey' => $ENV{'BLUEFIN_DECRYPTX_P2PE_APIKEY'},
});
```

### 2. List attestation records

`list()` returns an `arrayref` of entities, one per record, and dies on
error; `data_get` reads each record.

```perl
my $attestations = eval { $client->Attestation->list({ 'client' => 'example' }) };
if (my $err = $@) {
    print "list failed: $err\n";
}
else {
    for my $attestation (@$attestations) {
        print $attestation->data_get->{id}, "\n";
    }
}
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`load()` returns the ENTITY — call data_get for the record — and dies on error.

```perl
my $devicecustodydetail = eval { $client->DeviceCustodyDetail->load({ 'device_type' => 'example_device_type', 'serial_number' => 'example_serial_number', 'id' => 'example_id' }) };
if (my $err = $@) {
    print "load failed: $err\n";
}
else {
    print $devicecustodydetail->data_get->{id}, "\n";
}
```

### 4. Create, update, and remove

```perl
# Create — returns the ENTITY (call data_get for the record)
my $created = $client->Attestation->create({ 'devices' => [] });

```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const devicetypes = await client.DeviceType().list()
  console.log(devicetypes.map((item) => item.data()))
} catch (err) {
  console.error('list failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
result envelope. Branch on `ok`; on failure `status` holds the HTTP status
(for error responses) and `err` holds the error:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (!result.ok) {
  console.error('request failed:', result.status, result.err)
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```perl
my $result = $client->direct({
    'path' => '/api/resource/{id}',
    'method' => 'GET',
    'params' => { 'id' => 'example' },
});

if ($result->{ok}) {
    print $result->{status}, "\n";  # 200
    print $result->{data}, "\n";    # response body
}
else {
    # A non-2xx response carries status + data (the error body); a
    # transport-level failure carries err instead. Only one is present, so
    # read whichever is defined.
    print $result->{status}, ' ', ($result->{err} // ''), "\n";
}
```

### Prepare a request without sending it

```perl
# prepare() returns the fetch definition and dies on error.
my $fetchdef = $client->prepare({
    'path' => '/api/resource/{id}',
    'method' => 'DELETE',
    'params' => { 'id' => 'example' },
});

print $fetchdef->{url}, "\n";
print $fetchdef->{method}, "\n";
print $fetchdef->{headers}, "\n";
```

### Use test mode

Create a mock client for unit testing — no server required:

```perl
my $client = BluefinDecryptxP2peSDK->test(undef, undef);

# Entity ops return the entity, and list one per record; they die on error.
my $devicetype = $client->DeviceType->list();
# data_get on an entity reads its mock response record
```

### Use a custom fetch function

Replace the HTTP transport with your own coderef:

```perl
my $mock_fetch = sub {
    my ($url, $init) = @_;
    return ({
        'status' => 200,
        'statusText' => 'OK',
        'headers' => {},
        'json' => sub { { 'id' => 'mock01' } },
    }, undef);
};

my $client = BluefinDecryptxP2peSDK->new({
    'base' => 'http://localhost:8080',
    'system' => { 'fetch' => $mock_fetch },
});
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd perl && prove -Ilib t/
```


## Reference

### BluefinDecryptxP2peSDK

```perl
use lib 'lib';
use BluefinDecryptxP2peSDK;

my $client = BluefinDecryptxP2peSDK->new($options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `hashref` | Feature activation flags. |
| `extend` | `arrayref` | Additional feature instances to load. |
| `system` | `hashref` | System overrides (e.g. custom `fetch` coderef). |

### test

```perl
my $client = BluefinDecryptxP2peSDK->test($testopts, $sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `undef`.

### BluefinDecryptxP2peSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> hashref` | Deep copy of current SDK options. |
| `get_utility` | `() -> utility` | Copy of the SDK utility object. |
| `prepare` | `($fetchargs) -> hashref` | Build an HTTP request definition without sending. Dies on error. |
| `direct` | `($fetchargs) -> hashref` | Build and send an HTTP request. Returns a result hashref (branch on `ok`). |
| `Attestation` | `($data) -> Attestation entity` | Create an Attestation entity instance. |
| `Client` | `($data) -> Client entity` | Create a Client entity instance. |
| `CreateResult` | `($data) -> CreateResult entity` | Create a CreateResult entity instance. |
| `Decryption` | `($data) -> Decryption entity` | Create a Decryption entity instance. |
| `Device` | `($data) -> Device entity` | Create a Device entity instance. |
| `DeviceBuild` | `($data) -> DeviceBuild entity` | Create a DeviceBuild entity instance. |
| `DeviceCustodyDetail` | `($data) -> DeviceCustodyDetail entity` | Create a DeviceCustodyDetail entity instance. |
| `DeviceCustodyListItem` | `($data) -> DeviceCustodyListItem entity` | Create a DeviceCustodyListItem entity instance. |
| `DeviceReceiveResult` | `($data) -> DeviceReceiveResult entity` | Create a DeviceReceiveResult entity instance. |
| `DeviceRkiActivateResult` | `($data) -> DeviceRkiActivateResult entity` | Create a DeviceRkiActivateResult entity instance. |
| `DeviceState` | `($data) -> DeviceState entity` | Create a DeviceState entity instance. |
| `DeviceType` | `($data) -> DeviceType entity` | Create a DeviceType entity instance. |
| `InjectKey` | `($data) -> InjectKey entity` | Create an InjectKey entity instance. |
| `Kif` | `($data) -> Kif entity` | Create a Kif entity instance. |
| `Location` | `($data) -> Location entity` | Create a Location entity instance. |
| `Partner` | `($data) -> Partner entity` | Create a Partner entity instance. |
| `Shipment` | `($data) -> Shipment entity` | Create a Shipment entity instance. |
| `Success` | `($data) -> Success entity` | Create a Success entity instance. |
| `Transaction` | `($data) -> Transaction entity` | Create a Transaction entity instance. |
| `UpdateResult` | `($data) -> UpdateResult entity` | Create an UpdateResult entity instance. |
| `User` | `($data) -> User entity` | Create an User entity instance. |
| `VirtualDevice` | `($data) -> VirtualDevice entity` | Create a VirtualDevice entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `($reqmatch, $ctrl) -> entity` | Load a single entity by match criteria, and return it. Dies on error. |
| `list` | `($reqmatch, $ctrl) -> arrayref` | List entities matching the criteria, one per record. Dies on error. |
| `create` | `($reqdata, $ctrl) -> entity` | Create a new entity, and return it. Dies on error. |
| `update` | `($reqdata, $ctrl) -> entity` | Update an existing entity, and return it. Dies on error. |
| `remove` | `($reqmatch, $ctrl) -> entity` | Remove an entity, and return it marked as deleted. Dies on error. |
| `data_get` | `() -> hashref` | Get entity data. |
| `data_set` | `($data)` | Set entity data. |
| `match_get` | `() -> hashref` | Get entity match criteria. |
| `match_set` | `($match)` | Set entity match criteria. |
| `make` | `() -> entity` | Create a new instance with the same options. |
| `get_name` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return the entity, and `list` an `arrayref` of
entities, one per record; `data_get` reads an entity's record (a
`hashref`). They die on error, so wrap calls in `eval { ... }` and
inspect `$@` to handle failures.

The `direct()` escape hatch never dies — it returns a result `hashref`
you branch on via `$result->{ok}`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `boolean` | True if the HTTP status is 2xx. |
| `status` | `integer` | HTTP status code. |
| `headers` | `hashref` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is false and `err` contains the error value.

### Entities

#### Attestation

| Field | Description |
| --- | --- |
| `client` | Reference to the associated Client resource. |
| `completeDate` | The date and time that the Attestation took place. |
| `created` | Creation timestamp in ISO 8601 format. |
| `device` | Reference to the associated Device resource. |
| `devices` |  |
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
| `completeDate` | The date and time that the Custody change took place. |
| `custodian` | Reference to the associated User resource. |
| `location` | Reference to the associated Location resource. |
| `notes` | Free form field that allows the Client associate notes with the Custody Change. |

Operations: Create.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### Decryption

| Field | Description |
| --- | --- |
| `cbcVector` | Base64 or hex encoded initial vector obtained from device. |
| `deviceType` | The device Type. |
| `encoding` | The payload encoding |
| `encrypted` |  |
| `hasCcData` | Validation flag that indicates whether inbound and outbound data should be checked for credit card numbers. |
| `reference` | A string (of up to 50 characters) that helps partners identify individual API calls. |
| `sequenceNumber` | Sequence number obtained from device in base 64 or hex encoded format. |
| `serialNumber` | The serial number of the device. |
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

#### DeviceCustodyListItem

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

#### DeviceReceiveResult

| Field | Description |
| --- | --- |
| `serialNumber` | The serial number of the Device that is shipped. |
| `success` | Indicates if the action succeeded. |
| `tamperLabel` | The code that is printed the tamper label of the Device that is shipped. |

Operations: Create.

API path: `/devices/receive`

#### DeviceRkiActivateResult

| Field | Description |
| --- | --- |
| `appVersion` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildName` | The Device Builds's name. |
| `buildNumber` | The Build Number. |
| `configFile` | \? |
| `firmwareVersion` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | A list of hardware versions that this Device Build covers. |
| `serialNumber` | The referenced Device's serial number. |
| `success` | Indicates if the RKI activation succeeded. |
| `whiteListingBinRanges` | \? |

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
| `client` | Reference to the associated Client resource. |
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
| `location` | Reference to the associated Location resource. |
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
| `devices` | An array of Device ids to share with partner. |
| `sharePartnerFrom` | Reference to the associated Partner. |
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
| `device` | Reference to the associated Device resource. |
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
| `address1` | The Location's street address. |
| `address2` | The Location's street address. |
| `alternateKey` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | Date and time that the Device is due its next PCI Audit. |
| `billingId` | \? |
| `city` | The Location's city. |
| `client` | Reference to the associated Client resource. |
| `clientCanOrderEquipment` | This property indicates if the Partner is allowed to order Equipment. |
| `clientRef` | Client Reference property that is included in the decrypt API call. |
| `contact` | Reference to the associated User resource. |
| `country` | Reference to the associated Country. |
| `customReference` | A Partner specified reference for a location. |
| `dateShipped` | The date and time that a package is shipped. |
| `decrypted` | A Transcation can process muliple decryptions. |
| `device` | Reference to the associated Device resource. |
| `deviceBuild` | Reference to the associated Device Build resource. |
| `deviceType` | Reference to the associated Device Type resource. |
| `directPartner` | Reference to the associated Partner. |
| `email` | The User's email address. |
| `encrypted` | A Transcation can process muliple encryptions. |
| `endDate` | Timestamp from the end of the transaction. |
| `errCode` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | The error messge that is sent in response to a failed decrypt API call. |
| `firstName` | The User's name. |
| `id` | ID of newly created resource |
| `injectKey` | Reference to the associated Device resource. |
| `ipAddress` | The IP address of the http client that makes the decrypt API call. |
| `isActive` | This property indicates if the User account is active or disabled. |
| `items` |  |
| `keyType` | The type of cipher used during decrytion. |
| `kif` | Reference to the associated KIF resource. |
| `lastName` | The User's Surname. |
| `location` | Reference to the associated Location resource. |
| `locationType` | The Location's clasification. |
| `mailAddress1` | The Location's street address. |
| `mailAddress2` | The Location's street address. |
| `mailCity` | The Location's city. |
| `mailCountry` | The Location's street address. |
| `mailPostalCode` | The Location's postal code. |
| `mailStateProvince` | The Location's street state or province. |
| `messageId` | Message ID. |
| `method` | The decryption cypher/method. |
| `mid` | Some Partners will have an merchant ids on their own software offerings. |
| `name` | The Client's name. |
| `nameOfBusiness` | The name of the business at this location. |
| `notes` | Arbitary note that can be attached to a Device entry. |
| `parent` | Reference to the associated Partner. |
| `partner` | Reference to the associated Partner. |
| `partnerId` | The Partner's id. |
| `phone` | The User's phone number without dashes, spaces, or brackets. |
| `postalCode` | The Location's postal code. |
| `reference` | The Partner's reference string. |
| `sendWelcomeEmail` | If this property is set to '*true*' the newly created user will be sent a welcome email. |
| `serialNumber` | The Device's serial number. |
| `startDate` | Timestamp from the beginning of the transaction. |
| `stateProvince` | The Location's street state or province. |
| `success` | The success indicator. |
| `tracking` | The courier's tracking number. |
| `uniqueId` | Unique Identifier for the Location. |
| `userName` | The User's unique username. |
| `userRole` | Reference to the associated User Role. |
| `verificationPhrase` | The verification phrase is a message that the Partner creates. |
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

#### VirtualDevice

| Field | Description |
| --- | --- |
| `data` | List of Devices. |
| `id` |  |
| `total` | Total number of Devices available (not the number of Users in the response). |

Operations: Load.

API path: `/virtualDevices/{sharePartnerTo}`



## Entities


### Attestation

Create an instance: `my $attestation = $client->Attestation;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `hashref` | Reference to the associated Client resource. |
| `completeDate` | `string` | The date and time that the Attestation took place. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `device` | `hashref` | Reference to the associated Device resource. |
| `devices` | `arrayref` |  |
| `id` | `string` | This resource's unique identifier. |
| `name` | `string` | Text describing the attestation. |
| `notes` | `string` | Free form field that allows the Client associate notes with the Attestation. |

#### Example: Load

```perl
my $attestation = $client->Attestation->load({ 'id' => 'attestation_id' });
```

#### Example: List

```perl
# an arrayref of entities, one per record; data_get reads each record
my $attestations = $client->Attestation->list({ 'client' => 'example' });
print $_->data_get->{id}, "\n" for @$attestations;
```

#### Example: Create

```perl
my $attestation = $client->Attestation->create({
    'devices' => [],  # arrayref
});
```


### Client

Create an instance: `my $client = $client->Client;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |
| `remove($match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `hashref` | Reference to the associated User resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `hashref` | Reference to the associated Partner. |
| `id` | `string` | This resource's unique identifier. |
| `isActive` | `boolean` | This property indicates if the Client account is active or disabled. |
| `location` | `hashref` | Reference to the associated Location resource. |
| `mid` | `string` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Client's name. |
| `partner` | `hashref` | Reference to the Client's root Partner. |
| `version` | `integer` | The number of times that this resource has been updated. |

#### Example: Load

```perl
my $client = $client->Client->load({ 'id' => 'client_id' });
```

#### Example: List

```perl
# an arrayref of entities, one per record; data_get reads each record
my $clients = $client->Client->list({ 'partner' => 'example' });
print $_->data_get->{id}, "\n" for @$clients;
```

#### Example: Create

```perl
my $client = $client->Client->create({
    'location' => {},  # hashref
});
```


### CreateResult

Create an instance: `my $create_result = $client->CreateResult;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `string` | The date and time that the Custody change took place. |
| `custodian` | `hashref` | Reference to the associated User resource. |
| `location` | `hashref` | Reference to the associated Location resource. |
| `notes` | `string` | Free form field that allows the Client associate notes with the Custody Change. |

#### Example: Create

```perl
my $create_result = $client->CreateResult->create({
    'device_type' => 'example_device_type',  # string
    'serial_number' => 'example_serial_number',  # string
    'custodian' => {},  # hashref
    'location' => {},  # hashref
});
```


### Decryption

Create an instance: `my $decryption = $client->Decryption;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `cbcVector` | `string` | Base64 or hex encoded initial vector obtained from device. |
| `deviceType` | `string` | The device Type. |
| `encoding` | `string` | The payload encoding |
| `encrypted` | `arrayref` |  |
| `hasCcData` | `string` | Validation flag that indicates whether inbound and outbound data should be checked for credit card numbers. |
| `reference` | `string` | A string (of up to 50 characters) that helps partners identify individual API calls. |
| `sequenceNumber` | `string` | Sequence number obtained from device in base 64 or hex encoded format. |
| `serialNumber` | `string` | The serial number of the device. |
| `success` | `boolean` | true if the payload decryption was successful. |

#### Example: Create

```perl
my $decryption = $client->Decryption->create({
    'deviceType' => 'example_deviceType',  # string
    'encrypted' => [],  # arrayref
    'serialNumber' => 'example_serialNumber',  # string
});
```


### Device

Create an instance: `my $device = $client->Device;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `hashref` | Reference to the associated User resource. |
| `activationDate` | `string` | Timestamp from when the Device was activated. |
| `alternateKey` | `string` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `string` | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `string` | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `hashref` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `hashref` | Reference to the associated User resource. |
| `deviceBuild` | `hashref` | Reference to the associated Device Build resource. |
| `deviceState` | `hashref` | Reference to the associated Device State resource. |
| `deviceType` | `hashref` | Reference to the associated Device Type resource. |
| `errorCounter` | `integer` | The number times the Device has been in error. |
| `errorLastDate` | `string` | Timestamp from the last time that the Device had an error. |
| `id` | `string` | The Device's unique identifier. |
| `initializedBy` | `hashref` | Reference to the associated User resource. |
| `initializedDate` | `string` | Timestamp from when the Device was initialized. |
| `injectKey` | `hashref` | Reference to the associated Device resource. |
| `isVirtual` | `boolean` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `hashref` | Reference to the associated KIF resource. |
| `lastActivityDate` | `string` | Timestamp from the last time that the Device was used. |
| `location` | `hashref` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `modifiedBy` | `hashref` | Reference to the associated User resource. |
| `name` | `string` | The Device's name. |
| `notes` | `string` | Arbitary note that can be attached to a Device entry. |
| `partner` | `hashref` | Reference to the associated Partner. |
| `serialNumber` | `string` | The Device's serial number. |
| `version` | `integer` | The number of times that this resource has been updated. |

#### Example: Load

```perl
my $device = $client->Device->load({ 'id' => 'device_id' });
```

#### Example: List

```perl
# an arrayref of entities, one per record; data_get reads each record
my $devices = $client->Device->list;
print $_->data_get->{id}, "\n" for @$devices;
```

#### Example: Create

```perl
my $device = $client->Device->create({
    'activatedBy' => {},  # hashref
    'createdBy' => {},  # hashref
    'initializedBy' => {},  # hashref
    'location' => {},  # hashref
    'modifiedBy' => {},  # hashref
});
```


### DeviceBuild

Create an instance: `my $device_build = $client->DeviceBuild;`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appVersion` | `string` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `string` | The Build Number. |
| `configFileName` | `string` | The name of the configuration file that is uploaded to the device. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `deviceType` | `string` | The Device Type Name. |
| `firmwareVersion` | `string` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `string` | A list of hardware versions that this Device Build covers. |
| `id` | `integer` | This resource's unique identifier. |
| `isActive` | `boolean` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Device Builds's name. |
| `notes` | `string` | Notes attached to the device build by Bluefin CISO. |
| `version` | `integer` | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `string` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `boolean` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

#### Example: Load

```perl
my $device_build = $client->DeviceBuild->load({ 'id' => 'device_build_id' });
```

#### Example: List

```perl
# an arrayref of entities, one per record; data_get reads each record
my $device_builds = $client->DeviceBuild->list;
print $_->data_get->{id}, "\n" for @$device_builds;
```


### DeviceCustodyDetail

Create an instance: `my $device_custody_detail = $client->DeviceCustodyDetail;`

#### Operations

| Method | Description |
| --- | --- |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `string` | The date and time that the Custody change took place. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `hashref` | Reference to the associated User resource. |
| `custodian` | `hashref` | Reference to the associated User resource. |
| `device` | `hashref` | Reference to the associated Device resource. |
| `id` | `integer` | This resource's unique identifier. |
| `location` | `hashref` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `modifiedBy` | `hashref` | Reference to the associated User resource. |
| `notes` | `string` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `hashref` | Reference to the associated Custody Status. |
| `transferMethod` | `hashref` | Reference to the associated Transfer Method. |
| `version` | `integer` | The number of times that this resource has been updated. |

#### Example: Load

```perl
my $device_custody_detail = $client->DeviceCustodyDetail->load({ 'id' => 'device_custody_detail_id', 'device_type' => 'device_type', 'serial_number' => 'serial_number' });
```


### DeviceCustodyListItem

Create an instance: `my $device_custody_list_item = $client->DeviceCustodyListItem;`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `string` | The date and time that the Custody change took place. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `hashref` | Reference to the associated User resource. |
| `custodian` | `hashref` | Reference to the associated User resource. |
| `device` | `hashref` | Reference to the associated Device resource. |
| `id` | `integer` | This resource's unique identifier. |
| `location` | `hashref` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `modifiedBy` | `hashref` | Reference to the associated User resource. |
| `notes` | `string` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `hashref` | Reference to the associated Custody Status. |
| `transferMethod` | `hashref` | Reference to the associated Transfer Method. |
| `version` | `integer` | The number of times that this resource has been updated. |

#### Example: List

```perl
# an arrayref of entities, one per record; data_get reads each record
my $device_custody_list_items = $client->DeviceCustodyListItem->list({ 'device_type' => 'example', 'serial_number' => 'example' });
print $_->data_get->{id}, "\n" for @$device_custody_list_items;
```


### DeviceReceiveResult

Create an instance: `my $device_receive_result = $client->DeviceReceiveResult;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `serialNumber` | `string` | The serial number of the Device that is shipped. |
| `success` | `boolean` | Indicates if the action succeeded. |
| `tamperLabel` | `string` | The code that is printed the tamper label of the Device that is shipped. |

#### Example: Create

```perl
my $device_receive_result = $client->DeviceReceiveResult->create({
    'serialNumber' => 'example_serialNumber',  # string
    'success' => 1,  # boolean
    'tamperLabel' => 'example_tamperLabel',  # string
});
```


### DeviceRkiActivateResult

Create an instance: `my $device_rki_activate_result = $client->DeviceRkiActivateResult;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appVersion` | `string` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildName` | `string` | The Device Builds's name. |
| `buildNumber` | `string` | The Build Number. |
| `configFile` | `string` | \? |
| `firmwareVersion` | `string` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `string` | A list of hardware versions that this Device Build covers. |
| `serialNumber` | `string` | The referenced Device's serial number. |
| `success` | `boolean` | Indicates if the RKI activation succeeded. |
| `whiteListingBinRanges` | `string` | \? |

#### Example: Create

```perl
my $device_rki_activate_result = $client->DeviceRkiActivateResult->create({
    'serialNumber' => 'example_serialNumber',  # string
    'success' => 1,  # boolean
});
```


### DeviceState

Create an instance: `my $device_state = $client->DeviceState;`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `integer` | Unique identifier for this Device state. |
| `name` | `string` | Descriptive name for this Device state. |

#### Example: List

```perl
# an arrayref of entities, one per record; data_get reads each record
my $device_states = $client->DeviceState->list;
print $_->data_get->{id}, "\n" for @$device_states;
```


### DeviceType

Create an instance: `my $device_type = $client->DeviceType;`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `string` | The Device type. |
| `hardwareVersion` | `string` | The Device hardware version. |
| `id` | `string` | Unique idenifier. |
| `isActive` | `boolean` | This property indicates if the DeviceType is active. |
| `manufacturer` | `string` | The Device manufacturer. |
| `model` | `string` | The Device model. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The DeviceType name. |
| `photoUrl` | `string` |  |
| `productName` | `string` | The Device name. |
| `version` | `integer` | The number of times that this resource has been updated. |

#### Example: Load

```perl
my $device_type = $client->DeviceType->load({ 'id' => 'device_type_id' });
```

#### Example: List

```perl
# an arrayref of entities, one per record; data_get reads each record
my $device_types = $client->DeviceType->list;
print $_->data_get->{id}, "\n" for @$device_types;
```


### InjectKey

Create an instance: `my $inject_key = $client->InjectKey;`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `id` | `string` | unique idenifier |
| `isActive` | `boolean` | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `boolean` | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `string` | The cipher type that the key works with. |
| `modified` | `string` | Last modified timestamp in ISO 8601 format. |
| `name` | `string` | Key name. |
| `version` | `integer` | The number of times that this resource has been updated. |

#### Example: Load

```perl
my $inject_key = $client->InjectKey->load({ 'id' => 'inject_key_id' });
```

#### Example: List

```perl
# an arrayref of entities, one per record; data_get reads each record
my $inject_keys = $client->InjectKey->list;
print $_->data_get->{id}, "\n" for @$inject_keys;
```


### Kif

Create an instance: `my $kif = $client->Kif;`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `integer` | This resource's unique identifier. |
| `name` | `string` | The KIF's name. |

#### Example: List

```perl
# an arrayref of entities, one per record; data_get reads each record
my $kifs = $client->Kif->list;
print $_->data_get->{id}, "\n" for @$kifs;
```


### Location

Create an instance: `my $location = $client->Location;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |
| `remove($match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address1` | `string` | The Location's street address. |
| `address2` | `string` | The Location's street address. |
| `billingId` | `string` | \? |
| `city` | `string` | The Location's city. |
| `client` | `hashref` | Reference to the associated Client resource. |
| `country` | `string` | The Location's country. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `customReference` | `string` | A Partner specified reference for a location. |
| `id` | `string` | This resource's unique identifier. |
| `locationType` | `string` | The Location's clasification. |
| `mailAddress1` | `string` | The Location's street address. |
| `mailAddress2` | `string` | The Location's street address. |
| `mailCity` | `string` | The Location's city. |
| `mailCountry` | `string` | The Location's street address. |
| `mailPostalCode` | `string` | The Location's postal code. |
| `mailStateProvince` | `string` | The Location's street state or province. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Location's name. |
| `nameOfBusiness` | `string` | The name of the business at this location. |
| `notes` | `string` | Note for delivery driver. |
| `postalCode` | `string` | The Location's postal code. |
| `stateProvince` | `string` | The Location's street state or province. |
| `uniqueId` | `string` | Unique Identifier for the Location. |
| `version` | `integer` | The number of times that this resource has been updated. |

#### Example: Load

```perl
my $location = $client->Location->load({ 'id' => 'location_id' });
```

#### Example: List

```perl
# an arrayref of entities, one per record; data_get reads each record
my $locations = $client->Location->list({ 'client' => 'example' });
print $_->data_get->{id}, "\n" for @$locations;
```

#### Example: Create

```perl
my $location = $client->Location->create({
});
```


### Partner

Create an instance: `my $partner = $client->Partner;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `string` | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `boolean` | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `hashref` | Reference to the associated User resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `id` | `string` | This resource's unique identifier. |
| `isActive` | `boolean` | This property indicates if the Parter account is active or disabled. |
| `location` | `hashref` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Partner's name. |
| `parent` | `hashref` | Reference to the associated Partner. |
| `partnerId` | `string` | The Partner's id. |
| `reference` | `string` | The Partner's reference string. |
| `verificationPhrase` | `string` | The verification phrase is a message that the Partner creates. |
| `version` | `integer` | The number of times that this resource has been updated. |

#### Example: Load

```perl
my $partner = $client->Partner->load({ 'id' => 'partner_id' });
```

#### Example: List

```perl
# an arrayref of entities, one per record; data_get reads each record
my $partners = $client->Partner->list;
print $_->data_get->{id}, "\n" for @$partners;
```

#### Example: Create

```perl
my $partner = $client->Partner->create({
    'location' => {},  # hashref
});
```


### Shipment

Create an instance: `my $shipment = $client->Shipment;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `string` | The name of the courier. |
| `client` | `hashref` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `string` | The date and time that a package is recieved. |
| `dateShipped` | `string` | The date and time that a package is shipped. |
| `dcKif` | `hashref` | Reference to the associated KIF resource. |
| `id` | `string` | This resource's unique identifier. |
| `items` | `arrayref` |  |
| `kif` | `hashref` | Reference to the associated KIF resource. |
| `location` | `hashref` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `partner` | `hashref` | Reference to the associated Partner. |
| `shipmentType` | `string` | The type of shipment. |
| `tracking` | `string` | The courier's tracking number. |
| `version` | `integer` | The number of times that this resource has been updated. |

#### Example: Load

```perl
my $shipment = $client->Shipment->load({ 'id' => 'shipment_id' });
```

#### Example: List

```perl
# an arrayref of entities, one per record; data_get reads each record
my $shipments = $client->Shipment->list({ 'kif' => 'example' });
print $_->data_get->{id}, "\n" for @$shipments;
```

#### Example: Create

```perl
my $shipment = $client->Shipment->create({
    'location' => {},  # hashref
});
```


### Success

Create an instance: `my $success = $client->Success;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `remove($match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `devices` | `arrayref` | An array of Device ids to share with partner. |
| `sharePartnerFrom` | `hashref` | Reference to the associated Partner. |
| `success` | `boolean` | Indicates if the action was a success. |

#### Example: Create

```perl
my $success = $client->Success->create({
    'share_partner_to' => 'example_share_partner_to',  # string
    'devices' => [],  # arrayref
    'sharePartnerFrom' => {},  # hashref
});
```


### Transaction

Create an instance: `my $transaction = $client->Transaction;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `string` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `hashref` | Reference to the associated Client resource. |
| `clientRef` | `string` | Client Reference property that is included in the decrypt API call. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `decrypted` | `integer` | A Transcation can process muliple decryptions. |
| `device` | `hashref` | Reference to the associated Device resource. |
| `deviceName` | `string` | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `hashref` | Reference to the associated Partner. |
| `encrypted` | `integer` | A Transcation can process muliple encryptions. |
| `endDate` | `string` | Timestamp from the end of the transaction. |
| `errCode` | `string` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `string` | This resource's unique identifier. |
| `ipAddress` | `string` | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `boolean` | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `string` | The type of cipher used during decrytion. |
| `location` | `hashref` | Reference to the associated Location resource. |
| `messageId` | `string` | Message ID. |
| `method` | `string` | The decryption cypher/method. |
| `partner` | `hashref` | Reference to the associated Partner. |
| `reference` | `string` | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `string` | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `string` | Timestamp from the beginning of the transaction. |
| `success` | `boolean` | The success indicator. |
| `transactionSource` | `string` | The source of the Transaction. |

#### Example: Load

```perl
my $transaction = $client->Transaction->load({ 'id' => 'transaction_id' });
```

#### Example: List

```perl
# an arrayref of entities, one per record; data_get reads each record
my $transactions = $client->Transaction->list;
print $_->data_get->{id}, "\n" for @$transactions;
```

#### Example: Create

```perl
my $transaction = $client->Transaction->create({
    'device' => {},  # hashref
    'location' => {},  # hashref
});
```


### UpdateResult

Create an instance: `my $update_result = $client->UpdateResult;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `update($data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address1` | `string` | The Location's street address. |
| `address2` | `string` | The Location's street address. |
| `alternateKey` | `string` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `string` | Date and time that the Device is due its next PCI Audit. |
| `billingId` | `string` | \? |
| `city` | `string` | The Location's city. |
| `client` | `hashref` | Reference to the associated Client resource. |
| `clientCanOrderEquipment` | `boolean` | This property indicates if the Partner is allowed to order Equipment. |
| `clientRef` | `string` | Client Reference property that is included in the decrypt API call. |
| `contact` | `hashref` | Reference to the associated User resource. |
| `country` | `hashref` | Reference to the associated Country. |
| `customReference` | `string` | A Partner specified reference for a location. |
| `dateShipped` | `string` | The date and time that a package is shipped. |
| `decrypted` | `integer` | A Transcation can process muliple decryptions. |
| `device` | `hashref` | Reference to the associated Device resource. |
| `deviceBuild` | `hashref` | Reference to the associated Device Build resource. |
| `deviceType` | `hashref` | Reference to the associated Device Type resource. |
| `directPartner` | `hashref` | Reference to the associated Partner. |
| `email` | `string` | The User's email address. |
| `encrypted` | `integer` | A Transcation can process muliple encryptions. |
| `endDate` | `string` | Timestamp from the end of the transaction. |
| `errCode` | `string` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | The error messge that is sent in response to a failed decrypt API call. |
| `firstName` | `string` | The User's name. |
| `id` | `string` | ID of newly created resource |
| `injectKey` | `hashref` | Reference to the associated Device resource. |
| `ipAddress` | `string` | The IP address of the http client that makes the decrypt API call. |
| `isActive` | `boolean` | This property indicates if the User account is active or disabled. |
| `items` | `arrayref` |  |
| `keyType` | `string` | The type of cipher used during decrytion. |
| `kif` | `hashref` | Reference to the associated KIF resource. |
| `lastName` | `string` | The User's Surname. |
| `location` | `hashref` | Reference to the associated Location resource. |
| `locationType` | `string` | The Location's clasification. |
| `mailAddress1` | `string` | The Location's street address. |
| `mailAddress2` | `string` | The Location's street address. |
| `mailCity` | `string` | The Location's city. |
| `mailCountry` | `string` | The Location's street address. |
| `mailPostalCode` | `string` | The Location's postal code. |
| `mailStateProvince` | `string` | The Location's street state or province. |
| `messageId` | `string` | Message ID. |
| `method` | `string` | The decryption cypher/method. |
| `mid` | `string` | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `string` | The Client's name. |
| `nameOfBusiness` | `string` | The name of the business at this location. |
| `notes` | `string` | Arbitary note that can be attached to a Device entry. |
| `parent` | `hashref` | Reference to the associated Partner. |
| `partner` | `hashref` | Reference to the associated Partner. |
| `partnerId` | `string` | The Partner's id. |
| `phone` | `string` | The User's phone number without dashes, spaces, or brackets. |
| `postalCode` | `string` | The Location's postal code. |
| `reference` | `string` | The Partner's reference string. |
| `sendWelcomeEmail` | `boolean` | If this property is set to '*true*' the newly created user will be sent a welcome email. |
| `serialNumber` | `string` | The Device's serial number. |
| `startDate` | `string` | Timestamp from the beginning of the transaction. |
| `stateProvince` | `string` | The Location's street state or province. |
| `success` | `boolean` | The success indicator. |
| `tracking` | `string` | The courier's tracking number. |
| `uniqueId` | `string` | Unique Identifier for the Location. |
| `userName` | `string` | The User's unique username. |
| `userRole` | `hashref` | Reference to the associated User Role. |
| `verificationPhrase` | `string` | The verification phrase is a message that the Partner creates. |
| `version` | `integer` | The number of times that this resource has been updated. |

#### Example: List

```perl
# an arrayref of entities, one per record; data_get reads each record
my $update_results = $client->UpdateResult->list;
print $_->data_get->{id}, "\n" for @$update_results;
```

#### Example: Create

```perl
my $update_result = $client->UpdateResult->create({
    'contact' => {},  # hashref
    'email' => 'example_email',  # string
    'firstName' => 'example_firstName',  # string
    'isActive' => 1,  # boolean
    'lastName' => 'example_lastName',  # string
    'location' => {},  # hashref
    'phone' => 'example_phone',  # string
    'userName' => 'example_userName',  # string
    'userRole' => {},  # hashref
});
```


### User

Create an instance: `my $user = $client->User;`

#### Operations

| Method | Description |
| --- | --- |
| `load($match)` | Load a single entity by match criteria. |
| `remove($match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `hashref` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `email` | `string` | The User's email address. |
| `firstName` | `string` | The User's name. |
| `id` | `string` | This resource's unique identifier. |
| `isActive` | `boolean` | This property indicates if the User account is active or disabled. |
| `kif` | `hashref` | Reference to the associated KIF resource. |
| `lastName` | `string` | The User's Surname. |
| `modified` | `string` | Last modified timestamp. |
| `partner` | `hashref` | Reference to the associated Partner. |
| `phone` | `string` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `string` | The User's unique username. |
| `userRole` | `hashref` | Reference to the associated User Role. |
| `version` | `integer` | The number of times that this resource has been updated. |

#### Example: Load

```perl
my $user = $client->User->load({ 'id' => 'user_id' });
```


### VirtualDevice

Create an instance: `my $virtual_device = $client->VirtualDevice;`

#### Operations

| Method | Description |
| --- | --- |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `arrayref` | List of Devices. |
| `id` | `string` |  |
| `total` | `integer` | Total number of Devices available (not the number of Users in the response). |

#### Example: Load

```perl
my $virtual_device = $client->VirtualDevice->load({ 'id' => 'virtual_device_id' });
```

## Features

This SDK ships 12 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`audit`](#audit) | Audit trail |
| [`clienttrack`](#clienttrack) | Client tracking |
| [`debug`](#debug) | Debug capture |
| [`idempotency`](#idempotency) | Idempotency |
| [`log`](#log) | Logging |
| [`metrics`](#metrics) | Metrics |
| [`paging`](#paging) | Paging |
| [`ratelimit`](#ratelimit) | Rate limiting |
| [`retry`](#retry) | Retry |
| [`telemetry`](#telemetry) | Telemetry |
| [`test`](#test) | Test transport |
| [`timeout`](#timeout) | Timeout |

> **Order matters for `ratelimit`, `retry`, `timeout`.** These wrap the
> transport, so each one wraps whatever is already installed: the order you
> activate them in IS the nesting order. Activating them as an ordered list
> rather than a map is what fixes that order.

### audit

Audit trail.

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

Set `feature.audit.active` to enable it, then override any of the options above.

### clienttrack

Client tracking.

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

Set `feature.clienttrack.active` to enable it, then override any of the options above.

### debug

Debug capture.

| Option | Default |
|---|---|
| `active` | `false` |
| `max` | `100` |
| `redact` | `['authorization', 'cookie', 'set-cookie', 'api-key', 'apikey', 'x-api-key', 'idempotency-key']` |

Set `feature.debug.active` to enable it, then override any of the options above.

### idempotency

Idempotency.

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

Set `feature.idempotency.active` to enable it, then override any of the options above.

### log

Logging.

| Option | Default |
|---|---|
| `active` | `true` |

Set `feature.log.active` to enable it, then override any of the options above.

### metrics

Metrics.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.metrics.active` to enable it, then override any of the options above.

### paging

Paging.

| Option | Default |
|---|---|
| `active` | `false` |
| `afterVar` | `'after'` |
| `cursorParam` | `'cursor'` |
| `firstVar` | `'first'` |
| `limitParam` | `'limit'` |
| `pageParam` | `'page'` |
| `startPage` | `1` |

Set `feature.paging.active` to enable it, then override any of the options above.

### ratelimit

Rate limiting.

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

Set `feature.ratelimit.active` to enable it, then override any of the options above.

`ratelimit` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.

### retry

Retry.

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

Set `feature.retry.active` to enable it, then override any of the options above.

`retry` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.

### telemetry

Telemetry.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.telemetry.active` to enable it, then override any of the options above.

### test

Test transport.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.test.active` to enable it, then override any of the options above.

### timeout

Timeout.

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

Set `feature.timeout.active` to enable it, then override any of the options above.

`timeout` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.


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

- **AuditFeature**: Audit trail
- **ClienttrackFeature**: Client tracking
- **DebugFeature**: Debug capture
- **IdempotencyFeature**: Idempotency
- **LogFeature**: Logging
- **MetricsFeature**: Metrics
- **PagingFeature**: Paging
- **RatelimitFeature**: Rate limiting
- **RetryFeature**: Retry
- **TelemetryFeature**: Telemetry
- **TestFeature**: Test transport
- **TimeoutFeature**: Timeout

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as hashrefs

The Perl SDK uses plain hashrefs and arrayrefs throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Use `BluefinDecryptxP2peHelpers::to_map()` to safely validate that a value
is a hashref.

### Module structure

```
perl/
├── lib/BluefinDecryptxP2peSDK.pm    -- Main SDK module (package BluefinDecryptxP2peSDK)
├── config.pm                    -- Configuration
├── schema.pm                    -- Generated option + entity specs
├── features.pm                  -- Feature factory
├── core/                        -- Core types and context
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (base, test, log)
├── utility/                     -- Utility functions
├── lib/Voxgig/Struct.pm         -- Vendored struct library
└── t/                           -- Test suites
```

Load the main module with `use lib 'lib'; use BluefinDecryptxP2peSDK;` — it
pulls in the config, features, and core modules for you. Require entity or
utility modules directly only when needed.

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

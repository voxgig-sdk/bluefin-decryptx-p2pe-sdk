# BluefinDecryptxP2pe Dart SDK Reference

Complete API reference for the BluefinDecryptxP2pe Dart SDK.

## BluefinDecryptxP2peSDK

### Constructor

```dart
import 'package:bluefin_decryptx_p2pe_sdk/BluefinDecryptxP2peSDK.dart';

final client = BluefinDecryptxP2peSDK(options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Map` | SDK configuration options. |
| `options['apikey']` | `String` | API key for authentication. |
| `options['base']` | `String` | Base URL for API requests. |
| `options['prefix']` | `String` | URL prefix appended after base. |
| `options['suffix']` | `String` | URL suffix appended after path. |
| `options['headers']` | `Map` | Custom headers for all requests. |
| `options['feature']` | `Map` | Feature configuration. |
| `options['system']` | `Map` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinDecryptxP2peSDK.test([testopts, sdkopts])`

Create a test client with mock features active. Both arguments may be `null`.

```dart
final client = BluefinDecryptxP2peSDK.test();
```


### Instance Methods

#### `Attestation([entopts])`

Create a new `AttestationEntity` instance. Pass no argument for no initial data.

#### `Client([entopts])`

Create a new `ClientEntity` instance. Pass no argument for no initial data.

#### `CreateResult([entopts])`

Create a new `CreateResultEntity` instance. Pass no argument for no initial data.

#### `Decryption([entopts])`

Create a new `DecryptionEntity` instance. Pass no argument for no initial data.

#### `Device([entopts])`

Create a new `DeviceEntity` instance. Pass no argument for no initial data.

#### `DeviceBuild([entopts])`

Create a new `DeviceBuildEntity` instance. Pass no argument for no initial data.

#### `DeviceCustodyDetail([entopts])`

Create a new `DeviceCustodyDetailEntity` instance. Pass no argument for no initial data.

#### `DeviceCustodyListItem([entopts])`

Create a new `DeviceCustodyListItemEntity` instance. Pass no argument for no initial data.

#### `DeviceReceiveResult([entopts])`

Create a new `DeviceReceiveResultEntity` instance. Pass no argument for no initial data.

#### `DeviceRkiActivateResult([entopts])`

Create a new `DeviceRkiActivateResultEntity` instance. Pass no argument for no initial data.

#### `DeviceState([entopts])`

Create a new `DeviceStateEntity` instance. Pass no argument for no initial data.

#### `DeviceType([entopts])`

Create a new `DeviceTypeEntity` instance. Pass no argument for no initial data.

#### `InjectKey([entopts])`

Create a new `InjectKeyEntity` instance. Pass no argument for no initial data.

#### `Kif([entopts])`

Create a new `KifEntity` instance. Pass no argument for no initial data.

#### `Location([entopts])`

Create a new `LocationEntity` instance. Pass no argument for no initial data.

#### `Partner([entopts])`

Create a new `PartnerEntity` instance. Pass no argument for no initial data.

#### `Shipment([entopts])`

Create a new `ShipmentEntity` instance. Pass no argument for no initial data.

#### `Success([entopts])`

Create a new `SuccessEntity` instance. Pass no argument for no initial data.

#### `Transaction([entopts])`

Create a new `TransactionEntity` instance. Pass no argument for no initial data.

#### `UpdateResult([entopts])`

Create a new `UpdateResultEntity` instance. Pass no argument for no initial data.

#### `User([entopts])`

Create a new `UserEntity` instance. Pass no argument for no initial data.

#### `VirtualDevice([entopts])`

Create a new `VirtualDeviceEntity` instance. Pass no argument for no initial data.

#### `options() -> Map`

Return a deep copy of the current SDK options.

#### `utility() -> Utility`

Return the SDK utility object.

#### `direct([fetchargs]) -> Future<Map>`

Make a direct HTTP request to any API endpoint. Returns a result `Map` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never throws — branch on `result['ok']`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs['path']` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs['method']` | `String` | HTTP method (default: `'GET'`). |
| `fetchargs['params']` | `Map` | Path parameter values. |
| `fetchargs['query']` | `Map` | Query string parameters. |
| `fetchargs['headers']` | `Map` | Request headers (merged with defaults). |
| `fetchargs['body']` | `dynamic` | Request body (maps are JSON-serialized). |

**Returns:** `Future<Map>`

#### `prepare([fetchargs]) -> Future`

Prepare a fetch definition without sending. Returns the `fetchdef` (or an error value on failure).


---

## AttestationEntity

```dart
final attestation = client.Attestation();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Map<String, dynamic>` | No | Reference to the associated Client resource. |
| `completeDate` | `String` | No | The date and time that the Attestation took place. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `device` | `Map<String, dynamic>` | No | Reference to the associated Device resource. |
| `devices` | `List<dynamic>` | Yes |  |
| `id` | `String` | No | This resource's unique identifier. |
| `name` | `String` | No | Text describing the attestation. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Attestation. |

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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity and throws on error.

```dart
final result = await client.Attestation().create({
  'devices': <dynamic>[],  // List<dynamic>
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and throws on error.

```dart
final results = await client.Attestation().list({ client: "example" });
for (final attestation in results) {
  print(attestation.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and throws on error.

```dart
final result = await client.Attestation().load({'id': 'attestation_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `AttestationEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## ClientEntity

```dart
final client_ = client.Client();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `Map<String, dynamic>` | No | Reference to the associated User resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `id` | `String` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Client account is active or disabled. |
| `location` | `Map<String, dynamic>` | Yes | Reference to the associated Location resource. |
| `mid` | `String` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Client's name. |
| `partner` | `Map<String, dynamic>` | No | Reference to the Client's root Partner. |
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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity and throws on error.

```dart
final result = await client.Client().create({
  'location': <String, dynamic>{},  // Map<String, dynamic>
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and throws on error.

```dart
final results = await client.Client().list({ partner: "example" });
for (final client_ in results) {
  print(client_.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and throws on error.

```dart
final result = await client.Client().load({'id': 'client_id'});
```

#### `remove(reqmatch, [ctrl]) -> Future<dynamic>`

Remove the entity matching the given criteria. Returns the entity, marked as deleted (`deleted()`); it keeps the data it held. Throws on error.

```dart
final result = await client.Client().remove({'id': 'client_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `ClientEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## CreateResultEntity

```dart
final create_result = client.CreateResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String` | No | The date and time that the Custody change took place. |
| `custodian` | `Map<String, dynamic>` | Yes | Reference to the associated User resource. |
| `location` | `Map<String, dynamic>` | Yes | Reference to the associated Location resource. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Custody Change. |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity and throws on error.

```dart
final result = await client.CreateResult().create({
  'device_type': 'example_device_type',  // String
  'serial_number': 'example_serial_number',  // String
  'custodian': <String, dynamic>{},  // Map<String, dynamic>
  'location': <String, dynamic>{},  // Map<String, dynamic>
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `CreateResultEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## DecryptionEntity

```dart
final decryption = client.Decryption();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `cbcVector` | `String` | No | Base64 or hex encoded initial vector obtained from device. |
| `deviceType` | `String` | Yes | The device Type. |
| `encoding` | `String` | No | The payload encoding |
| `encrypted` | `List<dynamic>` | Yes |  |
| `hasCcData` | `String` | No | Validation flag that indicates whether inbound and outbound data should be checked for credit card numbers. |
| `reference` | `String` | No | A string (of up to 50 characters) that helps partners identify individual API calls. |
| `sequenceNumber` | `String` | No | Sequence number obtained from device in base 64 or hex encoded format. |
| `serialNumber` | `String` | Yes | The serial number of the device. |
| `success` | `bool` | No | true if the payload decryption was successful. |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity and throws on error.

```dart
final result = await client.Decryption().create({
  'deviceType': 'example_deviceType',  // String
  'encrypted': <dynamic>[],  // List<dynamic>
  'serialNumber': 'example_serialNumber',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `DecryptionEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## DeviceEntity

```dart
final device = client.Device();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activatedBy` | `Map<String, dynamic>` | Yes | Reference to the associated User resource. |
| `activationDate` | `String` | No | Timestamp from when the Device was activated. |
| `alternateKey` | `String` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `String` | No | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `String` | No | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `Map<String, dynamic>` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Map<String, dynamic>` | Yes | Reference to the associated User resource. |
| `deviceBuild` | `Map<String, dynamic>` | No | Reference to the associated Device Build resource. |
| `deviceState` | `Map<String, dynamic>` | No | Reference to the associated Device State resource. |
| `deviceType` | `Map<String, dynamic>` | No | Reference to the associated Device Type resource. |
| `errorCounter` | `int` | No | The number times the Device has been in error. |
| `errorLastDate` | `String` | No | Timestamp from the last time that the Device had an error. |
| `id` | `String` | No | The Device's unique identifier. |
| `initializedBy` | `Map<String, dynamic>` | Yes | Reference to the associated User resource. |
| `initializedDate` | `String` | No | Timestamp from when the Device was initialized. |
| `injectKey` | `Map<String, dynamic>` | No | Reference to the associated Device resource. |
| `isVirtual` | `bool` | No | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `Map<String, dynamic>` | No | Reference to the associated KIF resource. |
| `lastActivityDate` | `String` | No | Timestamp from the last time that the Device was used. |
| `location` | `Map<String, dynamic>` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `modifiedBy` | `Map<String, dynamic>` | Yes | Reference to the associated User resource. |
| `name` | `String` | No | The Device's name. |
| `notes` | `String` | No | Arbitary note that can be attached to a Device entry. |
| `partner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `serialNumber` | `String` | No | The Device's serial number. |
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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity and throws on error.

```dart
final result = await client.Device().create({
  'activatedBy': <String, dynamic>{},  // Map<String, dynamic>
  'createdBy': <String, dynamic>{},  // Map<String, dynamic>
  'initializedBy': <String, dynamic>{},  // Map<String, dynamic>
  'location': <String, dynamic>{},  // Map<String, dynamic>
  'modifiedBy': <String, dynamic>{},  // Map<String, dynamic>
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and throws on error.

```dart
final results = await client.Device().list();
for (final device in results) {
  print(device.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and throws on error.

```dart
final result = await client.Device().load({'id': 'device_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `DeviceEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## DeviceBuildEntity

```dart
final device_build = client.DeviceBuild();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appVersion` | `String` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `String` | No | The Build Number. |
| `configFileName` | `String` | No | The name of the configuration file that is uploaded to the device. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `deviceType` | `String` | No | The Device Type Name. |
| `firmwareVersion` | `String` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `String` | No | A list of hardware versions that this Device Build covers. |
| `id` | `int` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Device Builds's name. |
| `notes` | `String` | No | Notes attached to the device build by Bluefin CISO. |
| `version` | `int` | No | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `String` | No | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `bool` | No | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

### Operations

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and throws on error.

```dart
final results = await client.DeviceBuild().list();
for (final device_build in results) {
  print(device_build.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and throws on error.

```dart
final result = await client.DeviceBuild().load({'id': 'device_build_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `DeviceBuildEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## DeviceCustodyDetailEntity

```dart
final device_custody_detail = client.DeviceCustodyDetail();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String` | No | The date and time that the Custody change took place. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Map<String, dynamic>` | Yes | Reference to the associated User resource. |
| `custodian` | `Map<String, dynamic>` | Yes | Reference to the associated User resource. |
| `device` | `Map<String, dynamic>` | No | Reference to the associated Device resource. |
| `id` | `int` | No | This resource's unique identifier. |
| `location` | `Map<String, dynamic>` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `modifiedBy` | `Map<String, dynamic>` | Yes | Reference to the associated User resource. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Map<String, dynamic>` | No | Reference to the associated Custody Status. |
| `transferMethod` | `Map<String, dynamic>` | No | Reference to the associated Transfer Method. |
| `version` | `int` | No | The number of times that this resource has been updated. |

### Operations

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and throws on error.

```dart
final result = await client.DeviceCustodyDetail().load({'id': 'device_custody_detail_id', 'device_type': 'device_type', 'serial_number': 'serial_number'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `DeviceCustodyDetailEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## DeviceCustodyListItemEntity

```dart
final device_custody_list_item = client.DeviceCustodyListItem();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String` | No | The date and time that the Custody change took place. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Map<String, dynamic>` | Yes | Reference to the associated User resource. |
| `custodian` | `Map<String, dynamic>` | Yes | Reference to the associated User resource. |
| `device` | `Map<String, dynamic>` | No | Reference to the associated Device resource. |
| `id` | `int` | No | This resource's unique identifier. |
| `location` | `Map<String, dynamic>` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `modifiedBy` | `Map<String, dynamic>` | Yes | Reference to the associated User resource. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Map<String, dynamic>` | No | Reference to the associated Custody Status. |
| `transferMethod` | `Map<String, dynamic>` | No | Reference to the associated Transfer Method. |
| `version` | `int` | No | The number of times that this resource has been updated. |

### Operations

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and throws on error.

```dart
final results = await client.DeviceCustodyListItem().list({ device_type: "example", serial_number: "example" });
for (final device_custody_list_item in results) {
  print(device_custody_list_item.data());
}
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `DeviceCustodyListItemEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## DeviceReceiveResultEntity

```dart
final device_receive_result = client.DeviceReceiveResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `serialNumber` | `String` | Yes | The serial number of the Device that is shipped. |
| `success` | `bool` | Yes | Indicates if the action succeeded. |
| `tamperLabel` | `String` | Yes | The code that is printed the tamper label of the Device that is shipped. |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity and throws on error.

```dart
final result = await client.DeviceReceiveResult().create({
  'serialNumber': 'example_serialNumber',  // String
  'success': true,  // bool
  'tamperLabel': 'example_tamperLabel',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `DeviceReceiveResultEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## DeviceRkiActivateResultEntity

```dart
final device_rki_activate_result = client.DeviceRkiActivateResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appVersion` | `String` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildName` | `String` | No | The Device Builds's name. |
| `buildNumber` | `String` | No | The Build Number. |
| `configFile` | `String` | No | \? |
| `firmwareVersion` | `String` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `String` | No | A list of hardware versions that this Device Build covers. |
| `serialNumber` | `String` | Yes | The referenced Device's serial number. |
| `success` | `bool` | Yes | Indicates if the RKI activation succeeded. |
| `whiteListingBinRanges` | `String` | No | \? |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity and throws on error.

```dart
final result = await client.DeviceRkiActivateResult().create({
  'serialNumber': 'example_serialNumber',  // String
  'success': true,  // bool
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `DeviceRkiActivateResultEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## DeviceStateEntity

```dart
final device_state = client.DeviceState();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int` | No | Unique identifier for this Device state. |
| `name` | `String` | No | Descriptive name for this Device state. |

### Operations

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and throws on error.

```dart
final results = await client.DeviceState().list();
for (final device_state in results) {
  print(device_state.data());
}
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `DeviceStateEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## DeviceTypeEntity

```dart
final device_type = client.DeviceType();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `String` | No | The Device type. |
| `hardwareVersion` | `String` | No | The Device hardware version. |
| `id` | `String` | No | Unique idenifier. |
| `isActive` | `bool` | No | This property indicates if the DeviceType is active. |
| `manufacturer` | `String` | No | The Device manufacturer. |
| `model` | `String` | No | The Device model. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The DeviceType name. |
| `photoUrl` | `String` | No |  |
| `productName` | `String` | No | The Device name. |
| `version` | `int` | No | The number of times that this resource has been updated. |

### Operations

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and throws on error.

```dart
final results = await client.DeviceType().list();
for (final device_type in results) {
  print(device_type.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and throws on error.

```dart
final result = await client.DeviceType().load({'id': 'device_type_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `DeviceTypeEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## InjectKeyEntity

```dart
final inject_key = client.InjectKey();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `id` | `String` | No | unique idenifier |
| `isActive` | `bool` | No | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `bool` | No | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `String` | No | The cipher type that the key works with. |
| `modified` | `String` | No | Last modified timestamp in ISO 8601 format. |
| `name` | `String` | No | Key name. |
| `version` | `int` | No | The number of times that this resource has been updated. |

### Operations

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and throws on error.

```dart
final results = await client.InjectKey().list();
for (final inject_key in results) {
  print(inject_key.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and throws on error.

```dart
final result = await client.InjectKey().load({'id': 'inject_key_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `InjectKeyEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## KifEntity

```dart
final kif = client.Kif();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int` | No | This resource's unique identifier. |
| `name` | `String` | No | The KIF's name. |

### Operations

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and throws on error.

```dart
final results = await client.Kif().list();
for (final kif in results) {
  print(kif.data());
}
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `KifEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## LocationEntity

```dart
final location = client.Location();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address1` | `String` | No | The Location's street address. |
| `address2` | `String` | No | The Location's street address. |
| `billingId` | `String` | No | \? |
| `city` | `String` | No | The Location's city. |
| `client` | `Map<String, dynamic>` | No | Reference to the associated Client resource. |
| `country` | `String` | No | The Location's country. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `customReference` | `String` | No | A Partner specified reference for a location. |
| `id` | `String` | No | This resource's unique identifier. |
| `locationType` | `String` | No | The Location's clasification. |
| `mailAddress1` | `String` | No | The Location's street address. |
| `mailAddress2` | `String` | No | The Location's street address. |
| `mailCity` | `String` | No | The Location's city. |
| `mailCountry` | `String` | No | The Location's street address. |
| `mailPostalCode` | `String` | No | The Location's postal code. |
| `mailStateProvince` | `String` | No | The Location's street state or province. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Location's name. |
| `nameOfBusiness` | `String` | No | The name of the business at this location. |
| `notes` | `String` | No | Note for delivery driver. |
| `postalCode` | `String` | No | The Location's postal code. |
| `stateProvince` | `String` | No | The Location's street state or province. |
| `uniqueId` | `String` | No | Unique Identifier for the Location. |
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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity and throws on error.

```dart
final result = await client.Location().create({
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and throws on error.

```dart
final results = await client.Location().list({ client: "example" });
for (final location in results) {
  print(location.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and throws on error.

```dart
final result = await client.Location().load({'id': 'location_id'});
```

#### `remove(reqmatch, [ctrl]) -> Future<dynamic>`

Remove the entity matching the given criteria. Returns the entity, marked as deleted (`deleted()`); it keeps the data it held. Throws on error.

```dart
final result = await client.Location().remove({'id': 'location_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `LocationEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## PartnerEntity

```dart
final partner = client.Partner();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `String` | No | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `bool` | No | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `Map<String, dynamic>` | No | Reference to the associated User resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `id` | `String` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Parter account is active or disabled. |
| `location` | `Map<String, dynamic>` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Partner's name. |
| `parent` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `partnerId` | `String` | No | The Partner's id. |
| `reference` | `String` | No | The Partner's reference string. |
| `verificationPhrase` | `String` | No | The verification phrase is a message that the Partner creates. |
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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity and throws on error.

```dart
final result = await client.Partner().create({
  'location': <String, dynamic>{},  // Map<String, dynamic>
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and throws on error.

```dart
final results = await client.Partner().list();
for (final partner in results) {
  print(partner.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and throws on error.

```dart
final result = await client.Partner().load({'id': 'partner_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `PartnerEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## ShipmentEntity

```dart
final shipment = client.Shipment();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `String` | No | The name of the courier. |
| `client` | `Map<String, dynamic>` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `String` | No | The date and time that a package is recieved. |
| `dateShipped` | `String` | No | The date and time that a package is shipped. |
| `dcKif` | `Map<String, dynamic>` | No | Reference to the associated KIF resource. |
| `id` | `String` | No | This resource's unique identifier. |
| `items` | `List<dynamic>` | No |  |
| `kif` | `Map<String, dynamic>` | No | Reference to the associated KIF resource. |
| `location` | `Map<String, dynamic>` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `partner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `shipmentType` | `String` | No | The type of shipment. |
| `tracking` | `String` | No | The courier's tracking number. |
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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity and throws on error.

```dart
final result = await client.Shipment().create({
  'location': <String, dynamic>{},  // Map<String, dynamic>
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and throws on error.

```dart
final results = await client.Shipment().list({ kif: "example" });
for (final shipment in results) {
  print(shipment.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and throws on error.

```dart
final result = await client.Shipment().load({'id': 'shipment_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `ShipmentEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## SuccessEntity

```dart
final success = client.Success();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `devices` | `List<dynamic>` | Yes | An array of Device ids to share with partner. |
| `sharePartnerFrom` | `Map<String, dynamic>` | Yes | Reference to the associated Partner. |
| `success` | `bool` | No | Indicates if the action was a success. |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity and throws on error.

```dart
final result = await client.Success().create({
  'share_partner_to': 'example_share_partner_to',  // String
  'devices': <dynamic>[],  // List<dynamic>
  'sharePartnerFrom': <String, dynamic>{},  // Map<String, dynamic>
});
```

#### `remove(reqmatch, [ctrl]) -> Future<dynamic>`

Remove the entity matching the given criteria. Returns the entity, marked as deleted (`deleted()`); it keeps the data it held. Throws on error.

```dart
final result = await client.Success().remove({'share_partner_to': 'share_partner_to'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `SuccessEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## TransactionEntity

```dart
final transaction = client.Transaction();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternateKey` | `String` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `Map<String, dynamic>` | No | Reference to the associated Client resource. |
| `clientRef` | `String` | No | Client Reference property that is included in the decrypt API call. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `decrypted` | `int` | No | A Transcation can process muliple decryptions. |
| `device` | `Map<String, dynamic>` | Yes | Reference to the associated Device resource. |
| `deviceName` | `String` | No | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `encrypted` | `int` | No | A Transcation can process muliple encryptions. |
| `endDate` | `String` | No | Timestamp from the end of the transaction. |
| `errCode` | `String` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `String` | No | This resource's unique identifier. |
| `ipAddress` | `String` | No | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `bool` | No | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `String` | No | The type of cipher used during decrytion. |
| `location` | `Map<String, dynamic>` | Yes | Reference to the associated Location resource. |
| `messageId` | `String` | No | Message ID. |
| `method` | `String` | No | The decryption cypher/method. |
| `partner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `reference` | `String` | No | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `String` | No | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `String` | No | Timestamp from the beginning of the transaction. |
| `success` | `bool` | No | The success indicator. |
| `transactionSource` | `String` | No | The source of the Transaction. |

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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity and throws on error.

```dart
final result = await client.Transaction().create({
  'device': <String, dynamic>{},  // Map<String, dynamic>
  'location': <String, dynamic>{},  // Map<String, dynamic>
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and throws on error.

```dart
final results = await client.Transaction().list();
for (final transaction in results) {
  print(transaction.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and throws on error.

```dart
final result = await client.Transaction().load({'id': 'transaction_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `TransactionEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## UpdateResultEntity

```dart
final update_result = client.UpdateResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address1` | `String` | No | The Location's street address. |
| `address2` | `String` | No | The Location's street address. |
| `alternateKey` | `String` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `String` | No | Date and time that the Device is due its next PCI Audit. |
| `billingId` | `String` | No | \? |
| `city` | `String` | No | The Location's city. |
| `client` | `Map<String, dynamic>` | No | Reference to the associated Client resource. |
| `clientCanOrderEquipment` | `bool` | No | This property indicates if the Partner is allowed to order Equipment. |
| `clientRef` | `String` | No | Client Reference property that is included in the decrypt API call. |
| `contact` | `Map<String, dynamic>` | Yes | Reference to the associated User resource. |
| `country` | `Map<String, dynamic>` | No | Reference to the associated Country. |
| `customReference` | `String` | No | A Partner specified reference for a location. |
| `dateShipped` | `String` | No | The date and time that a package is shipped. |
| `decrypted` | `int` | No | A Transcation can process muliple decryptions. |
| `device` | `Map<String, dynamic>` | No | Reference to the associated Device resource. |
| `deviceBuild` | `Map<String, dynamic>` | No | Reference to the associated Device Build resource. |
| `deviceType` | `Map<String, dynamic>` | No | Reference to the associated Device Type resource. |
| `directPartner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `email` | `String` | Yes | The User's email address. |
| `encrypted` | `int` | No | A Transcation can process muliple encryptions. |
| `endDate` | `String` | No | Timestamp from the end of the transaction. |
| `errCode` | `String` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | No | The error messge that is sent in response to a failed decrypt API call. |
| `firstName` | `String` | Yes | The User's name. |
| `id` | `String` | No | ID of newly created resource |
| `injectKey` | `Map<String, dynamic>` | No | Reference to the associated Device resource. |
| `ipAddress` | `String` | No | The IP address of the http client that makes the decrypt API call. |
| `isActive` | `bool` | Yes | This property indicates if the User account is active or disabled. |
| `items` | `List<dynamic>` | No |  |
| `keyType` | `String` | No | The type of cipher used during decrytion. |
| `kif` | `Map<String, dynamic>` | No | Reference to the associated KIF resource. |
| `lastName` | `String` | Yes | The User's Surname. |
| `location` | `Map<String, dynamic>` | Yes | Reference to the associated Location resource. |
| `locationType` | `String` | No | The Location's clasification. |
| `mailAddress1` | `String` | No | The Location's street address. |
| `mailAddress2` | `String` | No | The Location's street address. |
| `mailCity` | `String` | No | The Location's city. |
| `mailCountry` | `String` | No | The Location's street address. |
| `mailPostalCode` | `String` | No | The Location's postal code. |
| `mailStateProvince` | `String` | No | The Location's street state or province. |
| `messageId` | `String` | No | Message ID. |
| `method` | `String` | No | The decryption cypher/method. |
| `mid` | `String` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `String` | No | The Client's name. |
| `nameOfBusiness` | `String` | No | The name of the business at this location. |
| `notes` | `String` | No | Arbitary note that can be attached to a Device entry. |
| `parent` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `partner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `partnerId` | `String` | No | The Partner's id. |
| `phone` | `String` | Yes | The User's phone number without dashes, spaces, or brackets. |
| `postalCode` | `String` | No | The Location's postal code. |
| `reference` | `String` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | No | If this property is set to '*true*' the newly created user will be sent a welcome email. |
| `serialNumber` | `String` | No | The Device's serial number. |
| `startDate` | `String` | No | Timestamp from the beginning of the transaction. |
| `stateProvince` | `String` | No | The Location's street state or province. |
| `success` | `bool` | No | The success indicator. |
| `tracking` | `String` | No | The courier's tracking number. |
| `uniqueId` | `String` | No | Unique Identifier for the Location. |
| `userName` | `String` | Yes | The User's unique username. |
| `userRole` | `Map<String, dynamic>` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `String` | No | The verification phrase is a message that the Partner creates. |
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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity and throws on error.

```dart
final result = await client.UpdateResult().create({
  'contact': <String, dynamic>{},  // Map<String, dynamic>
  'email': 'example_email',  // String
  'firstName': 'example_firstName',  // String
  'isActive': true,  // bool
  'lastName': 'example_lastName',  // String
  'location': <String, dynamic>{},  // Map<String, dynamic>
  'phone': 'example_phone',  // String
  'userName': 'example_userName',  // String
  'userRole': <String, dynamic>{},  // Map<String, dynamic>
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and throws on error.

```dart
final results = await client.UpdateResult().list();
for (final update_result in results) {
  print(update_result.data());
}
```

#### `update(reqdata, [ctrl]) -> Future<dynamic>`

Update an existing entity. The data must include the entity `id`. Returns the updated entity and throws on error.

```dart
final result = await client.UpdateResult().update({
  'id': 'id',
  // Fields to update
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `UpdateResultEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## UserEntity

```dart
final user = client.User();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Map<String, dynamic>` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `email` | `String` | No | The User's email address. |
| `firstName` | `String` | No | The User's name. |
| `id` | `String` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `kif` | `Map<String, dynamic>` | No | Reference to the associated KIF resource. |
| `lastName` | `String` | No | The User's Surname. |
| `modified` | `String` | No | Last modified timestamp. |
| `partner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `phone` | `String` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String` | No | The User's unique username. |
| `userRole` | `Map<String, dynamic>` | No | Reference to the associated User Role. |
| `version` | `int` | No | The number of times that this resource has been updated. |

### Operations

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and throws on error.

```dart
final result = await client.User().load({'id': 'user_id'});
```

#### `remove(reqmatch, [ctrl]) -> Future<dynamic>`

Remove the entity matching the given criteria. Returns the entity, marked as deleted (`deleted()`); it keeps the data it held. Throws on error.

```dart
final result = await client.User().remove({'id': 'user_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `UserEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## VirtualDeviceEntity

```dart
final virtual_device = client.VirtualDevice();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `List<dynamic>` | No | List of Devices. |
| `id` | `String` | No |  |
| `total` | `int` | No | Total number of Devices available (not the number of Users in the response). |

### Operations

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and throws on error.

```dart
final result = await client.VirtualDevice().load({'id': 'virtual_device_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `VirtualDeviceEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


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

```dart
final client = BluefinDecryptxP2peSDK({
  'feature': {
    'audit': {'active': true},
    'clienttrack': {'active': true},
    'debug': {'active': true},
    'idempotency': {'active': true},
    'log': {'active': true},
    'metrics': {'active': true},
    'paging': {'active': true},
    'ratelimit': {'active': true},
    'retry': {'active': true},
    'telemetry': {'active': true},
    'test': {'active': true},
    'timeout': {'active': true},
  },
});
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


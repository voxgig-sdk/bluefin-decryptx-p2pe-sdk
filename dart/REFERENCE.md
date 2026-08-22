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

#### `DeviceCustodyList([entopts])`

Create a new `DeviceCustodyListEntity` instance. Pass no argument for no initial data.

#### `DeviceList([entopts])`

Create a new `DeviceListEntity` instance. Pass no argument for no initial data.

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
| `id` | `String` | No | This resource's unique identifier. |
| `name` | `String` | No | Text describing the attestation. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Attestation. |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.Attestation().create({
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.Attestation().list();
for (final attestation in results) {
  print(attestation.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.Client().create({
  'location': <String, dynamic>{},  // Map<String, dynamic>
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.Client().list();
for (final client_ in results) {
  print(client_.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.Client().load({'id': 'client_id'});
```

#### `remove(reqmatch, [ctrl]) -> Future<dynamic>`

Remove the entity matching the given criteria. Throws on error.

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

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.CreateResult().create({
  'device_type': 'example_device_type',  // String
  'serial_number': 'example_serial_number',  // String
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
| `success` | `bool` | No | true if the payload decryption was successful. |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.Decryption().create({
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

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

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

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.Device().list();
for (final device in results) {
  print(device.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

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

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.DeviceBuild().list();
for (final device_build in results) {
  print(device_build.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

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

Load a single entity matching the given criteria. Returns the entity data and throws on error.

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

## DeviceCustodyListEntity

```dart
final device_custody_list = client.DeviceCustodyList();
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

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.DeviceCustodyList().list({ device_type: "example", serial_number: "example" });
for (final device_custody_list in results) {
  print(device_custody_list.data());
}
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `DeviceCustodyListEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## DeviceListEntity

```dart
final device_list = client.DeviceList();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `List<dynamic>` | No | List of Devices. |
| `total` | `int` | No | Total number of Devices available (not the number of Users in the response). |

### Operations

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.DeviceList().load({'share_partner_to': 'share_partner_to'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `DeviceListEntity` instance with the same options.

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
| `success` | `bool` | Yes | Indicates if the action succeeded. |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.DeviceReceiveResult().create({
  'success': true,  // bool
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
| `success` | `bool` | Yes | Indicates if the RKI activation succeeded. |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.DeviceRkiActivateResult().create({
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

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

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

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.DeviceType().list();
for (final device_type in results) {
  print(device_type.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

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

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.InjectKey().list();
for (final inject_key in results) {
  print(inject_key.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

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

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

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

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.Location().create({
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.Location().list();
for (final location in results) {
  print(location.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.Location().load({'id': 'location_id'});
```

#### `remove(reqmatch, [ctrl]) -> Future<dynamic>`

Remove the entity matching the given criteria. Throws on error.

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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.Partner().create({
  'location': <String, dynamic>{},  // Map<String, dynamic>
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.Partner().list();
for (final partner in results) {
  print(partner.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

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
| `modified` | `String` | No | Last modified timestamp. |
| `partner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `shipmentType` | `String` | No | The type of shipment. |
| `tracking` | `String` | No | The courier's tracking number. |
| `version` | `int` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.Shipment().create({
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.Shipment().list();
for (final shipment in results) {
  print(shipment.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

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
| `success` | `bool` | No | Indicates if the action was a success. |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.Success().create({
  'share_partner_to': 'example_share_partner_to',  // String
});
```

#### `remove(reqmatch, [ctrl]) -> Future<dynamic>`

Remove the entity matching the given criteria. Throws on error.

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

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.Transaction().create({
  'location': <String, dynamic>{},  // Map<String, dynamic>
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.Transaction().list();
for (final transaction in results) {
  print(transaction.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

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
| `client` | `Map<String, dynamic>` | No | Reference to the associated Client resource. |
| `email` | `String` | No | The User's email address. |
| `firstName` | `String` | No | The User's name. |
| `id` | `String` | No | ID of newly created resource |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `kif` | `Map<String, dynamic>` | No | Reference to the associated KIF resource. |
| `lastName` | `String` | No | The User's Surname. |
| `partner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `phone` | `String` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String` | No | The User's unique username. |
| `userRole` | `Map<String, dynamic>` | No | Reference to the associated User Role. |
| `version` | `int` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.UpdateResult().create({
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.UpdateResult().list();
for (final update_result in results) {
  print(update_result.data());
}
```

#### `update(reqdata, [ctrl]) -> Future<dynamic>`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

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

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.User().load({'id': 'user_id'});
```

#### `remove(reqmatch, [ctrl]) -> Future<dynamic>`

Remove the entity matching the given criteria. Throws on error.

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

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```dart
final client = BluefinDecryptxP2peSDK({
  'feature': {
    'test': {'active': true},
  },
});
```


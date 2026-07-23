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
| `client` | `Map<String, dynamic>` | No |  |
| `complete_date` | `String` | No |  |
| `created` | `String` | No |  |
| `device` | `Map<String, dynamic>` | No |  |
| `id` | `String` | No |  |
| `name` | `String` | No |  |
| `note` | `String` | No |  |

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
| `contact` | `Map<String, dynamic>` | No |  |
| `created` | `String` | No |  |
| `direct_partner` | `Map<String, dynamic>` | No |  |
| `id` | `String` | No |  |
| `is_active` | `bool` | No |  |
| `location` | `Map<String, dynamic>` | Yes |  |
| `mid` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `partner` | `Map<String, dynamic>` | No |  |
| `version` | `int` | No |  |

### Field Usage by Operation

| Field | load | list | create | remove |
| --- | --- | --- | --- | --- |
| `contact` | - | Yes | - | - |
| `created` | - | - | - | - |
| `direct_partner` | - | - | - | - |
| `id` | - | - | - | - |
| `is_active` | - | - | - | - |
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
| `success` | `bool` | No |  |

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
| `activated_by` | `Map<String, dynamic>` | Yes |  |
| `activation_date` | `String` | No |  |
| `alternate_key` | `String` | No |  |
| `audit_next_date` | `String` | No |  |
| `audit_notification_date` | `String` | No |  |
| `client` | `Map<String, dynamic>` | No |  |
| `created` | `String` | No |  |
| `created_by` | `Map<String, dynamic>` | Yes |  |
| `device_build` | `Map<String, dynamic>` | No |  |
| `device_state` | `Map<String, dynamic>` | No |  |
| `device_type` | `Map<String, dynamic>` | No |  |
| `error_counter` | `int` | No |  |
| `error_last_date` | `String` | No |  |
| `id` | `String` | No |  |
| `initialized_by` | `Map<String, dynamic>` | Yes |  |
| `initialized_date` | `String` | No |  |
| `inject_key` | `Map<String, dynamic>` | No |  |
| `is_virtual` | `bool` | No |  |
| `kif` | `Map<String, dynamic>` | No |  |
| `last_activity_date` | `String` | No |  |
| `location` | `Map<String, dynamic>` | Yes |  |
| `modified` | `String` | No |  |
| `modified_by` | `Map<String, dynamic>` | Yes |  |
| `name` | `String` | No |  |
| `note` | `String` | No |  |
| `partner` | `Map<String, dynamic>` | No |  |
| `serial_number` | `String` | No |  |
| `version` | `int` | No |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.Device().create({
  'activated_by': <String, dynamic>{},  // Map<String, dynamic>
  'created_by': <String, dynamic>{},  // Map<String, dynamic>
  'initialized_by': <String, dynamic>{},  // Map<String, dynamic>
  'location': <String, dynamic>{},  // Map<String, dynamic>
  'modified_by': <String, dynamic>{},  // Map<String, dynamic>
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
| `app_version` | `String` | No |  |
| `build_number` | `String` | No |  |
| `config_file_name` | `String` | No |  |
| `created` | `String` | No |  |
| `device_type` | `String` | No |  |
| `firmware_version` | `String` | No |  |
| `hardware_version` | `String` | No |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `note` | `String` | No |  |
| `version` | `int` | No |  |
| `white_listing_bin_range` | `String` | No |  |
| `white_listing_used` | `bool` | No |  |

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
| `complete_date` | `String` | No |  |
| `created` | `String` | No |  |
| `created_by` | `Map<String, dynamic>` | Yes |  |
| `custodian` | `Map<String, dynamic>` | Yes |  |
| `device` | `Map<String, dynamic>` | No |  |
| `id` | `int` | No |  |
| `location` | `Map<String, dynamic>` | Yes |  |
| `modified` | `String` | No |  |
| `modified_by` | `Map<String, dynamic>` | Yes |  |
| `note` | `String` | No |  |
| `status` | `Map<String, dynamic>` | No |  |
| `transfer_method` | `Map<String, dynamic>` | No |  |
| `version` | `int` | No |  |

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
| `complete_date` | `String` | No |  |
| `created` | `String` | No |  |
| `created_by` | `Map<String, dynamic>` | Yes |  |
| `custodian` | `Map<String, dynamic>` | Yes |  |
| `device` | `Map<String, dynamic>` | No |  |
| `id` | `int` | No |  |
| `location` | `Map<String, dynamic>` | Yes |  |
| `modified` | `String` | No |  |
| `modified_by` | `Map<String, dynamic>` | Yes |  |
| `note` | `String` | No |  |
| `status` | `Map<String, dynamic>` | No |  |
| `transfer_method` | `Map<String, dynamic>` | No |  |
| `version` | `int` | No |  |

### Operations

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.DeviceCustodyList().list();
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
| `data` | `List<dynamic>` | No |  |
| `total` | `int` | No |  |

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
| `success` | `bool` | Yes |  |

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
| `success` | `bool` | Yes |  |

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
| `id` | `int` | No |  |
| `name` | `String` | No |  |

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
| `created` | `String` | No |  |
| `device_type_mode` | `String` | No |  |
| `hardware_version` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `bool` | No |  |
| `manufacturer` | `String` | No |  |
| `model` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `photo_url` | `String` | No |  |
| `product_name` | `String` | No |  |
| `version` | `int` | No |  |

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
| `created` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `bool` | No |  |
| `is_p2_pe` | `bool` | No |  |
| `key_type` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `version` | `int` | No |  |

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
| `id` | `int` | No |  |
| `name` | `String` | No |  |

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
| `address1` | `String` | No |  |
| `address2` | `String` | No |  |
| `billing_id` | `String` | No |  |
| `city` | `String` | No |  |
| `country` | `String` | No |  |
| `created` | `String` | No |  |
| `custom_reference` | `String` | No |  |
| `id` | `String` | No |  |
| `location_type` | `String` | No |  |
| `mail_address1` | `String` | No |  |
| `mail_address2` | `String` | No |  |
| `mail_city` | `String` | No |  |
| `mail_country` | `String` | No |  |
| `mail_postal_code` | `String` | No |  |
| `mail_state_province` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `name_of_business` | `String` | No |  |
| `note` | `String` | No |  |
| `postal_code` | `String` | No |  |
| `state_province` | `String` | No |  |
| `unique_id` | `String` | No |  |
| `version` | `int` | No |  |

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
| `billing_id` | `String` | No |  |
| `client_can_order_equipment` | `bool` | No |  |
| `contact` | `Map<String, dynamic>` | No |  |
| `created` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `bool` | No |  |
| `location` | `Map<String, dynamic>` | Yes |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `parent` | `Map<String, dynamic>` | No |  |
| `partner_id` | `String` | No |  |
| `reference` | `String` | No |  |
| `verification_phrase` | `String` | No |  |
| `version` | `int` | No |  |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `billing_id` | - | - | - |
| `client_can_order_equipment` | - | - | - |
| `contact` | - | Yes | - |
| `created` | - | - | - |
| `id` | - | - | - |
| `is_active` | - | - | - |
| `location` | - | - | - |
| `modified` | - | - | - |
| `name` | - | - | - |
| `parent` | - | - | - |
| `partner_id` | - | - | - |
| `reference` | - | - | - |
| `verification_phrase` | - | - | - |
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
| `carrier` | `String` | No |  |
| `client` | `Map<String, dynamic>` | No |  |
| `created` | `String` | No |  |
| `date_received` | `String` | No |  |
| `date_shipped` | `String` | No |  |
| `dc_kif` | `Map<String, dynamic>` | No |  |
| `id` | `String` | No |  |
| `item` | `List<dynamic>` | No |  |
| `kif` | `Map<String, dynamic>` | No |  |
| `modified` | `String` | No |  |
| `partner` | `Map<String, dynamic>` | No |  |
| `shipment_type` | `String` | No |  |
| `tracking` | `String` | No |  |
| `version` | `int` | No |  |

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
| `success` | `bool` | No |  |

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
| `alternate_key` | `String` | No |  |
| `client` | `Map<String, dynamic>` | No |  |
| `client_ref` | `String` | No |  |
| `created` | `String` | No |  |
| `decrypted` | `int` | No |  |
| `device_name` | `String` | No |  |
| `direct_partner` | `Map<String, dynamic>` | No |  |
| `encrypted` | `int` | No |  |
| `end_date` | `String` | No |  |
| `err_code` | `String` | No |  |
| `err_message` | `String` | No |  |
| `id` | `String` | No |  |
| `ip_address` | `String` | No |  |
| `is_virtual` | `bool` | No |  |
| `key_type` | `String` | No |  |
| `location` | `Map<String, dynamic>` | Yes |  |
| `message_id` | `String` | No |  |
| `method` | `String` | No |  |
| `partner` | `Map<String, dynamic>` | No |  |
| `reference` | `String` | No |  |
| `serial_number` | `String` | No |  |
| `start_date` | `String` | No |  |
| `success` | `bool` | No |  |
| `transaction_source` | `String` | No |  |

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
| `client` | `Map<String, dynamic>` | No |  |
| `email` | `String` | No |  |
| `first_name` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `bool` | No |  |
| `kif` | `Map<String, dynamic>` | No |  |
| `last_name` | `String` | No |  |
| `partner` | `Map<String, dynamic>` | No |  |
| `phone` | `String` | No |  |
| `user_name` | `String` | No |  |
| `user_role` | `Map<String, dynamic>` | No |  |
| `version` | `int` | No |  |

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
| `client` | `Map<String, dynamic>` | No |  |
| `created` | `String` | No |  |
| `email` | `String` | No |  |
| `first_name` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `bool` | No |  |
| `kif` | `Map<String, dynamic>` | No |  |
| `last_name` | `String` | No |  |
| `modified` | `String` | No |  |
| `partner` | `Map<String, dynamic>` | No |  |
| `phone` | `String` | No |  |
| `user_name` | `String` | No |  |
| `user_role` | `Map<String, dynamic>` | No |  |
| `version` | `int` | No |  |

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


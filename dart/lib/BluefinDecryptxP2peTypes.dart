// Typed models for the BluefinDecryptxP2pe SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON).
// Do not edit by hand.
//
// The operation pipeline passes plain maps; these classes are the typed,
// convertible view: `BluefinDecryptxP2pe.fromMap(ent.data())` / `model.toMap()`.

class Attestation {
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? complete_date;
  /// STRING
  String? created;
  /// OBJECT
  Map<String, dynamic>? device;
  /// STRING
  String? id;
  /// STRING
  String? name;
  /// STRING
  String? note;

  Attestation({
    this.client,
    this.complete_date,
    this.created,
    this.device,
    this.id,
    this.name,
    this.note,
  });

  factory Attestation.fromMap(Map<String, dynamic> m) => Attestation(
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        complete_date: m['complete_date'] is String ? m['complete_date'] : null,
        created: m['created'] is String ? m['created'] : null,
        device: m['device'] is Map<String, dynamic> ? m['device'] : null,
        id: m['id'] is String ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
        note: m['note'] is String ? m['note'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != client) {
      m['client'] = client;
    }
    if (null != complete_date) {
      m['complete_date'] = complete_date;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != device) {
      m['device'] = device;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != note) {
      m['note'] = note;
    }
    return m;
  }
}

class AttestationLoadMatch {
  /// STRING (required at the API)
  String? id;

  AttestationLoadMatch({
    this.id,
  });

  factory AttestationLoadMatch.fromMap(Map<String, dynamic> m) => AttestationLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class AttestationListMatch {
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? complete_date;
  /// STRING
  String? created;
  /// OBJECT
  Map<String, dynamic>? device;
  /// STRING
  String? id;
  /// STRING
  String? name;
  /// STRING
  String? note;

  AttestationListMatch({
    this.client,
    this.complete_date,
    this.created,
    this.device,
    this.id,
    this.name,
    this.note,
  });

  factory AttestationListMatch.fromMap(Map<String, dynamic> m) => AttestationListMatch(
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        complete_date: m['complete_date'] is String ? m['complete_date'] : null,
        created: m['created'] is String ? m['created'] : null,
        device: m['device'] is Map<String, dynamic> ? m['device'] : null,
        id: m['id'] is String ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
        note: m['note'] is String ? m['note'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != client) {
      m['client'] = client;
    }
    if (null != complete_date) {
      m['complete_date'] = complete_date;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != device) {
      m['device'] = device;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != note) {
      m['note'] = note;
    }
    return m;
  }
}

class AttestationCreateData {
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? complete_date;
  /// STRING
  String? created;
  /// OBJECT
  Map<String, dynamic>? device;
  /// STRING
  String? id;
  /// STRING
  String? name;
  /// STRING
  String? note;

  AttestationCreateData({
    this.client,
    this.complete_date,
    this.created,
    this.device,
    this.id,
    this.name,
    this.note,
  });

  factory AttestationCreateData.fromMap(Map<String, dynamic> m) => AttestationCreateData(
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        complete_date: m['complete_date'] is String ? m['complete_date'] : null,
        created: m['created'] is String ? m['created'] : null,
        device: m['device'] is Map<String, dynamic> ? m['device'] : null,
        id: m['id'] is String ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
        note: m['note'] is String ? m['note'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != client) {
      m['client'] = client;
    }
    if (null != complete_date) {
      m['complete_date'] = complete_date;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != device) {
      m['device'] = device;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != note) {
      m['note'] = note;
    }
    return m;
  }
}

class Client {
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// OBJECT
  Map<String, dynamic>? direct_partner;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? is_active;
  /// OBJECT (required at the API)
  Map<String, dynamic>? location;
  /// STRING
  String? mid;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// INTEGER
  int? version;

  Client({
    this.contact,
    this.created,
    this.direct_partner,
    this.id,
    this.is_active,
    this.location,
    this.mid,
    this.modified,
    this.name,
    this.partner,
    this.version,
  });

  factory Client.fromMap(Map<String, dynamic> m) => Client(
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        direct_partner: m['direct_partner'] is Map<String, dynamic> ? m['direct_partner'] : null,
        id: m['id'] is String ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != direct_partner) {
      m['direct_partner'] = direct_partner;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != mid) {
      m['mid'] = mid;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class ClientLoadMatch {
  /// STRING (required at the API)
  String? id;

  ClientLoadMatch({
    this.id,
  });

  factory ClientLoadMatch.fromMap(Map<String, dynamic> m) => ClientLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class ClientListMatch {
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// OBJECT
  Map<String, dynamic>? direct_partner;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? is_active;
  /// OBJECT
  Map<String, dynamic>? location;
  /// STRING
  String? mid;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// INTEGER
  int? version;

  ClientListMatch({
    this.contact,
    this.created,
    this.direct_partner,
    this.id,
    this.is_active,
    this.location,
    this.mid,
    this.modified,
    this.name,
    this.partner,
    this.version,
  });

  factory ClientListMatch.fromMap(Map<String, dynamic> m) => ClientListMatch(
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        direct_partner: m['direct_partner'] is Map<String, dynamic> ? m['direct_partner'] : null,
        id: m['id'] is String ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != direct_partner) {
      m['direct_partner'] = direct_partner;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != mid) {
      m['mid'] = mid;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class ClientCreateData {
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// OBJECT
  Map<String, dynamic>? direct_partner;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? is_active;
  /// OBJECT (required at the API)
  Map<String, dynamic>? location;
  /// STRING
  String? mid;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// INTEGER
  int? version;

  ClientCreateData({
    this.contact,
    this.created,
    this.direct_partner,
    this.id,
    this.is_active,
    this.location,
    this.mid,
    this.modified,
    this.name,
    this.partner,
    this.version,
  });

  factory ClientCreateData.fromMap(Map<String, dynamic> m) => ClientCreateData(
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        direct_partner: m['direct_partner'] is Map<String, dynamic> ? m['direct_partner'] : null,
        id: m['id'] is String ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != direct_partner) {
      m['direct_partner'] = direct_partner;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != mid) {
      m['mid'] = mid;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class ClientRemoveMatch {
  /// STRING (required at the API)
  String? id;

  ClientRemoveMatch({
    this.id,
  });

  factory ClientRemoveMatch.fromMap(Map<String, dynamic> m) => ClientRemoveMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class CreateResult {
  CreateResult();

  factory CreateResult.fromMap(Map<String, dynamic> m) => CreateResult();

  Map<String, dynamic> toMap() => <String, dynamic>{};
}

class CreateResultCreateData {
  /// STRING (required at the API)
  String? device_type;
  /// STRING (required at the API)
  String? serial_number;

  CreateResultCreateData({
    this.device_type,
    this.serial_number,
  });

  factory CreateResultCreateData.fromMap(Map<String, dynamic> m) => CreateResultCreateData(
        device_type: m['device_type'] is String ? m['device_type'] : null,
        serial_number: m['serial_number'] is String ? m['serial_number'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != device_type) {
      m['device_type'] = device_type;
    }
    if (null != serial_number) {
      m['serial_number'] = serial_number;
    }
    return m;
  }
}

class Decryption {
  /// BOOLEAN
  bool? success;

  Decryption({
    this.success,
  });

  factory Decryption.fromMap(Map<String, dynamic> m) => Decryption(
        success: m['success'] is bool ? m['success'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != success) {
      m['success'] = success;
    }
    return m;
  }
}

class DecryptionCreateData {
  /// BOOLEAN
  bool? success;

  DecryptionCreateData({
    this.success,
  });

  factory DecryptionCreateData.fromMap(Map<String, dynamic> m) => DecryptionCreateData(
        success: m['success'] is bool ? m['success'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != success) {
      m['success'] = success;
    }
    return m;
  }
}

class Device {
  /// OBJECT (required at the API)
  Map<String, dynamic>? activated_by;
  /// STRING
  String? activation_date;
  /// STRING
  String? alternate_key;
  /// STRING
  String? audit_next_date;
  /// STRING
  String? audit_notification_date;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? created;
  /// OBJECT (required at the API)
  Map<String, dynamic>? created_by;
  /// OBJECT
  Map<String, dynamic>? device_build;
  /// OBJECT
  Map<String, dynamic>? device_state;
  /// OBJECT
  Map<String, dynamic>? device_type;
  /// INTEGER
  int? error_counter;
  /// STRING
  String? error_last_date;
  /// STRING
  String? id;
  /// OBJECT (required at the API)
  Map<String, dynamic>? initialized_by;
  /// STRING
  String? initialized_date;
  /// OBJECT
  Map<String, dynamic>? inject_key;
  /// BOOLEAN
  bool? is_virtual;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? last_activity_date;
  /// OBJECT (required at the API)
  Map<String, dynamic>? location;
  /// STRING
  String? modified;
  /// OBJECT (required at the API)
  Map<String, dynamic>? modified_by;
  /// STRING
  String? name;
  /// STRING
  String? note;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? serial_number;
  /// INTEGER
  int? version;

  Device({
    this.activated_by,
    this.activation_date,
    this.alternate_key,
    this.audit_next_date,
    this.audit_notification_date,
    this.client,
    this.created,
    this.created_by,
    this.device_build,
    this.device_state,
    this.device_type,
    this.error_counter,
    this.error_last_date,
    this.id,
    this.initialized_by,
    this.initialized_date,
    this.inject_key,
    this.is_virtual,
    this.kif,
    this.last_activity_date,
    this.location,
    this.modified,
    this.modified_by,
    this.name,
    this.note,
    this.partner,
    this.serial_number,
    this.version,
  });

  factory Device.fromMap(Map<String, dynamic> m) => Device(
        activated_by: m['activated_by'] is Map<String, dynamic> ? m['activated_by'] : null,
        activation_date: m['activation_date'] is String ? m['activation_date'] : null,
        alternate_key: m['alternate_key'] is String ? m['alternate_key'] : null,
        audit_next_date: m['audit_next_date'] is String ? m['audit_next_date'] : null,
        audit_notification_date: m['audit_notification_date'] is String ? m['audit_notification_date'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        created: m['created'] is String ? m['created'] : null,
        created_by: m['created_by'] is Map<String, dynamic> ? m['created_by'] : null,
        device_build: m['device_build'] is Map<String, dynamic> ? m['device_build'] : null,
        device_state: m['device_state'] is Map<String, dynamic> ? m['device_state'] : null,
        device_type: m['device_type'] is Map<String, dynamic> ? m['device_type'] : null,
        error_counter: m['error_counter'] is int ? m['error_counter'] : null,
        error_last_date: m['error_last_date'] is String ? m['error_last_date'] : null,
        id: m['id'] is String ? m['id'] : null,
        initialized_by: m['initialized_by'] is Map<String, dynamic> ? m['initialized_by'] : null,
        initialized_date: m['initialized_date'] is String ? m['initialized_date'] : null,
        inject_key: m['inject_key'] is Map<String, dynamic> ? m['inject_key'] : null,
        is_virtual: m['is_virtual'] is bool ? m['is_virtual'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        last_activity_date: m['last_activity_date'] is String ? m['last_activity_date'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        modified_by: m['modified_by'] is Map<String, dynamic> ? m['modified_by'] : null,
        name: m['name'] is String ? m['name'] : null,
        note: m['note'] is String ? m['note'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        serial_number: m['serial_number'] is String ? m['serial_number'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != activated_by) {
      m['activated_by'] = activated_by;
    }
    if (null != activation_date) {
      m['activation_date'] = activation_date;
    }
    if (null != alternate_key) {
      m['alternate_key'] = alternate_key;
    }
    if (null != audit_next_date) {
      m['audit_next_date'] = audit_next_date;
    }
    if (null != audit_notification_date) {
      m['audit_notification_date'] = audit_notification_date;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != created_by) {
      m['created_by'] = created_by;
    }
    if (null != device_build) {
      m['device_build'] = device_build;
    }
    if (null != device_state) {
      m['device_state'] = device_state;
    }
    if (null != device_type) {
      m['device_type'] = device_type;
    }
    if (null != error_counter) {
      m['error_counter'] = error_counter;
    }
    if (null != error_last_date) {
      m['error_last_date'] = error_last_date;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != initialized_by) {
      m['initialized_by'] = initialized_by;
    }
    if (null != initialized_date) {
      m['initialized_date'] = initialized_date;
    }
    if (null != inject_key) {
      m['inject_key'] = inject_key;
    }
    if (null != is_virtual) {
      m['is_virtual'] = is_virtual;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != last_activity_date) {
      m['last_activity_date'] = last_activity_date;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != modified_by) {
      m['modified_by'] = modified_by;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != note) {
      m['note'] = note;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != serial_number) {
      m['serial_number'] = serial_number;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class DeviceLoadMatch {
  /// STRING
  String? device_type;
  /// STRING
  String? serial_number;
  /// STRING
  String? id;

  DeviceLoadMatch({
    this.device_type,
    this.serial_number,
    this.id,
  });

  factory DeviceLoadMatch.fromMap(Map<String, dynamic> m) => DeviceLoadMatch(
        device_type: m['device_type'] is String ? m['device_type'] : null,
        serial_number: m['serial_number'] is String ? m['serial_number'] : null,
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != device_type) {
      m['device_type'] = device_type;
    }
    if (null != serial_number) {
      m['serial_number'] = serial_number;
    }
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class DeviceListMatch {
  /// OBJECT
  Map<String, dynamic>? activated_by;
  /// STRING
  String? activation_date;
  /// STRING
  String? alternate_key;
  /// STRING
  String? audit_next_date;
  /// STRING
  String? audit_notification_date;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? created;
  /// OBJECT
  Map<String, dynamic>? created_by;
  /// OBJECT
  Map<String, dynamic>? device_build;
  /// OBJECT
  Map<String, dynamic>? device_state;
  /// OBJECT
  Map<String, dynamic>? device_type;
  /// INTEGER
  int? error_counter;
  /// STRING
  String? error_last_date;
  /// STRING
  String? id;
  /// OBJECT
  Map<String, dynamic>? initialized_by;
  /// STRING
  String? initialized_date;
  /// OBJECT
  Map<String, dynamic>? inject_key;
  /// BOOLEAN
  bool? is_virtual;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? last_activity_date;
  /// OBJECT
  Map<String, dynamic>? location;
  /// STRING
  String? modified;
  /// OBJECT
  Map<String, dynamic>? modified_by;
  /// STRING
  String? name;
  /// STRING
  String? note;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? serial_number;
  /// INTEGER
  int? version;

  DeviceListMatch({
    this.activated_by,
    this.activation_date,
    this.alternate_key,
    this.audit_next_date,
    this.audit_notification_date,
    this.client,
    this.created,
    this.created_by,
    this.device_build,
    this.device_state,
    this.device_type,
    this.error_counter,
    this.error_last_date,
    this.id,
    this.initialized_by,
    this.initialized_date,
    this.inject_key,
    this.is_virtual,
    this.kif,
    this.last_activity_date,
    this.location,
    this.modified,
    this.modified_by,
    this.name,
    this.note,
    this.partner,
    this.serial_number,
    this.version,
  });

  factory DeviceListMatch.fromMap(Map<String, dynamic> m) => DeviceListMatch(
        activated_by: m['activated_by'] is Map<String, dynamic> ? m['activated_by'] : null,
        activation_date: m['activation_date'] is String ? m['activation_date'] : null,
        alternate_key: m['alternate_key'] is String ? m['alternate_key'] : null,
        audit_next_date: m['audit_next_date'] is String ? m['audit_next_date'] : null,
        audit_notification_date: m['audit_notification_date'] is String ? m['audit_notification_date'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        created: m['created'] is String ? m['created'] : null,
        created_by: m['created_by'] is Map<String, dynamic> ? m['created_by'] : null,
        device_build: m['device_build'] is Map<String, dynamic> ? m['device_build'] : null,
        device_state: m['device_state'] is Map<String, dynamic> ? m['device_state'] : null,
        device_type: m['device_type'] is Map<String, dynamic> ? m['device_type'] : null,
        error_counter: m['error_counter'] is int ? m['error_counter'] : null,
        error_last_date: m['error_last_date'] is String ? m['error_last_date'] : null,
        id: m['id'] is String ? m['id'] : null,
        initialized_by: m['initialized_by'] is Map<String, dynamic> ? m['initialized_by'] : null,
        initialized_date: m['initialized_date'] is String ? m['initialized_date'] : null,
        inject_key: m['inject_key'] is Map<String, dynamic> ? m['inject_key'] : null,
        is_virtual: m['is_virtual'] is bool ? m['is_virtual'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        last_activity_date: m['last_activity_date'] is String ? m['last_activity_date'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        modified_by: m['modified_by'] is Map<String, dynamic> ? m['modified_by'] : null,
        name: m['name'] is String ? m['name'] : null,
        note: m['note'] is String ? m['note'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        serial_number: m['serial_number'] is String ? m['serial_number'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != activated_by) {
      m['activated_by'] = activated_by;
    }
    if (null != activation_date) {
      m['activation_date'] = activation_date;
    }
    if (null != alternate_key) {
      m['alternate_key'] = alternate_key;
    }
    if (null != audit_next_date) {
      m['audit_next_date'] = audit_next_date;
    }
    if (null != audit_notification_date) {
      m['audit_notification_date'] = audit_notification_date;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != created_by) {
      m['created_by'] = created_by;
    }
    if (null != device_build) {
      m['device_build'] = device_build;
    }
    if (null != device_state) {
      m['device_state'] = device_state;
    }
    if (null != device_type) {
      m['device_type'] = device_type;
    }
    if (null != error_counter) {
      m['error_counter'] = error_counter;
    }
    if (null != error_last_date) {
      m['error_last_date'] = error_last_date;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != initialized_by) {
      m['initialized_by'] = initialized_by;
    }
    if (null != initialized_date) {
      m['initialized_date'] = initialized_date;
    }
    if (null != inject_key) {
      m['inject_key'] = inject_key;
    }
    if (null != is_virtual) {
      m['is_virtual'] = is_virtual;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != last_activity_date) {
      m['last_activity_date'] = last_activity_date;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != modified_by) {
      m['modified_by'] = modified_by;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != note) {
      m['note'] = note;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != serial_number) {
      m['serial_number'] = serial_number;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class DeviceCreateData {
  /// OBJECT (required at the API)
  Map<String, dynamic>? activated_by;
  /// STRING
  String? activation_date;
  /// STRING
  String? alternate_key;
  /// STRING
  String? audit_next_date;
  /// STRING
  String? audit_notification_date;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? created;
  /// OBJECT (required at the API)
  Map<String, dynamic>? created_by;
  /// OBJECT
  Map<String, dynamic>? device_build;
  /// OBJECT
  Map<String, dynamic>? device_state;
  /// OBJECT
  Map<String, dynamic>? device_type;
  /// INTEGER
  int? error_counter;
  /// STRING
  String? error_last_date;
  /// STRING
  String? id;
  /// OBJECT (required at the API)
  Map<String, dynamic>? initialized_by;
  /// STRING
  String? initialized_date;
  /// OBJECT
  Map<String, dynamic>? inject_key;
  /// BOOLEAN
  bool? is_virtual;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? last_activity_date;
  /// OBJECT (required at the API)
  Map<String, dynamic>? location;
  /// STRING
  String? modified;
  /// OBJECT (required at the API)
  Map<String, dynamic>? modified_by;
  /// STRING
  String? name;
  /// STRING
  String? note;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? serial_number;
  /// INTEGER
  int? version;

  DeviceCreateData({
    this.activated_by,
    this.activation_date,
    this.alternate_key,
    this.audit_next_date,
    this.audit_notification_date,
    this.client,
    this.created,
    this.created_by,
    this.device_build,
    this.device_state,
    this.device_type,
    this.error_counter,
    this.error_last_date,
    this.id,
    this.initialized_by,
    this.initialized_date,
    this.inject_key,
    this.is_virtual,
    this.kif,
    this.last_activity_date,
    this.location,
    this.modified,
    this.modified_by,
    this.name,
    this.note,
    this.partner,
    this.serial_number,
    this.version,
  });

  factory DeviceCreateData.fromMap(Map<String, dynamic> m) => DeviceCreateData(
        activated_by: m['activated_by'] is Map<String, dynamic> ? m['activated_by'] : null,
        activation_date: m['activation_date'] is String ? m['activation_date'] : null,
        alternate_key: m['alternate_key'] is String ? m['alternate_key'] : null,
        audit_next_date: m['audit_next_date'] is String ? m['audit_next_date'] : null,
        audit_notification_date: m['audit_notification_date'] is String ? m['audit_notification_date'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        created: m['created'] is String ? m['created'] : null,
        created_by: m['created_by'] is Map<String, dynamic> ? m['created_by'] : null,
        device_build: m['device_build'] is Map<String, dynamic> ? m['device_build'] : null,
        device_state: m['device_state'] is Map<String, dynamic> ? m['device_state'] : null,
        device_type: m['device_type'] is Map<String, dynamic> ? m['device_type'] : null,
        error_counter: m['error_counter'] is int ? m['error_counter'] : null,
        error_last_date: m['error_last_date'] is String ? m['error_last_date'] : null,
        id: m['id'] is String ? m['id'] : null,
        initialized_by: m['initialized_by'] is Map<String, dynamic> ? m['initialized_by'] : null,
        initialized_date: m['initialized_date'] is String ? m['initialized_date'] : null,
        inject_key: m['inject_key'] is Map<String, dynamic> ? m['inject_key'] : null,
        is_virtual: m['is_virtual'] is bool ? m['is_virtual'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        last_activity_date: m['last_activity_date'] is String ? m['last_activity_date'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        modified_by: m['modified_by'] is Map<String, dynamic> ? m['modified_by'] : null,
        name: m['name'] is String ? m['name'] : null,
        note: m['note'] is String ? m['note'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        serial_number: m['serial_number'] is String ? m['serial_number'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != activated_by) {
      m['activated_by'] = activated_by;
    }
    if (null != activation_date) {
      m['activation_date'] = activation_date;
    }
    if (null != alternate_key) {
      m['alternate_key'] = alternate_key;
    }
    if (null != audit_next_date) {
      m['audit_next_date'] = audit_next_date;
    }
    if (null != audit_notification_date) {
      m['audit_notification_date'] = audit_notification_date;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != created_by) {
      m['created_by'] = created_by;
    }
    if (null != device_build) {
      m['device_build'] = device_build;
    }
    if (null != device_state) {
      m['device_state'] = device_state;
    }
    if (null != device_type) {
      m['device_type'] = device_type;
    }
    if (null != error_counter) {
      m['error_counter'] = error_counter;
    }
    if (null != error_last_date) {
      m['error_last_date'] = error_last_date;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != initialized_by) {
      m['initialized_by'] = initialized_by;
    }
    if (null != initialized_date) {
      m['initialized_date'] = initialized_date;
    }
    if (null != inject_key) {
      m['inject_key'] = inject_key;
    }
    if (null != is_virtual) {
      m['is_virtual'] = is_virtual;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != last_activity_date) {
      m['last_activity_date'] = last_activity_date;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != modified_by) {
      m['modified_by'] = modified_by;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != note) {
      m['note'] = note;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != serial_number) {
      m['serial_number'] = serial_number;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class DeviceBuild {
  /// STRING
  String? app_version;
  /// STRING
  String? build_number;
  /// STRING
  String? config_file_name;
  /// STRING
  String? created;
  /// STRING
  String? device_type;
  /// STRING
  String? firmware_version;
  /// STRING
  String? hardware_version;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? is_active;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// STRING
  String? note;
  /// INTEGER
  int? version;
  /// STRING
  String? white_listing_bin_range;
  /// BOOLEAN
  bool? white_listing_used;

  DeviceBuild({
    this.app_version,
    this.build_number,
    this.config_file_name,
    this.created,
    this.device_type,
    this.firmware_version,
    this.hardware_version,
    this.id,
    this.is_active,
    this.modified,
    this.name,
    this.note,
    this.version,
    this.white_listing_bin_range,
    this.white_listing_used,
  });

  factory DeviceBuild.fromMap(Map<String, dynamic> m) => DeviceBuild(
        app_version: m['app_version'] is String ? m['app_version'] : null,
        build_number: m['build_number'] is String ? m['build_number'] : null,
        config_file_name: m['config_file_name'] is String ? m['config_file_name'] : null,
        created: m['created'] is String ? m['created'] : null,
        device_type: m['device_type'] is String ? m['device_type'] : null,
        firmware_version: m['firmware_version'] is String ? m['firmware_version'] : null,
        hardware_version: m['hardware_version'] is String ? m['hardware_version'] : null,
        id: m['id'] is int ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        note: m['note'] is String ? m['note'] : null,
        version: m['version'] is int ? m['version'] : null,
        white_listing_bin_range: m['white_listing_bin_range'] is String ? m['white_listing_bin_range'] : null,
        white_listing_used: m['white_listing_used'] is bool ? m['white_listing_used'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != app_version) {
      m['app_version'] = app_version;
    }
    if (null != build_number) {
      m['build_number'] = build_number;
    }
    if (null != config_file_name) {
      m['config_file_name'] = config_file_name;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != device_type) {
      m['device_type'] = device_type;
    }
    if (null != firmware_version) {
      m['firmware_version'] = firmware_version;
    }
    if (null != hardware_version) {
      m['hardware_version'] = hardware_version;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != note) {
      m['note'] = note;
    }
    if (null != version) {
      m['version'] = version;
    }
    if (null != white_listing_bin_range) {
      m['white_listing_bin_range'] = white_listing_bin_range;
    }
    if (null != white_listing_used) {
      m['white_listing_used'] = white_listing_used;
    }
    return m;
  }
}

class DeviceBuildLoadMatch {
  /// STRING (required at the API)
  String? id;

  DeviceBuildLoadMatch({
    this.id,
  });

  factory DeviceBuildLoadMatch.fromMap(Map<String, dynamic> m) => DeviceBuildLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class DeviceBuildListMatch {
  /// STRING
  String? app_version;
  /// STRING
  String? build_number;
  /// STRING
  String? config_file_name;
  /// STRING
  String? created;
  /// STRING
  String? device_type;
  /// STRING
  String? firmware_version;
  /// STRING
  String? hardware_version;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? is_active;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// STRING
  String? note;
  /// INTEGER
  int? version;
  /// STRING
  String? white_listing_bin_range;
  /// BOOLEAN
  bool? white_listing_used;

  DeviceBuildListMatch({
    this.app_version,
    this.build_number,
    this.config_file_name,
    this.created,
    this.device_type,
    this.firmware_version,
    this.hardware_version,
    this.id,
    this.is_active,
    this.modified,
    this.name,
    this.note,
    this.version,
    this.white_listing_bin_range,
    this.white_listing_used,
  });

  factory DeviceBuildListMatch.fromMap(Map<String, dynamic> m) => DeviceBuildListMatch(
        app_version: m['app_version'] is String ? m['app_version'] : null,
        build_number: m['build_number'] is String ? m['build_number'] : null,
        config_file_name: m['config_file_name'] is String ? m['config_file_name'] : null,
        created: m['created'] is String ? m['created'] : null,
        device_type: m['device_type'] is String ? m['device_type'] : null,
        firmware_version: m['firmware_version'] is String ? m['firmware_version'] : null,
        hardware_version: m['hardware_version'] is String ? m['hardware_version'] : null,
        id: m['id'] is int ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        note: m['note'] is String ? m['note'] : null,
        version: m['version'] is int ? m['version'] : null,
        white_listing_bin_range: m['white_listing_bin_range'] is String ? m['white_listing_bin_range'] : null,
        white_listing_used: m['white_listing_used'] is bool ? m['white_listing_used'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != app_version) {
      m['app_version'] = app_version;
    }
    if (null != build_number) {
      m['build_number'] = build_number;
    }
    if (null != config_file_name) {
      m['config_file_name'] = config_file_name;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != device_type) {
      m['device_type'] = device_type;
    }
    if (null != firmware_version) {
      m['firmware_version'] = firmware_version;
    }
    if (null != hardware_version) {
      m['hardware_version'] = hardware_version;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != note) {
      m['note'] = note;
    }
    if (null != version) {
      m['version'] = version;
    }
    if (null != white_listing_bin_range) {
      m['white_listing_bin_range'] = white_listing_bin_range;
    }
    if (null != white_listing_used) {
      m['white_listing_used'] = white_listing_used;
    }
    return m;
  }
}

class DeviceCustodyDetail {
  /// STRING
  String? complete_date;
  /// STRING
  String? created;
  /// OBJECT (required at the API)
  Map<String, dynamic>? created_by;
  /// OBJECT (required at the API)
  Map<String, dynamic>? custodian;
  /// OBJECT
  Map<String, dynamic>? device;
  /// INTEGER
  int? id;
  /// OBJECT (required at the API)
  Map<String, dynamic>? location;
  /// STRING
  String? modified;
  /// OBJECT (required at the API)
  Map<String, dynamic>? modified_by;
  /// STRING
  String? note;
  /// OBJECT
  Map<String, dynamic>? status;
  /// OBJECT
  Map<String, dynamic>? transfer_method;
  /// INTEGER
  int? version;

  DeviceCustodyDetail({
    this.complete_date,
    this.created,
    this.created_by,
    this.custodian,
    this.device,
    this.id,
    this.location,
    this.modified,
    this.modified_by,
    this.note,
    this.status,
    this.transfer_method,
    this.version,
  });

  factory DeviceCustodyDetail.fromMap(Map<String, dynamic> m) => DeviceCustodyDetail(
        complete_date: m['complete_date'] is String ? m['complete_date'] : null,
        created: m['created'] is String ? m['created'] : null,
        created_by: m['created_by'] is Map<String, dynamic> ? m['created_by'] : null,
        custodian: m['custodian'] is Map<String, dynamic> ? m['custodian'] : null,
        device: m['device'] is Map<String, dynamic> ? m['device'] : null,
        id: m['id'] is int ? m['id'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        modified_by: m['modified_by'] is Map<String, dynamic> ? m['modified_by'] : null,
        note: m['note'] is String ? m['note'] : null,
        status: m['status'] is Map<String, dynamic> ? m['status'] : null,
        transfer_method: m['transfer_method'] is Map<String, dynamic> ? m['transfer_method'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != complete_date) {
      m['complete_date'] = complete_date;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != created_by) {
      m['created_by'] = created_by;
    }
    if (null != custodian) {
      m['custodian'] = custodian;
    }
    if (null != device) {
      m['device'] = device;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != modified_by) {
      m['modified_by'] = modified_by;
    }
    if (null != note) {
      m['note'] = note;
    }
    if (null != status) {
      m['status'] = status;
    }
    if (null != transfer_method) {
      m['transfer_method'] = transfer_method;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class DeviceCustodyDetailLoadMatch {
  /// STRING (required at the API)
  String? device_type;
  /// STRING (required at the API)
  String? id;
  /// STRING (required at the API)
  String? serial_number;

  DeviceCustodyDetailLoadMatch({
    this.device_type,
    this.id,
    this.serial_number,
  });

  factory DeviceCustodyDetailLoadMatch.fromMap(Map<String, dynamic> m) => DeviceCustodyDetailLoadMatch(
        device_type: m['device_type'] is String ? m['device_type'] : null,
        id: m['id'] is String ? m['id'] : null,
        serial_number: m['serial_number'] is String ? m['serial_number'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != device_type) {
      m['device_type'] = device_type;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != serial_number) {
      m['serial_number'] = serial_number;
    }
    return m;
  }
}

class DeviceCustodyList {
  /// STRING
  String? complete_date;
  /// STRING
  String? created;
  /// OBJECT (required at the API)
  Map<String, dynamic>? created_by;
  /// OBJECT (required at the API)
  Map<String, dynamic>? custodian;
  /// OBJECT
  Map<String, dynamic>? device;
  /// INTEGER
  int? id;
  /// OBJECT (required at the API)
  Map<String, dynamic>? location;
  /// STRING
  String? modified;
  /// OBJECT (required at the API)
  Map<String, dynamic>? modified_by;
  /// STRING
  String? note;
  /// OBJECT
  Map<String, dynamic>? status;
  /// OBJECT
  Map<String, dynamic>? transfer_method;
  /// INTEGER
  int? version;

  DeviceCustodyList({
    this.complete_date,
    this.created,
    this.created_by,
    this.custodian,
    this.device,
    this.id,
    this.location,
    this.modified,
    this.modified_by,
    this.note,
    this.status,
    this.transfer_method,
    this.version,
  });

  factory DeviceCustodyList.fromMap(Map<String, dynamic> m) => DeviceCustodyList(
        complete_date: m['complete_date'] is String ? m['complete_date'] : null,
        created: m['created'] is String ? m['created'] : null,
        created_by: m['created_by'] is Map<String, dynamic> ? m['created_by'] : null,
        custodian: m['custodian'] is Map<String, dynamic> ? m['custodian'] : null,
        device: m['device'] is Map<String, dynamic> ? m['device'] : null,
        id: m['id'] is int ? m['id'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        modified_by: m['modified_by'] is Map<String, dynamic> ? m['modified_by'] : null,
        note: m['note'] is String ? m['note'] : null,
        status: m['status'] is Map<String, dynamic> ? m['status'] : null,
        transfer_method: m['transfer_method'] is Map<String, dynamic> ? m['transfer_method'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != complete_date) {
      m['complete_date'] = complete_date;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != created_by) {
      m['created_by'] = created_by;
    }
    if (null != custodian) {
      m['custodian'] = custodian;
    }
    if (null != device) {
      m['device'] = device;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != modified_by) {
      m['modified_by'] = modified_by;
    }
    if (null != note) {
      m['note'] = note;
    }
    if (null != status) {
      m['status'] = status;
    }
    if (null != transfer_method) {
      m['transfer_method'] = transfer_method;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class DeviceCustodyListListMatch {
  /// STRING (required at the API)
  String? device_type;
  /// STRING (required at the API)
  String? serial_number;

  DeviceCustodyListListMatch({
    this.device_type,
    this.serial_number,
  });

  factory DeviceCustodyListListMatch.fromMap(Map<String, dynamic> m) => DeviceCustodyListListMatch(
        device_type: m['device_type'] is String ? m['device_type'] : null,
        serial_number: m['serial_number'] is String ? m['serial_number'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != device_type) {
      m['device_type'] = device_type;
    }
    if (null != serial_number) {
      m['serial_number'] = serial_number;
    }
    return m;
  }
}

class DeviceList {
  /// ARRAY
  List<dynamic>? data;
  /// INTEGER
  int? total;

  DeviceList({
    this.data,
    this.total,
  });

  factory DeviceList.fromMap(Map<String, dynamic> m) => DeviceList(
        data: m['data'] is List<dynamic> ? m['data'] : null,
        total: m['total'] is int ? m['total'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != data) {
      m['data'] = data;
    }
    if (null != total) {
      m['total'] = total;
    }
    return m;
  }
}

class DeviceListLoadMatch {
  /// STRING (required at the API)
  String? share_partner_to;

  DeviceListLoadMatch({
    this.share_partner_to,
  });

  factory DeviceListLoadMatch.fromMap(Map<String, dynamic> m) => DeviceListLoadMatch(
        share_partner_to: m['share_partner_to'] is String ? m['share_partner_to'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != share_partner_to) {
      m['share_partner_to'] = share_partner_to;
    }
    return m;
  }
}

class DeviceReceiveResult {
  /// BOOLEAN (required at the API)
  bool? success;

  DeviceReceiveResult({
    this.success,
  });

  factory DeviceReceiveResult.fromMap(Map<String, dynamic> m) => DeviceReceiveResult(
        success: m['success'] is bool ? m['success'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != success) {
      m['success'] = success;
    }
    return m;
  }
}

class DeviceReceiveResultCreateData {
  /// BOOLEAN (required at the API)
  bool? success;

  DeviceReceiveResultCreateData({
    this.success,
  });

  factory DeviceReceiveResultCreateData.fromMap(Map<String, dynamic> m) => DeviceReceiveResultCreateData(
        success: m['success'] is bool ? m['success'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != success) {
      m['success'] = success;
    }
    return m;
  }
}

class DeviceRkiActivateResult {
  /// BOOLEAN (required at the API)
  bool? success;

  DeviceRkiActivateResult({
    this.success,
  });

  factory DeviceRkiActivateResult.fromMap(Map<String, dynamic> m) => DeviceRkiActivateResult(
        success: m['success'] is bool ? m['success'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != success) {
      m['success'] = success;
    }
    return m;
  }
}

class DeviceRkiActivateResultCreateData {
  /// BOOLEAN (required at the API)
  bool? success;

  DeviceRkiActivateResultCreateData({
    this.success,
  });

  factory DeviceRkiActivateResultCreateData.fromMap(Map<String, dynamic> m) => DeviceRkiActivateResultCreateData(
        success: m['success'] is bool ? m['success'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != success) {
      m['success'] = success;
    }
    return m;
  }
}

class DeviceState {
  /// INTEGER
  int? id;
  /// STRING
  String? name;

  DeviceState({
    this.id,
    this.name,
  });

  factory DeviceState.fromMap(Map<String, dynamic> m) => DeviceState(
        id: m['id'] is int ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    if (null != name) {
      m['name'] = name;
    }
    return m;
  }
}

class DeviceStateListMatch {
  /// INTEGER
  int? id;
  /// STRING
  String? name;

  DeviceStateListMatch({
    this.id,
    this.name,
  });

  factory DeviceStateListMatch.fromMap(Map<String, dynamic> m) => DeviceStateListMatch(
        id: m['id'] is int ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    if (null != name) {
      m['name'] = name;
    }
    return m;
  }
}

class DeviceType {
  /// STRING
  String? created;
  /// STRING
  String? device_type_mode;
  /// STRING
  String? hardware_version;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? is_active;
  /// STRING
  String? manufacturer;
  /// STRING
  String? model;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// STRING
  String? photo_url;
  /// STRING
  String? product_name;
  /// INTEGER
  int? version;

  DeviceType({
    this.created,
    this.device_type_mode,
    this.hardware_version,
    this.id,
    this.is_active,
    this.manufacturer,
    this.model,
    this.modified,
    this.name,
    this.photo_url,
    this.product_name,
    this.version,
  });

  factory DeviceType.fromMap(Map<String, dynamic> m) => DeviceType(
        created: m['created'] is String ? m['created'] : null,
        device_type_mode: m['device_type_mode'] is String ? m['device_type_mode'] : null,
        hardware_version: m['hardware_version'] is String ? m['hardware_version'] : null,
        id: m['id'] is String ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        manufacturer: m['manufacturer'] is String ? m['manufacturer'] : null,
        model: m['model'] is String ? m['model'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        photo_url: m['photo_url'] is String ? m['photo_url'] : null,
        product_name: m['product_name'] is String ? m['product_name'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != created) {
      m['created'] = created;
    }
    if (null != device_type_mode) {
      m['device_type_mode'] = device_type_mode;
    }
    if (null != hardware_version) {
      m['hardware_version'] = hardware_version;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != manufacturer) {
      m['manufacturer'] = manufacturer;
    }
    if (null != model) {
      m['model'] = model;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != photo_url) {
      m['photo_url'] = photo_url;
    }
    if (null != product_name) {
      m['product_name'] = product_name;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class DeviceTypeLoadMatch {
  /// STRING (required at the API)
  String? id;

  DeviceTypeLoadMatch({
    this.id,
  });

  factory DeviceTypeLoadMatch.fromMap(Map<String, dynamic> m) => DeviceTypeLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class DeviceTypeListMatch {
  /// STRING
  String? created;
  /// STRING
  String? device_type_mode;
  /// STRING
  String? hardware_version;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? is_active;
  /// STRING
  String? manufacturer;
  /// STRING
  String? model;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// STRING
  String? photo_url;
  /// STRING
  String? product_name;
  /// INTEGER
  int? version;

  DeviceTypeListMatch({
    this.created,
    this.device_type_mode,
    this.hardware_version,
    this.id,
    this.is_active,
    this.manufacturer,
    this.model,
    this.modified,
    this.name,
    this.photo_url,
    this.product_name,
    this.version,
  });

  factory DeviceTypeListMatch.fromMap(Map<String, dynamic> m) => DeviceTypeListMatch(
        created: m['created'] is String ? m['created'] : null,
        device_type_mode: m['device_type_mode'] is String ? m['device_type_mode'] : null,
        hardware_version: m['hardware_version'] is String ? m['hardware_version'] : null,
        id: m['id'] is String ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        manufacturer: m['manufacturer'] is String ? m['manufacturer'] : null,
        model: m['model'] is String ? m['model'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        photo_url: m['photo_url'] is String ? m['photo_url'] : null,
        product_name: m['product_name'] is String ? m['product_name'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != created) {
      m['created'] = created;
    }
    if (null != device_type_mode) {
      m['device_type_mode'] = device_type_mode;
    }
    if (null != hardware_version) {
      m['hardware_version'] = hardware_version;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != manufacturer) {
      m['manufacturer'] = manufacturer;
    }
    if (null != model) {
      m['model'] = model;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != photo_url) {
      m['photo_url'] = photo_url;
    }
    if (null != product_name) {
      m['product_name'] = product_name;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class InjectKey {
  /// STRING
  String? created;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? is_active;
  /// BOOLEAN
  bool? is_p2_pe;
  /// STRING
  String? key_type;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// INTEGER
  int? version;

  InjectKey({
    this.created,
    this.id,
    this.is_active,
    this.is_p2_pe,
    this.key_type,
    this.modified,
    this.name,
    this.version,
  });

  factory InjectKey.fromMap(Map<String, dynamic> m) => InjectKey(
        created: m['created'] is String ? m['created'] : null,
        id: m['id'] is String ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        is_p2_pe: m['is_p2_pe'] is bool ? m['is_p2_pe'] : null,
        key_type: m['key_type'] is String ? m['key_type'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != created) {
      m['created'] = created;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != is_p2_pe) {
      m['is_p2_pe'] = is_p2_pe;
    }
    if (null != key_type) {
      m['key_type'] = key_type;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class InjectKeyLoadMatch {
  /// STRING (required at the API)
  String? id;

  InjectKeyLoadMatch({
    this.id,
  });

  factory InjectKeyLoadMatch.fromMap(Map<String, dynamic> m) => InjectKeyLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class InjectKeyListMatch {
  /// STRING
  String? created;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? is_active;
  /// BOOLEAN
  bool? is_p2_pe;
  /// STRING
  String? key_type;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// INTEGER
  int? version;

  InjectKeyListMatch({
    this.created,
    this.id,
    this.is_active,
    this.is_p2_pe,
    this.key_type,
    this.modified,
    this.name,
    this.version,
  });

  factory InjectKeyListMatch.fromMap(Map<String, dynamic> m) => InjectKeyListMatch(
        created: m['created'] is String ? m['created'] : null,
        id: m['id'] is String ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        is_p2_pe: m['is_p2_pe'] is bool ? m['is_p2_pe'] : null,
        key_type: m['key_type'] is String ? m['key_type'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != created) {
      m['created'] = created;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != is_p2_pe) {
      m['is_p2_pe'] = is_p2_pe;
    }
    if (null != key_type) {
      m['key_type'] = key_type;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class Kif {
  /// INTEGER
  int? id;
  /// STRING
  String? name;

  Kif({
    this.id,
    this.name,
  });

  factory Kif.fromMap(Map<String, dynamic> m) => Kif(
        id: m['id'] is int ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    if (null != name) {
      m['name'] = name;
    }
    return m;
  }
}

class KifListMatch {
  /// INTEGER
  int? id;
  /// STRING
  String? name;

  KifListMatch({
    this.id,
    this.name,
  });

  factory KifListMatch.fromMap(Map<String, dynamic> m) => KifListMatch(
        id: m['id'] is int ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    if (null != name) {
      m['name'] = name;
    }
    return m;
  }
}

class Location {
  /// STRING
  String? address1;
  /// STRING
  String? address2;
  /// STRING
  String? billing_id;
  /// STRING
  String? city;
  /// STRING
  String? country;
  /// STRING
  String? created;
  /// STRING
  String? custom_reference;
  /// STRING
  String? id;
  /// STRING
  String? location_type;
  /// STRING
  String? mail_address1;
  /// STRING
  String? mail_address2;
  /// STRING
  String? mail_city;
  /// STRING
  String? mail_country;
  /// STRING
  String? mail_postal_code;
  /// STRING
  String? mail_state_province;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// STRING
  String? name_of_business;
  /// STRING
  String? note;
  /// STRING
  String? postal_code;
  /// STRING
  String? state_province;
  /// STRING
  String? unique_id;
  /// INTEGER
  int? version;

  Location({
    this.address1,
    this.address2,
    this.billing_id,
    this.city,
    this.country,
    this.created,
    this.custom_reference,
    this.id,
    this.location_type,
    this.mail_address1,
    this.mail_address2,
    this.mail_city,
    this.mail_country,
    this.mail_postal_code,
    this.mail_state_province,
    this.modified,
    this.name,
    this.name_of_business,
    this.note,
    this.postal_code,
    this.state_province,
    this.unique_id,
    this.version,
  });

  factory Location.fromMap(Map<String, dynamic> m) => Location(
        address1: m['address1'] is String ? m['address1'] : null,
        address2: m['address2'] is String ? m['address2'] : null,
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        city: m['city'] is String ? m['city'] : null,
        country: m['country'] is String ? m['country'] : null,
        created: m['created'] is String ? m['created'] : null,
        custom_reference: m['custom_reference'] is String ? m['custom_reference'] : null,
        id: m['id'] is String ? m['id'] : null,
        location_type: m['location_type'] is String ? m['location_type'] : null,
        mail_address1: m['mail_address1'] is String ? m['mail_address1'] : null,
        mail_address2: m['mail_address2'] is String ? m['mail_address2'] : null,
        mail_city: m['mail_city'] is String ? m['mail_city'] : null,
        mail_country: m['mail_country'] is String ? m['mail_country'] : null,
        mail_postal_code: m['mail_postal_code'] is String ? m['mail_postal_code'] : null,
        mail_state_province: m['mail_state_province'] is String ? m['mail_state_province'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        name_of_business: m['name_of_business'] is String ? m['name_of_business'] : null,
        note: m['note'] is String ? m['note'] : null,
        postal_code: m['postal_code'] is String ? m['postal_code'] : null,
        state_province: m['state_province'] is String ? m['state_province'] : null,
        unique_id: m['unique_id'] is String ? m['unique_id'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != address1) {
      m['address1'] = address1;
    }
    if (null != address2) {
      m['address2'] = address2;
    }
    if (null != billing_id) {
      m['billing_id'] = billing_id;
    }
    if (null != city) {
      m['city'] = city;
    }
    if (null != country) {
      m['country'] = country;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != custom_reference) {
      m['custom_reference'] = custom_reference;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != location_type) {
      m['location_type'] = location_type;
    }
    if (null != mail_address1) {
      m['mail_address1'] = mail_address1;
    }
    if (null != mail_address2) {
      m['mail_address2'] = mail_address2;
    }
    if (null != mail_city) {
      m['mail_city'] = mail_city;
    }
    if (null != mail_country) {
      m['mail_country'] = mail_country;
    }
    if (null != mail_postal_code) {
      m['mail_postal_code'] = mail_postal_code;
    }
    if (null != mail_state_province) {
      m['mail_state_province'] = mail_state_province;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != name_of_business) {
      m['name_of_business'] = name_of_business;
    }
    if (null != note) {
      m['note'] = note;
    }
    if (null != postal_code) {
      m['postal_code'] = postal_code;
    }
    if (null != state_province) {
      m['state_province'] = state_province;
    }
    if (null != unique_id) {
      m['unique_id'] = unique_id;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class LocationLoadMatch {
  /// STRING (required at the API)
  String? id;

  LocationLoadMatch({
    this.id,
  });

  factory LocationLoadMatch.fromMap(Map<String, dynamic> m) => LocationLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class LocationListMatch {
  /// STRING
  String? address1;
  /// STRING
  String? address2;
  /// STRING
  String? billing_id;
  /// STRING
  String? city;
  /// STRING
  String? country;
  /// STRING
  String? created;
  /// STRING
  String? custom_reference;
  /// STRING
  String? id;
  /// STRING
  String? location_type;
  /// STRING
  String? mail_address1;
  /// STRING
  String? mail_address2;
  /// STRING
  String? mail_city;
  /// STRING
  String? mail_country;
  /// STRING
  String? mail_postal_code;
  /// STRING
  String? mail_state_province;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// STRING
  String? name_of_business;
  /// STRING
  String? note;
  /// STRING
  String? postal_code;
  /// STRING
  String? state_province;
  /// STRING
  String? unique_id;
  /// INTEGER
  int? version;

  LocationListMatch({
    this.address1,
    this.address2,
    this.billing_id,
    this.city,
    this.country,
    this.created,
    this.custom_reference,
    this.id,
    this.location_type,
    this.mail_address1,
    this.mail_address2,
    this.mail_city,
    this.mail_country,
    this.mail_postal_code,
    this.mail_state_province,
    this.modified,
    this.name,
    this.name_of_business,
    this.note,
    this.postal_code,
    this.state_province,
    this.unique_id,
    this.version,
  });

  factory LocationListMatch.fromMap(Map<String, dynamic> m) => LocationListMatch(
        address1: m['address1'] is String ? m['address1'] : null,
        address2: m['address2'] is String ? m['address2'] : null,
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        city: m['city'] is String ? m['city'] : null,
        country: m['country'] is String ? m['country'] : null,
        created: m['created'] is String ? m['created'] : null,
        custom_reference: m['custom_reference'] is String ? m['custom_reference'] : null,
        id: m['id'] is String ? m['id'] : null,
        location_type: m['location_type'] is String ? m['location_type'] : null,
        mail_address1: m['mail_address1'] is String ? m['mail_address1'] : null,
        mail_address2: m['mail_address2'] is String ? m['mail_address2'] : null,
        mail_city: m['mail_city'] is String ? m['mail_city'] : null,
        mail_country: m['mail_country'] is String ? m['mail_country'] : null,
        mail_postal_code: m['mail_postal_code'] is String ? m['mail_postal_code'] : null,
        mail_state_province: m['mail_state_province'] is String ? m['mail_state_province'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        name_of_business: m['name_of_business'] is String ? m['name_of_business'] : null,
        note: m['note'] is String ? m['note'] : null,
        postal_code: m['postal_code'] is String ? m['postal_code'] : null,
        state_province: m['state_province'] is String ? m['state_province'] : null,
        unique_id: m['unique_id'] is String ? m['unique_id'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != address1) {
      m['address1'] = address1;
    }
    if (null != address2) {
      m['address2'] = address2;
    }
    if (null != billing_id) {
      m['billing_id'] = billing_id;
    }
    if (null != city) {
      m['city'] = city;
    }
    if (null != country) {
      m['country'] = country;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != custom_reference) {
      m['custom_reference'] = custom_reference;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != location_type) {
      m['location_type'] = location_type;
    }
    if (null != mail_address1) {
      m['mail_address1'] = mail_address1;
    }
    if (null != mail_address2) {
      m['mail_address2'] = mail_address2;
    }
    if (null != mail_city) {
      m['mail_city'] = mail_city;
    }
    if (null != mail_country) {
      m['mail_country'] = mail_country;
    }
    if (null != mail_postal_code) {
      m['mail_postal_code'] = mail_postal_code;
    }
    if (null != mail_state_province) {
      m['mail_state_province'] = mail_state_province;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != name_of_business) {
      m['name_of_business'] = name_of_business;
    }
    if (null != note) {
      m['note'] = note;
    }
    if (null != postal_code) {
      m['postal_code'] = postal_code;
    }
    if (null != state_province) {
      m['state_province'] = state_province;
    }
    if (null != unique_id) {
      m['unique_id'] = unique_id;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class LocationCreateData {
  /// STRING
  String? address1;
  /// STRING
  String? address2;
  /// STRING
  String? billing_id;
  /// STRING
  String? city;
  /// STRING
  String? country;
  /// STRING
  String? created;
  /// STRING
  String? custom_reference;
  /// STRING
  String? id;
  /// STRING
  String? location_type;
  /// STRING
  String? mail_address1;
  /// STRING
  String? mail_address2;
  /// STRING
  String? mail_city;
  /// STRING
  String? mail_country;
  /// STRING
  String? mail_postal_code;
  /// STRING
  String? mail_state_province;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// STRING
  String? name_of_business;
  /// STRING
  String? note;
  /// STRING
  String? postal_code;
  /// STRING
  String? state_province;
  /// STRING
  String? unique_id;
  /// INTEGER
  int? version;

  LocationCreateData({
    this.address1,
    this.address2,
    this.billing_id,
    this.city,
    this.country,
    this.created,
    this.custom_reference,
    this.id,
    this.location_type,
    this.mail_address1,
    this.mail_address2,
    this.mail_city,
    this.mail_country,
    this.mail_postal_code,
    this.mail_state_province,
    this.modified,
    this.name,
    this.name_of_business,
    this.note,
    this.postal_code,
    this.state_province,
    this.unique_id,
    this.version,
  });

  factory LocationCreateData.fromMap(Map<String, dynamic> m) => LocationCreateData(
        address1: m['address1'] is String ? m['address1'] : null,
        address2: m['address2'] is String ? m['address2'] : null,
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        city: m['city'] is String ? m['city'] : null,
        country: m['country'] is String ? m['country'] : null,
        created: m['created'] is String ? m['created'] : null,
        custom_reference: m['custom_reference'] is String ? m['custom_reference'] : null,
        id: m['id'] is String ? m['id'] : null,
        location_type: m['location_type'] is String ? m['location_type'] : null,
        mail_address1: m['mail_address1'] is String ? m['mail_address1'] : null,
        mail_address2: m['mail_address2'] is String ? m['mail_address2'] : null,
        mail_city: m['mail_city'] is String ? m['mail_city'] : null,
        mail_country: m['mail_country'] is String ? m['mail_country'] : null,
        mail_postal_code: m['mail_postal_code'] is String ? m['mail_postal_code'] : null,
        mail_state_province: m['mail_state_province'] is String ? m['mail_state_province'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        name_of_business: m['name_of_business'] is String ? m['name_of_business'] : null,
        note: m['note'] is String ? m['note'] : null,
        postal_code: m['postal_code'] is String ? m['postal_code'] : null,
        state_province: m['state_province'] is String ? m['state_province'] : null,
        unique_id: m['unique_id'] is String ? m['unique_id'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != address1) {
      m['address1'] = address1;
    }
    if (null != address2) {
      m['address2'] = address2;
    }
    if (null != billing_id) {
      m['billing_id'] = billing_id;
    }
    if (null != city) {
      m['city'] = city;
    }
    if (null != country) {
      m['country'] = country;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != custom_reference) {
      m['custom_reference'] = custom_reference;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != location_type) {
      m['location_type'] = location_type;
    }
    if (null != mail_address1) {
      m['mail_address1'] = mail_address1;
    }
    if (null != mail_address2) {
      m['mail_address2'] = mail_address2;
    }
    if (null != mail_city) {
      m['mail_city'] = mail_city;
    }
    if (null != mail_country) {
      m['mail_country'] = mail_country;
    }
    if (null != mail_postal_code) {
      m['mail_postal_code'] = mail_postal_code;
    }
    if (null != mail_state_province) {
      m['mail_state_province'] = mail_state_province;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != name_of_business) {
      m['name_of_business'] = name_of_business;
    }
    if (null != note) {
      m['note'] = note;
    }
    if (null != postal_code) {
      m['postal_code'] = postal_code;
    }
    if (null != state_province) {
      m['state_province'] = state_province;
    }
    if (null != unique_id) {
      m['unique_id'] = unique_id;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class LocationRemoveMatch {
  /// STRING (required at the API)
  String? id;

  LocationRemoveMatch({
    this.id,
  });

  factory LocationRemoveMatch.fromMap(Map<String, dynamic> m) => LocationRemoveMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class Partner {
  /// STRING
  String? billing_id;
  /// BOOLEAN
  bool? client_can_order_equipment;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? is_active;
  /// OBJECT (required at the API)
  Map<String, dynamic>? location;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? parent;
  /// STRING
  String? partner_id;
  /// STRING
  String? reference;
  /// STRING
  String? verification_phrase;
  /// INTEGER
  int? version;

  Partner({
    this.billing_id,
    this.client_can_order_equipment,
    this.contact,
    this.created,
    this.id,
    this.is_active,
    this.location,
    this.modified,
    this.name,
    this.parent,
    this.partner_id,
    this.reference,
    this.verification_phrase,
    this.version,
  });

  factory Partner.fromMap(Map<String, dynamic> m) => Partner(
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        client_can_order_equipment: m['client_can_order_equipment'] is bool ? m['client_can_order_equipment'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        id: m['id'] is String ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        partner_id: m['partner_id'] is String ? m['partner_id'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        verification_phrase: m['verification_phrase'] is String ? m['verification_phrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billing_id) {
      m['billing_id'] = billing_id;
    }
    if (null != client_can_order_equipment) {
      m['client_can_order_equipment'] = client_can_order_equipment;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != parent) {
      m['parent'] = parent;
    }
    if (null != partner_id) {
      m['partner_id'] = partner_id;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != verification_phrase) {
      m['verification_phrase'] = verification_phrase;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class PartnerLoadMatch {
  /// STRING (required at the API)
  String? id;

  PartnerLoadMatch({
    this.id,
  });

  factory PartnerLoadMatch.fromMap(Map<String, dynamic> m) => PartnerLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class PartnerListMatch {
  /// STRING
  String? billing_id;
  /// BOOLEAN
  bool? client_can_order_equipment;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? is_active;
  /// OBJECT
  Map<String, dynamic>? location;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? parent;
  /// STRING
  String? partner_id;
  /// STRING
  String? reference;
  /// STRING
  String? verification_phrase;
  /// INTEGER
  int? version;

  PartnerListMatch({
    this.billing_id,
    this.client_can_order_equipment,
    this.contact,
    this.created,
    this.id,
    this.is_active,
    this.location,
    this.modified,
    this.name,
    this.parent,
    this.partner_id,
    this.reference,
    this.verification_phrase,
    this.version,
  });

  factory PartnerListMatch.fromMap(Map<String, dynamic> m) => PartnerListMatch(
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        client_can_order_equipment: m['client_can_order_equipment'] is bool ? m['client_can_order_equipment'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        id: m['id'] is String ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        partner_id: m['partner_id'] is String ? m['partner_id'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        verification_phrase: m['verification_phrase'] is String ? m['verification_phrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billing_id) {
      m['billing_id'] = billing_id;
    }
    if (null != client_can_order_equipment) {
      m['client_can_order_equipment'] = client_can_order_equipment;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != parent) {
      m['parent'] = parent;
    }
    if (null != partner_id) {
      m['partner_id'] = partner_id;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != verification_phrase) {
      m['verification_phrase'] = verification_phrase;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class PartnerCreateData {
  /// STRING
  String? billing_id;
  /// BOOLEAN
  bool? client_can_order_equipment;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? is_active;
  /// OBJECT (required at the API)
  Map<String, dynamic>? location;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? parent;
  /// STRING
  String? partner_id;
  /// STRING
  String? reference;
  /// STRING
  String? verification_phrase;
  /// INTEGER
  int? version;

  PartnerCreateData({
    this.billing_id,
    this.client_can_order_equipment,
    this.contact,
    this.created,
    this.id,
    this.is_active,
    this.location,
    this.modified,
    this.name,
    this.parent,
    this.partner_id,
    this.reference,
    this.verification_phrase,
    this.version,
  });

  factory PartnerCreateData.fromMap(Map<String, dynamic> m) => PartnerCreateData(
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        client_can_order_equipment: m['client_can_order_equipment'] is bool ? m['client_can_order_equipment'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        id: m['id'] is String ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        partner_id: m['partner_id'] is String ? m['partner_id'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        verification_phrase: m['verification_phrase'] is String ? m['verification_phrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billing_id) {
      m['billing_id'] = billing_id;
    }
    if (null != client_can_order_equipment) {
      m['client_can_order_equipment'] = client_can_order_equipment;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != parent) {
      m['parent'] = parent;
    }
    if (null != partner_id) {
      m['partner_id'] = partner_id;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != verification_phrase) {
      m['verification_phrase'] = verification_phrase;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class Shipment {
  /// STRING
  String? carrier;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? created;
  /// STRING
  String? date_received;
  /// STRING
  String? date_shipped;
  /// OBJECT
  Map<String, dynamic>? dc_kif;
  /// STRING
  String? id;
  /// ARRAY
  List<dynamic>? item;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? modified;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? shipment_type;
  /// STRING
  String? tracking;
  /// INTEGER
  int? version;

  Shipment({
    this.carrier,
    this.client,
    this.created,
    this.date_received,
    this.date_shipped,
    this.dc_kif,
    this.id,
    this.item,
    this.kif,
    this.modified,
    this.partner,
    this.shipment_type,
    this.tracking,
    this.version,
  });

  factory Shipment.fromMap(Map<String, dynamic> m) => Shipment(
        carrier: m['carrier'] is String ? m['carrier'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        created: m['created'] is String ? m['created'] : null,
        date_received: m['date_received'] is String ? m['date_received'] : null,
        date_shipped: m['date_shipped'] is String ? m['date_shipped'] : null,
        dc_kif: m['dc_kif'] is Map<String, dynamic> ? m['dc_kif'] : null,
        id: m['id'] is String ? m['id'] : null,
        item: m['item'] is List<dynamic> ? m['item'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        shipment_type: m['shipment_type'] is String ? m['shipment_type'] : null,
        tracking: m['tracking'] is String ? m['tracking'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != carrier) {
      m['carrier'] = carrier;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != date_received) {
      m['date_received'] = date_received;
    }
    if (null != date_shipped) {
      m['date_shipped'] = date_shipped;
    }
    if (null != dc_kif) {
      m['dc_kif'] = dc_kif;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != item) {
      m['item'] = item;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != shipment_type) {
      m['shipment_type'] = shipment_type;
    }
    if (null != tracking) {
      m['tracking'] = tracking;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class ShipmentLoadMatch {
  /// STRING (required at the API)
  String? id;

  ShipmentLoadMatch({
    this.id,
  });

  factory ShipmentLoadMatch.fromMap(Map<String, dynamic> m) => ShipmentLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class ShipmentListMatch {
  /// STRING
  String? carrier;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? created;
  /// STRING
  String? date_received;
  /// STRING
  String? date_shipped;
  /// OBJECT
  Map<String, dynamic>? dc_kif;
  /// STRING
  String? id;
  /// ARRAY
  List<dynamic>? item;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? modified;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? shipment_type;
  /// STRING
  String? tracking;
  /// INTEGER
  int? version;

  ShipmentListMatch({
    this.carrier,
    this.client,
    this.created,
    this.date_received,
    this.date_shipped,
    this.dc_kif,
    this.id,
    this.item,
    this.kif,
    this.modified,
    this.partner,
    this.shipment_type,
    this.tracking,
    this.version,
  });

  factory ShipmentListMatch.fromMap(Map<String, dynamic> m) => ShipmentListMatch(
        carrier: m['carrier'] is String ? m['carrier'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        created: m['created'] is String ? m['created'] : null,
        date_received: m['date_received'] is String ? m['date_received'] : null,
        date_shipped: m['date_shipped'] is String ? m['date_shipped'] : null,
        dc_kif: m['dc_kif'] is Map<String, dynamic> ? m['dc_kif'] : null,
        id: m['id'] is String ? m['id'] : null,
        item: m['item'] is List<dynamic> ? m['item'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        shipment_type: m['shipment_type'] is String ? m['shipment_type'] : null,
        tracking: m['tracking'] is String ? m['tracking'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != carrier) {
      m['carrier'] = carrier;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != date_received) {
      m['date_received'] = date_received;
    }
    if (null != date_shipped) {
      m['date_shipped'] = date_shipped;
    }
    if (null != dc_kif) {
      m['dc_kif'] = dc_kif;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != item) {
      m['item'] = item;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != shipment_type) {
      m['shipment_type'] = shipment_type;
    }
    if (null != tracking) {
      m['tracking'] = tracking;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class ShipmentCreateData {
  /// STRING
  String? carrier;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? created;
  /// STRING
  String? date_received;
  /// STRING
  String? date_shipped;
  /// OBJECT
  Map<String, dynamic>? dc_kif;
  /// STRING
  String? id;
  /// ARRAY
  List<dynamic>? item;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? modified;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? shipment_type;
  /// STRING
  String? tracking;
  /// INTEGER
  int? version;

  ShipmentCreateData({
    this.carrier,
    this.client,
    this.created,
    this.date_received,
    this.date_shipped,
    this.dc_kif,
    this.id,
    this.item,
    this.kif,
    this.modified,
    this.partner,
    this.shipment_type,
    this.tracking,
    this.version,
  });

  factory ShipmentCreateData.fromMap(Map<String, dynamic> m) => ShipmentCreateData(
        carrier: m['carrier'] is String ? m['carrier'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        created: m['created'] is String ? m['created'] : null,
        date_received: m['date_received'] is String ? m['date_received'] : null,
        date_shipped: m['date_shipped'] is String ? m['date_shipped'] : null,
        dc_kif: m['dc_kif'] is Map<String, dynamic> ? m['dc_kif'] : null,
        id: m['id'] is String ? m['id'] : null,
        item: m['item'] is List<dynamic> ? m['item'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        shipment_type: m['shipment_type'] is String ? m['shipment_type'] : null,
        tracking: m['tracking'] is String ? m['tracking'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != carrier) {
      m['carrier'] = carrier;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != date_received) {
      m['date_received'] = date_received;
    }
    if (null != date_shipped) {
      m['date_shipped'] = date_shipped;
    }
    if (null != dc_kif) {
      m['dc_kif'] = dc_kif;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != item) {
      m['item'] = item;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != shipment_type) {
      m['shipment_type'] = shipment_type;
    }
    if (null != tracking) {
      m['tracking'] = tracking;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class Success {
  /// BOOLEAN
  bool? success;

  Success({
    this.success,
  });

  factory Success.fromMap(Map<String, dynamic> m) => Success(
        success: m['success'] is bool ? m['success'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != success) {
      m['success'] = success;
    }
    return m;
  }
}

class SuccessCreateData {
  /// STRING (required at the API)
  String? share_partner_to;

  SuccessCreateData({
    this.share_partner_to,
  });

  factory SuccessCreateData.fromMap(Map<String, dynamic> m) => SuccessCreateData(
        share_partner_to: m['share_partner_to'] is String ? m['share_partner_to'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != share_partner_to) {
      m['share_partner_to'] = share_partner_to;
    }
    return m;
  }
}

class SuccessRemoveMatch {
  /// STRING (required at the API)
  String? share_partner_to;

  SuccessRemoveMatch({
    this.share_partner_to,
  });

  factory SuccessRemoveMatch.fromMap(Map<String, dynamic> m) => SuccessRemoveMatch(
        share_partner_to: m['share_partner_to'] is String ? m['share_partner_to'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != share_partner_to) {
      m['share_partner_to'] = share_partner_to;
    }
    return m;
  }
}

class Transaction {
  /// STRING
  String? alternate_key;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? client_ref;
  /// STRING
  String? created;
  /// INTEGER
  int? decrypted;
  /// STRING
  String? device_name;
  /// OBJECT
  Map<String, dynamic>? direct_partner;
  /// INTEGER
  int? encrypted;
  /// STRING
  String? end_date;
  /// STRING
  String? err_code;
  /// STRING
  String? err_message;
  /// STRING
  String? id;
  /// STRING
  String? ip_address;
  /// BOOLEAN
  bool? is_virtual;
  /// STRING
  String? key_type;
  /// OBJECT (required at the API)
  Map<String, dynamic>? location;
  /// STRING
  String? message_id;
  /// STRING
  String? method;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? reference;
  /// STRING
  String? serial_number;
  /// STRING
  String? start_date;
  /// BOOLEAN
  bool? success;
  /// STRING
  String? transaction_source;

  Transaction({
    this.alternate_key,
    this.client,
    this.client_ref,
    this.created,
    this.decrypted,
    this.device_name,
    this.direct_partner,
    this.encrypted,
    this.end_date,
    this.err_code,
    this.err_message,
    this.id,
    this.ip_address,
    this.is_virtual,
    this.key_type,
    this.location,
    this.message_id,
    this.method,
    this.partner,
    this.reference,
    this.serial_number,
    this.start_date,
    this.success,
    this.transaction_source,
  });

  factory Transaction.fromMap(Map<String, dynamic> m) => Transaction(
        alternate_key: m['alternate_key'] is String ? m['alternate_key'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        client_ref: m['client_ref'] is String ? m['client_ref'] : null,
        created: m['created'] is String ? m['created'] : null,
        decrypted: m['decrypted'] is int ? m['decrypted'] : null,
        device_name: m['device_name'] is String ? m['device_name'] : null,
        direct_partner: m['direct_partner'] is Map<String, dynamic> ? m['direct_partner'] : null,
        encrypted: m['encrypted'] is int ? m['encrypted'] : null,
        end_date: m['end_date'] is String ? m['end_date'] : null,
        err_code: m['err_code'] is String ? m['err_code'] : null,
        err_message: m['err_message'] is String ? m['err_message'] : null,
        id: m['id'] is String ? m['id'] : null,
        ip_address: m['ip_address'] is String ? m['ip_address'] : null,
        is_virtual: m['is_virtual'] is bool ? m['is_virtual'] : null,
        key_type: m['key_type'] is String ? m['key_type'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        message_id: m['message_id'] is String ? m['message_id'] : null,
        method: m['method'] is String ? m['method'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        serial_number: m['serial_number'] is String ? m['serial_number'] : null,
        start_date: m['start_date'] is String ? m['start_date'] : null,
        success: m['success'] is bool ? m['success'] : null,
        transaction_source: m['transaction_source'] is String ? m['transaction_source'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != alternate_key) {
      m['alternate_key'] = alternate_key;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != client_ref) {
      m['client_ref'] = client_ref;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != decrypted) {
      m['decrypted'] = decrypted;
    }
    if (null != device_name) {
      m['device_name'] = device_name;
    }
    if (null != direct_partner) {
      m['direct_partner'] = direct_partner;
    }
    if (null != encrypted) {
      m['encrypted'] = encrypted;
    }
    if (null != end_date) {
      m['end_date'] = end_date;
    }
    if (null != err_code) {
      m['err_code'] = err_code;
    }
    if (null != err_message) {
      m['err_message'] = err_message;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != ip_address) {
      m['ip_address'] = ip_address;
    }
    if (null != is_virtual) {
      m['is_virtual'] = is_virtual;
    }
    if (null != key_type) {
      m['key_type'] = key_type;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != message_id) {
      m['message_id'] = message_id;
    }
    if (null != method) {
      m['method'] = method;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != serial_number) {
      m['serial_number'] = serial_number;
    }
    if (null != start_date) {
      m['start_date'] = start_date;
    }
    if (null != success) {
      m['success'] = success;
    }
    if (null != transaction_source) {
      m['transaction_source'] = transaction_source;
    }
    return m;
  }
}

class TransactionLoadMatch {
  /// STRING (required at the API)
  String? id;

  TransactionLoadMatch({
    this.id,
  });

  factory TransactionLoadMatch.fromMap(Map<String, dynamic> m) => TransactionLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class TransactionListMatch {
  /// STRING
  String? alternate_key;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? client_ref;
  /// STRING
  String? created;
  /// INTEGER
  int? decrypted;
  /// STRING
  String? device_name;
  /// OBJECT
  Map<String, dynamic>? direct_partner;
  /// INTEGER
  int? encrypted;
  /// STRING
  String? end_date;
  /// STRING
  String? err_code;
  /// STRING
  String? err_message;
  /// STRING
  String? id;
  /// STRING
  String? ip_address;
  /// BOOLEAN
  bool? is_virtual;
  /// STRING
  String? key_type;
  /// OBJECT
  Map<String, dynamic>? location;
  /// STRING
  String? message_id;
  /// STRING
  String? method;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? reference;
  /// STRING
  String? serial_number;
  /// STRING
  String? start_date;
  /// BOOLEAN
  bool? success;
  /// STRING
  String? transaction_source;

  TransactionListMatch({
    this.alternate_key,
    this.client,
    this.client_ref,
    this.created,
    this.decrypted,
    this.device_name,
    this.direct_partner,
    this.encrypted,
    this.end_date,
    this.err_code,
    this.err_message,
    this.id,
    this.ip_address,
    this.is_virtual,
    this.key_type,
    this.location,
    this.message_id,
    this.method,
    this.partner,
    this.reference,
    this.serial_number,
    this.start_date,
    this.success,
    this.transaction_source,
  });

  factory TransactionListMatch.fromMap(Map<String, dynamic> m) => TransactionListMatch(
        alternate_key: m['alternate_key'] is String ? m['alternate_key'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        client_ref: m['client_ref'] is String ? m['client_ref'] : null,
        created: m['created'] is String ? m['created'] : null,
        decrypted: m['decrypted'] is int ? m['decrypted'] : null,
        device_name: m['device_name'] is String ? m['device_name'] : null,
        direct_partner: m['direct_partner'] is Map<String, dynamic> ? m['direct_partner'] : null,
        encrypted: m['encrypted'] is int ? m['encrypted'] : null,
        end_date: m['end_date'] is String ? m['end_date'] : null,
        err_code: m['err_code'] is String ? m['err_code'] : null,
        err_message: m['err_message'] is String ? m['err_message'] : null,
        id: m['id'] is String ? m['id'] : null,
        ip_address: m['ip_address'] is String ? m['ip_address'] : null,
        is_virtual: m['is_virtual'] is bool ? m['is_virtual'] : null,
        key_type: m['key_type'] is String ? m['key_type'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        message_id: m['message_id'] is String ? m['message_id'] : null,
        method: m['method'] is String ? m['method'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        serial_number: m['serial_number'] is String ? m['serial_number'] : null,
        start_date: m['start_date'] is String ? m['start_date'] : null,
        success: m['success'] is bool ? m['success'] : null,
        transaction_source: m['transaction_source'] is String ? m['transaction_source'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != alternate_key) {
      m['alternate_key'] = alternate_key;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != client_ref) {
      m['client_ref'] = client_ref;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != decrypted) {
      m['decrypted'] = decrypted;
    }
    if (null != device_name) {
      m['device_name'] = device_name;
    }
    if (null != direct_partner) {
      m['direct_partner'] = direct_partner;
    }
    if (null != encrypted) {
      m['encrypted'] = encrypted;
    }
    if (null != end_date) {
      m['end_date'] = end_date;
    }
    if (null != err_code) {
      m['err_code'] = err_code;
    }
    if (null != err_message) {
      m['err_message'] = err_message;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != ip_address) {
      m['ip_address'] = ip_address;
    }
    if (null != is_virtual) {
      m['is_virtual'] = is_virtual;
    }
    if (null != key_type) {
      m['key_type'] = key_type;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != message_id) {
      m['message_id'] = message_id;
    }
    if (null != method) {
      m['method'] = method;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != serial_number) {
      m['serial_number'] = serial_number;
    }
    if (null != start_date) {
      m['start_date'] = start_date;
    }
    if (null != success) {
      m['success'] = success;
    }
    if (null != transaction_source) {
      m['transaction_source'] = transaction_source;
    }
    return m;
  }
}

class TransactionCreateData {
  /// STRING
  String? alternate_key;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? client_ref;
  /// STRING
  String? created;
  /// INTEGER
  int? decrypted;
  /// STRING
  String? device_name;
  /// OBJECT
  Map<String, dynamic>? direct_partner;
  /// INTEGER
  int? encrypted;
  /// STRING
  String? end_date;
  /// STRING
  String? err_code;
  /// STRING
  String? err_message;
  /// STRING
  String? id;
  /// STRING
  String? ip_address;
  /// BOOLEAN
  bool? is_virtual;
  /// STRING
  String? key_type;
  /// OBJECT (required at the API)
  Map<String, dynamic>? location;
  /// STRING
  String? message_id;
  /// STRING
  String? method;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? reference;
  /// STRING
  String? serial_number;
  /// STRING
  String? start_date;
  /// BOOLEAN
  bool? success;
  /// STRING
  String? transaction_source;

  TransactionCreateData({
    this.alternate_key,
    this.client,
    this.client_ref,
    this.created,
    this.decrypted,
    this.device_name,
    this.direct_partner,
    this.encrypted,
    this.end_date,
    this.err_code,
    this.err_message,
    this.id,
    this.ip_address,
    this.is_virtual,
    this.key_type,
    this.location,
    this.message_id,
    this.method,
    this.partner,
    this.reference,
    this.serial_number,
    this.start_date,
    this.success,
    this.transaction_source,
  });

  factory TransactionCreateData.fromMap(Map<String, dynamic> m) => TransactionCreateData(
        alternate_key: m['alternate_key'] is String ? m['alternate_key'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        client_ref: m['client_ref'] is String ? m['client_ref'] : null,
        created: m['created'] is String ? m['created'] : null,
        decrypted: m['decrypted'] is int ? m['decrypted'] : null,
        device_name: m['device_name'] is String ? m['device_name'] : null,
        direct_partner: m['direct_partner'] is Map<String, dynamic> ? m['direct_partner'] : null,
        encrypted: m['encrypted'] is int ? m['encrypted'] : null,
        end_date: m['end_date'] is String ? m['end_date'] : null,
        err_code: m['err_code'] is String ? m['err_code'] : null,
        err_message: m['err_message'] is String ? m['err_message'] : null,
        id: m['id'] is String ? m['id'] : null,
        ip_address: m['ip_address'] is String ? m['ip_address'] : null,
        is_virtual: m['is_virtual'] is bool ? m['is_virtual'] : null,
        key_type: m['key_type'] is String ? m['key_type'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        message_id: m['message_id'] is String ? m['message_id'] : null,
        method: m['method'] is String ? m['method'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        serial_number: m['serial_number'] is String ? m['serial_number'] : null,
        start_date: m['start_date'] is String ? m['start_date'] : null,
        success: m['success'] is bool ? m['success'] : null,
        transaction_source: m['transaction_source'] is String ? m['transaction_source'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != alternate_key) {
      m['alternate_key'] = alternate_key;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != client_ref) {
      m['client_ref'] = client_ref;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != decrypted) {
      m['decrypted'] = decrypted;
    }
    if (null != device_name) {
      m['device_name'] = device_name;
    }
    if (null != direct_partner) {
      m['direct_partner'] = direct_partner;
    }
    if (null != encrypted) {
      m['encrypted'] = encrypted;
    }
    if (null != end_date) {
      m['end_date'] = end_date;
    }
    if (null != err_code) {
      m['err_code'] = err_code;
    }
    if (null != err_message) {
      m['err_message'] = err_message;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != ip_address) {
      m['ip_address'] = ip_address;
    }
    if (null != is_virtual) {
      m['is_virtual'] = is_virtual;
    }
    if (null != key_type) {
      m['key_type'] = key_type;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != message_id) {
      m['message_id'] = message_id;
    }
    if (null != method) {
      m['method'] = method;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != serial_number) {
      m['serial_number'] = serial_number;
    }
    if (null != start_date) {
      m['start_date'] = start_date;
    }
    if (null != success) {
      m['success'] = success;
    }
    if (null != transaction_source) {
      m['transaction_source'] = transaction_source;
    }
    return m;
  }
}

class UpdateResult {
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? email;
  /// STRING
  String? first_name;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? is_active;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? last_name;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? phone;
  /// STRING
  String? user_name;
  /// OBJECT
  Map<String, dynamic>? user_role;
  /// INTEGER
  int? version;

  UpdateResult({
    this.client,
    this.email,
    this.first_name,
    this.id,
    this.is_active,
    this.kif,
    this.last_name,
    this.partner,
    this.phone,
    this.user_name,
    this.user_role,
    this.version,
  });

  factory UpdateResult.fromMap(Map<String, dynamic> m) => UpdateResult(
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        email: m['email'] is String ? m['email'] : null,
        first_name: m['first_name'] is String ? m['first_name'] : null,
        id: m['id'] is String ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        last_name: m['last_name'] is String ? m['last_name'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        user_name: m['user_name'] is String ? m['user_name'] : null,
        user_role: m['user_role'] is Map<String, dynamic> ? m['user_role'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != client) {
      m['client'] = client;
    }
    if (null != email) {
      m['email'] = email;
    }
    if (null != first_name) {
      m['first_name'] = first_name;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != last_name) {
      m['last_name'] = last_name;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != phone) {
      m['phone'] = phone;
    }
    if (null != user_name) {
      m['user_name'] = user_name;
    }
    if (null != user_role) {
      m['user_role'] = user_role;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class UpdateResultListMatch {
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? email;
  /// STRING
  String? first_name;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? is_active;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? last_name;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? phone;
  /// STRING
  String? user_name;
  /// OBJECT
  Map<String, dynamic>? user_role;
  /// INTEGER
  int? version;

  UpdateResultListMatch({
    this.client,
    this.email,
    this.first_name,
    this.id,
    this.is_active,
    this.kif,
    this.last_name,
    this.partner,
    this.phone,
    this.user_name,
    this.user_role,
    this.version,
  });

  factory UpdateResultListMatch.fromMap(Map<String, dynamic> m) => UpdateResultListMatch(
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        email: m['email'] is String ? m['email'] : null,
        first_name: m['first_name'] is String ? m['first_name'] : null,
        id: m['id'] is String ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        last_name: m['last_name'] is String ? m['last_name'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        user_name: m['user_name'] is String ? m['user_name'] : null,
        user_role: m['user_role'] is Map<String, dynamic> ? m['user_role'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != client) {
      m['client'] = client;
    }
    if (null != email) {
      m['email'] = email;
    }
    if (null != first_name) {
      m['first_name'] = first_name;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != last_name) {
      m['last_name'] = last_name;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != phone) {
      m['phone'] = phone;
    }
    if (null != user_name) {
      m['user_name'] = user_name;
    }
    if (null != user_role) {
      m['user_role'] = user_role;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class UpdateResultCreateData {
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? email;
  /// STRING
  String? first_name;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? is_active;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? last_name;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? phone;
  /// STRING
  String? user_name;
  /// OBJECT
  Map<String, dynamic>? user_role;
  /// INTEGER
  int? version;

  UpdateResultCreateData({
    this.client,
    this.email,
    this.first_name,
    this.id,
    this.is_active,
    this.kif,
    this.last_name,
    this.partner,
    this.phone,
    this.user_name,
    this.user_role,
    this.version,
  });

  factory UpdateResultCreateData.fromMap(Map<String, dynamic> m) => UpdateResultCreateData(
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        email: m['email'] is String ? m['email'] : null,
        first_name: m['first_name'] is String ? m['first_name'] : null,
        id: m['id'] is String ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        last_name: m['last_name'] is String ? m['last_name'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        user_name: m['user_name'] is String ? m['user_name'] : null,
        user_role: m['user_role'] is Map<String, dynamic> ? m['user_role'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != client) {
      m['client'] = client;
    }
    if (null != email) {
      m['email'] = email;
    }
    if (null != first_name) {
      m['first_name'] = first_name;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != last_name) {
      m['last_name'] = last_name;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != phone) {
      m['phone'] = phone;
    }
    if (null != user_name) {
      m['user_name'] = user_name;
    }
    if (null != user_role) {
      m['user_role'] = user_role;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class UpdateResultUpdateData {
  /// STRING (required at the API)
  String? id;

  UpdateResultUpdateData({
    this.id,
  });

  factory UpdateResultUpdateData.fromMap(Map<String, dynamic> m) => UpdateResultUpdateData(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class User {
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? created;
  /// STRING
  String? email;
  /// STRING
  String? first_name;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? is_active;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? last_name;
  /// STRING
  String? modified;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? phone;
  /// STRING
  String? user_name;
  /// OBJECT
  Map<String, dynamic>? user_role;
  /// INTEGER
  int? version;

  User({
    this.client,
    this.created,
    this.email,
    this.first_name,
    this.id,
    this.is_active,
    this.kif,
    this.last_name,
    this.modified,
    this.partner,
    this.phone,
    this.user_name,
    this.user_role,
    this.version,
  });

  factory User.fromMap(Map<String, dynamic> m) => User(
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        created: m['created'] is String ? m['created'] : null,
        email: m['email'] is String ? m['email'] : null,
        first_name: m['first_name'] is String ? m['first_name'] : null,
        id: m['id'] is String ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        last_name: m['last_name'] is String ? m['last_name'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        user_name: m['user_name'] is String ? m['user_name'] : null,
        user_role: m['user_role'] is Map<String, dynamic> ? m['user_role'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != client) {
      m['client'] = client;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != email) {
      m['email'] = email;
    }
    if (null != first_name) {
      m['first_name'] = first_name;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != last_name) {
      m['last_name'] = last_name;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != phone) {
      m['phone'] = phone;
    }
    if (null != user_name) {
      m['user_name'] = user_name;
    }
    if (null != user_role) {
      m['user_role'] = user_role;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class UserLoadMatch {
  /// STRING (required at the API)
  String? id;

  UserLoadMatch({
    this.id,
  });

  factory UserLoadMatch.fromMap(Map<String, dynamic> m) => UserLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class UserRemoveMatch {
  /// STRING (required at the API)
  String? id;

  UserRemoveMatch({
    this.id,
  });

  factory UserRemoveMatch.fromMap(Map<String, dynamic> m) => UserRemoveMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}


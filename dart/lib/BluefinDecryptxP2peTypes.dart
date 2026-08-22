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
  String? completeDate;
  /// STRING
  String? created;
  /// OBJECT
  Map<String, dynamic>? device;
  /// STRING
  String? id;
  /// STRING
  String? name;
  /// STRING
  String? notes;

  Attestation({
    this.client,
    this.completeDate,
    this.created,
    this.device,
    this.id,
    this.name,
    this.notes,
  });

  factory Attestation.fromMap(Map<String, dynamic> m) => Attestation(
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        completeDate: m['completeDate'] is String ? m['completeDate'] : null,
        created: m['created'] is String ? m['created'] : null,
        device: m['device'] is Map<String, dynamic> ? m['device'] : null,
        id: m['id'] is String ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
        notes: m['notes'] is String ? m['notes'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != client) {
      m['client'] = client;
    }
    if (null != completeDate) {
      m['completeDate'] = completeDate;
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
    if (null != notes) {
      m['notes'] = notes;
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
  String? completeDate;
  /// STRING
  String? created;
  /// OBJECT
  Map<String, dynamic>? device;
  /// STRING
  String? id;
  /// STRING
  String? name;
  /// STRING
  String? notes;

  AttestationListMatch({
    this.client,
    this.completeDate,
    this.created,
    this.device,
    this.id,
    this.name,
    this.notes,
  });

  factory AttestationListMatch.fromMap(Map<String, dynamic> m) => AttestationListMatch(
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        completeDate: m['completeDate'] is String ? m['completeDate'] : null,
        created: m['created'] is String ? m['created'] : null,
        device: m['device'] is Map<String, dynamic> ? m['device'] : null,
        id: m['id'] is String ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
        notes: m['notes'] is String ? m['notes'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != client) {
      m['client'] = client;
    }
    if (null != completeDate) {
      m['completeDate'] = completeDate;
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
    if (null != notes) {
      m['notes'] = notes;
    }
    return m;
  }
}

class AttestationCreateData {
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? completeDate;
  /// STRING
  String? created;
  /// OBJECT
  Map<String, dynamic>? device;
  /// STRING
  String? id;
  /// STRING
  String? name;
  /// STRING
  String? notes;

  AttestationCreateData({
    this.client,
    this.completeDate,
    this.created,
    this.device,
    this.id,
    this.name,
    this.notes,
  });

  factory AttestationCreateData.fromMap(Map<String, dynamic> m) => AttestationCreateData(
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        completeDate: m['completeDate'] is String ? m['completeDate'] : null,
        created: m['created'] is String ? m['created'] : null,
        device: m['device'] is Map<String, dynamic> ? m['device'] : null,
        id: m['id'] is String ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
        notes: m['notes'] is String ? m['notes'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != client) {
      m['client'] = client;
    }
    if (null != completeDate) {
      m['completeDate'] = completeDate;
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
    if (null != notes) {
      m['notes'] = notes;
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
  Map<String, dynamic>? directPartner;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? isActive;
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
    this.directPartner,
    this.id,
    this.isActive,
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
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        id: m['id'] is String ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
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
    if (null != directPartner) {
      m['directPartner'] = directPartner;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
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
  Map<String, dynamic>? directPartner;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? isActive;
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
    this.directPartner,
    this.id,
    this.isActive,
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
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        id: m['id'] is String ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
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
    if (null != directPartner) {
      m['directPartner'] = directPartner;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
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
  Map<String, dynamic>? directPartner;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? isActive;
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
    this.directPartner,
    this.id,
    this.isActive,
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
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        id: m['id'] is String ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
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
    if (null != directPartner) {
      m['directPartner'] = directPartner;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
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
  Map<String, dynamic>? activatedBy;
  /// STRING
  String? activationDate;
  /// STRING
  String? alternateKey;
  /// STRING
  String? auditNextDate;
  /// STRING
  String? auditNotificationDate;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? created;
  /// OBJECT (required at the API)
  Map<String, dynamic>? createdBy;
  /// OBJECT
  Map<String, dynamic>? deviceBuild;
  /// OBJECT
  Map<String, dynamic>? deviceState;
  /// OBJECT
  Map<String, dynamic>? deviceType;
  /// INTEGER
  int? errorCounter;
  /// STRING
  String? errorLastDate;
  /// STRING
  String? id;
  /// OBJECT (required at the API)
  Map<String, dynamic>? initializedBy;
  /// STRING
  String? initializedDate;
  /// OBJECT
  Map<String, dynamic>? injectKey;
  /// BOOLEAN
  bool? isVirtual;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? lastActivityDate;
  /// OBJECT (required at the API)
  Map<String, dynamic>? location;
  /// STRING
  String? modified;
  /// OBJECT (required at the API)
  Map<String, dynamic>? modifiedBy;
  /// STRING
  String? name;
  /// STRING
  String? notes;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? serialNumber;
  /// INTEGER
  int? version;

  Device({
    this.activatedBy,
    this.activationDate,
    this.alternateKey,
    this.auditNextDate,
    this.auditNotificationDate,
    this.client,
    this.created,
    this.createdBy,
    this.deviceBuild,
    this.deviceState,
    this.deviceType,
    this.errorCounter,
    this.errorLastDate,
    this.id,
    this.initializedBy,
    this.initializedDate,
    this.injectKey,
    this.isVirtual,
    this.kif,
    this.lastActivityDate,
    this.location,
    this.modified,
    this.modifiedBy,
    this.name,
    this.notes,
    this.partner,
    this.serialNumber,
    this.version,
  });

  factory Device.fromMap(Map<String, dynamic> m) => Device(
        activatedBy: m['activatedBy'] is Map<String, dynamic> ? m['activatedBy'] : null,
        activationDate: m['activationDate'] is String ? m['activationDate'] : null,
        alternateKey: m['alternateKey'] is String ? m['alternateKey'] : null,
        auditNextDate: m['auditNextDate'] is String ? m['auditNextDate'] : null,
        auditNotificationDate: m['auditNotificationDate'] is String ? m['auditNotificationDate'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        created: m['created'] is String ? m['created'] : null,
        createdBy: m['createdBy'] is Map<String, dynamic> ? m['createdBy'] : null,
        deviceBuild: m['deviceBuild'] is Map<String, dynamic> ? m['deviceBuild'] : null,
        deviceState: m['deviceState'] is Map<String, dynamic> ? m['deviceState'] : null,
        deviceType: m['deviceType'] is Map<String, dynamic> ? m['deviceType'] : null,
        errorCounter: m['errorCounter'] is int ? m['errorCounter'] : null,
        errorLastDate: m['errorLastDate'] is String ? m['errorLastDate'] : null,
        id: m['id'] is String ? m['id'] : null,
        initializedBy: m['initializedBy'] is Map<String, dynamic> ? m['initializedBy'] : null,
        initializedDate: m['initializedDate'] is String ? m['initializedDate'] : null,
        injectKey: m['injectKey'] is Map<String, dynamic> ? m['injectKey'] : null,
        isVirtual: m['isVirtual'] is bool ? m['isVirtual'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        lastActivityDate: m['lastActivityDate'] is String ? m['lastActivityDate'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        modifiedBy: m['modifiedBy'] is Map<String, dynamic> ? m['modifiedBy'] : null,
        name: m['name'] is String ? m['name'] : null,
        notes: m['notes'] is String ? m['notes'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        serialNumber: m['serialNumber'] is String ? m['serialNumber'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != activatedBy) {
      m['activatedBy'] = activatedBy;
    }
    if (null != activationDate) {
      m['activationDate'] = activationDate;
    }
    if (null != alternateKey) {
      m['alternateKey'] = alternateKey;
    }
    if (null != auditNextDate) {
      m['auditNextDate'] = auditNextDate;
    }
    if (null != auditNotificationDate) {
      m['auditNotificationDate'] = auditNotificationDate;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != createdBy) {
      m['createdBy'] = createdBy;
    }
    if (null != deviceBuild) {
      m['deviceBuild'] = deviceBuild;
    }
    if (null != deviceState) {
      m['deviceState'] = deviceState;
    }
    if (null != deviceType) {
      m['deviceType'] = deviceType;
    }
    if (null != errorCounter) {
      m['errorCounter'] = errorCounter;
    }
    if (null != errorLastDate) {
      m['errorLastDate'] = errorLastDate;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != initializedBy) {
      m['initializedBy'] = initializedBy;
    }
    if (null != initializedDate) {
      m['initializedDate'] = initializedDate;
    }
    if (null != injectKey) {
      m['injectKey'] = injectKey;
    }
    if (null != isVirtual) {
      m['isVirtual'] = isVirtual;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != lastActivityDate) {
      m['lastActivityDate'] = lastActivityDate;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != modifiedBy) {
      m['modifiedBy'] = modifiedBy;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != notes) {
      m['notes'] = notes;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != serialNumber) {
      m['serialNumber'] = serialNumber;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class DeviceLoadMatch {
  /// STRING (required at the API)
  String? id;

  DeviceLoadMatch({
    this.id,
  });

  factory DeviceLoadMatch.fromMap(Map<String, dynamic> m) => DeviceLoadMatch(
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

class DeviceListMatch {
  /// OBJECT
  Map<String, dynamic>? activatedBy;
  /// STRING
  String? activationDate;
  /// STRING
  String? alternateKey;
  /// STRING
  String? auditNextDate;
  /// STRING
  String? auditNotificationDate;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? created;
  /// OBJECT
  Map<String, dynamic>? createdBy;
  /// OBJECT
  Map<String, dynamic>? deviceBuild;
  /// OBJECT
  Map<String, dynamic>? deviceState;
  /// OBJECT
  Map<String, dynamic>? deviceType;
  /// INTEGER
  int? errorCounter;
  /// STRING
  String? errorLastDate;
  /// STRING
  String? id;
  /// OBJECT
  Map<String, dynamic>? initializedBy;
  /// STRING
  String? initializedDate;
  /// OBJECT
  Map<String, dynamic>? injectKey;
  /// BOOLEAN
  bool? isVirtual;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? lastActivityDate;
  /// OBJECT
  Map<String, dynamic>? location;
  /// STRING
  String? modified;
  /// OBJECT
  Map<String, dynamic>? modifiedBy;
  /// STRING
  String? name;
  /// STRING
  String? notes;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? serialNumber;
  /// INTEGER
  int? version;

  DeviceListMatch({
    this.activatedBy,
    this.activationDate,
    this.alternateKey,
    this.auditNextDate,
    this.auditNotificationDate,
    this.client,
    this.created,
    this.createdBy,
    this.deviceBuild,
    this.deviceState,
    this.deviceType,
    this.errorCounter,
    this.errorLastDate,
    this.id,
    this.initializedBy,
    this.initializedDate,
    this.injectKey,
    this.isVirtual,
    this.kif,
    this.lastActivityDate,
    this.location,
    this.modified,
    this.modifiedBy,
    this.name,
    this.notes,
    this.partner,
    this.serialNumber,
    this.version,
  });

  factory DeviceListMatch.fromMap(Map<String, dynamic> m) => DeviceListMatch(
        activatedBy: m['activatedBy'] is Map<String, dynamic> ? m['activatedBy'] : null,
        activationDate: m['activationDate'] is String ? m['activationDate'] : null,
        alternateKey: m['alternateKey'] is String ? m['alternateKey'] : null,
        auditNextDate: m['auditNextDate'] is String ? m['auditNextDate'] : null,
        auditNotificationDate: m['auditNotificationDate'] is String ? m['auditNotificationDate'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        created: m['created'] is String ? m['created'] : null,
        createdBy: m['createdBy'] is Map<String, dynamic> ? m['createdBy'] : null,
        deviceBuild: m['deviceBuild'] is Map<String, dynamic> ? m['deviceBuild'] : null,
        deviceState: m['deviceState'] is Map<String, dynamic> ? m['deviceState'] : null,
        deviceType: m['deviceType'] is Map<String, dynamic> ? m['deviceType'] : null,
        errorCounter: m['errorCounter'] is int ? m['errorCounter'] : null,
        errorLastDate: m['errorLastDate'] is String ? m['errorLastDate'] : null,
        id: m['id'] is String ? m['id'] : null,
        initializedBy: m['initializedBy'] is Map<String, dynamic> ? m['initializedBy'] : null,
        initializedDate: m['initializedDate'] is String ? m['initializedDate'] : null,
        injectKey: m['injectKey'] is Map<String, dynamic> ? m['injectKey'] : null,
        isVirtual: m['isVirtual'] is bool ? m['isVirtual'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        lastActivityDate: m['lastActivityDate'] is String ? m['lastActivityDate'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        modifiedBy: m['modifiedBy'] is Map<String, dynamic> ? m['modifiedBy'] : null,
        name: m['name'] is String ? m['name'] : null,
        notes: m['notes'] is String ? m['notes'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        serialNumber: m['serialNumber'] is String ? m['serialNumber'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != activatedBy) {
      m['activatedBy'] = activatedBy;
    }
    if (null != activationDate) {
      m['activationDate'] = activationDate;
    }
    if (null != alternateKey) {
      m['alternateKey'] = alternateKey;
    }
    if (null != auditNextDate) {
      m['auditNextDate'] = auditNextDate;
    }
    if (null != auditNotificationDate) {
      m['auditNotificationDate'] = auditNotificationDate;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != createdBy) {
      m['createdBy'] = createdBy;
    }
    if (null != deviceBuild) {
      m['deviceBuild'] = deviceBuild;
    }
    if (null != deviceState) {
      m['deviceState'] = deviceState;
    }
    if (null != deviceType) {
      m['deviceType'] = deviceType;
    }
    if (null != errorCounter) {
      m['errorCounter'] = errorCounter;
    }
    if (null != errorLastDate) {
      m['errorLastDate'] = errorLastDate;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != initializedBy) {
      m['initializedBy'] = initializedBy;
    }
    if (null != initializedDate) {
      m['initializedDate'] = initializedDate;
    }
    if (null != injectKey) {
      m['injectKey'] = injectKey;
    }
    if (null != isVirtual) {
      m['isVirtual'] = isVirtual;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != lastActivityDate) {
      m['lastActivityDate'] = lastActivityDate;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != modifiedBy) {
      m['modifiedBy'] = modifiedBy;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != notes) {
      m['notes'] = notes;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != serialNumber) {
      m['serialNumber'] = serialNumber;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class DeviceCreateData {
  /// OBJECT (required at the API)
  Map<String, dynamic>? activatedBy;
  /// STRING
  String? activationDate;
  /// STRING
  String? alternateKey;
  /// STRING
  String? auditNextDate;
  /// STRING
  String? auditNotificationDate;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? created;
  /// OBJECT (required at the API)
  Map<String, dynamic>? createdBy;
  /// OBJECT
  Map<String, dynamic>? deviceBuild;
  /// OBJECT
  Map<String, dynamic>? deviceState;
  /// OBJECT
  Map<String, dynamic>? deviceType;
  /// INTEGER
  int? errorCounter;
  /// STRING
  String? errorLastDate;
  /// STRING
  String? id;
  /// OBJECT (required at the API)
  Map<String, dynamic>? initializedBy;
  /// STRING
  String? initializedDate;
  /// OBJECT
  Map<String, dynamic>? injectKey;
  /// BOOLEAN
  bool? isVirtual;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? lastActivityDate;
  /// OBJECT (required at the API)
  Map<String, dynamic>? location;
  /// STRING
  String? modified;
  /// OBJECT (required at the API)
  Map<String, dynamic>? modifiedBy;
  /// STRING
  String? name;
  /// STRING
  String? notes;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? serialNumber;
  /// INTEGER
  int? version;

  DeviceCreateData({
    this.activatedBy,
    this.activationDate,
    this.alternateKey,
    this.auditNextDate,
    this.auditNotificationDate,
    this.client,
    this.created,
    this.createdBy,
    this.deviceBuild,
    this.deviceState,
    this.deviceType,
    this.errorCounter,
    this.errorLastDate,
    this.id,
    this.initializedBy,
    this.initializedDate,
    this.injectKey,
    this.isVirtual,
    this.kif,
    this.lastActivityDate,
    this.location,
    this.modified,
    this.modifiedBy,
    this.name,
    this.notes,
    this.partner,
    this.serialNumber,
    this.version,
  });

  factory DeviceCreateData.fromMap(Map<String, dynamic> m) => DeviceCreateData(
        activatedBy: m['activatedBy'] is Map<String, dynamic> ? m['activatedBy'] : null,
        activationDate: m['activationDate'] is String ? m['activationDate'] : null,
        alternateKey: m['alternateKey'] is String ? m['alternateKey'] : null,
        auditNextDate: m['auditNextDate'] is String ? m['auditNextDate'] : null,
        auditNotificationDate: m['auditNotificationDate'] is String ? m['auditNotificationDate'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        created: m['created'] is String ? m['created'] : null,
        createdBy: m['createdBy'] is Map<String, dynamic> ? m['createdBy'] : null,
        deviceBuild: m['deviceBuild'] is Map<String, dynamic> ? m['deviceBuild'] : null,
        deviceState: m['deviceState'] is Map<String, dynamic> ? m['deviceState'] : null,
        deviceType: m['deviceType'] is Map<String, dynamic> ? m['deviceType'] : null,
        errorCounter: m['errorCounter'] is int ? m['errorCounter'] : null,
        errorLastDate: m['errorLastDate'] is String ? m['errorLastDate'] : null,
        id: m['id'] is String ? m['id'] : null,
        initializedBy: m['initializedBy'] is Map<String, dynamic> ? m['initializedBy'] : null,
        initializedDate: m['initializedDate'] is String ? m['initializedDate'] : null,
        injectKey: m['injectKey'] is Map<String, dynamic> ? m['injectKey'] : null,
        isVirtual: m['isVirtual'] is bool ? m['isVirtual'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        lastActivityDate: m['lastActivityDate'] is String ? m['lastActivityDate'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        modifiedBy: m['modifiedBy'] is Map<String, dynamic> ? m['modifiedBy'] : null,
        name: m['name'] is String ? m['name'] : null,
        notes: m['notes'] is String ? m['notes'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        serialNumber: m['serialNumber'] is String ? m['serialNumber'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != activatedBy) {
      m['activatedBy'] = activatedBy;
    }
    if (null != activationDate) {
      m['activationDate'] = activationDate;
    }
    if (null != alternateKey) {
      m['alternateKey'] = alternateKey;
    }
    if (null != auditNextDate) {
      m['auditNextDate'] = auditNextDate;
    }
    if (null != auditNotificationDate) {
      m['auditNotificationDate'] = auditNotificationDate;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != createdBy) {
      m['createdBy'] = createdBy;
    }
    if (null != deviceBuild) {
      m['deviceBuild'] = deviceBuild;
    }
    if (null != deviceState) {
      m['deviceState'] = deviceState;
    }
    if (null != deviceType) {
      m['deviceType'] = deviceType;
    }
    if (null != errorCounter) {
      m['errorCounter'] = errorCounter;
    }
    if (null != errorLastDate) {
      m['errorLastDate'] = errorLastDate;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != initializedBy) {
      m['initializedBy'] = initializedBy;
    }
    if (null != initializedDate) {
      m['initializedDate'] = initializedDate;
    }
    if (null != injectKey) {
      m['injectKey'] = injectKey;
    }
    if (null != isVirtual) {
      m['isVirtual'] = isVirtual;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != lastActivityDate) {
      m['lastActivityDate'] = lastActivityDate;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != modifiedBy) {
      m['modifiedBy'] = modifiedBy;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != notes) {
      m['notes'] = notes;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != serialNumber) {
      m['serialNumber'] = serialNumber;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class DeviceBuild {
  /// STRING
  String? appVersion;
  /// STRING
  String? buildNumber;
  /// STRING
  String? configFileName;
  /// STRING
  String? created;
  /// STRING
  String? deviceType;
  /// STRING
  String? firmwareVersion;
  /// STRING
  String? hardwareVersion;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? isActive;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// STRING
  String? notes;
  /// INTEGER
  int? version;
  /// STRING
  String? whiteListingBinRanges;
  /// BOOLEAN
  bool? whiteListingUsed;

  DeviceBuild({
    this.appVersion,
    this.buildNumber,
    this.configFileName,
    this.created,
    this.deviceType,
    this.firmwareVersion,
    this.hardwareVersion,
    this.id,
    this.isActive,
    this.modified,
    this.name,
    this.notes,
    this.version,
    this.whiteListingBinRanges,
    this.whiteListingUsed,
  });

  factory DeviceBuild.fromMap(Map<String, dynamic> m) => DeviceBuild(
        appVersion: m['appVersion'] is String ? m['appVersion'] : null,
        buildNumber: m['buildNumber'] is String ? m['buildNumber'] : null,
        configFileName: m['configFileName'] is String ? m['configFileName'] : null,
        created: m['created'] is String ? m['created'] : null,
        deviceType: m['deviceType'] is String ? m['deviceType'] : null,
        firmwareVersion: m['firmwareVersion'] is String ? m['firmwareVersion'] : null,
        hardwareVersion: m['hardwareVersion'] is String ? m['hardwareVersion'] : null,
        id: m['id'] is int ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        notes: m['notes'] is String ? m['notes'] : null,
        version: m['version'] is int ? m['version'] : null,
        whiteListingBinRanges: m['whiteListingBinRanges'] is String ? m['whiteListingBinRanges'] : null,
        whiteListingUsed: m['whiteListingUsed'] is bool ? m['whiteListingUsed'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != appVersion) {
      m['appVersion'] = appVersion;
    }
    if (null != buildNumber) {
      m['buildNumber'] = buildNumber;
    }
    if (null != configFileName) {
      m['configFileName'] = configFileName;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != deviceType) {
      m['deviceType'] = deviceType;
    }
    if (null != firmwareVersion) {
      m['firmwareVersion'] = firmwareVersion;
    }
    if (null != hardwareVersion) {
      m['hardwareVersion'] = hardwareVersion;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != notes) {
      m['notes'] = notes;
    }
    if (null != version) {
      m['version'] = version;
    }
    if (null != whiteListingBinRanges) {
      m['whiteListingBinRanges'] = whiteListingBinRanges;
    }
    if (null != whiteListingUsed) {
      m['whiteListingUsed'] = whiteListingUsed;
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
  String? appVersion;
  /// STRING
  String? buildNumber;
  /// STRING
  String? configFileName;
  /// STRING
  String? created;
  /// STRING
  String? deviceType;
  /// STRING
  String? firmwareVersion;
  /// STRING
  String? hardwareVersion;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? isActive;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// STRING
  String? notes;
  /// INTEGER
  int? version;
  /// STRING
  String? whiteListingBinRanges;
  /// BOOLEAN
  bool? whiteListingUsed;

  DeviceBuildListMatch({
    this.appVersion,
    this.buildNumber,
    this.configFileName,
    this.created,
    this.deviceType,
    this.firmwareVersion,
    this.hardwareVersion,
    this.id,
    this.isActive,
    this.modified,
    this.name,
    this.notes,
    this.version,
    this.whiteListingBinRanges,
    this.whiteListingUsed,
  });

  factory DeviceBuildListMatch.fromMap(Map<String, dynamic> m) => DeviceBuildListMatch(
        appVersion: m['appVersion'] is String ? m['appVersion'] : null,
        buildNumber: m['buildNumber'] is String ? m['buildNumber'] : null,
        configFileName: m['configFileName'] is String ? m['configFileName'] : null,
        created: m['created'] is String ? m['created'] : null,
        deviceType: m['deviceType'] is String ? m['deviceType'] : null,
        firmwareVersion: m['firmwareVersion'] is String ? m['firmwareVersion'] : null,
        hardwareVersion: m['hardwareVersion'] is String ? m['hardwareVersion'] : null,
        id: m['id'] is int ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        notes: m['notes'] is String ? m['notes'] : null,
        version: m['version'] is int ? m['version'] : null,
        whiteListingBinRanges: m['whiteListingBinRanges'] is String ? m['whiteListingBinRanges'] : null,
        whiteListingUsed: m['whiteListingUsed'] is bool ? m['whiteListingUsed'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != appVersion) {
      m['appVersion'] = appVersion;
    }
    if (null != buildNumber) {
      m['buildNumber'] = buildNumber;
    }
    if (null != configFileName) {
      m['configFileName'] = configFileName;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != deviceType) {
      m['deviceType'] = deviceType;
    }
    if (null != firmwareVersion) {
      m['firmwareVersion'] = firmwareVersion;
    }
    if (null != hardwareVersion) {
      m['hardwareVersion'] = hardwareVersion;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != notes) {
      m['notes'] = notes;
    }
    if (null != version) {
      m['version'] = version;
    }
    if (null != whiteListingBinRanges) {
      m['whiteListingBinRanges'] = whiteListingBinRanges;
    }
    if (null != whiteListingUsed) {
      m['whiteListingUsed'] = whiteListingUsed;
    }
    return m;
  }
}

class DeviceCustodyDetail {
  /// STRING
  String? completeDate;
  /// STRING
  String? created;
  /// OBJECT (required at the API)
  Map<String, dynamic>? createdBy;
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
  Map<String, dynamic>? modifiedBy;
  /// STRING
  String? notes;
  /// OBJECT
  Map<String, dynamic>? status;
  /// OBJECT
  Map<String, dynamic>? transferMethod;
  /// INTEGER
  int? version;

  DeviceCustodyDetail({
    this.completeDate,
    this.created,
    this.createdBy,
    this.custodian,
    this.device,
    this.id,
    this.location,
    this.modified,
    this.modifiedBy,
    this.notes,
    this.status,
    this.transferMethod,
    this.version,
  });

  factory DeviceCustodyDetail.fromMap(Map<String, dynamic> m) => DeviceCustodyDetail(
        completeDate: m['completeDate'] is String ? m['completeDate'] : null,
        created: m['created'] is String ? m['created'] : null,
        createdBy: m['createdBy'] is Map<String, dynamic> ? m['createdBy'] : null,
        custodian: m['custodian'] is Map<String, dynamic> ? m['custodian'] : null,
        device: m['device'] is Map<String, dynamic> ? m['device'] : null,
        id: m['id'] is int ? m['id'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        modifiedBy: m['modifiedBy'] is Map<String, dynamic> ? m['modifiedBy'] : null,
        notes: m['notes'] is String ? m['notes'] : null,
        status: m['status'] is Map<String, dynamic> ? m['status'] : null,
        transferMethod: m['transferMethod'] is Map<String, dynamic> ? m['transferMethod'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != completeDate) {
      m['completeDate'] = completeDate;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != createdBy) {
      m['createdBy'] = createdBy;
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
    if (null != modifiedBy) {
      m['modifiedBy'] = modifiedBy;
    }
    if (null != notes) {
      m['notes'] = notes;
    }
    if (null != status) {
      m['status'] = status;
    }
    if (null != transferMethod) {
      m['transferMethod'] = transferMethod;
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
  String? completeDate;
  /// STRING
  String? created;
  /// OBJECT (required at the API)
  Map<String, dynamic>? createdBy;
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
  Map<String, dynamic>? modifiedBy;
  /// STRING
  String? notes;
  /// OBJECT
  Map<String, dynamic>? status;
  /// OBJECT
  Map<String, dynamic>? transferMethod;
  /// INTEGER
  int? version;

  DeviceCustodyList({
    this.completeDate,
    this.created,
    this.createdBy,
    this.custodian,
    this.device,
    this.id,
    this.location,
    this.modified,
    this.modifiedBy,
    this.notes,
    this.status,
    this.transferMethod,
    this.version,
  });

  factory DeviceCustodyList.fromMap(Map<String, dynamic> m) => DeviceCustodyList(
        completeDate: m['completeDate'] is String ? m['completeDate'] : null,
        created: m['created'] is String ? m['created'] : null,
        createdBy: m['createdBy'] is Map<String, dynamic> ? m['createdBy'] : null,
        custodian: m['custodian'] is Map<String, dynamic> ? m['custodian'] : null,
        device: m['device'] is Map<String, dynamic> ? m['device'] : null,
        id: m['id'] is int ? m['id'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        modifiedBy: m['modifiedBy'] is Map<String, dynamic> ? m['modifiedBy'] : null,
        notes: m['notes'] is String ? m['notes'] : null,
        status: m['status'] is Map<String, dynamic> ? m['status'] : null,
        transferMethod: m['transferMethod'] is Map<String, dynamic> ? m['transferMethod'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != completeDate) {
      m['completeDate'] = completeDate;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != createdBy) {
      m['createdBy'] = createdBy;
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
    if (null != modifiedBy) {
      m['modifiedBy'] = modifiedBy;
    }
    if (null != notes) {
      m['notes'] = notes;
    }
    if (null != status) {
      m['status'] = status;
    }
    if (null != transferMethod) {
      m['transferMethod'] = transferMethod;
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
  String? deviceTypeMode;
  /// STRING
  String? hardwareVersion;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? isActive;
  /// STRING
  String? manufacturer;
  /// STRING
  String? model;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// STRING
  String? photoUrl;
  /// STRING
  String? productName;
  /// INTEGER
  int? version;

  DeviceType({
    this.created,
    this.deviceTypeMode,
    this.hardwareVersion,
    this.id,
    this.isActive,
    this.manufacturer,
    this.model,
    this.modified,
    this.name,
    this.photoUrl,
    this.productName,
    this.version,
  });

  factory DeviceType.fromMap(Map<String, dynamic> m) => DeviceType(
        created: m['created'] is String ? m['created'] : null,
        deviceTypeMode: m['deviceTypeMode'] is String ? m['deviceTypeMode'] : null,
        hardwareVersion: m['hardwareVersion'] is String ? m['hardwareVersion'] : null,
        id: m['id'] is String ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        manufacturer: m['manufacturer'] is String ? m['manufacturer'] : null,
        model: m['model'] is String ? m['model'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        photoUrl: m['photoUrl'] is String ? m['photoUrl'] : null,
        productName: m['productName'] is String ? m['productName'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != created) {
      m['created'] = created;
    }
    if (null != deviceTypeMode) {
      m['deviceTypeMode'] = deviceTypeMode;
    }
    if (null != hardwareVersion) {
      m['hardwareVersion'] = hardwareVersion;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
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
    if (null != photoUrl) {
      m['photoUrl'] = photoUrl;
    }
    if (null != productName) {
      m['productName'] = productName;
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
  String? deviceTypeMode;
  /// STRING
  String? hardwareVersion;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? isActive;
  /// STRING
  String? manufacturer;
  /// STRING
  String? model;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// STRING
  String? photoUrl;
  /// STRING
  String? productName;
  /// INTEGER
  int? version;

  DeviceTypeListMatch({
    this.created,
    this.deviceTypeMode,
    this.hardwareVersion,
    this.id,
    this.isActive,
    this.manufacturer,
    this.model,
    this.modified,
    this.name,
    this.photoUrl,
    this.productName,
    this.version,
  });

  factory DeviceTypeListMatch.fromMap(Map<String, dynamic> m) => DeviceTypeListMatch(
        created: m['created'] is String ? m['created'] : null,
        deviceTypeMode: m['deviceTypeMode'] is String ? m['deviceTypeMode'] : null,
        hardwareVersion: m['hardwareVersion'] is String ? m['hardwareVersion'] : null,
        id: m['id'] is String ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        manufacturer: m['manufacturer'] is String ? m['manufacturer'] : null,
        model: m['model'] is String ? m['model'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        photoUrl: m['photoUrl'] is String ? m['photoUrl'] : null,
        productName: m['productName'] is String ? m['productName'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != created) {
      m['created'] = created;
    }
    if (null != deviceTypeMode) {
      m['deviceTypeMode'] = deviceTypeMode;
    }
    if (null != hardwareVersion) {
      m['hardwareVersion'] = hardwareVersion;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
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
    if (null != photoUrl) {
      m['photoUrl'] = photoUrl;
    }
    if (null != productName) {
      m['productName'] = productName;
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
  bool? isActive;
  /// BOOLEAN
  bool? isP2PE;
  /// STRING
  String? keyType;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// INTEGER
  int? version;

  InjectKey({
    this.created,
    this.id,
    this.isActive,
    this.isP2PE,
    this.keyType,
    this.modified,
    this.name,
    this.version,
  });

  factory InjectKey.fromMap(Map<String, dynamic> m) => InjectKey(
        created: m['created'] is String ? m['created'] : null,
        id: m['id'] is String ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        isP2PE: m['isP2PE'] is bool ? m['isP2PE'] : null,
        keyType: m['keyType'] is String ? m['keyType'] : null,
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
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != isP2PE) {
      m['isP2PE'] = isP2PE;
    }
    if (null != keyType) {
      m['keyType'] = keyType;
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
  bool? isActive;
  /// BOOLEAN
  bool? isP2PE;
  /// STRING
  String? keyType;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// INTEGER
  int? version;

  InjectKeyListMatch({
    this.created,
    this.id,
    this.isActive,
    this.isP2PE,
    this.keyType,
    this.modified,
    this.name,
    this.version,
  });

  factory InjectKeyListMatch.fromMap(Map<String, dynamic> m) => InjectKeyListMatch(
        created: m['created'] is String ? m['created'] : null,
        id: m['id'] is String ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        isP2PE: m['isP2PE'] is bool ? m['isP2PE'] : null,
        keyType: m['keyType'] is String ? m['keyType'] : null,
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
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != isP2PE) {
      m['isP2PE'] = isP2PE;
    }
    if (null != keyType) {
      m['keyType'] = keyType;
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
  String? billingId;
  /// STRING
  String? city;
  /// STRING
  String? country;
  /// STRING
  String? created;
  /// STRING
  String? customReference;
  /// STRING
  String? id;
  /// STRING
  String? locationType;
  /// STRING
  String? mailAddress1;
  /// STRING
  String? mailAddress2;
  /// STRING
  String? mailCity;
  /// STRING
  String? mailCountry;
  /// STRING
  String? mailPostalCode;
  /// STRING
  String? mailStateProvince;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// STRING
  String? nameOfBusiness;
  /// STRING
  String? notes;
  /// STRING
  String? postalCode;
  /// STRING
  String? stateProvince;
  /// STRING
  String? uniqueId;
  /// INTEGER
  int? version;

  Location({
    this.address1,
    this.address2,
    this.billingId,
    this.city,
    this.country,
    this.created,
    this.customReference,
    this.id,
    this.locationType,
    this.mailAddress1,
    this.mailAddress2,
    this.mailCity,
    this.mailCountry,
    this.mailPostalCode,
    this.mailStateProvince,
    this.modified,
    this.name,
    this.nameOfBusiness,
    this.notes,
    this.postalCode,
    this.stateProvince,
    this.uniqueId,
    this.version,
  });

  factory Location.fromMap(Map<String, dynamic> m) => Location(
        address1: m['address1'] is String ? m['address1'] : null,
        address2: m['address2'] is String ? m['address2'] : null,
        billingId: m['billingId'] is String ? m['billingId'] : null,
        city: m['city'] is String ? m['city'] : null,
        country: m['country'] is String ? m['country'] : null,
        created: m['created'] is String ? m['created'] : null,
        customReference: m['customReference'] is String ? m['customReference'] : null,
        id: m['id'] is String ? m['id'] : null,
        locationType: m['locationType'] is String ? m['locationType'] : null,
        mailAddress1: m['mailAddress1'] is String ? m['mailAddress1'] : null,
        mailAddress2: m['mailAddress2'] is String ? m['mailAddress2'] : null,
        mailCity: m['mailCity'] is String ? m['mailCity'] : null,
        mailCountry: m['mailCountry'] is String ? m['mailCountry'] : null,
        mailPostalCode: m['mailPostalCode'] is String ? m['mailPostalCode'] : null,
        mailStateProvince: m['mailStateProvince'] is String ? m['mailStateProvince'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        nameOfBusiness: m['nameOfBusiness'] is String ? m['nameOfBusiness'] : null,
        notes: m['notes'] is String ? m['notes'] : null,
        postalCode: m['postalCode'] is String ? m['postalCode'] : null,
        stateProvince: m['stateProvince'] is String ? m['stateProvince'] : null,
        uniqueId: m['uniqueId'] is String ? m['uniqueId'] : null,
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
    if (null != billingId) {
      m['billingId'] = billingId;
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
    if (null != customReference) {
      m['customReference'] = customReference;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != locationType) {
      m['locationType'] = locationType;
    }
    if (null != mailAddress1) {
      m['mailAddress1'] = mailAddress1;
    }
    if (null != mailAddress2) {
      m['mailAddress2'] = mailAddress2;
    }
    if (null != mailCity) {
      m['mailCity'] = mailCity;
    }
    if (null != mailCountry) {
      m['mailCountry'] = mailCountry;
    }
    if (null != mailPostalCode) {
      m['mailPostalCode'] = mailPostalCode;
    }
    if (null != mailStateProvince) {
      m['mailStateProvince'] = mailStateProvince;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != nameOfBusiness) {
      m['nameOfBusiness'] = nameOfBusiness;
    }
    if (null != notes) {
      m['notes'] = notes;
    }
    if (null != postalCode) {
      m['postalCode'] = postalCode;
    }
    if (null != stateProvince) {
      m['stateProvince'] = stateProvince;
    }
    if (null != uniqueId) {
      m['uniqueId'] = uniqueId;
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
  String? billingId;
  /// STRING
  String? city;
  /// STRING
  String? country;
  /// STRING
  String? created;
  /// STRING
  String? customReference;
  /// STRING
  String? id;
  /// STRING
  String? locationType;
  /// STRING
  String? mailAddress1;
  /// STRING
  String? mailAddress2;
  /// STRING
  String? mailCity;
  /// STRING
  String? mailCountry;
  /// STRING
  String? mailPostalCode;
  /// STRING
  String? mailStateProvince;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// STRING
  String? nameOfBusiness;
  /// STRING
  String? notes;
  /// STRING
  String? postalCode;
  /// STRING
  String? stateProvince;
  /// STRING
  String? uniqueId;
  /// INTEGER
  int? version;

  LocationListMatch({
    this.address1,
    this.address2,
    this.billingId,
    this.city,
    this.country,
    this.created,
    this.customReference,
    this.id,
    this.locationType,
    this.mailAddress1,
    this.mailAddress2,
    this.mailCity,
    this.mailCountry,
    this.mailPostalCode,
    this.mailStateProvince,
    this.modified,
    this.name,
    this.nameOfBusiness,
    this.notes,
    this.postalCode,
    this.stateProvince,
    this.uniqueId,
    this.version,
  });

  factory LocationListMatch.fromMap(Map<String, dynamic> m) => LocationListMatch(
        address1: m['address1'] is String ? m['address1'] : null,
        address2: m['address2'] is String ? m['address2'] : null,
        billingId: m['billingId'] is String ? m['billingId'] : null,
        city: m['city'] is String ? m['city'] : null,
        country: m['country'] is String ? m['country'] : null,
        created: m['created'] is String ? m['created'] : null,
        customReference: m['customReference'] is String ? m['customReference'] : null,
        id: m['id'] is String ? m['id'] : null,
        locationType: m['locationType'] is String ? m['locationType'] : null,
        mailAddress1: m['mailAddress1'] is String ? m['mailAddress1'] : null,
        mailAddress2: m['mailAddress2'] is String ? m['mailAddress2'] : null,
        mailCity: m['mailCity'] is String ? m['mailCity'] : null,
        mailCountry: m['mailCountry'] is String ? m['mailCountry'] : null,
        mailPostalCode: m['mailPostalCode'] is String ? m['mailPostalCode'] : null,
        mailStateProvince: m['mailStateProvince'] is String ? m['mailStateProvince'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        nameOfBusiness: m['nameOfBusiness'] is String ? m['nameOfBusiness'] : null,
        notes: m['notes'] is String ? m['notes'] : null,
        postalCode: m['postalCode'] is String ? m['postalCode'] : null,
        stateProvince: m['stateProvince'] is String ? m['stateProvince'] : null,
        uniqueId: m['uniqueId'] is String ? m['uniqueId'] : null,
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
    if (null != billingId) {
      m['billingId'] = billingId;
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
    if (null != customReference) {
      m['customReference'] = customReference;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != locationType) {
      m['locationType'] = locationType;
    }
    if (null != mailAddress1) {
      m['mailAddress1'] = mailAddress1;
    }
    if (null != mailAddress2) {
      m['mailAddress2'] = mailAddress2;
    }
    if (null != mailCity) {
      m['mailCity'] = mailCity;
    }
    if (null != mailCountry) {
      m['mailCountry'] = mailCountry;
    }
    if (null != mailPostalCode) {
      m['mailPostalCode'] = mailPostalCode;
    }
    if (null != mailStateProvince) {
      m['mailStateProvince'] = mailStateProvince;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != nameOfBusiness) {
      m['nameOfBusiness'] = nameOfBusiness;
    }
    if (null != notes) {
      m['notes'] = notes;
    }
    if (null != postalCode) {
      m['postalCode'] = postalCode;
    }
    if (null != stateProvince) {
      m['stateProvince'] = stateProvince;
    }
    if (null != uniqueId) {
      m['uniqueId'] = uniqueId;
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
  String? billingId;
  /// STRING
  String? city;
  /// STRING
  String? country;
  /// STRING
  String? created;
  /// STRING
  String? customReference;
  /// STRING
  String? id;
  /// STRING
  String? locationType;
  /// STRING
  String? mailAddress1;
  /// STRING
  String? mailAddress2;
  /// STRING
  String? mailCity;
  /// STRING
  String? mailCountry;
  /// STRING
  String? mailPostalCode;
  /// STRING
  String? mailStateProvince;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// STRING
  String? nameOfBusiness;
  /// STRING
  String? notes;
  /// STRING
  String? postalCode;
  /// STRING
  String? stateProvince;
  /// STRING
  String? uniqueId;
  /// INTEGER
  int? version;

  LocationCreateData({
    this.address1,
    this.address2,
    this.billingId,
    this.city,
    this.country,
    this.created,
    this.customReference,
    this.id,
    this.locationType,
    this.mailAddress1,
    this.mailAddress2,
    this.mailCity,
    this.mailCountry,
    this.mailPostalCode,
    this.mailStateProvince,
    this.modified,
    this.name,
    this.nameOfBusiness,
    this.notes,
    this.postalCode,
    this.stateProvince,
    this.uniqueId,
    this.version,
  });

  factory LocationCreateData.fromMap(Map<String, dynamic> m) => LocationCreateData(
        address1: m['address1'] is String ? m['address1'] : null,
        address2: m['address2'] is String ? m['address2'] : null,
        billingId: m['billingId'] is String ? m['billingId'] : null,
        city: m['city'] is String ? m['city'] : null,
        country: m['country'] is String ? m['country'] : null,
        created: m['created'] is String ? m['created'] : null,
        customReference: m['customReference'] is String ? m['customReference'] : null,
        id: m['id'] is String ? m['id'] : null,
        locationType: m['locationType'] is String ? m['locationType'] : null,
        mailAddress1: m['mailAddress1'] is String ? m['mailAddress1'] : null,
        mailAddress2: m['mailAddress2'] is String ? m['mailAddress2'] : null,
        mailCity: m['mailCity'] is String ? m['mailCity'] : null,
        mailCountry: m['mailCountry'] is String ? m['mailCountry'] : null,
        mailPostalCode: m['mailPostalCode'] is String ? m['mailPostalCode'] : null,
        mailStateProvince: m['mailStateProvince'] is String ? m['mailStateProvince'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        nameOfBusiness: m['nameOfBusiness'] is String ? m['nameOfBusiness'] : null,
        notes: m['notes'] is String ? m['notes'] : null,
        postalCode: m['postalCode'] is String ? m['postalCode'] : null,
        stateProvince: m['stateProvince'] is String ? m['stateProvince'] : null,
        uniqueId: m['uniqueId'] is String ? m['uniqueId'] : null,
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
    if (null != billingId) {
      m['billingId'] = billingId;
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
    if (null != customReference) {
      m['customReference'] = customReference;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != locationType) {
      m['locationType'] = locationType;
    }
    if (null != mailAddress1) {
      m['mailAddress1'] = mailAddress1;
    }
    if (null != mailAddress2) {
      m['mailAddress2'] = mailAddress2;
    }
    if (null != mailCity) {
      m['mailCity'] = mailCity;
    }
    if (null != mailCountry) {
      m['mailCountry'] = mailCountry;
    }
    if (null != mailPostalCode) {
      m['mailPostalCode'] = mailPostalCode;
    }
    if (null != mailStateProvince) {
      m['mailStateProvince'] = mailStateProvince;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != nameOfBusiness) {
      m['nameOfBusiness'] = nameOfBusiness;
    }
    if (null != notes) {
      m['notes'] = notes;
    }
    if (null != postalCode) {
      m['postalCode'] = postalCode;
    }
    if (null != stateProvince) {
      m['stateProvince'] = stateProvince;
    }
    if (null != uniqueId) {
      m['uniqueId'] = uniqueId;
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
  String? billingId;
  /// BOOLEAN
  bool? clientCanOrderEquipment;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? isActive;
  /// OBJECT (required at the API)
  Map<String, dynamic>? location;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? parent;
  /// STRING
  String? partnerId;
  /// STRING
  String? reference;
  /// STRING
  String? verificationPhrase;
  /// INTEGER
  int? version;

  Partner({
    this.billingId,
    this.clientCanOrderEquipment,
    this.contact,
    this.created,
    this.id,
    this.isActive,
    this.location,
    this.modified,
    this.name,
    this.parent,
    this.partnerId,
    this.reference,
    this.verificationPhrase,
    this.version,
  });

  factory Partner.fromMap(Map<String, dynamic> m) => Partner(
        billingId: m['billingId'] is String ? m['billingId'] : null,
        clientCanOrderEquipment: m['clientCanOrderEquipment'] is bool ? m['clientCanOrderEquipment'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        id: m['id'] is String ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        partnerId: m['partnerId'] is String ? m['partnerId'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        verificationPhrase: m['verificationPhrase'] is String ? m['verificationPhrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billingId) {
      m['billingId'] = billingId;
    }
    if (null != clientCanOrderEquipment) {
      m['clientCanOrderEquipment'] = clientCanOrderEquipment;
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
    if (null != isActive) {
      m['isActive'] = isActive;
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
    if (null != partnerId) {
      m['partnerId'] = partnerId;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != verificationPhrase) {
      m['verificationPhrase'] = verificationPhrase;
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
  String? billingId;
  /// BOOLEAN
  bool? clientCanOrderEquipment;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? isActive;
  /// OBJECT
  Map<String, dynamic>? location;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? parent;
  /// STRING
  String? partnerId;
  /// STRING
  String? reference;
  /// STRING
  String? verificationPhrase;
  /// INTEGER
  int? version;

  PartnerListMatch({
    this.billingId,
    this.clientCanOrderEquipment,
    this.contact,
    this.created,
    this.id,
    this.isActive,
    this.location,
    this.modified,
    this.name,
    this.parent,
    this.partnerId,
    this.reference,
    this.verificationPhrase,
    this.version,
  });

  factory PartnerListMatch.fromMap(Map<String, dynamic> m) => PartnerListMatch(
        billingId: m['billingId'] is String ? m['billingId'] : null,
        clientCanOrderEquipment: m['clientCanOrderEquipment'] is bool ? m['clientCanOrderEquipment'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        id: m['id'] is String ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        partnerId: m['partnerId'] is String ? m['partnerId'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        verificationPhrase: m['verificationPhrase'] is String ? m['verificationPhrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billingId) {
      m['billingId'] = billingId;
    }
    if (null != clientCanOrderEquipment) {
      m['clientCanOrderEquipment'] = clientCanOrderEquipment;
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
    if (null != isActive) {
      m['isActive'] = isActive;
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
    if (null != partnerId) {
      m['partnerId'] = partnerId;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != verificationPhrase) {
      m['verificationPhrase'] = verificationPhrase;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class PartnerCreateData {
  /// STRING
  String? billingId;
  /// BOOLEAN
  bool? clientCanOrderEquipment;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? isActive;
  /// OBJECT (required at the API)
  Map<String, dynamic>? location;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? parent;
  /// STRING
  String? partnerId;
  /// STRING
  String? reference;
  /// STRING
  String? verificationPhrase;
  /// INTEGER
  int? version;

  PartnerCreateData({
    this.billingId,
    this.clientCanOrderEquipment,
    this.contact,
    this.created,
    this.id,
    this.isActive,
    this.location,
    this.modified,
    this.name,
    this.parent,
    this.partnerId,
    this.reference,
    this.verificationPhrase,
    this.version,
  });

  factory PartnerCreateData.fromMap(Map<String, dynamic> m) => PartnerCreateData(
        billingId: m['billingId'] is String ? m['billingId'] : null,
        clientCanOrderEquipment: m['clientCanOrderEquipment'] is bool ? m['clientCanOrderEquipment'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        id: m['id'] is String ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        partnerId: m['partnerId'] is String ? m['partnerId'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        verificationPhrase: m['verificationPhrase'] is String ? m['verificationPhrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billingId) {
      m['billingId'] = billingId;
    }
    if (null != clientCanOrderEquipment) {
      m['clientCanOrderEquipment'] = clientCanOrderEquipment;
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
    if (null != isActive) {
      m['isActive'] = isActive;
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
    if (null != partnerId) {
      m['partnerId'] = partnerId;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != verificationPhrase) {
      m['verificationPhrase'] = verificationPhrase;
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
  String? dateReceived;
  /// STRING
  String? dateShipped;
  /// OBJECT
  Map<String, dynamic>? dcKif;
  /// STRING
  String? id;
  /// ARRAY
  List<dynamic>? items;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? modified;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? shipmentType;
  /// STRING
  String? tracking;
  /// INTEGER
  int? version;

  Shipment({
    this.carrier,
    this.client,
    this.created,
    this.dateReceived,
    this.dateShipped,
    this.dcKif,
    this.id,
    this.items,
    this.kif,
    this.modified,
    this.partner,
    this.shipmentType,
    this.tracking,
    this.version,
  });

  factory Shipment.fromMap(Map<String, dynamic> m) => Shipment(
        carrier: m['carrier'] is String ? m['carrier'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        created: m['created'] is String ? m['created'] : null,
        dateReceived: m['dateReceived'] is String ? m['dateReceived'] : null,
        dateShipped: m['dateShipped'] is String ? m['dateShipped'] : null,
        dcKif: m['dcKif'] is Map<String, dynamic> ? m['dcKif'] : null,
        id: m['id'] is String ? m['id'] : null,
        items: m['items'] is List<dynamic> ? m['items'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        shipmentType: m['shipmentType'] is String ? m['shipmentType'] : null,
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
    if (null != dateReceived) {
      m['dateReceived'] = dateReceived;
    }
    if (null != dateShipped) {
      m['dateShipped'] = dateShipped;
    }
    if (null != dcKif) {
      m['dcKif'] = dcKif;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != items) {
      m['items'] = items;
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
    if (null != shipmentType) {
      m['shipmentType'] = shipmentType;
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
  String? dateReceived;
  /// STRING
  String? dateShipped;
  /// OBJECT
  Map<String, dynamic>? dcKif;
  /// STRING
  String? id;
  /// ARRAY
  List<dynamic>? items;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? modified;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? shipmentType;
  /// STRING
  String? tracking;
  /// INTEGER
  int? version;

  ShipmentListMatch({
    this.carrier,
    this.client,
    this.created,
    this.dateReceived,
    this.dateShipped,
    this.dcKif,
    this.id,
    this.items,
    this.kif,
    this.modified,
    this.partner,
    this.shipmentType,
    this.tracking,
    this.version,
  });

  factory ShipmentListMatch.fromMap(Map<String, dynamic> m) => ShipmentListMatch(
        carrier: m['carrier'] is String ? m['carrier'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        created: m['created'] is String ? m['created'] : null,
        dateReceived: m['dateReceived'] is String ? m['dateReceived'] : null,
        dateShipped: m['dateShipped'] is String ? m['dateShipped'] : null,
        dcKif: m['dcKif'] is Map<String, dynamic> ? m['dcKif'] : null,
        id: m['id'] is String ? m['id'] : null,
        items: m['items'] is List<dynamic> ? m['items'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        shipmentType: m['shipmentType'] is String ? m['shipmentType'] : null,
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
    if (null != dateReceived) {
      m['dateReceived'] = dateReceived;
    }
    if (null != dateShipped) {
      m['dateShipped'] = dateShipped;
    }
    if (null != dcKif) {
      m['dcKif'] = dcKif;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != items) {
      m['items'] = items;
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
    if (null != shipmentType) {
      m['shipmentType'] = shipmentType;
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
  String? dateReceived;
  /// STRING
  String? dateShipped;
  /// OBJECT
  Map<String, dynamic>? dcKif;
  /// STRING
  String? id;
  /// ARRAY
  List<dynamic>? items;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? modified;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? shipmentType;
  /// STRING
  String? tracking;
  /// INTEGER
  int? version;

  ShipmentCreateData({
    this.carrier,
    this.client,
    this.created,
    this.dateReceived,
    this.dateShipped,
    this.dcKif,
    this.id,
    this.items,
    this.kif,
    this.modified,
    this.partner,
    this.shipmentType,
    this.tracking,
    this.version,
  });

  factory ShipmentCreateData.fromMap(Map<String, dynamic> m) => ShipmentCreateData(
        carrier: m['carrier'] is String ? m['carrier'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        created: m['created'] is String ? m['created'] : null,
        dateReceived: m['dateReceived'] is String ? m['dateReceived'] : null,
        dateShipped: m['dateShipped'] is String ? m['dateShipped'] : null,
        dcKif: m['dcKif'] is Map<String, dynamic> ? m['dcKif'] : null,
        id: m['id'] is String ? m['id'] : null,
        items: m['items'] is List<dynamic> ? m['items'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        shipmentType: m['shipmentType'] is String ? m['shipmentType'] : null,
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
    if (null != dateReceived) {
      m['dateReceived'] = dateReceived;
    }
    if (null != dateShipped) {
      m['dateShipped'] = dateShipped;
    }
    if (null != dcKif) {
      m['dcKif'] = dcKif;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != items) {
      m['items'] = items;
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
    if (null != shipmentType) {
      m['shipmentType'] = shipmentType;
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
  /// BOOLEAN
  bool? success;

  SuccessCreateData({
    this.share_partner_to,
    this.success,
  });

  factory SuccessCreateData.fromMap(Map<String, dynamic> m) => SuccessCreateData(
        share_partner_to: m['share_partner_to'] is String ? m['share_partner_to'] : null,
        success: m['success'] is bool ? m['success'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != share_partner_to) {
      m['share_partner_to'] = share_partner_to;
    }
    if (null != success) {
      m['success'] = success;
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
  String? alternateKey;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? clientRef;
  /// STRING
  String? created;
  /// INTEGER
  int? decrypted;
  /// STRING
  String? deviceName;
  /// OBJECT
  Map<String, dynamic>? directPartner;
  /// INTEGER
  int? encrypted;
  /// STRING
  String? endDate;
  /// STRING
  String? errCode;
  /// STRING
  String? errMessage;
  /// STRING
  String? id;
  /// STRING
  String? ipAddress;
  /// BOOLEAN
  bool? isVirtual;
  /// STRING
  String? keyType;
  /// OBJECT (required at the API)
  Map<String, dynamic>? location;
  /// STRING
  String? messageId;
  /// STRING
  String? method;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? reference;
  /// STRING
  String? serialNumber;
  /// STRING
  String? startDate;
  /// BOOLEAN
  bool? success;
  /// STRING
  String? transactionSource;

  Transaction({
    this.alternateKey,
    this.client,
    this.clientRef,
    this.created,
    this.decrypted,
    this.deviceName,
    this.directPartner,
    this.encrypted,
    this.endDate,
    this.errCode,
    this.errMessage,
    this.id,
    this.ipAddress,
    this.isVirtual,
    this.keyType,
    this.location,
    this.messageId,
    this.method,
    this.partner,
    this.reference,
    this.serialNumber,
    this.startDate,
    this.success,
    this.transactionSource,
  });

  factory Transaction.fromMap(Map<String, dynamic> m) => Transaction(
        alternateKey: m['alternateKey'] is String ? m['alternateKey'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        clientRef: m['clientRef'] is String ? m['clientRef'] : null,
        created: m['created'] is String ? m['created'] : null,
        decrypted: m['decrypted'] is int ? m['decrypted'] : null,
        deviceName: m['deviceName'] is String ? m['deviceName'] : null,
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        encrypted: m['encrypted'] is int ? m['encrypted'] : null,
        endDate: m['endDate'] is String ? m['endDate'] : null,
        errCode: m['errCode'] is String ? m['errCode'] : null,
        errMessage: m['errMessage'] is String ? m['errMessage'] : null,
        id: m['id'] is String ? m['id'] : null,
        ipAddress: m['ipAddress'] is String ? m['ipAddress'] : null,
        isVirtual: m['isVirtual'] is bool ? m['isVirtual'] : null,
        keyType: m['keyType'] is String ? m['keyType'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        messageId: m['messageId'] is String ? m['messageId'] : null,
        method: m['method'] is String ? m['method'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        serialNumber: m['serialNumber'] is String ? m['serialNumber'] : null,
        startDate: m['startDate'] is String ? m['startDate'] : null,
        success: m['success'] is bool ? m['success'] : null,
        transactionSource: m['transactionSource'] is String ? m['transactionSource'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != alternateKey) {
      m['alternateKey'] = alternateKey;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != clientRef) {
      m['clientRef'] = clientRef;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != decrypted) {
      m['decrypted'] = decrypted;
    }
    if (null != deviceName) {
      m['deviceName'] = deviceName;
    }
    if (null != directPartner) {
      m['directPartner'] = directPartner;
    }
    if (null != encrypted) {
      m['encrypted'] = encrypted;
    }
    if (null != endDate) {
      m['endDate'] = endDate;
    }
    if (null != errCode) {
      m['errCode'] = errCode;
    }
    if (null != errMessage) {
      m['errMessage'] = errMessage;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != ipAddress) {
      m['ipAddress'] = ipAddress;
    }
    if (null != isVirtual) {
      m['isVirtual'] = isVirtual;
    }
    if (null != keyType) {
      m['keyType'] = keyType;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != messageId) {
      m['messageId'] = messageId;
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
    if (null != serialNumber) {
      m['serialNumber'] = serialNumber;
    }
    if (null != startDate) {
      m['startDate'] = startDate;
    }
    if (null != success) {
      m['success'] = success;
    }
    if (null != transactionSource) {
      m['transactionSource'] = transactionSource;
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
  String? alternateKey;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? clientRef;
  /// STRING
  String? created;
  /// INTEGER
  int? decrypted;
  /// STRING
  String? deviceName;
  /// OBJECT
  Map<String, dynamic>? directPartner;
  /// INTEGER
  int? encrypted;
  /// STRING
  String? endDate;
  /// STRING
  String? errCode;
  /// STRING
  String? errMessage;
  /// STRING
  String? id;
  /// STRING
  String? ipAddress;
  /// BOOLEAN
  bool? isVirtual;
  /// STRING
  String? keyType;
  /// OBJECT
  Map<String, dynamic>? location;
  /// STRING
  String? messageId;
  /// STRING
  String? method;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? reference;
  /// STRING
  String? serialNumber;
  /// STRING
  String? startDate;
  /// BOOLEAN
  bool? success;
  /// STRING
  String? transactionSource;

  TransactionListMatch({
    this.alternateKey,
    this.client,
    this.clientRef,
    this.created,
    this.decrypted,
    this.deviceName,
    this.directPartner,
    this.encrypted,
    this.endDate,
    this.errCode,
    this.errMessage,
    this.id,
    this.ipAddress,
    this.isVirtual,
    this.keyType,
    this.location,
    this.messageId,
    this.method,
    this.partner,
    this.reference,
    this.serialNumber,
    this.startDate,
    this.success,
    this.transactionSource,
  });

  factory TransactionListMatch.fromMap(Map<String, dynamic> m) => TransactionListMatch(
        alternateKey: m['alternateKey'] is String ? m['alternateKey'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        clientRef: m['clientRef'] is String ? m['clientRef'] : null,
        created: m['created'] is String ? m['created'] : null,
        decrypted: m['decrypted'] is int ? m['decrypted'] : null,
        deviceName: m['deviceName'] is String ? m['deviceName'] : null,
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        encrypted: m['encrypted'] is int ? m['encrypted'] : null,
        endDate: m['endDate'] is String ? m['endDate'] : null,
        errCode: m['errCode'] is String ? m['errCode'] : null,
        errMessage: m['errMessage'] is String ? m['errMessage'] : null,
        id: m['id'] is String ? m['id'] : null,
        ipAddress: m['ipAddress'] is String ? m['ipAddress'] : null,
        isVirtual: m['isVirtual'] is bool ? m['isVirtual'] : null,
        keyType: m['keyType'] is String ? m['keyType'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        messageId: m['messageId'] is String ? m['messageId'] : null,
        method: m['method'] is String ? m['method'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        serialNumber: m['serialNumber'] is String ? m['serialNumber'] : null,
        startDate: m['startDate'] is String ? m['startDate'] : null,
        success: m['success'] is bool ? m['success'] : null,
        transactionSource: m['transactionSource'] is String ? m['transactionSource'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != alternateKey) {
      m['alternateKey'] = alternateKey;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != clientRef) {
      m['clientRef'] = clientRef;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != decrypted) {
      m['decrypted'] = decrypted;
    }
    if (null != deviceName) {
      m['deviceName'] = deviceName;
    }
    if (null != directPartner) {
      m['directPartner'] = directPartner;
    }
    if (null != encrypted) {
      m['encrypted'] = encrypted;
    }
    if (null != endDate) {
      m['endDate'] = endDate;
    }
    if (null != errCode) {
      m['errCode'] = errCode;
    }
    if (null != errMessage) {
      m['errMessage'] = errMessage;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != ipAddress) {
      m['ipAddress'] = ipAddress;
    }
    if (null != isVirtual) {
      m['isVirtual'] = isVirtual;
    }
    if (null != keyType) {
      m['keyType'] = keyType;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != messageId) {
      m['messageId'] = messageId;
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
    if (null != serialNumber) {
      m['serialNumber'] = serialNumber;
    }
    if (null != startDate) {
      m['startDate'] = startDate;
    }
    if (null != success) {
      m['success'] = success;
    }
    if (null != transactionSource) {
      m['transactionSource'] = transactionSource;
    }
    return m;
  }
}

class TransactionCreateData {
  /// STRING
  String? alternateKey;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? clientRef;
  /// STRING
  String? created;
  /// INTEGER
  int? decrypted;
  /// STRING
  String? deviceName;
  /// OBJECT
  Map<String, dynamic>? directPartner;
  /// INTEGER
  int? encrypted;
  /// STRING
  String? endDate;
  /// STRING
  String? errCode;
  /// STRING
  String? errMessage;
  /// STRING
  String? id;
  /// STRING
  String? ipAddress;
  /// BOOLEAN
  bool? isVirtual;
  /// STRING
  String? keyType;
  /// OBJECT (required at the API)
  Map<String, dynamic>? location;
  /// STRING
  String? messageId;
  /// STRING
  String? method;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? reference;
  /// STRING
  String? serialNumber;
  /// STRING
  String? startDate;
  /// BOOLEAN
  bool? success;
  /// STRING
  String? transactionSource;

  TransactionCreateData({
    this.alternateKey,
    this.client,
    this.clientRef,
    this.created,
    this.decrypted,
    this.deviceName,
    this.directPartner,
    this.encrypted,
    this.endDate,
    this.errCode,
    this.errMessage,
    this.id,
    this.ipAddress,
    this.isVirtual,
    this.keyType,
    this.location,
    this.messageId,
    this.method,
    this.partner,
    this.reference,
    this.serialNumber,
    this.startDate,
    this.success,
    this.transactionSource,
  });

  factory TransactionCreateData.fromMap(Map<String, dynamic> m) => TransactionCreateData(
        alternateKey: m['alternateKey'] is String ? m['alternateKey'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        clientRef: m['clientRef'] is String ? m['clientRef'] : null,
        created: m['created'] is String ? m['created'] : null,
        decrypted: m['decrypted'] is int ? m['decrypted'] : null,
        deviceName: m['deviceName'] is String ? m['deviceName'] : null,
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        encrypted: m['encrypted'] is int ? m['encrypted'] : null,
        endDate: m['endDate'] is String ? m['endDate'] : null,
        errCode: m['errCode'] is String ? m['errCode'] : null,
        errMessage: m['errMessage'] is String ? m['errMessage'] : null,
        id: m['id'] is String ? m['id'] : null,
        ipAddress: m['ipAddress'] is String ? m['ipAddress'] : null,
        isVirtual: m['isVirtual'] is bool ? m['isVirtual'] : null,
        keyType: m['keyType'] is String ? m['keyType'] : null,
        location: m['location'] is Map<String, dynamic> ? m['location'] : null,
        messageId: m['messageId'] is String ? m['messageId'] : null,
        method: m['method'] is String ? m['method'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        serialNumber: m['serialNumber'] is String ? m['serialNumber'] : null,
        startDate: m['startDate'] is String ? m['startDate'] : null,
        success: m['success'] is bool ? m['success'] : null,
        transactionSource: m['transactionSource'] is String ? m['transactionSource'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != alternateKey) {
      m['alternateKey'] = alternateKey;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != clientRef) {
      m['clientRef'] = clientRef;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != decrypted) {
      m['decrypted'] = decrypted;
    }
    if (null != deviceName) {
      m['deviceName'] = deviceName;
    }
    if (null != directPartner) {
      m['directPartner'] = directPartner;
    }
    if (null != encrypted) {
      m['encrypted'] = encrypted;
    }
    if (null != endDate) {
      m['endDate'] = endDate;
    }
    if (null != errCode) {
      m['errCode'] = errCode;
    }
    if (null != errMessage) {
      m['errMessage'] = errMessage;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != ipAddress) {
      m['ipAddress'] = ipAddress;
    }
    if (null != isVirtual) {
      m['isVirtual'] = isVirtual;
    }
    if (null != keyType) {
      m['keyType'] = keyType;
    }
    if (null != location) {
      m['location'] = location;
    }
    if (null != messageId) {
      m['messageId'] = messageId;
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
    if (null != serialNumber) {
      m['serialNumber'] = serialNumber;
    }
    if (null != startDate) {
      m['startDate'] = startDate;
    }
    if (null != success) {
      m['success'] = success;
    }
    if (null != transactionSource) {
      m['transactionSource'] = transactionSource;
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
  String? firstName;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? isActive;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? lastName;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? phone;
  /// STRING
  String? userName;
  /// OBJECT
  Map<String, dynamic>? userRole;
  /// INTEGER
  int? version;

  UpdateResult({
    this.client,
    this.email,
    this.firstName,
    this.id,
    this.isActive,
    this.kif,
    this.lastName,
    this.partner,
    this.phone,
    this.userName,
    this.userRole,
    this.version,
  });

  factory UpdateResult.fromMap(Map<String, dynamic> m) => UpdateResult(
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        email: m['email'] is String ? m['email'] : null,
        firstName: m['firstName'] is String ? m['firstName'] : null,
        id: m['id'] is String ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        lastName: m['lastName'] is String ? m['lastName'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        userName: m['userName'] is String ? m['userName'] : null,
        userRole: m['userRole'] is Map<String, dynamic> ? m['userRole'] : null,
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
    if (null != firstName) {
      m['firstName'] = firstName;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != lastName) {
      m['lastName'] = lastName;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != phone) {
      m['phone'] = phone;
    }
    if (null != userName) {
      m['userName'] = userName;
    }
    if (null != userRole) {
      m['userRole'] = userRole;
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
  String? firstName;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? isActive;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? lastName;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? phone;
  /// STRING
  String? userName;
  /// OBJECT
  Map<String, dynamic>? userRole;
  /// INTEGER
  int? version;

  UpdateResultListMatch({
    this.client,
    this.email,
    this.firstName,
    this.id,
    this.isActive,
    this.kif,
    this.lastName,
    this.partner,
    this.phone,
    this.userName,
    this.userRole,
    this.version,
  });

  factory UpdateResultListMatch.fromMap(Map<String, dynamic> m) => UpdateResultListMatch(
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        email: m['email'] is String ? m['email'] : null,
        firstName: m['firstName'] is String ? m['firstName'] : null,
        id: m['id'] is String ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        lastName: m['lastName'] is String ? m['lastName'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        userName: m['userName'] is String ? m['userName'] : null,
        userRole: m['userRole'] is Map<String, dynamic> ? m['userRole'] : null,
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
    if (null != firstName) {
      m['firstName'] = firstName;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != lastName) {
      m['lastName'] = lastName;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != phone) {
      m['phone'] = phone;
    }
    if (null != userName) {
      m['userName'] = userName;
    }
    if (null != userRole) {
      m['userRole'] = userRole;
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
  String? firstName;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? isActive;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? lastName;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? phone;
  /// STRING
  String? userName;
  /// OBJECT
  Map<String, dynamic>? userRole;
  /// INTEGER
  int? version;

  UpdateResultCreateData({
    this.client,
    this.email,
    this.firstName,
    this.id,
    this.isActive,
    this.kif,
    this.lastName,
    this.partner,
    this.phone,
    this.userName,
    this.userRole,
    this.version,
  });

  factory UpdateResultCreateData.fromMap(Map<String, dynamic> m) => UpdateResultCreateData(
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        email: m['email'] is String ? m['email'] : null,
        firstName: m['firstName'] is String ? m['firstName'] : null,
        id: m['id'] is String ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        lastName: m['lastName'] is String ? m['lastName'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        userName: m['userName'] is String ? m['userName'] : null,
        userRole: m['userRole'] is Map<String, dynamic> ? m['userRole'] : null,
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
    if (null != firstName) {
      m['firstName'] = firstName;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != lastName) {
      m['lastName'] = lastName;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != phone) {
      m['phone'] = phone;
    }
    if (null != userName) {
      m['userName'] = userName;
    }
    if (null != userRole) {
      m['userRole'] = userRole;
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
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? email;
  /// STRING
  String? firstName;
  /// BOOLEAN
  bool? isActive;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? lastName;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? phone;
  /// STRING
  String? userName;
  /// OBJECT
  Map<String, dynamic>? userRole;
  /// INTEGER
  int? version;

  UpdateResultUpdateData({
    this.id,
    this.client,
    this.email,
    this.firstName,
    this.isActive,
    this.kif,
    this.lastName,
    this.partner,
    this.phone,
    this.userName,
    this.userRole,
    this.version,
  });

  factory UpdateResultUpdateData.fromMap(Map<String, dynamic> m) => UpdateResultUpdateData(
        id: m['id'] is String ? m['id'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        email: m['email'] is String ? m['email'] : null,
        firstName: m['firstName'] is String ? m['firstName'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        lastName: m['lastName'] is String ? m['lastName'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        userName: m['userName'] is String ? m['userName'] : null,
        userRole: m['userRole'] is Map<String, dynamic> ? m['userRole'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != email) {
      m['email'] = email;
    }
    if (null != firstName) {
      m['firstName'] = firstName;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != lastName) {
      m['lastName'] = lastName;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != phone) {
      m['phone'] = phone;
    }
    if (null != userName) {
      m['userName'] = userName;
    }
    if (null != userRole) {
      m['userRole'] = userRole;
    }
    if (null != version) {
      m['version'] = version;
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
  String? firstName;
  /// STRING
  String? id;
  /// BOOLEAN
  bool? isActive;
  /// OBJECT
  Map<String, dynamic>? kif;
  /// STRING
  String? lastName;
  /// STRING
  String? modified;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? phone;
  /// STRING
  String? userName;
  /// OBJECT
  Map<String, dynamic>? userRole;
  /// INTEGER
  int? version;

  User({
    this.client,
    this.created,
    this.email,
    this.firstName,
    this.id,
    this.isActive,
    this.kif,
    this.lastName,
    this.modified,
    this.partner,
    this.phone,
    this.userName,
    this.userRole,
    this.version,
  });

  factory User.fromMap(Map<String, dynamic> m) => User(
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        created: m['created'] is String ? m['created'] : null,
        email: m['email'] is String ? m['email'] : null,
        firstName: m['firstName'] is String ? m['firstName'] : null,
        id: m['id'] is String ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        kif: m['kif'] is Map<String, dynamic> ? m['kif'] : null,
        lastName: m['lastName'] is String ? m['lastName'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        userName: m['userName'] is String ? m['userName'] : null,
        userRole: m['userRole'] is Map<String, dynamic> ? m['userRole'] : null,
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
    if (null != firstName) {
      m['firstName'] = firstName;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != kif) {
      m['kif'] = kif;
    }
    if (null != lastName) {
      m['lastName'] = lastName;
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
    if (null != userName) {
      m['userName'] = userName;
    }
    if (null != userRole) {
      m['userRole'] = userRole;
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


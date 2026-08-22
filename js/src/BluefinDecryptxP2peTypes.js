// Typed models for the BluefinDecryptxP2pe SDK (JSDoc typedefs).
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
// edit by hand.

/**
 * @typedef {Object} Attestation
 * @property {Object} [client]
 * @property {string} [completeDate]
 * @property {string} [created]
 * @property {Object} [device]
 * @property {string} [id]
 * @property {string} [name]
 * @property {string} [notes]
 */

/**
 * @typedef {Object} AttestationLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} AttestationListMatch
 * @property {Object} [client]
 * @property {string} [completeDate]
 * @property {string} [created]
 * @property {Object} [device]
 * @property {string} [id]
 * @property {string} [name]
 * @property {string} [notes]
 */

/**
 * @typedef {Object} AttestationCreateData
 * @property {Object} [client]
 * @property {string} [completeDate]
 * @property {string} [created]
 * @property {Object} [device]
 * @property {string} [id]
 * @property {string} [name]
 * @property {string} [notes]
 */

/**
 * @typedef {Object} Client
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {Object} [directPartner]
 * @property {string} [id]
 * @property {boolean} [isActive]
 * @property {Object} location
 * @property {string} [mid]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [partner]
 * @property {number} [version]
 */

/**
 * @typedef {Object} ClientLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} ClientListMatch
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {Object} [directPartner]
 * @property {string} [id]
 * @property {boolean} [isActive]
 * @property {Object} [location]
 * @property {string} [mid]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [partner]
 * @property {number} [version]
 */

/**
 * @typedef {Object} ClientCreateData
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {Object} [directPartner]
 * @property {string} [id]
 * @property {boolean} [isActive]
 * @property {Object} location
 * @property {string} [mid]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [partner]
 * @property {number} [version]
 */

/**
 * @typedef {Object} ClientRemoveMatch
 * @property {string} id
 */

/**
 * @typedef {Object} CreateResult
 */

/**
 * @typedef {Object} CreateResultCreateData
 * @property {string} device_type
 * @property {string} serial_number
 */

/**
 * @typedef {Object} Decryption
 * @property {boolean} [success]
 */

/**
 * @typedef {Object} DecryptionCreateData
 * @property {boolean} [success]
 */

/**
 * @typedef {Object} Device
 * @property {Object} activatedBy
 * @property {string} [activationDate]
 * @property {string} [alternateKey]
 * @property {string} [auditNextDate]
 * @property {string} [auditNotificationDate]
 * @property {Object} [client]
 * @property {string} [created]
 * @property {Object} createdBy
 * @property {Object} [deviceBuild]
 * @property {Object} [deviceState]
 * @property {Object} [deviceType]
 * @property {number} [errorCounter]
 * @property {string} [errorLastDate]
 * @property {string} [id]
 * @property {Object} initializedBy
 * @property {string} [initializedDate]
 * @property {Object} [injectKey]
 * @property {boolean} [isVirtual]
 * @property {Object} [kif]
 * @property {string} [lastActivityDate]
 * @property {Object} location
 * @property {string} [modified]
 * @property {Object} modifiedBy
 * @property {string} [name]
 * @property {string} [notes]
 * @property {Object} [partner]
 * @property {string} [serialNumber]
 * @property {number} [version]
 */

/**
 * @typedef {Object} DeviceLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} DeviceListMatch
 * @property {Object} [activatedBy]
 * @property {string} [activationDate]
 * @property {string} [alternateKey]
 * @property {string} [auditNextDate]
 * @property {string} [auditNotificationDate]
 * @property {Object} [client]
 * @property {string} [created]
 * @property {Object} [createdBy]
 * @property {Object} [deviceBuild]
 * @property {Object} [deviceState]
 * @property {Object} [deviceType]
 * @property {number} [errorCounter]
 * @property {string} [errorLastDate]
 * @property {string} [id]
 * @property {Object} [initializedBy]
 * @property {string} [initializedDate]
 * @property {Object} [injectKey]
 * @property {boolean} [isVirtual]
 * @property {Object} [kif]
 * @property {string} [lastActivityDate]
 * @property {Object} [location]
 * @property {string} [modified]
 * @property {Object} [modifiedBy]
 * @property {string} [name]
 * @property {string} [notes]
 * @property {Object} [partner]
 * @property {string} [serialNumber]
 * @property {number} [version]
 */

/**
 * @typedef {Object} DeviceCreateData
 * @property {Object} activatedBy
 * @property {string} [activationDate]
 * @property {string} [alternateKey]
 * @property {string} [auditNextDate]
 * @property {string} [auditNotificationDate]
 * @property {Object} [client]
 * @property {string} [created]
 * @property {Object} createdBy
 * @property {Object} [deviceBuild]
 * @property {Object} [deviceState]
 * @property {Object} [deviceType]
 * @property {number} [errorCounter]
 * @property {string} [errorLastDate]
 * @property {string} [id]
 * @property {Object} initializedBy
 * @property {string} [initializedDate]
 * @property {Object} [injectKey]
 * @property {boolean} [isVirtual]
 * @property {Object} [kif]
 * @property {string} [lastActivityDate]
 * @property {Object} location
 * @property {string} [modified]
 * @property {Object} modifiedBy
 * @property {string} [name]
 * @property {string} [notes]
 * @property {Object} [partner]
 * @property {string} [serialNumber]
 * @property {number} [version]
 */

/**
 * @typedef {Object} DeviceBuild
 * @property {string} [appVersion]
 * @property {string} [buildNumber]
 * @property {string} [configFileName]
 * @property {string} [created]
 * @property {string} [deviceType]
 * @property {string} [firmwareVersion]
 * @property {string} [hardwareVersion]
 * @property {number} [id]
 * @property {boolean} [isActive]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {string} [notes]
 * @property {number} [version]
 * @property {string} [whiteListingBinRanges]
 * @property {boolean} [whiteListingUsed]
 */

/**
 * @typedef {Object} DeviceBuildLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} DeviceBuildListMatch
 * @property {string} [appVersion]
 * @property {string} [buildNumber]
 * @property {string} [configFileName]
 * @property {string} [created]
 * @property {string} [deviceType]
 * @property {string} [firmwareVersion]
 * @property {string} [hardwareVersion]
 * @property {number} [id]
 * @property {boolean} [isActive]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {string} [notes]
 * @property {number} [version]
 * @property {string} [whiteListingBinRanges]
 * @property {boolean} [whiteListingUsed]
 */

/**
 * @typedef {Object} DeviceCustodyDetail
 * @property {string} [completeDate]
 * @property {string} [created]
 * @property {Object} createdBy
 * @property {Object} custodian
 * @property {Object} [device]
 * @property {number} [id]
 * @property {Object} location
 * @property {string} [modified]
 * @property {Object} modifiedBy
 * @property {string} [notes]
 * @property {Object} [status]
 * @property {Object} [transferMethod]
 * @property {number} [version]
 */

/**
 * @typedef {Object} DeviceCustodyDetailLoadMatch
 * @property {string} device_type
 * @property {string} id
 * @property {string} serial_number
 */

/**
 * @typedef {Object} DeviceCustodyList
 * @property {string} [completeDate]
 * @property {string} [created]
 * @property {Object} createdBy
 * @property {Object} custodian
 * @property {Object} [device]
 * @property {number} [id]
 * @property {Object} location
 * @property {string} [modified]
 * @property {Object} modifiedBy
 * @property {string} [notes]
 * @property {Object} [status]
 * @property {Object} [transferMethod]
 * @property {number} [version]
 */

/**
 * @typedef {Object} DeviceCustodyListListMatch
 * @property {string} device_type
 * @property {string} serial_number
 */

/**
 * @typedef {Object} DeviceList
 * @property {Array} [data]
 * @property {number} [total]
 */

/**
 * @typedef {Object} DeviceListLoadMatch
 * @property {string} share_partner_to
 */

/**
 * @typedef {Object} DeviceReceiveResult
 * @property {boolean} success
 */

/**
 * @typedef {Object} DeviceReceiveResultCreateData
 * @property {boolean} success
 */

/**
 * @typedef {Object} DeviceRkiActivateResult
 * @property {boolean} success
 */

/**
 * @typedef {Object} DeviceRkiActivateResultCreateData
 * @property {boolean} success
 */

/**
 * @typedef {Object} DeviceState
 * @property {number} [id]
 * @property {string} [name]
 */

/**
 * @typedef {Object} DeviceStateListMatch
 * @property {number} [id]
 * @property {string} [name]
 */

/**
 * @typedef {Object} DeviceType
 * @property {string} [created]
 * @property {string} [deviceTypeMode]
 * @property {string} [hardwareVersion]
 * @property {string} [id]
 * @property {boolean} [isActive]
 * @property {string} [manufacturer]
 * @property {string} [model]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {string} [photoUrl]
 * @property {string} [productName]
 * @property {number} [version]
 */

/**
 * @typedef {Object} DeviceTypeLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} DeviceTypeListMatch
 * @property {string} [created]
 * @property {string} [deviceTypeMode]
 * @property {string} [hardwareVersion]
 * @property {string} [id]
 * @property {boolean} [isActive]
 * @property {string} [manufacturer]
 * @property {string} [model]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {string} [photoUrl]
 * @property {string} [productName]
 * @property {number} [version]
 */

/**
 * @typedef {Object} InjectKey
 * @property {string} [created]
 * @property {string} [id]
 * @property {boolean} [isActive]
 * @property {boolean} [isP2PE]
 * @property {string} [keyType]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {number} [version]
 */

/**
 * @typedef {Object} InjectKeyLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} InjectKeyListMatch
 * @property {string} [created]
 * @property {string} [id]
 * @property {boolean} [isActive]
 * @property {boolean} [isP2PE]
 * @property {string} [keyType]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {number} [version]
 */

/**
 * @typedef {Object} Kif
 * @property {number} [id]
 * @property {string} [name]
 */

/**
 * @typedef {Object} KifListMatch
 * @property {number} [id]
 * @property {string} [name]
 */

/**
 * @typedef {Object} Location
 * @property {string} [address1]
 * @property {string} [address2]
 * @property {string} [billingId]
 * @property {string} [city]
 * @property {string} [country]
 * @property {string} [created]
 * @property {string} [customReference]
 * @property {string} [id]
 * @property {string} [locationType]
 * @property {string} [mailAddress1]
 * @property {string} [mailAddress2]
 * @property {string} [mailCity]
 * @property {string} [mailCountry]
 * @property {string} [mailPostalCode]
 * @property {string} [mailStateProvince]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {string} [nameOfBusiness]
 * @property {string} [notes]
 * @property {string} [postalCode]
 * @property {string} [stateProvince]
 * @property {string} [uniqueId]
 * @property {number} [version]
 */

/**
 * @typedef {Object} LocationLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} LocationListMatch
 * @property {string} [address1]
 * @property {string} [address2]
 * @property {string} [billingId]
 * @property {string} [city]
 * @property {string} [country]
 * @property {string} [created]
 * @property {string} [customReference]
 * @property {string} [id]
 * @property {string} [locationType]
 * @property {string} [mailAddress1]
 * @property {string} [mailAddress2]
 * @property {string} [mailCity]
 * @property {string} [mailCountry]
 * @property {string} [mailPostalCode]
 * @property {string} [mailStateProvince]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {string} [nameOfBusiness]
 * @property {string} [notes]
 * @property {string} [postalCode]
 * @property {string} [stateProvince]
 * @property {string} [uniqueId]
 * @property {number} [version]
 */

/**
 * @typedef {Object} LocationCreateData
 * @property {string} [address1]
 * @property {string} [address2]
 * @property {string} [billingId]
 * @property {string} [city]
 * @property {string} [country]
 * @property {string} [created]
 * @property {string} [customReference]
 * @property {string} [id]
 * @property {string} [locationType]
 * @property {string} [mailAddress1]
 * @property {string} [mailAddress2]
 * @property {string} [mailCity]
 * @property {string} [mailCountry]
 * @property {string} [mailPostalCode]
 * @property {string} [mailStateProvince]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {string} [nameOfBusiness]
 * @property {string} [notes]
 * @property {string} [postalCode]
 * @property {string} [stateProvince]
 * @property {string} [uniqueId]
 * @property {number} [version]
 */

/**
 * @typedef {Object} LocationRemoveMatch
 * @property {string} id
 */

/**
 * @typedef {Object} Partner
 * @property {string} [billingId]
 * @property {boolean} [clientCanOrderEquipment]
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {string} [id]
 * @property {boolean} [isActive]
 * @property {Object} location
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [parent]
 * @property {string} [partnerId]
 * @property {string} [reference]
 * @property {string} [verificationPhrase]
 * @property {number} [version]
 */

/**
 * @typedef {Object} PartnerLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} PartnerListMatch
 * @property {string} [billingId]
 * @property {boolean} [clientCanOrderEquipment]
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {string} [id]
 * @property {boolean} [isActive]
 * @property {Object} [location]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [parent]
 * @property {string} [partnerId]
 * @property {string} [reference]
 * @property {string} [verificationPhrase]
 * @property {number} [version]
 */

/**
 * @typedef {Object} PartnerCreateData
 * @property {string} [billingId]
 * @property {boolean} [clientCanOrderEquipment]
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {string} [id]
 * @property {boolean} [isActive]
 * @property {Object} location
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [parent]
 * @property {string} [partnerId]
 * @property {string} [reference]
 * @property {string} [verificationPhrase]
 * @property {number} [version]
 */

/**
 * @typedef {Object} Shipment
 * @property {string} [carrier]
 * @property {Object} [client]
 * @property {string} [created]
 * @property {string} [dateReceived]
 * @property {string} [dateShipped]
 * @property {Object} [dcKif]
 * @property {string} [id]
 * @property {Array} [items]
 * @property {Object} [kif]
 * @property {string} [modified]
 * @property {Object} [partner]
 * @property {string} [shipmentType]
 * @property {string} [tracking]
 * @property {number} [version]
 */

/**
 * @typedef {Object} ShipmentLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} ShipmentListMatch
 * @property {string} [carrier]
 * @property {Object} [client]
 * @property {string} [created]
 * @property {string} [dateReceived]
 * @property {string} [dateShipped]
 * @property {Object} [dcKif]
 * @property {string} [id]
 * @property {Array} [items]
 * @property {Object} [kif]
 * @property {string} [modified]
 * @property {Object} [partner]
 * @property {string} [shipmentType]
 * @property {string} [tracking]
 * @property {number} [version]
 */

/**
 * @typedef {Object} ShipmentCreateData
 * @property {string} [carrier]
 * @property {Object} [client]
 * @property {string} [created]
 * @property {string} [dateReceived]
 * @property {string} [dateShipped]
 * @property {Object} [dcKif]
 * @property {string} [id]
 * @property {Array} [items]
 * @property {Object} [kif]
 * @property {string} [modified]
 * @property {Object} [partner]
 * @property {string} [shipmentType]
 * @property {string} [tracking]
 * @property {number} [version]
 */

/**
 * @typedef {Object} Success
 * @property {boolean} [success]
 */

/**
 * @typedef {Object} SuccessCreateData
 * @property {string} share_partner_to
 * @property {boolean} [success]
 */

/**
 * @typedef {Object} SuccessRemoveMatch
 * @property {string} share_partner_to
 */

/**
 * @typedef {Object} Transaction
 * @property {string} [alternateKey]
 * @property {Object} [client]
 * @property {string} [clientRef]
 * @property {string} [created]
 * @property {number} [decrypted]
 * @property {string} [deviceName]
 * @property {Object} [directPartner]
 * @property {number} [encrypted]
 * @property {string} [endDate]
 * @property {string} [errCode]
 * @property {string} [errMessage]
 * @property {string} [id]
 * @property {string} [ipAddress]
 * @property {boolean} [isVirtual]
 * @property {string} [keyType]
 * @property {Object} location
 * @property {string} [messageId]
 * @property {string} [method]
 * @property {Object} [partner]
 * @property {string} [reference]
 * @property {string} [serialNumber]
 * @property {string} [startDate]
 * @property {boolean} [success]
 * @property {string} [transactionSource]
 */

/**
 * @typedef {Object} TransactionLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} TransactionListMatch
 * @property {string} [alternateKey]
 * @property {Object} [client]
 * @property {string} [clientRef]
 * @property {string} [created]
 * @property {number} [decrypted]
 * @property {string} [deviceName]
 * @property {Object} [directPartner]
 * @property {number} [encrypted]
 * @property {string} [endDate]
 * @property {string} [errCode]
 * @property {string} [errMessage]
 * @property {string} [id]
 * @property {string} [ipAddress]
 * @property {boolean} [isVirtual]
 * @property {string} [keyType]
 * @property {Object} [location]
 * @property {string} [messageId]
 * @property {string} [method]
 * @property {Object} [partner]
 * @property {string} [reference]
 * @property {string} [serialNumber]
 * @property {string} [startDate]
 * @property {boolean} [success]
 * @property {string} [transactionSource]
 */

/**
 * @typedef {Object} TransactionCreateData
 * @property {string} [alternateKey]
 * @property {Object} [client]
 * @property {string} [clientRef]
 * @property {string} [created]
 * @property {number} [decrypted]
 * @property {string} [deviceName]
 * @property {Object} [directPartner]
 * @property {number} [encrypted]
 * @property {string} [endDate]
 * @property {string} [errCode]
 * @property {string} [errMessage]
 * @property {string} [id]
 * @property {string} [ipAddress]
 * @property {boolean} [isVirtual]
 * @property {string} [keyType]
 * @property {Object} location
 * @property {string} [messageId]
 * @property {string} [method]
 * @property {Object} [partner]
 * @property {string} [reference]
 * @property {string} [serialNumber]
 * @property {string} [startDate]
 * @property {boolean} [success]
 * @property {string} [transactionSource]
 */

/**
 * @typedef {Object} UpdateResult
 * @property {Object} [client]
 * @property {string} [email]
 * @property {string} [firstName]
 * @property {string} [id]
 * @property {boolean} [isActive]
 * @property {Object} [kif]
 * @property {string} [lastName]
 * @property {Object} [partner]
 * @property {string} [phone]
 * @property {string} [userName]
 * @property {Object} [userRole]
 * @property {number} [version]
 */

/**
 * @typedef {Object} UpdateResultListMatch
 * @property {Object} [client]
 * @property {string} [email]
 * @property {string} [firstName]
 * @property {string} [id]
 * @property {boolean} [isActive]
 * @property {Object} [kif]
 * @property {string} [lastName]
 * @property {Object} [partner]
 * @property {string} [phone]
 * @property {string} [userName]
 * @property {Object} [userRole]
 * @property {number} [version]
 */

/**
 * @typedef {Object} UpdateResultCreateData
 * @property {Object} [client]
 * @property {string} [email]
 * @property {string} [firstName]
 * @property {string} [id]
 * @property {boolean} [isActive]
 * @property {Object} [kif]
 * @property {string} [lastName]
 * @property {Object} [partner]
 * @property {string} [phone]
 * @property {string} [userName]
 * @property {Object} [userRole]
 * @property {number} [version]
 */

/**
 * @typedef {Object} UpdateResultUpdateData
 * @property {string} id
 * @property {Object} [client]
 * @property {string} [email]
 * @property {string} [firstName]
 * @property {boolean} [isActive]
 * @property {Object} [kif]
 * @property {string} [lastName]
 * @property {Object} [partner]
 * @property {string} [phone]
 * @property {string} [userName]
 * @property {Object} [userRole]
 * @property {number} [version]
 */

/**
 * @typedef {Object} User
 * @property {Object} [client]
 * @property {string} [created]
 * @property {string} [email]
 * @property {string} [firstName]
 * @property {string} [id]
 * @property {boolean} [isActive]
 * @property {Object} [kif]
 * @property {string} [lastName]
 * @property {string} [modified]
 * @property {Object} [partner]
 * @property {string} [phone]
 * @property {string} [userName]
 * @property {Object} [userRole]
 * @property {number} [version]
 */

/**
 * @typedef {Object} UserLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} UserRemoveMatch
 * @property {string} id
 */


export interface Attestation {
    client?: Record<string, any>;
    completeDate?: string;
    created?: string;
    device?: Record<string, any>;
    devices: any[];
    id?: string;
    name?: string;
    notes?: string;
}
export interface AttestationLoadMatch {
    id: string;
}
export interface AttestationListMatch {
    client: string;
    skip?: number;
    take?: number;
}
export interface AttestationCreateData {
    client?: Record<string, any>;
    completeDate?: string;
    created?: string;
    device?: Record<string, any>;
    devices: any[];
    id?: string;
    name?: string;
    notes?: string;
}
export interface Client {
    contact?: Record<string, any>;
    created?: string;
    directPartner?: Record<string, any>;
    id?: string;
    isActive?: boolean;
    location: Record<string, any>;
    mid?: string;
    modified?: string;
    name?: string;
    partner?: Record<string, any>;
    version?: number;
}
export interface ClientLoadMatch {
    id: string;
}
export interface ClientListMatch {
    partner: string;
    skip?: number;
    take?: number;
}
export interface ClientCreateData {
    contact?: Record<string, any>;
    created?: string;
    directPartner?: Record<string, any>;
    id?: string;
    isActive?: boolean;
    location: Record<string, any>;
    mid?: string;
    modified?: string;
    name?: string;
    partner?: Record<string, any>;
    version?: number;
}
export interface ClientRemoveMatch {
    id: string;
}
export interface CreateResult {
    completeDate?: string;
    custodian: Record<string, any>;
    location: Record<string, any>;
    notes?: string;
}
export interface CreateResultCreateData {
    device_type: string;
    serial_number: string;
    completeDate?: string;
    custodian: Record<string, any>;
    location: Record<string, any>;
    notes?: string;
}
export interface Decryption {
    cbcVector?: string;
    deviceType: string;
    encoding?: string;
    encrypted: any[];
    hasCcData?: string;
    reference?: string;
    sequenceNumber?: string;
    serialNumber: string;
    success?: boolean;
}
export interface DecryptionCreateData {
    cbcVector?: string;
    deviceType: string;
    encoding?: string;
    encrypted: any[];
    hasCcData?: string;
    reference?: string;
    sequenceNumber?: string;
    serialNumber: string;
    success?: boolean;
}
export interface Device {
    activatedBy: Record<string, any>;
    activationDate?: string;
    alternateKey?: string;
    auditNextDate?: string;
    auditNotificationDate?: string;
    client?: Record<string, any>;
    created?: string;
    createdBy: Record<string, any>;
    deviceBuild?: Record<string, any>;
    deviceState?: Record<string, any>;
    deviceType?: Record<string, any>;
    errorCounter?: number;
    errorLastDate?: string;
    id?: string;
    initializedBy: Record<string, any>;
    initializedDate?: string;
    injectKey?: Record<string, any>;
    isVirtual?: boolean;
    kif?: Record<string, any>;
    lastActivityDate?: string;
    location: Record<string, any>;
    modified?: string;
    modifiedBy: Record<string, any>;
    name?: string;
    notes?: string;
    partner?: Record<string, any>;
    serialNumber?: string;
    version?: number;
}
export interface DeviceLoadMatch {
    id: string;
}
export interface DeviceListMatch {
    client?: string;
    device_state?: string;
    kif?: string;
    partner?: string;
    serial_number?: string;
    skip?: number;
    sorting_direction?: string;
    sorting_field?: string;
    take?: number;
}
export interface DeviceCreateData {
    activatedBy: Record<string, any>;
    activationDate?: string;
    alternateKey?: string;
    auditNextDate?: string;
    auditNotificationDate?: string;
    client?: Record<string, any>;
    created?: string;
    createdBy: Record<string, any>;
    deviceBuild?: Record<string, any>;
    deviceState?: Record<string, any>;
    deviceType?: Record<string, any>;
    errorCounter?: number;
    errorLastDate?: string;
    id?: string;
    initializedBy: Record<string, any>;
    initializedDate?: string;
    injectKey?: Record<string, any>;
    isVirtual?: boolean;
    kif?: Record<string, any>;
    lastActivityDate?: string;
    location: Record<string, any>;
    modified?: string;
    modifiedBy: Record<string, any>;
    name?: string;
    notes?: string;
    partner?: Record<string, any>;
    serialNumber?: string;
    version?: number;
}
export interface DeviceBuild {
    appVersion?: string;
    buildNumber?: string;
    configFileName?: string;
    created?: string;
    deviceType?: string;
    firmwareVersion?: string;
    hardwareVersion?: string;
    id?: number;
    isActive?: boolean;
    modified?: string;
    name?: string;
    notes?: string;
    version?: number;
    whiteListingBinRanges?: string;
    whiteListingUsed?: boolean;
}
export interface DeviceBuildLoadMatch {
    id: string;
}
export interface DeviceBuildListMatch {
    device_type?: string;
    skip?: number;
    take?: number;
}
export interface DeviceCustodyDetail {
    completeDate?: string;
    created?: string;
    createdBy: Record<string, any>;
    custodian: Record<string, any>;
    device?: Record<string, any>;
    id?: number;
    location: Record<string, any>;
    modified?: string;
    modifiedBy: Record<string, any>;
    notes?: string;
    status?: Record<string, any>;
    transferMethod?: Record<string, any>;
    version?: number;
}
export interface DeviceCustodyDetailLoadMatch {
    device_type: string;
    id: string;
    serial_number: string;
}
export interface DeviceCustodyListItem {
    completeDate?: string;
    created?: string;
    createdBy: Record<string, any>;
    custodian: Record<string, any>;
    device?: Record<string, any>;
    id?: number;
    location: Record<string, any>;
    modified?: string;
    modifiedBy: Record<string, any>;
    notes?: string;
    status?: Record<string, any>;
    transferMethod?: Record<string, any>;
    version?: number;
}
export interface DeviceCustodyListItemListMatch {
    device_type: string;
    serial_number: string;
    skip?: number;
    take?: number;
}
export interface DeviceReceiveResult {
    serialNumber: string;
    success: boolean;
    tamperLabel: string;
}
export interface DeviceReceiveResultCreateData {
    serialNumber: string;
    success: boolean;
    tamperLabel: string;
}
export interface DeviceRkiActivateResult {
    appVersion?: string;
    buildName?: string;
    buildNumber?: string;
    configFile?: string;
    firmwareVersion?: string;
    hardwareVersion?: string;
    serialNumber: string;
    success: boolean;
    whiteListingBinRanges?: string;
}
export interface DeviceRkiActivateResultCreateData {
    appVersion?: string;
    buildName?: string;
    buildNumber?: string;
    configFile?: string;
    firmwareVersion?: string;
    hardwareVersion?: string;
    serialNumber: string;
    success: boolean;
    whiteListingBinRanges?: string;
}
export interface DeviceState {
    id?: number;
    name?: string;
}
export interface DeviceStateListMatch {
    id?: number;
    name?: string;
}
export interface DeviceType {
    created?: string;
    deviceTypeMode?: string;
    hardwareVersion?: string;
    id?: string;
    isActive?: boolean;
    manufacturer?: string;
    model?: string;
    modified?: string;
    name?: string;
    photoUrl?: string;
    productName?: string;
    version?: number;
}
export interface DeviceTypeLoadMatch {
    id: string;
}
export interface DeviceTypeListMatch {
    created?: string;
    deviceTypeMode?: string;
    hardwareVersion?: string;
    id?: string;
    isActive?: boolean;
    manufacturer?: string;
    model?: string;
    modified?: string;
    name?: string;
    photoUrl?: string;
    productName?: string;
    version?: number;
}
export interface InjectKey {
    created?: string;
    id?: string;
    isActive?: boolean;
    isP2PE?: boolean;
    keyType?: string;
    modified?: string;
    name?: string;
    version?: number;
}
export interface InjectKeyLoadMatch {
    id: string;
}
export interface InjectKeyListMatch {
    created?: string;
    id?: string;
    isActive?: boolean;
    isP2PE?: boolean;
    keyType?: string;
    modified?: string;
    name?: string;
    version?: number;
}
export interface Kif {
    id?: number;
    name?: string;
}
export interface KifListMatch {
    id?: number;
    name?: string;
}
export interface Location {
    address1?: string;
    address2?: string;
    billingId?: string;
    city?: string;
    client?: Record<string, any>;
    country?: string;
    created?: string;
    customReference?: string;
    id?: string;
    locationType?: string;
    mailAddress1?: string;
    mailAddress2?: string;
    mailCity?: string;
    mailCountry?: string;
    mailPostalCode?: string;
    mailStateProvince?: string;
    modified?: string;
    name?: string;
    nameOfBusiness?: string;
    notes?: string;
    postalCode?: string;
    stateProvince?: string;
    uniqueId?: string;
    version?: number;
}
export interface LocationLoadMatch {
    id: string;
}
export interface LocationListMatch {
    client: string;
    skip?: number;
    take?: number;
}
export interface LocationCreateData {
    address1?: string;
    address2?: string;
    billingId?: string;
    city?: string;
    client?: Record<string, any>;
    country?: string;
    created?: string;
    customReference?: string;
    id?: string;
    locationType?: string;
    mailAddress1?: string;
    mailAddress2?: string;
    mailCity?: string;
    mailCountry?: string;
    mailPostalCode?: string;
    mailStateProvince?: string;
    modified?: string;
    name?: string;
    nameOfBusiness?: string;
    notes?: string;
    postalCode?: string;
    stateProvince?: string;
    uniqueId?: string;
    version?: number;
}
export interface LocationRemoveMatch {
    id: string;
}
export interface Partner {
    billingId?: string;
    clientCanOrderEquipment?: boolean;
    contact?: Record<string, any>;
    created?: string;
    id?: string;
    isActive?: boolean;
    location: Record<string, any>;
    modified?: string;
    name?: string;
    parent?: Record<string, any>;
    partnerId?: string;
    reference?: string;
    verificationPhrase?: string;
    version?: number;
}
export interface PartnerLoadMatch {
    id: string;
}
export interface PartnerListMatch {
    partner?: string;
    skip?: number;
    take?: number;
}
export interface PartnerCreateData {
    billingId?: string;
    clientCanOrderEquipment?: boolean;
    contact?: Record<string, any>;
    created?: string;
    id?: string;
    isActive?: boolean;
    location: Record<string, any>;
    modified?: string;
    name?: string;
    parent?: Record<string, any>;
    partnerId?: string;
    reference?: string;
    verificationPhrase?: string;
    version?: number;
}
export interface Shipment {
    carrier?: string;
    client?: Record<string, any>;
    created?: string;
    dateReceived?: string;
    dateShipped?: string;
    dcKif?: Record<string, any>;
    id?: string;
    items?: any[];
    kif?: Record<string, any>;
    location: Record<string, any>;
    modified?: string;
    partner?: Record<string, any>;
    shipmentType?: string;
    tracking?: string;
    version?: number;
}
export interface ShipmentLoadMatch {
    id: string;
}
export interface ShipmentListMatch {
    kif: string;
    mode?: string;
    skip?: number;
    take?: number;
}
export interface ShipmentCreateData {
    carrier?: string;
    client?: Record<string, any>;
    created?: string;
    dateReceived?: string;
    dateShipped?: string;
    dcKif?: Record<string, any>;
    id?: string;
    items?: any[];
    kif?: Record<string, any>;
    location: Record<string, any>;
    modified?: string;
    partner?: Record<string, any>;
    shipmentType?: string;
    tracking?: string;
    version?: number;
}
export interface Success {
    devices: any[];
    sharePartnerFrom: Record<string, any>;
    success?: boolean;
}
export interface SuccessCreateData {
    share_partner_to: string;
    devices: any[];
    sharePartnerFrom: Record<string, any>;
    success?: boolean;
}
export interface SuccessRemoveMatch {
    share_partner_to: string;
}
export interface Transaction {
    alternateKey?: string;
    client?: Record<string, any>;
    clientRef?: string;
    created?: string;
    decrypted?: number;
    device: Record<string, any>;
    deviceName?: string;
    directPartner?: Record<string, any>;
    encrypted?: number;
    endDate?: string;
    errCode?: string;
    errMessage?: string;
    id?: string;
    ipAddress?: string;
    isVirtual?: boolean;
    keyType?: string;
    location: Record<string, any>;
    messageId?: string;
    method?: string;
    partner?: Record<string, any>;
    reference?: string;
    serialNumber?: string;
    startDate?: string;
    success?: boolean;
    transactionSource?: string;
}
export interface TransactionLoadMatch {
    id: string;
}
export interface TransactionListMatch {
    client?: string;
    client_ref?: string;
    date_from?: string;
    date_to?: string;
    location?: string;
    message_id?: string;
    paging_mode?: string;
    partner?: string;
    reference?: string;
    serial_number?: string;
    skip?: number;
    success?: boolean;
    take?: number;
}
export interface TransactionCreateData {
    alternateKey?: string;
    client?: Record<string, any>;
    clientRef?: string;
    created?: string;
    decrypted?: number;
    device: Record<string, any>;
    deviceName?: string;
    directPartner?: Record<string, any>;
    encrypted?: number;
    endDate?: string;
    errCode?: string;
    errMessage?: string;
    id?: string;
    ipAddress?: string;
    isVirtual?: boolean;
    keyType?: string;
    location: Record<string, any>;
    messageId?: string;
    method?: string;
    partner?: Record<string, any>;
    reference?: string;
    serialNumber?: string;
    startDate?: string;
    success?: boolean;
    transactionSource?: string;
}
export interface UpdateResult {
    address1?: string;
    address2?: string;
    alternateKey?: string;
    auditNextDate?: string;
    billingId?: string;
    city?: string;
    client?: Record<string, any>;
    clientCanOrderEquipment?: boolean;
    clientRef?: string;
    contact: Record<string, any>;
    country?: Record<string, any>;
    customReference?: string;
    dateShipped?: string;
    decrypted?: number;
    device?: Record<string, any>;
    deviceBuild?: Record<string, any>;
    deviceType?: Record<string, any>;
    directPartner?: Record<string, any>;
    email: string;
    encrypted?: number;
    endDate?: string;
    errCode?: string;
    errMessage?: string;
    firstName: string;
    id?: string;
    injectKey?: Record<string, any>;
    ipAddress?: string;
    isActive: boolean;
    items?: any[];
    keyType?: string;
    kif?: Record<string, any>;
    lastName: string;
    location: Record<string, any>;
    locationType?: string;
    mailAddress1?: string;
    mailAddress2?: string;
    mailCity?: string;
    mailCountry?: string;
    mailPostalCode?: string;
    mailStateProvince?: string;
    messageId?: string;
    method?: string;
    mid?: string;
    name?: string;
    nameOfBusiness?: string;
    notes?: string;
    parent?: Record<string, any>;
    partner?: Record<string, any>;
    partnerId?: string;
    phone: string;
    postalCode?: string;
    reference?: string;
    sendWelcomeEmail?: boolean;
    serialNumber?: string;
    startDate?: string;
    stateProvince?: string;
    success?: boolean;
    tracking?: string;
    uniqueId?: string;
    userName: string;
    userRole: Record<string, any>;
    verificationPhrase?: string;
    version?: number;
}
export interface UpdateResultListMatch {
    client?: string;
    kif?: string;
    partner?: any;
    skip?: number;
    take?: number;
}
export interface UpdateResultCreateData {
    address1?: string;
    address2?: string;
    alternateKey?: string;
    auditNextDate?: string;
    billingId?: string;
    city?: string;
    client?: Record<string, any>;
    clientCanOrderEquipment?: boolean;
    clientRef?: string;
    contact: Record<string, any>;
    country?: Record<string, any>;
    customReference?: string;
    dateShipped?: string;
    decrypted?: number;
    device?: Record<string, any>;
    deviceBuild?: Record<string, any>;
    deviceType?: Record<string, any>;
    directPartner?: Record<string, any>;
    email: string;
    encrypted?: number;
    endDate?: string;
    errCode?: string;
    errMessage?: string;
    firstName: string;
    id?: string;
    injectKey?: Record<string, any>;
    ipAddress?: string;
    isActive: boolean;
    items?: any[];
    keyType?: string;
    kif?: Record<string, any>;
    lastName: string;
    location: Record<string, any>;
    locationType?: string;
    mailAddress1?: string;
    mailAddress2?: string;
    mailCity?: string;
    mailCountry?: string;
    mailPostalCode?: string;
    mailStateProvince?: string;
    messageId?: string;
    method?: string;
    mid?: string;
    name?: string;
    nameOfBusiness?: string;
    notes?: string;
    parent?: Record<string, any>;
    partner?: Record<string, any>;
    partnerId?: string;
    phone: string;
    postalCode?: string;
    reference?: string;
    sendWelcomeEmail?: boolean;
    serialNumber?: string;
    startDate?: string;
    stateProvince?: string;
    success?: boolean;
    tracking?: string;
    uniqueId?: string;
    userName: string;
    userRole: Record<string, any>;
    verificationPhrase?: string;
    version?: number;
}
export interface UpdateResultUpdateData {
    id: string;
    address1?: string;
    address2?: string;
    alternateKey?: string;
    auditNextDate?: string;
    billingId?: string;
    city?: string;
    client?: Record<string, any>;
    clientCanOrderEquipment?: boolean;
    clientRef?: string;
    contact?: Record<string, any>;
    country?: Record<string, any>;
    customReference?: string;
    dateShipped?: string;
    decrypted?: number;
    device?: Record<string, any>;
    deviceBuild?: Record<string, any>;
    deviceType?: Record<string, any>;
    directPartner?: Record<string, any>;
    email?: string;
    encrypted?: number;
    endDate?: string;
    errCode?: string;
    errMessage?: string;
    firstName?: string;
    injectKey?: Record<string, any>;
    ipAddress?: string;
    isActive?: boolean;
    items?: any[];
    keyType?: string;
    kif?: Record<string, any>;
    lastName?: string;
    location?: Record<string, any>;
    locationType?: string;
    mailAddress1?: string;
    mailAddress2?: string;
    mailCity?: string;
    mailCountry?: string;
    mailPostalCode?: string;
    mailStateProvince?: string;
    messageId?: string;
    method?: string;
    mid?: string;
    name?: string;
    nameOfBusiness?: string;
    notes?: string;
    parent?: Record<string, any>;
    partner?: Record<string, any>;
    partnerId?: string;
    phone?: string;
    postalCode?: string;
    reference?: string;
    sendWelcomeEmail?: boolean;
    serialNumber?: string;
    startDate?: string;
    stateProvince?: string;
    success?: boolean;
    tracking?: string;
    uniqueId?: string;
    userName?: string;
    userRole?: Record<string, any>;
    verificationPhrase?: string;
    version?: number;
}
export interface User {
    client?: Record<string, any>;
    created?: string;
    email?: string;
    firstName?: string;
    id?: string;
    isActive?: boolean;
    kif?: Record<string, any>;
    lastName?: string;
    modified?: string;
    partner?: Record<string, any>;
    phone?: string;
    userName?: string;
    userRole?: Record<string, any>;
    version?: number;
}
export interface UserLoadMatch {
    id: string;
}
export interface UserRemoveMatch {
    id: string;
}
export interface VirtualDevice {
    data?: any[];
    id?: string;
    total?: number;
}
export interface VirtualDeviceLoadMatch {
    id: string;
    skip?: number;
    sorting_direction?: string;
    sorting_field?: string;
    take?: number;
}

// Typed models for the BluefinDecryptxP2pe SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import (
	"encoding/json"

	"github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/go/core"
)

// Attestation is the typed data model for the attestation entity.
type Attestation struct {
	Client *map[string]any `json:"client,omitempty"`
	CompleteDate *string `json:"completeDate,omitempty"`
	Created *string `json:"created,omitempty"`
	Device *map[string]any `json:"device,omitempty"`
	Id *string `json:"id,omitempty"`
	Name *string `json:"name,omitempty"`
	Notes *string `json:"notes,omitempty"`
}

// AttestationLoadMatch is the typed request payload for Attestation.LoadTyped.
type AttestationLoadMatch struct {
	Id string `json:"id"`
}

// AttestationListMatch is the typed request payload for Attestation.ListTyped.
type AttestationListMatch struct {
	Client *map[string]any `json:"client,omitempty"`
	CompleteDate *string `json:"completeDate,omitempty"`
	Created *string `json:"created,omitempty"`
	Device *map[string]any `json:"device,omitempty"`
	Id *string `json:"id,omitempty"`
	Name *string `json:"name,omitempty"`
	Notes *string `json:"notes,omitempty"`
}

// AttestationCreateData is the typed request payload for Attestation.CreateTyped.
type AttestationCreateData struct {
	Client *map[string]any `json:"client,omitempty"`
	CompleteDate *string `json:"completeDate,omitempty"`
	Created *string `json:"created,omitempty"`
	Device *map[string]any `json:"device,omitempty"`
	Id *string `json:"id,omitempty"`
	Name *string `json:"name,omitempty"`
	Notes *string `json:"notes,omitempty"`
}

// Client is the typed data model for the client entity.
type Client struct {
	Contact *map[string]any `json:"contact,omitempty"`
	Created *string `json:"created,omitempty"`
	DirectPartner *map[string]any `json:"directPartner,omitempty"`
	Id *string `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	Location map[string]any `json:"location"`
	Mid *string `json:"mid,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Version *int `json:"version,omitempty"`
}

// ClientLoadMatch is the typed request payload for Client.LoadTyped.
type ClientLoadMatch struct {
	Id string `json:"id"`
}

// ClientListMatch is the typed request payload for Client.ListTyped.
type ClientListMatch struct {
	Contact *map[string]any `json:"contact,omitempty"`
	Created *string `json:"created,omitempty"`
	DirectPartner *map[string]any `json:"directPartner,omitempty"`
	Id *string `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	Location *map[string]any `json:"location,omitempty"`
	Mid *string `json:"mid,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Version *int `json:"version,omitempty"`
}

// ClientCreateData is the typed request payload for Client.CreateTyped.
type ClientCreateData struct {
	Contact *map[string]any `json:"contact,omitempty"`
	Created *string `json:"created,omitempty"`
	DirectPartner *map[string]any `json:"directPartner,omitempty"`
	Id *string `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	Location map[string]any `json:"location"`
	Mid *string `json:"mid,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Version *int `json:"version,omitempty"`
}

// ClientRemoveMatch is the typed request payload for Client.RemoveTyped.
type ClientRemoveMatch struct {
	Id string `json:"id"`
}

// CreateResult is the typed data model for the create_result entity.
type CreateResult struct {
}

// CreateResultCreateData is the typed request payload for CreateResult.CreateTyped.
type CreateResultCreateData struct {
	DeviceType string `json:"device_type"`
	SerialNumber string `json:"serial_number"`
}

// Decryption is the typed data model for the decryption entity.
type Decryption struct {
	Success *bool `json:"success,omitempty"`
}

// DecryptionCreateData is the typed request payload for Decryption.CreateTyped.
type DecryptionCreateData struct {
	Success *bool `json:"success,omitempty"`
}

// Device is the typed data model for the device entity.
type Device struct {
	ActivatedBy map[string]any `json:"activatedBy"`
	ActivationDate *string `json:"activationDate,omitempty"`
	AlternateKey *string `json:"alternateKey,omitempty"`
	AuditNextDate *string `json:"auditNextDate,omitempty"`
	AuditNotificationDate *string `json:"auditNotificationDate,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	Created *string `json:"created,omitempty"`
	CreatedBy map[string]any `json:"createdBy"`
	DeviceBuild *map[string]any `json:"deviceBuild,omitempty"`
	DeviceState *map[string]any `json:"deviceState,omitempty"`
	DeviceType *map[string]any `json:"deviceType,omitempty"`
	ErrorCounter *int `json:"errorCounter,omitempty"`
	ErrorLastDate *string `json:"errorLastDate,omitempty"`
	Id *string `json:"id,omitempty"`
	InitializedBy map[string]any `json:"initializedBy"`
	InitializedDate *string `json:"initializedDate,omitempty"`
	InjectKey *map[string]any `json:"injectKey,omitempty"`
	IsVirtual *bool `json:"isVirtual,omitempty"`
	Kif *map[string]any `json:"kif,omitempty"`
	LastActivityDate *string `json:"lastActivityDate,omitempty"`
	Location map[string]any `json:"location"`
	Modified *string `json:"modified,omitempty"`
	ModifiedBy map[string]any `json:"modifiedBy"`
	Name *string `json:"name,omitempty"`
	Notes *string `json:"notes,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	SerialNumber *string `json:"serialNumber,omitempty"`
	Version *int `json:"version,omitempty"`
}

// DeviceLoadMatch is the typed request payload for Device.LoadTyped.
type DeviceLoadMatch struct {
	DeviceType *string `json:"device_type,omitempty"`
	SerialNumber *string `json:"serial_number,omitempty"`
	Id *string `json:"id,omitempty"`
}

// DeviceListMatch is the typed request payload for Device.ListTyped.
type DeviceListMatch struct {
	ActivatedBy *map[string]any `json:"activatedBy,omitempty"`
	ActivationDate *string `json:"activationDate,omitempty"`
	AlternateKey *string `json:"alternateKey,omitempty"`
	AuditNextDate *string `json:"auditNextDate,omitempty"`
	AuditNotificationDate *string `json:"auditNotificationDate,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	Created *string `json:"created,omitempty"`
	CreatedBy *map[string]any `json:"createdBy,omitempty"`
	DeviceBuild *map[string]any `json:"deviceBuild,omitempty"`
	DeviceState *map[string]any `json:"deviceState,omitempty"`
	DeviceType *map[string]any `json:"deviceType,omitempty"`
	ErrorCounter *int `json:"errorCounter,omitempty"`
	ErrorLastDate *string `json:"errorLastDate,omitempty"`
	Id *string `json:"id,omitempty"`
	InitializedBy *map[string]any `json:"initializedBy,omitempty"`
	InitializedDate *string `json:"initializedDate,omitempty"`
	InjectKey *map[string]any `json:"injectKey,omitempty"`
	IsVirtual *bool `json:"isVirtual,omitempty"`
	Kif *map[string]any `json:"kif,omitempty"`
	LastActivityDate *string `json:"lastActivityDate,omitempty"`
	Location *map[string]any `json:"location,omitempty"`
	Modified *string `json:"modified,omitempty"`
	ModifiedBy *map[string]any `json:"modifiedBy,omitempty"`
	Name *string `json:"name,omitempty"`
	Notes *string `json:"notes,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	SerialNumber *string `json:"serialNumber,omitempty"`
	Version *int `json:"version,omitempty"`
}

// DeviceCreateData is the typed request payload for Device.CreateTyped.
type DeviceCreateData struct {
	ActivatedBy map[string]any `json:"activatedBy"`
	ActivationDate *string `json:"activationDate,omitempty"`
	AlternateKey *string `json:"alternateKey,omitempty"`
	AuditNextDate *string `json:"auditNextDate,omitempty"`
	AuditNotificationDate *string `json:"auditNotificationDate,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	Created *string `json:"created,omitempty"`
	CreatedBy map[string]any `json:"createdBy"`
	DeviceBuild *map[string]any `json:"deviceBuild,omitempty"`
	DeviceState *map[string]any `json:"deviceState,omitempty"`
	DeviceType *map[string]any `json:"deviceType,omitempty"`
	ErrorCounter *int `json:"errorCounter,omitempty"`
	ErrorLastDate *string `json:"errorLastDate,omitempty"`
	Id *string `json:"id,omitempty"`
	InitializedBy map[string]any `json:"initializedBy"`
	InitializedDate *string `json:"initializedDate,omitempty"`
	InjectKey *map[string]any `json:"injectKey,omitempty"`
	IsVirtual *bool `json:"isVirtual,omitempty"`
	Kif *map[string]any `json:"kif,omitempty"`
	LastActivityDate *string `json:"lastActivityDate,omitempty"`
	Location map[string]any `json:"location"`
	Modified *string `json:"modified,omitempty"`
	ModifiedBy map[string]any `json:"modifiedBy"`
	Name *string `json:"name,omitempty"`
	Notes *string `json:"notes,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	SerialNumber *string `json:"serialNumber,omitempty"`
	Version *int `json:"version,omitempty"`
}

// DeviceBuild is the typed data model for the device_build entity.
type DeviceBuild struct {
	AppVersion *string `json:"appVersion,omitempty"`
	BuildNumber *string `json:"buildNumber,omitempty"`
	ConfigFileName *string `json:"configFileName,omitempty"`
	Created *string `json:"created,omitempty"`
	DeviceType *string `json:"deviceType,omitempty"`
	FirmwareVersion *string `json:"firmwareVersion,omitempty"`
	HardwareVersion *string `json:"hardwareVersion,omitempty"`
	Id *int `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	Notes *string `json:"notes,omitempty"`
	Version *int `json:"version,omitempty"`
	WhiteListingBinRanges *string `json:"whiteListingBinRanges,omitempty"`
	WhiteListingUsed *bool `json:"whiteListingUsed,omitempty"`
}

// DeviceBuildLoadMatch is the typed request payload for DeviceBuild.LoadTyped.
type DeviceBuildLoadMatch struct {
	Id string `json:"id"`
}

// DeviceBuildListMatch is the typed request payload for DeviceBuild.ListTyped.
type DeviceBuildListMatch struct {
	AppVersion *string `json:"appVersion,omitempty"`
	BuildNumber *string `json:"buildNumber,omitempty"`
	ConfigFileName *string `json:"configFileName,omitempty"`
	Created *string `json:"created,omitempty"`
	DeviceType *string `json:"deviceType,omitempty"`
	FirmwareVersion *string `json:"firmwareVersion,omitempty"`
	HardwareVersion *string `json:"hardwareVersion,omitempty"`
	Id *int `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	Notes *string `json:"notes,omitempty"`
	Version *int `json:"version,omitempty"`
	WhiteListingBinRanges *string `json:"whiteListingBinRanges,omitempty"`
	WhiteListingUsed *bool `json:"whiteListingUsed,omitempty"`
}

// DeviceCustodyDetail is the typed data model for the device_custody_detail entity.
type DeviceCustodyDetail struct {
	CompleteDate *string `json:"completeDate,omitempty"`
	Created *string `json:"created,omitempty"`
	CreatedBy map[string]any `json:"createdBy"`
	Custodian map[string]any `json:"custodian"`
	Device *map[string]any `json:"device,omitempty"`
	Id *int `json:"id,omitempty"`
	Location map[string]any `json:"location"`
	Modified *string `json:"modified,omitempty"`
	ModifiedBy map[string]any `json:"modifiedBy"`
	Notes *string `json:"notes,omitempty"`
	Status *map[string]any `json:"status,omitempty"`
	TransferMethod *map[string]any `json:"transferMethod,omitempty"`
	Version *int `json:"version,omitempty"`
}

// DeviceCustodyDetailLoadMatch is the typed request payload for DeviceCustodyDetail.LoadTyped.
type DeviceCustodyDetailLoadMatch struct {
	DeviceType string `json:"device_type"`
	Id string `json:"id"`
	SerialNumber string `json:"serial_number"`
}

// DeviceCustodyList is the typed data model for the device_custody_list entity.
type DeviceCustodyList struct {
	CompleteDate *string `json:"completeDate,omitempty"`
	Created *string `json:"created,omitempty"`
	CreatedBy map[string]any `json:"createdBy"`
	Custodian map[string]any `json:"custodian"`
	Device *map[string]any `json:"device,omitempty"`
	Id *int `json:"id,omitempty"`
	Location map[string]any `json:"location"`
	Modified *string `json:"modified,omitempty"`
	ModifiedBy map[string]any `json:"modifiedBy"`
	Notes *string `json:"notes,omitempty"`
	Status *map[string]any `json:"status,omitempty"`
	TransferMethod *map[string]any `json:"transferMethod,omitempty"`
	Version *int `json:"version,omitempty"`
}

// DeviceCustodyListListMatch is the typed request payload for DeviceCustodyList.ListTyped.
type DeviceCustodyListListMatch struct {
	DeviceType string `json:"device_type"`
	SerialNumber string `json:"serial_number"`
}

// DeviceList is the typed data model for the device_list entity.
type DeviceList struct {
	Data *[]any `json:"data,omitempty"`
	Total *int `json:"total,omitempty"`
}

// DeviceListLoadMatch is the typed request payload for DeviceList.LoadTyped.
type DeviceListLoadMatch struct {
	SharePartnerTo string `json:"share_partner_to"`
}

// DeviceReceiveResult is the typed data model for the device_receive_result entity.
type DeviceReceiveResult struct {
	Success bool `json:"success"`
}

// DeviceReceiveResultCreateData is the typed request payload for DeviceReceiveResult.CreateTyped.
type DeviceReceiveResultCreateData struct {
	Success bool `json:"success"`
}

// DeviceRkiActivateResult is the typed data model for the device_rki_activate_result entity.
type DeviceRkiActivateResult struct {
	Success bool `json:"success"`
}

// DeviceRkiActivateResultCreateData is the typed request payload for DeviceRkiActivateResult.CreateTyped.
type DeviceRkiActivateResultCreateData struct {
	Success bool `json:"success"`
}

// DeviceState is the typed data model for the device_state entity.
type DeviceState struct {
	Id *int `json:"id,omitempty"`
	Name *string `json:"name,omitempty"`
}

// DeviceStateListMatch is the typed request payload for DeviceState.ListTyped.
type DeviceStateListMatch struct {
	Id *int `json:"id,omitempty"`
	Name *string `json:"name,omitempty"`
}

// DeviceType is the typed data model for the device_type entity.
type DeviceType struct {
	Created *string `json:"created,omitempty"`
	DeviceTypeMode *string `json:"deviceTypeMode,omitempty"`
	HardwareVersion *string `json:"hardwareVersion,omitempty"`
	Id *string `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	Manufacturer *string `json:"manufacturer,omitempty"`
	Model *string `json:"model,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	PhotoUrl *string `json:"photoUrl,omitempty"`
	ProductName *string `json:"productName,omitempty"`
	Version *int `json:"version,omitempty"`
}

// DeviceTypeLoadMatch is the typed request payload for DeviceType.LoadTyped.
type DeviceTypeLoadMatch struct {
	Id string `json:"id"`
}

// DeviceTypeListMatch is the typed request payload for DeviceType.ListTyped.
type DeviceTypeListMatch struct {
	Created *string `json:"created,omitempty"`
	DeviceTypeMode *string `json:"deviceTypeMode,omitempty"`
	HardwareVersion *string `json:"hardwareVersion,omitempty"`
	Id *string `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	Manufacturer *string `json:"manufacturer,omitempty"`
	Model *string `json:"model,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	PhotoUrl *string `json:"photoUrl,omitempty"`
	ProductName *string `json:"productName,omitempty"`
	Version *int `json:"version,omitempty"`
}

// InjectKey is the typed data model for the inject_key entity.
type InjectKey struct {
	Created *string `json:"created,omitempty"`
	Id *string `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	IsP2PE *bool `json:"isP2PE,omitempty"`
	KeyType *string `json:"keyType,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	Version *int `json:"version,omitempty"`
}

// InjectKeyLoadMatch is the typed request payload for InjectKey.LoadTyped.
type InjectKeyLoadMatch struct {
	Id string `json:"id"`
}

// InjectKeyListMatch is the typed request payload for InjectKey.ListTyped.
type InjectKeyListMatch struct {
	Created *string `json:"created,omitempty"`
	Id *string `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	IsP2PE *bool `json:"isP2PE,omitempty"`
	KeyType *string `json:"keyType,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	Version *int `json:"version,omitempty"`
}

// Kif is the typed data model for the kif entity.
type Kif struct {
	Id *int `json:"id,omitempty"`
	Name *string `json:"name,omitempty"`
}

// KifListMatch is the typed request payload for Kif.ListTyped.
type KifListMatch struct {
	Id *int `json:"id,omitempty"`
	Name *string `json:"name,omitempty"`
}

// Location is the typed data model for the location entity.
type Location struct {
	Address1 *string `json:"address1,omitempty"`
	Address2 *string `json:"address2,omitempty"`
	BillingId *string `json:"billingId,omitempty"`
	City *string `json:"city,omitempty"`
	Country *string `json:"country,omitempty"`
	Created *string `json:"created,omitempty"`
	CustomReference *string `json:"customReference,omitempty"`
	Id *string `json:"id,omitempty"`
	LocationType *string `json:"locationType,omitempty"`
	MailAddress1 *string `json:"mailAddress1,omitempty"`
	MailAddress2 *string `json:"mailAddress2,omitempty"`
	MailCity *string `json:"mailCity,omitempty"`
	MailCountry *string `json:"mailCountry,omitempty"`
	MailPostalCode *string `json:"mailPostalCode,omitempty"`
	MailStateProvince *string `json:"mailStateProvince,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	NameOfBusiness *string `json:"nameOfBusiness,omitempty"`
	Notes *string `json:"notes,omitempty"`
	PostalCode *string `json:"postalCode,omitempty"`
	StateProvince *string `json:"stateProvince,omitempty"`
	UniqueId *string `json:"uniqueId,omitempty"`
	Version *int `json:"version,omitempty"`
}

// LocationLoadMatch is the typed request payload for Location.LoadTyped.
type LocationLoadMatch struct {
	Id string `json:"id"`
}

// LocationListMatch is the typed request payload for Location.ListTyped.
type LocationListMatch struct {
	Address1 *string `json:"address1,omitempty"`
	Address2 *string `json:"address2,omitempty"`
	BillingId *string `json:"billingId,omitempty"`
	City *string `json:"city,omitempty"`
	Country *string `json:"country,omitempty"`
	Created *string `json:"created,omitempty"`
	CustomReference *string `json:"customReference,omitempty"`
	Id *string `json:"id,omitempty"`
	LocationType *string `json:"locationType,omitempty"`
	MailAddress1 *string `json:"mailAddress1,omitempty"`
	MailAddress2 *string `json:"mailAddress2,omitempty"`
	MailCity *string `json:"mailCity,omitempty"`
	MailCountry *string `json:"mailCountry,omitempty"`
	MailPostalCode *string `json:"mailPostalCode,omitempty"`
	MailStateProvince *string `json:"mailStateProvince,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	NameOfBusiness *string `json:"nameOfBusiness,omitempty"`
	Notes *string `json:"notes,omitempty"`
	PostalCode *string `json:"postalCode,omitempty"`
	StateProvince *string `json:"stateProvince,omitempty"`
	UniqueId *string `json:"uniqueId,omitempty"`
	Version *int `json:"version,omitempty"`
}

// LocationCreateData is the typed request payload for Location.CreateTyped.
type LocationCreateData struct {
	Address1 *string `json:"address1,omitempty"`
	Address2 *string `json:"address2,omitempty"`
	BillingId *string `json:"billingId,omitempty"`
	City *string `json:"city,omitempty"`
	Country *string `json:"country,omitempty"`
	Created *string `json:"created,omitempty"`
	CustomReference *string `json:"customReference,omitempty"`
	Id *string `json:"id,omitempty"`
	LocationType *string `json:"locationType,omitempty"`
	MailAddress1 *string `json:"mailAddress1,omitempty"`
	MailAddress2 *string `json:"mailAddress2,omitempty"`
	MailCity *string `json:"mailCity,omitempty"`
	MailCountry *string `json:"mailCountry,omitempty"`
	MailPostalCode *string `json:"mailPostalCode,omitempty"`
	MailStateProvince *string `json:"mailStateProvince,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	NameOfBusiness *string `json:"nameOfBusiness,omitempty"`
	Notes *string `json:"notes,omitempty"`
	PostalCode *string `json:"postalCode,omitempty"`
	StateProvince *string `json:"stateProvince,omitempty"`
	UniqueId *string `json:"uniqueId,omitempty"`
	Version *int `json:"version,omitempty"`
}

// LocationRemoveMatch is the typed request payload for Location.RemoveTyped.
type LocationRemoveMatch struct {
	Id string `json:"id"`
}

// Partner is the typed data model for the partner entity.
type Partner struct {
	BillingId *string `json:"billingId,omitempty"`
	ClientCanOrderEquipment *bool `json:"clientCanOrderEquipment,omitempty"`
	Contact *map[string]any `json:"contact,omitempty"`
	Created *string `json:"created,omitempty"`
	Id *string `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	Location map[string]any `json:"location"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	Parent *map[string]any `json:"parent,omitempty"`
	PartnerId *string `json:"partnerId,omitempty"`
	Reference *string `json:"reference,omitempty"`
	VerificationPhrase *string `json:"verificationPhrase,omitempty"`
	Version *int `json:"version,omitempty"`
}

// PartnerLoadMatch is the typed request payload for Partner.LoadTyped.
type PartnerLoadMatch struct {
	Id string `json:"id"`
}

// PartnerListMatch is the typed request payload for Partner.ListTyped.
type PartnerListMatch struct {
	BillingId *string `json:"billingId,omitempty"`
	ClientCanOrderEquipment *bool `json:"clientCanOrderEquipment,omitempty"`
	Contact *map[string]any `json:"contact,omitempty"`
	Created *string `json:"created,omitempty"`
	Id *string `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	Location *map[string]any `json:"location,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	Parent *map[string]any `json:"parent,omitempty"`
	PartnerId *string `json:"partnerId,omitempty"`
	Reference *string `json:"reference,omitempty"`
	VerificationPhrase *string `json:"verificationPhrase,omitempty"`
	Version *int `json:"version,omitempty"`
}

// PartnerCreateData is the typed request payload for Partner.CreateTyped.
type PartnerCreateData struct {
	BillingId *string `json:"billingId,omitempty"`
	ClientCanOrderEquipment *bool `json:"clientCanOrderEquipment,omitempty"`
	Contact *map[string]any `json:"contact,omitempty"`
	Created *string `json:"created,omitempty"`
	Id *string `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	Location map[string]any `json:"location"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	Parent *map[string]any `json:"parent,omitempty"`
	PartnerId *string `json:"partnerId,omitempty"`
	Reference *string `json:"reference,omitempty"`
	VerificationPhrase *string `json:"verificationPhrase,omitempty"`
	Version *int `json:"version,omitempty"`
}

// Shipment is the typed data model for the shipment entity.
type Shipment struct {
	Carrier *string `json:"carrier,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	Created *string `json:"created,omitempty"`
	DateReceived *string `json:"dateReceived,omitempty"`
	DateShipped *string `json:"dateShipped,omitempty"`
	DcKif *map[string]any `json:"dcKif,omitempty"`
	Id *string `json:"id,omitempty"`
	Items *[]any `json:"items,omitempty"`
	Kif *map[string]any `json:"kif,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	ShipmentType *string `json:"shipmentType,omitempty"`
	Tracking *string `json:"tracking,omitempty"`
	Version *int `json:"version,omitempty"`
}

// ShipmentLoadMatch is the typed request payload for Shipment.LoadTyped.
type ShipmentLoadMatch struct {
	Id string `json:"id"`
}

// ShipmentListMatch is the typed request payload for Shipment.ListTyped.
type ShipmentListMatch struct {
	Carrier *string `json:"carrier,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	Created *string `json:"created,omitempty"`
	DateReceived *string `json:"dateReceived,omitempty"`
	DateShipped *string `json:"dateShipped,omitempty"`
	DcKif *map[string]any `json:"dcKif,omitempty"`
	Id *string `json:"id,omitempty"`
	Items *[]any `json:"items,omitempty"`
	Kif *map[string]any `json:"kif,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	ShipmentType *string `json:"shipmentType,omitempty"`
	Tracking *string `json:"tracking,omitempty"`
	Version *int `json:"version,omitempty"`
}

// ShipmentCreateData is the typed request payload for Shipment.CreateTyped.
type ShipmentCreateData struct {
	Carrier *string `json:"carrier,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	Created *string `json:"created,omitempty"`
	DateReceived *string `json:"dateReceived,omitempty"`
	DateShipped *string `json:"dateShipped,omitempty"`
	DcKif *map[string]any `json:"dcKif,omitempty"`
	Id *string `json:"id,omitempty"`
	Items *[]any `json:"items,omitempty"`
	Kif *map[string]any `json:"kif,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	ShipmentType *string `json:"shipmentType,omitempty"`
	Tracking *string `json:"tracking,omitempty"`
	Version *int `json:"version,omitempty"`
}

// Success is the typed data model for the success entity.
type Success struct {
	Success *bool `json:"success,omitempty"`
}

// SuccessCreateData is the typed request payload for Success.CreateTyped.
type SuccessCreateData struct {
	SharePartnerTo string `json:"share_partner_to"`
	Success *bool `json:"success,omitempty"`
}

// SuccessRemoveMatch is the typed request payload for Success.RemoveTyped.
type SuccessRemoveMatch struct {
	SharePartnerTo string `json:"share_partner_to"`
}

// Transaction is the typed data model for the transaction entity.
type Transaction struct {
	AlternateKey *string `json:"alternateKey,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	ClientRef *string `json:"clientRef,omitempty"`
	Created *string `json:"created,omitempty"`
	Decrypted *int `json:"decrypted,omitempty"`
	DeviceName *string `json:"deviceName,omitempty"`
	DirectPartner *map[string]any `json:"directPartner,omitempty"`
	Encrypted *int `json:"encrypted,omitempty"`
	EndDate *string `json:"endDate,omitempty"`
	ErrCode *string `json:"errCode,omitempty"`
	ErrMessage *string `json:"errMessage,omitempty"`
	Id *string `json:"id,omitempty"`
	IpAddress *string `json:"ipAddress,omitempty"`
	IsVirtual *bool `json:"isVirtual,omitempty"`
	KeyType *string `json:"keyType,omitempty"`
	Location map[string]any `json:"location"`
	MessageId *string `json:"messageId,omitempty"`
	Method *string `json:"method,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Reference *string `json:"reference,omitempty"`
	SerialNumber *string `json:"serialNumber,omitempty"`
	StartDate *string `json:"startDate,omitempty"`
	Success *bool `json:"success,omitempty"`
	TransactionSource *string `json:"transactionSource,omitempty"`
}

// TransactionLoadMatch is the typed request payload for Transaction.LoadTyped.
type TransactionLoadMatch struct {
	Id string `json:"id"`
}

// TransactionListMatch is the typed request payload for Transaction.ListTyped.
type TransactionListMatch struct {
	AlternateKey *string `json:"alternateKey,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	ClientRef *string `json:"clientRef,omitempty"`
	Created *string `json:"created,omitempty"`
	Decrypted *int `json:"decrypted,omitempty"`
	DeviceName *string `json:"deviceName,omitempty"`
	DirectPartner *map[string]any `json:"directPartner,omitempty"`
	Encrypted *int `json:"encrypted,omitempty"`
	EndDate *string `json:"endDate,omitempty"`
	ErrCode *string `json:"errCode,omitempty"`
	ErrMessage *string `json:"errMessage,omitempty"`
	Id *string `json:"id,omitempty"`
	IpAddress *string `json:"ipAddress,omitempty"`
	IsVirtual *bool `json:"isVirtual,omitempty"`
	KeyType *string `json:"keyType,omitempty"`
	Location *map[string]any `json:"location,omitempty"`
	MessageId *string `json:"messageId,omitempty"`
	Method *string `json:"method,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Reference *string `json:"reference,omitempty"`
	SerialNumber *string `json:"serialNumber,omitempty"`
	StartDate *string `json:"startDate,omitempty"`
	Success *bool `json:"success,omitempty"`
	TransactionSource *string `json:"transactionSource,omitempty"`
}

// TransactionCreateData is the typed request payload for Transaction.CreateTyped.
type TransactionCreateData struct {
	AlternateKey *string `json:"alternateKey,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	ClientRef *string `json:"clientRef,omitempty"`
	Created *string `json:"created,omitempty"`
	Decrypted *int `json:"decrypted,omitempty"`
	DeviceName *string `json:"deviceName,omitempty"`
	DirectPartner *map[string]any `json:"directPartner,omitempty"`
	Encrypted *int `json:"encrypted,omitempty"`
	EndDate *string `json:"endDate,omitempty"`
	ErrCode *string `json:"errCode,omitempty"`
	ErrMessage *string `json:"errMessage,omitempty"`
	Id *string `json:"id,omitempty"`
	IpAddress *string `json:"ipAddress,omitempty"`
	IsVirtual *bool `json:"isVirtual,omitempty"`
	KeyType *string `json:"keyType,omitempty"`
	Location map[string]any `json:"location"`
	MessageId *string `json:"messageId,omitempty"`
	Method *string `json:"method,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Reference *string `json:"reference,omitempty"`
	SerialNumber *string `json:"serialNumber,omitempty"`
	StartDate *string `json:"startDate,omitempty"`
	Success *bool `json:"success,omitempty"`
	TransactionSource *string `json:"transactionSource,omitempty"`
}

// UpdateResult is the typed data model for the update_result entity.
type UpdateResult struct {
	Client *map[string]any `json:"client,omitempty"`
	Email *string `json:"email,omitempty"`
	FirstName *string `json:"firstName,omitempty"`
	Id *string `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	Kif *map[string]any `json:"kif,omitempty"`
	LastName *string `json:"lastName,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Phone *string `json:"phone,omitempty"`
	UserName *string `json:"userName,omitempty"`
	UserRole *map[string]any `json:"userRole,omitempty"`
	Version *int `json:"version,omitempty"`
}

// UpdateResultListMatch is the typed request payload for UpdateResult.ListTyped.
type UpdateResultListMatch struct {
	Client *map[string]any `json:"client,omitempty"`
	Email *string `json:"email,omitempty"`
	FirstName *string `json:"firstName,omitempty"`
	Id *string `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	Kif *map[string]any `json:"kif,omitempty"`
	LastName *string `json:"lastName,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Phone *string `json:"phone,omitempty"`
	UserName *string `json:"userName,omitempty"`
	UserRole *map[string]any `json:"userRole,omitempty"`
	Version *int `json:"version,omitempty"`
}

// UpdateResultCreateData is the typed request payload for UpdateResult.CreateTyped.
type UpdateResultCreateData struct {
	Client *map[string]any `json:"client,omitempty"`
	Email *string `json:"email,omitempty"`
	FirstName *string `json:"firstName,omitempty"`
	Id *string `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	Kif *map[string]any `json:"kif,omitempty"`
	LastName *string `json:"lastName,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Phone *string `json:"phone,omitempty"`
	UserName *string `json:"userName,omitempty"`
	UserRole *map[string]any `json:"userRole,omitempty"`
	Version *int `json:"version,omitempty"`
}

// UpdateResultUpdateData is the typed request payload for UpdateResult.UpdateTyped.
type UpdateResultUpdateData struct {
	Id string `json:"id"`
	Client *map[string]any `json:"client,omitempty"`
	Email *string `json:"email,omitempty"`
	FirstName *string `json:"firstName,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	Kif *map[string]any `json:"kif,omitempty"`
	LastName *string `json:"lastName,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Phone *string `json:"phone,omitempty"`
	UserName *string `json:"userName,omitempty"`
	UserRole *map[string]any `json:"userRole,omitempty"`
	Version *int `json:"version,omitempty"`
}

// User is the typed data model for the user entity.
type User struct {
	Client *map[string]any `json:"client,omitempty"`
	Created *string `json:"created,omitempty"`
	Email *string `json:"email,omitempty"`
	FirstName *string `json:"firstName,omitempty"`
	Id *string `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	Kif *map[string]any `json:"kif,omitempty"`
	LastName *string `json:"lastName,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Phone *string `json:"phone,omitempty"`
	UserName *string `json:"userName,omitempty"`
	UserRole *map[string]any `json:"userRole,omitempty"`
	Version *int `json:"version,omitempty"`
}

// UserLoadMatch is the typed request payload for User.LoadTyped.
type UserLoadMatch struct {
	Id string `json:"id"`
}

// UserRemoveMatch is the typed request payload for User.RemoveTyped.
type UserRemoveMatch struct {
	Id string `json:"id"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// entityData unwraps an entity to its data map.
//
// Operations resolve to the ENTITY, not the raw data (see AGENTS.md), and an
// entity's fields are UNEXPORTED — marshalling one directly yields `{}`, so
// every typed accessor would silently hand back a zero-valued struct. The
// typed boundary therefore takes the data hop first.
func entityData(v any) any {
	if ent, ok := v.(core.Entity); ok {
		return ent.Data()
	}
	return v
}

// typedFrom decodes a runtime value (an entity, or the map[string]any the op
// pipeline produced) into a typed model T via a JSON round-trip. On any error
// it returns the zero value of T; the op's own (value, error) tuple carries
// the real error.
func typedFrom[T any](v any) T {
	var out T
	v = entityData(v)
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value into a typed slice []T via a
// JSON round-trip, for list ops. `list` resolves to a slice of ENTITY
// instances, so each element takes the data hop.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	if list, ok := v.([]any); ok {
		unwrapped := make([]any, 0, len(list))
		for _, item := range list {
			unwrapped = append(unwrapped, entityData(item))
		}
		v = unwrapped
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

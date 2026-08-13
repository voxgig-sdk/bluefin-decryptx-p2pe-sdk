<?php
declare(strict_types=1);

// Typed models for the BluefinDecryptxP2pe SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Attestation entity data model. */
class Attestation
{
    public ?array $client = null;
    public ?string $completeDate = null;
    public ?string $created = null;
    public ?array $device = null;
    public ?string $id = null;
    public ?string $name = null;
    public ?string $notes = null;
}

/** Request payload for Attestation#load. */
class AttestationLoadMatch
{
    public string $id;
}

/** Request payload for Attestation#list. */
class AttestationListMatch
{
    public ?array $client = null;
    public ?string $completeDate = null;
    public ?string $created = null;
    public ?array $device = null;
    public ?string $id = null;
    public ?string $name = null;
    public ?string $notes = null;
}

/** Request payload for Attestation#create. */
class AttestationCreateData
{
    public ?array $client = null;
    public ?string $completeDate = null;
    public ?string $created = null;
    public ?array $device = null;
    public ?string $id = null;
    public ?string $name = null;
    public ?string $notes = null;
}

/** Client entity data model. */
class Client
{
    public ?array $contact = null;
    public ?string $created = null;
    public ?array $directPartner = null;
    public ?string $id = null;
    public ?bool $isActive = null;
    public array $location;
    public ?string $mid = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $partner = null;
    public ?int $version = null;
}

/** Request payload for Client#load. */
class ClientLoadMatch
{
    public string $id;
}

/** Request payload for Client#list. */
class ClientListMatch
{
    public ?array $contact = null;
    public ?string $created = null;
    public ?array $directPartner = null;
    public ?string $id = null;
    public ?bool $isActive = null;
    public ?array $location = null;
    public ?string $mid = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $partner = null;
    public ?int $version = null;
}

/** Request payload for Client#create. */
class ClientCreateData
{
    public ?array $contact = null;
    public ?string $created = null;
    public ?array $directPartner = null;
    public ?string $id = null;
    public ?bool $isActive = null;
    public array $location;
    public ?string $mid = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $partner = null;
    public ?int $version = null;
}

/** Request payload for Client#remove. */
class ClientRemoveMatch
{
    public string $id;
}

/** CreateResult entity data model. */
class CreateResult
{
}

/** Request payload for CreateResult#create. */
class CreateResultCreateData
{
    public string $device_type;
    public string $serial_number;
}

/** Decryption entity data model. */
class Decryption
{
    public ?bool $success = null;
}

/** Request payload for Decryption#create. */
class DecryptionCreateData
{
    public ?bool $success = null;
}

/** Device entity data model. */
class Device
{
    public array $activatedBy;
    public ?string $activationDate = null;
    public ?string $alternateKey = null;
    public ?string $auditNextDate = null;
    public ?string $auditNotificationDate = null;
    public ?array $client = null;
    public ?string $created = null;
    public array $createdBy;
    public ?array $deviceBuild = null;
    public ?array $deviceState = null;
    public ?array $deviceType = null;
    public ?int $errorCounter = null;
    public ?string $errorLastDate = null;
    public ?string $id = null;
    public array $initializedBy;
    public ?string $initializedDate = null;
    public ?array $injectKey = null;
    public ?bool $isVirtual = null;
    public ?array $kif = null;
    public ?string $lastActivityDate = null;
    public array $location;
    public ?string $modified = null;
    public array $modifiedBy;
    public ?string $name = null;
    public ?string $notes = null;
    public ?array $partner = null;
    public ?string $serialNumber = null;
    public ?int $version = null;
}

/** Request payload for Device#load. */
class DeviceLoadMatch
{
    public ?string $device_type = null;
    public ?string $serial_number = null;
    public ?string $id = null;
}

/** Request payload for Device#list. */
class DeviceListMatch
{
    public ?array $activatedBy = null;
    public ?string $activationDate = null;
    public ?string $alternateKey = null;
    public ?string $auditNextDate = null;
    public ?string $auditNotificationDate = null;
    public ?array $client = null;
    public ?string $created = null;
    public ?array $createdBy = null;
    public ?array $deviceBuild = null;
    public ?array $deviceState = null;
    public ?array $deviceType = null;
    public ?int $errorCounter = null;
    public ?string $errorLastDate = null;
    public ?string $id = null;
    public ?array $initializedBy = null;
    public ?string $initializedDate = null;
    public ?array $injectKey = null;
    public ?bool $isVirtual = null;
    public ?array $kif = null;
    public ?string $lastActivityDate = null;
    public ?array $location = null;
    public ?string $modified = null;
    public ?array $modifiedBy = null;
    public ?string $name = null;
    public ?string $notes = null;
    public ?array $partner = null;
    public ?string $serialNumber = null;
    public ?int $version = null;
}

/** Request payload for Device#create. */
class DeviceCreateData
{
    public array $activatedBy;
    public ?string $activationDate = null;
    public ?string $alternateKey = null;
    public ?string $auditNextDate = null;
    public ?string $auditNotificationDate = null;
    public ?array $client = null;
    public ?string $created = null;
    public array $createdBy;
    public ?array $deviceBuild = null;
    public ?array $deviceState = null;
    public ?array $deviceType = null;
    public ?int $errorCounter = null;
    public ?string $errorLastDate = null;
    public ?string $id = null;
    public array $initializedBy;
    public ?string $initializedDate = null;
    public ?array $injectKey = null;
    public ?bool $isVirtual = null;
    public ?array $kif = null;
    public ?string $lastActivityDate = null;
    public array $location;
    public ?string $modified = null;
    public array $modifiedBy;
    public ?string $name = null;
    public ?string $notes = null;
    public ?array $partner = null;
    public ?string $serialNumber = null;
    public ?int $version = null;
}

/** DeviceBuild entity data model. */
class DeviceBuild
{
    public ?string $appVersion = null;
    public ?string $buildNumber = null;
    public ?string $configFileName = null;
    public ?string $created = null;
    public ?string $deviceType = null;
    public ?string $firmwareVersion = null;
    public ?string $hardwareVersion = null;
    public ?int $id = null;
    public ?bool $isActive = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?string $notes = null;
    public ?int $version = null;
    public ?string $whiteListingBinRanges = null;
    public ?bool $whiteListingUsed = null;
}

/** Request payload for DeviceBuild#load. */
class DeviceBuildLoadMatch
{
    public string $id;
}

/** Request payload for DeviceBuild#list. */
class DeviceBuildListMatch
{
    public ?string $appVersion = null;
    public ?string $buildNumber = null;
    public ?string $configFileName = null;
    public ?string $created = null;
    public ?string $deviceType = null;
    public ?string $firmwareVersion = null;
    public ?string $hardwareVersion = null;
    public ?int $id = null;
    public ?bool $isActive = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?string $notes = null;
    public ?int $version = null;
    public ?string $whiteListingBinRanges = null;
    public ?bool $whiteListingUsed = null;
}

/** DeviceCustodyDetail entity data model. */
class DeviceCustodyDetail
{
    public ?string $completeDate = null;
    public ?string $created = null;
    public array $createdBy;
    public array $custodian;
    public ?array $device = null;
    public ?int $id = null;
    public array $location;
    public ?string $modified = null;
    public array $modifiedBy;
    public ?string $notes = null;
    public ?array $status = null;
    public ?array $transferMethod = null;
    public ?int $version = null;
}

/** Request payload for DeviceCustodyDetail#load. */
class DeviceCustodyDetailLoadMatch
{
    public string $device_type;
    public string $id;
    public string $serial_number;
}

/** DeviceCustodyList entity data model. */
class DeviceCustodyList
{
    public ?string $completeDate = null;
    public ?string $created = null;
    public array $createdBy;
    public array $custodian;
    public ?array $device = null;
    public ?int $id = null;
    public array $location;
    public ?string $modified = null;
    public array $modifiedBy;
    public ?string $notes = null;
    public ?array $status = null;
    public ?array $transferMethod = null;
    public ?int $version = null;
}

/** Request payload for DeviceCustodyList#list. */
class DeviceCustodyListListMatch
{
    public string $device_type;
    public string $serial_number;
}

/** DeviceList entity data model. */
class DeviceList
{
    public ?array $data = null;
    public ?int $total = null;
}

/** Request payload for DeviceList#load. */
class DeviceListLoadMatch
{
    public string $share_partner_to;
}

/** DeviceReceiveResult entity data model. */
class DeviceReceiveResult
{
    public bool $success;
}

/** Request payload for DeviceReceiveResult#create. */
class DeviceReceiveResultCreateData
{
    public bool $success;
}

/** DeviceRkiActivateResult entity data model. */
class DeviceRkiActivateResult
{
    public bool $success;
}

/** Request payload for DeviceRkiActivateResult#create. */
class DeviceRkiActivateResultCreateData
{
    public bool $success;
}

/** DeviceState entity data model. */
class DeviceState
{
    public ?int $id = null;
    public ?string $name = null;
}

/** Request payload for DeviceState#list. */
class DeviceStateListMatch
{
    public ?int $id = null;
    public ?string $name = null;
}

/** DeviceType entity data model. */
class DeviceType
{
    public ?string $created = null;
    public ?string $deviceTypeMode = null;
    public ?string $hardwareVersion = null;
    public ?string $id = null;
    public ?bool $isActive = null;
    public ?string $manufacturer = null;
    public ?string $model = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?string $photoUrl = null;
    public ?string $productName = null;
    public ?int $version = null;
}

/** Request payload for DeviceType#load. */
class DeviceTypeLoadMatch
{
    public string $id;
}

/** Request payload for DeviceType#list. */
class DeviceTypeListMatch
{
    public ?string $created = null;
    public ?string $deviceTypeMode = null;
    public ?string $hardwareVersion = null;
    public ?string $id = null;
    public ?bool $isActive = null;
    public ?string $manufacturer = null;
    public ?string $model = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?string $photoUrl = null;
    public ?string $productName = null;
    public ?int $version = null;
}

/** InjectKey entity data model. */
class InjectKey
{
    public ?string $created = null;
    public ?string $id = null;
    public ?bool $isActive = null;
    public ?bool $isP2PE = null;
    public ?string $keyType = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?int $version = null;
}

/** Request payload for InjectKey#load. */
class InjectKeyLoadMatch
{
    public string $id;
}

/** Request payload for InjectKey#list. */
class InjectKeyListMatch
{
    public ?string $created = null;
    public ?string $id = null;
    public ?bool $isActive = null;
    public ?bool $isP2PE = null;
    public ?string $keyType = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?int $version = null;
}

/** Kif entity data model. */
class Kif
{
    public ?int $id = null;
    public ?string $name = null;
}

/** Request payload for Kif#list. */
class KifListMatch
{
    public ?int $id = null;
    public ?string $name = null;
}

/** Location entity data model. */
class Location
{
    public ?string $address1 = null;
    public ?string $address2 = null;
    public ?string $billingId = null;
    public ?string $city = null;
    public ?string $country = null;
    public ?string $created = null;
    public ?string $customReference = null;
    public ?string $id = null;
    public ?string $locationType = null;
    public ?string $mailAddress1 = null;
    public ?string $mailAddress2 = null;
    public ?string $mailCity = null;
    public ?string $mailCountry = null;
    public ?string $mailPostalCode = null;
    public ?string $mailStateProvince = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?string $nameOfBusiness = null;
    public ?string $notes = null;
    public ?string $postalCode = null;
    public ?string $stateProvince = null;
    public ?string $uniqueId = null;
    public ?int $version = null;
}

/** Request payload for Location#load. */
class LocationLoadMatch
{
    public string $id;
}

/** Request payload for Location#list. */
class LocationListMatch
{
    public ?string $address1 = null;
    public ?string $address2 = null;
    public ?string $billingId = null;
    public ?string $city = null;
    public ?string $country = null;
    public ?string $created = null;
    public ?string $customReference = null;
    public ?string $id = null;
    public ?string $locationType = null;
    public ?string $mailAddress1 = null;
    public ?string $mailAddress2 = null;
    public ?string $mailCity = null;
    public ?string $mailCountry = null;
    public ?string $mailPostalCode = null;
    public ?string $mailStateProvince = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?string $nameOfBusiness = null;
    public ?string $notes = null;
    public ?string $postalCode = null;
    public ?string $stateProvince = null;
    public ?string $uniqueId = null;
    public ?int $version = null;
}

/** Request payload for Location#create. */
class LocationCreateData
{
    public ?string $address1 = null;
    public ?string $address2 = null;
    public ?string $billingId = null;
    public ?string $city = null;
    public ?string $country = null;
    public ?string $created = null;
    public ?string $customReference = null;
    public ?string $id = null;
    public ?string $locationType = null;
    public ?string $mailAddress1 = null;
    public ?string $mailAddress2 = null;
    public ?string $mailCity = null;
    public ?string $mailCountry = null;
    public ?string $mailPostalCode = null;
    public ?string $mailStateProvince = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?string $nameOfBusiness = null;
    public ?string $notes = null;
    public ?string $postalCode = null;
    public ?string $stateProvince = null;
    public ?string $uniqueId = null;
    public ?int $version = null;
}

/** Request payload for Location#remove. */
class LocationRemoveMatch
{
    public string $id;
}

/** Partner entity data model. */
class Partner
{
    public ?string $billingId = null;
    public ?bool $clientCanOrderEquipment = null;
    public ?array $contact = null;
    public ?string $created = null;
    public ?string $id = null;
    public ?bool $isActive = null;
    public array $location;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $parent = null;
    public ?string $partnerId = null;
    public ?string $reference = null;
    public ?string $verificationPhrase = null;
    public ?int $version = null;
}

/** Request payload for Partner#load. */
class PartnerLoadMatch
{
    public string $id;
}

/** Request payload for Partner#list. */
class PartnerListMatch
{
    public ?string $billingId = null;
    public ?bool $clientCanOrderEquipment = null;
    public ?array $contact = null;
    public ?string $created = null;
    public ?string $id = null;
    public ?bool $isActive = null;
    public ?array $location = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $parent = null;
    public ?string $partnerId = null;
    public ?string $reference = null;
    public ?string $verificationPhrase = null;
    public ?int $version = null;
}

/** Request payload for Partner#create. */
class PartnerCreateData
{
    public ?string $billingId = null;
    public ?bool $clientCanOrderEquipment = null;
    public ?array $contact = null;
    public ?string $created = null;
    public ?string $id = null;
    public ?bool $isActive = null;
    public array $location;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $parent = null;
    public ?string $partnerId = null;
    public ?string $reference = null;
    public ?string $verificationPhrase = null;
    public ?int $version = null;
}

/** Shipment entity data model. */
class Shipment
{
    public ?string $carrier = null;
    public ?array $client = null;
    public ?string $created = null;
    public ?string $dateReceived = null;
    public ?string $dateShipped = null;
    public ?array $dcKif = null;
    public ?string $id = null;
    public ?array $items = null;
    public ?array $kif = null;
    public ?string $modified = null;
    public ?array $partner = null;
    public ?string $shipmentType = null;
    public ?string $tracking = null;
    public ?int $version = null;
}

/** Request payload for Shipment#load. */
class ShipmentLoadMatch
{
    public string $id;
}

/** Request payload for Shipment#list. */
class ShipmentListMatch
{
    public ?string $carrier = null;
    public ?array $client = null;
    public ?string $created = null;
    public ?string $dateReceived = null;
    public ?string $dateShipped = null;
    public ?array $dcKif = null;
    public ?string $id = null;
    public ?array $items = null;
    public ?array $kif = null;
    public ?string $modified = null;
    public ?array $partner = null;
    public ?string $shipmentType = null;
    public ?string $tracking = null;
    public ?int $version = null;
}

/** Request payload for Shipment#create. */
class ShipmentCreateData
{
    public ?string $carrier = null;
    public ?array $client = null;
    public ?string $created = null;
    public ?string $dateReceived = null;
    public ?string $dateShipped = null;
    public ?array $dcKif = null;
    public ?string $id = null;
    public ?array $items = null;
    public ?array $kif = null;
    public ?string $modified = null;
    public ?array $partner = null;
    public ?string $shipmentType = null;
    public ?string $tracking = null;
    public ?int $version = null;
}

/** Success entity data model. */
class Success
{
    public ?bool $success = null;
}

/** Request payload for Success#create. */
class SuccessCreateData
{
    public string $share_partner_to;
    public ?bool $success = null;
}

/** Request payload for Success#remove. */
class SuccessRemoveMatch
{
    public string $share_partner_to;
}

/** Transaction entity data model. */
class Transaction
{
    public ?string $alternateKey = null;
    public ?array $client = null;
    public ?string $clientRef = null;
    public ?string $created = null;
    public ?int $decrypted = null;
    public ?string $deviceName = null;
    public ?array $directPartner = null;
    public ?int $encrypted = null;
    public ?string $endDate = null;
    public ?string $errCode = null;
    public ?string $errMessage = null;
    public ?string $id = null;
    public ?string $ipAddress = null;
    public ?bool $isVirtual = null;
    public ?string $keyType = null;
    public array $location;
    public ?string $messageId = null;
    public ?string $method = null;
    public ?array $partner = null;
    public ?string $reference = null;
    public ?string $serialNumber = null;
    public ?string $startDate = null;
    public ?bool $success = null;
    public ?string $transactionSource = null;
}

/** Request payload for Transaction#load. */
class TransactionLoadMatch
{
    public string $id;
}

/** Request payload for Transaction#list. */
class TransactionListMatch
{
    public ?string $alternateKey = null;
    public ?array $client = null;
    public ?string $clientRef = null;
    public ?string $created = null;
    public ?int $decrypted = null;
    public ?string $deviceName = null;
    public ?array $directPartner = null;
    public ?int $encrypted = null;
    public ?string $endDate = null;
    public ?string $errCode = null;
    public ?string $errMessage = null;
    public ?string $id = null;
    public ?string $ipAddress = null;
    public ?bool $isVirtual = null;
    public ?string $keyType = null;
    public ?array $location = null;
    public ?string $messageId = null;
    public ?string $method = null;
    public ?array $partner = null;
    public ?string $reference = null;
    public ?string $serialNumber = null;
    public ?string $startDate = null;
    public ?bool $success = null;
    public ?string $transactionSource = null;
}

/** Request payload for Transaction#create. */
class TransactionCreateData
{
    public ?string $alternateKey = null;
    public ?array $client = null;
    public ?string $clientRef = null;
    public ?string $created = null;
    public ?int $decrypted = null;
    public ?string $deviceName = null;
    public ?array $directPartner = null;
    public ?int $encrypted = null;
    public ?string $endDate = null;
    public ?string $errCode = null;
    public ?string $errMessage = null;
    public ?string $id = null;
    public ?string $ipAddress = null;
    public ?bool $isVirtual = null;
    public ?string $keyType = null;
    public array $location;
    public ?string $messageId = null;
    public ?string $method = null;
    public ?array $partner = null;
    public ?string $reference = null;
    public ?string $serialNumber = null;
    public ?string $startDate = null;
    public ?bool $success = null;
    public ?string $transactionSource = null;
}

/** UpdateResult entity data model. */
class UpdateResult
{
    public ?array $client = null;
    public ?string $email = null;
    public ?string $firstName = null;
    public ?string $id = null;
    public ?bool $isActive = null;
    public ?array $kif = null;
    public ?string $lastName = null;
    public ?array $partner = null;
    public ?string $phone = null;
    public ?string $userName = null;
    public ?array $userRole = null;
    public ?int $version = null;
}

/** Request payload for UpdateResult#list. */
class UpdateResultListMatch
{
    public ?array $client = null;
    public ?string $email = null;
    public ?string $firstName = null;
    public ?string $id = null;
    public ?bool $isActive = null;
    public ?array $kif = null;
    public ?string $lastName = null;
    public ?array $partner = null;
    public ?string $phone = null;
    public ?string $userName = null;
    public ?array $userRole = null;
    public ?int $version = null;
}

/** Request payload for UpdateResult#create. */
class UpdateResultCreateData
{
    public ?array $client = null;
    public ?string $email = null;
    public ?string $firstName = null;
    public ?string $id = null;
    public ?bool $isActive = null;
    public ?array $kif = null;
    public ?string $lastName = null;
    public ?array $partner = null;
    public ?string $phone = null;
    public ?string $userName = null;
    public ?array $userRole = null;
    public ?int $version = null;
}

/** Request payload for UpdateResult#update. */
class UpdateResultUpdateData
{
    public string $id;
    public ?array $client = null;
    public ?string $email = null;
    public ?string $firstName = null;
    public ?bool $isActive = null;
    public ?array $kif = null;
    public ?string $lastName = null;
    public ?array $partner = null;
    public ?string $phone = null;
    public ?string $userName = null;
    public ?array $userRole = null;
    public ?int $version = null;
}

/** User entity data model. */
class User
{
    public ?array $client = null;
    public ?string $created = null;
    public ?string $email = null;
    public ?string $firstName = null;
    public ?string $id = null;
    public ?bool $isActive = null;
    public ?array $kif = null;
    public ?string $lastName = null;
    public ?string $modified = null;
    public ?array $partner = null;
    public ?string $phone = null;
    public ?string $userName = null;
    public ?array $userRole = null;
    public ?int $version = null;
}

/** Request payload for User#load. */
class UserLoadMatch
{
    public string $id;
}

/** Request payload for User#remove. */
class UserRemoveMatch
{
    public string $id;
}


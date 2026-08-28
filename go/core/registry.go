package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewAuditFeatureFunc func() Feature

var NewClienttrackFeatureFunc func() Feature

var NewIdempotencyFeatureFunc func() Feature

var NewLogFeatureFunc func() Feature

var NewMetricsFeatureFunc func() Feature

var NewPagingFeatureFunc func() Feature

var NewRatelimitFeatureFunc func() Feature

var NewRetryFeatureFunc func() Feature

var NewTelemetryFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewTimeoutFeatureFunc func() Feature

var NewAttestationEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewClientEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewCreateResultEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewDecryptionEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewDeviceEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewDeviceBuildEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewDeviceCustodyDetailEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewDeviceCustodyListEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewDeviceListEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewDeviceReceiveResultEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewDeviceRkiActivateResultEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewDeviceStateEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewDeviceTypeEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewInjectKeyEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewKifEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewLocationEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewPartnerEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewShipmentEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewSuccessEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewTransactionEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewUpdateResultEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity

var NewUserEntityFunc func(client *BluefinDecryptxP2peSDK, entopts map[string]any) BluefinDecryptxP2peEntity


package voxgigbluefindecryptxp2pesdk

import (
	"github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/go/core"
	"github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/go/entity"
	"github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/go/feature"
	_ "github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/go/utility"
)

// Type aliases preserve external API.
type BluefinDecryptxP2peSDK = core.BluefinDecryptxP2peSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type BluefinDecryptxP2peEntity = core.BluefinDecryptxP2peEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type BluefinDecryptxP2peError = core.BluefinDecryptxP2peError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewAttestationEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewAttestationEntity(client, entopts)
	}
	core.NewClientEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewClientEntity(client, entopts)
	}
	core.NewCreateResultEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewCreateResultEntity(client, entopts)
	}
	core.NewDecryptionEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewDecryptionEntity(client, entopts)
	}
	core.NewDeviceEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewDeviceEntity(client, entopts)
	}
	core.NewDeviceBuildEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewDeviceBuildEntity(client, entopts)
	}
	core.NewDeviceCustodyDetailEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewDeviceCustodyDetailEntity(client, entopts)
	}
	core.NewDeviceCustodyListEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewDeviceCustodyListEntity(client, entopts)
	}
	core.NewDeviceListEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewDeviceListEntity(client, entopts)
	}
	core.NewDeviceReceiveResultEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewDeviceReceiveResultEntity(client, entopts)
	}
	core.NewDeviceRkiActivateResultEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewDeviceRkiActivateResultEntity(client, entopts)
	}
	core.NewDeviceStateEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewDeviceStateEntity(client, entopts)
	}
	core.NewDeviceTypeEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewDeviceTypeEntity(client, entopts)
	}
	core.NewInjectKeyEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewInjectKeyEntity(client, entopts)
	}
	core.NewKifEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewKifEntity(client, entopts)
	}
	core.NewLocationEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewLocationEntity(client, entopts)
	}
	core.NewPartnerEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewPartnerEntity(client, entopts)
	}
	core.NewShipmentEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewShipmentEntity(client, entopts)
	}
	core.NewSuccessEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewSuccessEntity(client, entopts)
	}
	core.NewTransactionEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewTransactionEntity(client, entopts)
	}
	core.NewUpdateResultEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewUpdateResultEntity(client, entopts)
	}
	core.NewUserEntityFunc = func(client *core.BluefinDecryptxP2peSDK, entopts map[string]any) core.BluefinDecryptxP2peEntity {
		return entity.NewUserEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewBluefinDecryptxP2peSDK = core.NewBluefinDecryptxP2peSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var SharedConfig = core.SharedConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewBluefinDecryptxP2peSDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *BluefinDecryptxP2peSDK  { return NewBluefinDecryptxP2peSDK(nil) }
func Test() *BluefinDecryptxP2peSDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature

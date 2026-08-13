package core

import (
	"fmt"
	"strings"

	vs "github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/go/utility/struct"
)

type BluefinDecryptxP2peSDK struct {
	Mode     string
	options  map[string]any
	utility  *Utility
	Features []Feature
	rootctx  *Context
}

func NewBluefinDecryptxP2peSDK(options map[string]any) *BluefinDecryptxP2peSDK {
	sdk := &BluefinDecryptxP2peSDK{
		Mode:     "live",
		Features: []Feature{},
	}

	sdk.utility = NewUtility()

	config := MakeConfig()

	sdk.rootctx = sdk.utility.MakeContext(map[string]any{
		"client":  sdk,
		"utility": sdk.utility,
		"config":  config,
		"options": options,
		"shared":  map[string]any{},
	}, nil)

	sdk.options = sdk.utility.MakeOptions(sdk.rootctx)

	if vs.GetPath([]any{"feature", "test", "active"}, sdk.options) == true {
		sdk.Mode = "test"
	}

	sdk.rootctx.Options = sdk.options

	// Add features in the resolved order (MakeOptions puts an explicit array
	// order first, else defaults to test-first). Ordering matters: the `test`
	// feature installs the base mock transport and the transport features
	// (retry/cache/netsim/proxy/ratelimit) wrap whatever is current, so `test`
	// must be added before them to sit at the base of the chain.
	featureOpts := ToMapAny(vs.GetProp(sdk.options, "feature"))
	if featureOpts != nil {
		if fo, ok := vs.GetPath([]any{"__derived__", "featureorder"}, sdk.options).([]any); ok {
			for _, n := range fo {
				fname, _ := n.(string)
				fopts := ToMapAny(featureOpts[fname])
				if fopts != nil {
					if active, ok := fopts["active"]; ok {
						if ab, ok := active.(bool); ok && ab {
							sdk.utility.FeatureAdd(sdk.rootctx, makeFeature(fname))
						}
					}
				}
			}
		}
	}

	// Add extension features.
	if extend := vs.GetProp(sdk.options, "extend"); extend != nil {
		if extList, ok := extend.([]any); ok {
			for _, f := range extList {
				if feat, ok := f.(Feature); ok {
					sdk.utility.FeatureAdd(sdk.rootctx, feat)
				}
			}
		}
	}

	// Initialize features.
	for _, f := range sdk.Features {
		sdk.utility.FeatureInit(sdk.rootctx, f)
	}

	sdk.utility.FeatureHook(sdk.rootctx, "PostConstruct")

	return sdk
}

func (sdk *BluefinDecryptxP2peSDK) OptionsMap() map[string]any {
	out := vs.Clone(sdk.options)
	if om, ok := out.(map[string]any); ok {
		return om
	}
	return map[string]any{}
}

func (sdk *BluefinDecryptxP2peSDK) GetUtility() *Utility {
	return CopyUtility(sdk.utility)
}

func (sdk *BluefinDecryptxP2peSDK) GetRootCtx() *Context {
	return sdk.rootctx
}

func (sdk *BluefinDecryptxP2peSDK) Prepare(fetchargs map[string]any) (map[string]any, error) {
	utility := sdk.utility

	if fetchargs == nil {
		fetchargs = map[string]any{}
	}

	var ctrl map[string]any
	if c := vs.GetProp(fetchargs, "ctrl"); c != nil {
		if cm, ok := c.(map[string]any); ok {
			ctrl = cm
		}
	}
	if ctrl == nil {
		ctrl = map[string]any{}
	}

	ctx := utility.MakeContext(map[string]any{
		"opname": "prepare",
		"ctrl":   ctrl,
	}, sdk.rootctx)

	options := sdk.options

	path, _ := vs.GetProp(fetchargs, "path").(string)
	method, _ := vs.GetProp(fetchargs, "method").(string)
	if method == "" {
		method = "GET"
	}

	params := ToMapAny(vs.GetProp(fetchargs, "params"))
	if params == nil {
		params = map[string]any{}
	}
	query := ToMapAny(vs.GetProp(fetchargs, "query"))
	if query == nil {
		query = map[string]any{}
	}

	headers := utility.PrepareHeaders(ctx)

	base, _ := vs.GetProp(options, "base").(string)
	prefix, _ := vs.GetProp(options, "prefix").(string)
	suffix, _ := vs.GetProp(options, "suffix").(string)

	ctx.Spec = NewSpec(map[string]any{
		"base":    base,
		"prefix":  prefix,
		"suffix":  suffix,
		"path":    path,
		"method":  method,
		"params":  params,
		"query":   query,
		"headers": headers,
		"body":    vs.GetProp(fetchargs, "body"),
		"step":    "start",
	})

	// Merge user-provided headers.
	if uh := vs.GetProp(fetchargs, "headers"); uh != nil {
		if uhm, ok := uh.(map[string]any); ok {
			for k, v := range uhm {
				ctx.Spec.Headers[k] = v
			}
		}
	}

	_, err := utility.PrepareAuth(ctx)
	if err != nil {
		return nil, err
	}

	return utility.MakeFetchDef(ctx)
}

// Raw endpoint access is operator-controllable, like every entity op.
// Blocking it means denying BOTH the 'direct' and 'graphql' tokens, since
// either one reaches the same endpoint.
func (sdk *BluefinDecryptxP2peSDK) Direct(fetchargs map[string]any) (map[string]any, error) {
	if !sdk.opAllowed("direct") {
		return sdk.opDenied("direct"), nil
	}

	return sdk.rawRequest(fetchargs)
}

// Is this raw-access op permitted by the SDK's allow.op option?
func (sdk *BluefinDecryptxP2peSDK) opAllowed(op string) bool {
	allowOp, _ := vs.GetPath([]any{"allow", "op"}, sdk.options).(string)
	return strings.Contains(allowOp, op)
}

func (sdk *BluefinDecryptxP2peSDK) opDenied(op string) map[string]any {
	allowOp, _ := vs.GetPath([]any{"allow", "op"}, sdk.options).(string)
	return map[string]any{
		"ok": false,
		"err": fmt.Errorf("BluefinDecryptxP2peSDK: %s: operation not allowed by"+
			" SDK option allow.op value: \"%s\"", op, allowOp),
	}
}

// Ungated request path shared by Direct and Graphql, each of which checks
// its own allow.op token first. Unexported, rather than a flag on fetchargs:
// a caller-supplied marker would let anyone opt straight back out of the
// gate by passing it.
func (sdk *BluefinDecryptxP2peSDK) rawRequest(fetchargs map[string]any) (map[string]any, error) {
	utility := sdk.utility

	fetchdef, err := sdk.Prepare(fetchargs)
	if err != nil {
		return map[string]any{"ok": false, "err": err}, nil
	}

	if fetchargs == nil {
		fetchargs = map[string]any{}
	}

	var ctrl map[string]any
	if c := vs.GetProp(fetchargs, "ctrl"); c != nil {
		if cm, ok := c.(map[string]any); ok {
			ctrl = cm
		}
	}
	if ctrl == nil {
		ctrl = map[string]any{}
	}

	ctx := utility.MakeContext(map[string]any{
		"opname": "direct",
		"ctrl":   ctrl,
	}, sdk.rootctx)

	url, _ := fetchdef["url"].(string)
	fetched, fetchErr := utility.Fetcher(ctx, url, fetchdef)

	if fetchErr != nil {
		return map[string]any{"ok": false, "err": fetchErr}, nil
	}

	if fetched == nil {
		return map[string]any{
			"ok":  false,
			"err": ctx.MakeError("direct_no_response", "response: undefined"),
		}, nil
	}

	if fm, ok := fetched.(map[string]any); ok {
		status := ToInt(vs.GetProp(fm, "status"))
		headers := vs.GetProp(fm, "headers")

		// No-body responses (204, 304) and explicit zero content-length
		// must skip JSON parsing — calling json() on an empty body errors.
		var contentLength string
		if hm, ok := headers.(map[string]any); ok {
			if cl, ok := hm["content-length"]; ok {
				contentLength = fmt.Sprintf("%v", cl)
			}
		}
		noBody := status == 204 || status == 304 || contentLength == "0"

		var jsonData any
		if !noBody {
			if jf := vs.GetProp(fm, "json"); jf != nil {
				if f, ok := jf.(func() any); ok {
					// f() returns nil on parse error in our fetcher.
					jsonData = f()
				}
			}
		}

		return map[string]any{
			"ok":      status >= 200 && status < 300,
			"status":  status,
			"headers": headers,
			"data":    jsonData,
		}, nil
	}

	return map[string]any{"ok": false, "err": ctx.MakeError("direct_invalid", "invalid response type")}, nil
}

// Raw GraphQL access: the pressure valve that makes the generated surface's
// deliberate omissions (per-call selection sets, typed filter builders,
// batching, subscriptions) livable — the whole schema stays reachable.
//
// Thin wrapper over the same prepare/fetch path Direct uses, with the one
// thing raw Direct cannot do for GraphQL: a GraphQL failure rides HTTP 200
// as a top-level `errors` array, so status alone would report a failed query
// as ok.
//
// NOTE: like Direct, this bypasses the feature pipeline — no retry,
// ratelimit or paging features apply.
func (sdk *BluefinDecryptxP2peSDK) Graphql(
	query string, variables map[string]any, ctrl map[string]any,
) (map[string]any, error) {
	if !sdk.opAllowed("graphql") {
		return sdk.opDenied("graphql"), nil
	}

	if variables == nil {
		variables = map[string]any{}
	}
	if ctrl == nil {
		ctrl = map[string]any{}
	}

	res, err := sdk.rawRequest(map[string]any{
		"method":  "POST",
		"headers": map[string]any{"content-type": "application/json"},
		"body":    map[string]any{"query": query, "variables": variables},
		"ctrl":    ctrl,
	})

	if err != nil {
		return res, err
	}

	// Errors are read BEFORE any status check: a GraphQL parse or validation
	// failure comes back as HTTP 400 carrying the standard { errors: [...] }
	// body, and the raw path represents a non-2xx as ok:false with no err —
	// so returning early on status would discard the server's own
	// diagnostics, which are the only useful part of that response.
	errors, _ := vs.GetPath([]any{"data", "errors"}, res).([]any)

	if 0 < len(errors) {
		msg, _ := vs.GetProp(errors[0], "message").(string)
		if msg == "" {
			msg = "graphql error"
		}
		res["ok"] = false
		res["err"] = fmt.Errorf("BluefinDecryptxP2peSDK: graphql: %s", msg)
		res["graphql"] = errors
	}

	return res, nil
}


// Attestation returns a Attestation entity bound to this client.
// Idiomatic usage: client.Attestation(nil).List(nil, nil) or
// client.Attestation(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) Attestation(data map[string]any) BluefinDecryptxP2peEntity {
	return NewAttestationEntityFunc(sdk, data)
}


// Client returns a Client entity bound to this client.
// Idiomatic usage: client.Client(nil).List(nil, nil) or
// client.Client(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) Client(data map[string]any) BluefinDecryptxP2peEntity {
	return NewClientEntityFunc(sdk, data)
}


// CreateResult returns a CreateResult entity bound to this client.
// Idiomatic usage: client.CreateResult(nil).List(nil, nil) or
// client.CreateResult(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) CreateResult(data map[string]any) BluefinDecryptxP2peEntity {
	return NewCreateResultEntityFunc(sdk, data)
}


// Decryption returns a Decryption entity bound to this client.
// Idiomatic usage: client.Decryption(nil).List(nil, nil) or
// client.Decryption(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) Decryption(data map[string]any) BluefinDecryptxP2peEntity {
	return NewDecryptionEntityFunc(sdk, data)
}


// Device returns a Device entity bound to this client.
// Idiomatic usage: client.Device(nil).List(nil, nil) or
// client.Device(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) Device(data map[string]any) BluefinDecryptxP2peEntity {
	return NewDeviceEntityFunc(sdk, data)
}


// DeviceBuild returns a DeviceBuild entity bound to this client.
// Idiomatic usage: client.DeviceBuild(nil).List(nil, nil) or
// client.DeviceBuild(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) DeviceBuild(data map[string]any) BluefinDecryptxP2peEntity {
	return NewDeviceBuildEntityFunc(sdk, data)
}


// DeviceCustodyDetail returns a DeviceCustodyDetail entity bound to this client.
// Idiomatic usage: client.DeviceCustodyDetail(nil).List(nil, nil) or
// client.DeviceCustodyDetail(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) DeviceCustodyDetail(data map[string]any) BluefinDecryptxP2peEntity {
	return NewDeviceCustodyDetailEntityFunc(sdk, data)
}


// DeviceCustodyList returns a DeviceCustodyList entity bound to this client.
// Idiomatic usage: client.DeviceCustodyList(nil).List(nil, nil) or
// client.DeviceCustodyList(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) DeviceCustodyList(data map[string]any) BluefinDecryptxP2peEntity {
	return NewDeviceCustodyListEntityFunc(sdk, data)
}


// DeviceList returns a DeviceList entity bound to this client.
// Idiomatic usage: client.DeviceList(nil).List(nil, nil) or
// client.DeviceList(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) DeviceList(data map[string]any) BluefinDecryptxP2peEntity {
	return NewDeviceListEntityFunc(sdk, data)
}


// DeviceReceiveResult returns a DeviceReceiveResult entity bound to this client.
// Idiomatic usage: client.DeviceReceiveResult(nil).List(nil, nil) or
// client.DeviceReceiveResult(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) DeviceReceiveResult(data map[string]any) BluefinDecryptxP2peEntity {
	return NewDeviceReceiveResultEntityFunc(sdk, data)
}


// DeviceRkiActivateResult returns a DeviceRkiActivateResult entity bound to this client.
// Idiomatic usage: client.DeviceRkiActivateResult(nil).List(nil, nil) or
// client.DeviceRkiActivateResult(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) DeviceRkiActivateResult(data map[string]any) BluefinDecryptxP2peEntity {
	return NewDeviceRkiActivateResultEntityFunc(sdk, data)
}


// DeviceState returns a DeviceState entity bound to this client.
// Idiomatic usage: client.DeviceState(nil).List(nil, nil) or
// client.DeviceState(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) DeviceState(data map[string]any) BluefinDecryptxP2peEntity {
	return NewDeviceStateEntityFunc(sdk, data)
}


// DeviceType returns a DeviceType entity bound to this client.
// Idiomatic usage: client.DeviceType(nil).List(nil, nil) or
// client.DeviceType(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) DeviceType(data map[string]any) BluefinDecryptxP2peEntity {
	return NewDeviceTypeEntityFunc(sdk, data)
}


// InjectKey returns a InjectKey entity bound to this client.
// Idiomatic usage: client.InjectKey(nil).List(nil, nil) or
// client.InjectKey(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) InjectKey(data map[string]any) BluefinDecryptxP2peEntity {
	return NewInjectKeyEntityFunc(sdk, data)
}


// Kif returns a Kif entity bound to this client.
// Idiomatic usage: client.Kif(nil).List(nil, nil) or
// client.Kif(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) Kif(data map[string]any) BluefinDecryptxP2peEntity {
	return NewKifEntityFunc(sdk, data)
}


// Location returns a Location entity bound to this client.
// Idiomatic usage: client.Location(nil).List(nil, nil) or
// client.Location(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) Location(data map[string]any) BluefinDecryptxP2peEntity {
	return NewLocationEntityFunc(sdk, data)
}


// Partner returns a Partner entity bound to this client.
// Idiomatic usage: client.Partner(nil).List(nil, nil) or
// client.Partner(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) Partner(data map[string]any) BluefinDecryptxP2peEntity {
	return NewPartnerEntityFunc(sdk, data)
}


// Shipment returns a Shipment entity bound to this client.
// Idiomatic usage: client.Shipment(nil).List(nil, nil) or
// client.Shipment(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) Shipment(data map[string]any) BluefinDecryptxP2peEntity {
	return NewShipmentEntityFunc(sdk, data)
}


// Success returns a Success entity bound to this client.
// Idiomatic usage: client.Success(nil).List(nil, nil) or
// client.Success(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) Success(data map[string]any) BluefinDecryptxP2peEntity {
	return NewSuccessEntityFunc(sdk, data)
}


// Transaction returns a Transaction entity bound to this client.
// Idiomatic usage: client.Transaction(nil).List(nil, nil) or
// client.Transaction(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) Transaction(data map[string]any) BluefinDecryptxP2peEntity {
	return NewTransactionEntityFunc(sdk, data)
}


// UpdateResult returns a UpdateResult entity bound to this client.
// Idiomatic usage: client.UpdateResult(nil).List(nil, nil) or
// client.UpdateResult(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) UpdateResult(data map[string]any) BluefinDecryptxP2peEntity {
	return NewUpdateResultEntityFunc(sdk, data)
}


// User returns a User entity bound to this client.
// Idiomatic usage: client.User(nil).List(nil, nil) or
// client.User(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinDecryptxP2peSDK) User(data map[string]any) BluefinDecryptxP2peEntity {
	return NewUserEntityFunc(sdk, data)
}



func TestSDK(testopts map[string]any, sdkopts map[string]any) *BluefinDecryptxP2peSDK {
	if sdkopts == nil {
		sdkopts = map[string]any{}
	}
	sdkopts = vs.Clone(sdkopts).(map[string]any)

	if testopts == nil {
		testopts = map[string]any{}
	}
	testopts = vs.Clone(testopts).(map[string]any)
	testopts["active"] = true

	vs.SetPath(sdkopts, []any{"feature", "test"}, testopts)

	sdk := NewBluefinDecryptxP2peSDK(sdkopts)
	sdk.Mode = "test"

	return sdk
}

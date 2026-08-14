package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "BluefinDecryptxP2pe",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
			},
		},
		"options": map[string]any{
			"base": "https://apis.p2pemanager.com/api/v1",
			"auth": map[string]any{
				"prefix": "Basic",
			},
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"attestation": map[string]any{},
				"client": map[string]any{},
				"create_result": map[string]any{},
				"decryption": map[string]any{},
				"device": map[string]any{},
				"device_build": map[string]any{},
				"device_custody_detail": map[string]any{},
				"device_custody_list": map[string]any{},
				"device_list": map[string]any{},
				"device_receive_result": map[string]any{},
				"device_rki_activate_result": map[string]any{},
				"device_state": map[string]any{},
				"device_type": map[string]any{},
				"inject_key": map[string]any{},
				"kif": map[string]any{},
				"location": map[string]any{},
				"partner": map[string]any{},
				"shipment": map[string]any{},
				"success": map[string]any{},
				"transaction": map[string]any{},
				"update_result": map[string]any{},
				"user": map[string]any{},
			},
		},
		"entity": map[string]any{
			"attestation": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "client",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "completeDate",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "created",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "device",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "notes",
						"type": "`$STRING`",
					},
				},
				"name": "attestation",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/attestations",
								"parts": []any{
									"attestations",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "client",
											"orig": "client",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/attestations",
								"parts": []any{
									"attestations",
								},
								"select": map[string]any{
									"exist": []any{
										"client",
										"skip",
										"take",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/attestations/{id}",
								"parts": []any{
									"attestations",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"client": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "contact",
						"op": map[string]any{
							"list": map[string]any{
								"req": true,
								"type": "`$OBJECT`",
							},
						},
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "created",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "directPartner",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "isActive",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "location",
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "mid",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modified",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "partner",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "version",
						"type": "`$INTEGER`",
					},
				},
				"name": "client",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/clients",
								"parts": []any{
									"clients",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "partner",
											"orig": "partner",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/clients",
								"parts": []any{
									"clients",
								},
								"select": map[string]any{
									"exist": []any{
										"partner",
										"skip",
										"take",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/clients/{id}",
								"parts": []any{
									"clients",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "DELETE",
								"orig": "/clients/{id}",
								"parts": []any{
									"clients",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"create_result": map[string]any{
				"fields": []any{},
				"name": "create_result",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "device_type",
											"orig": "device_type",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "serial_number",
											"orig": "serial_number",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/devices/{serialNumber}/{deviceType}/custody",
								"parts": []any{
									"devices",
									"{serial_number}",
									"{device_type}",
									"custody",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"deviceType": "device_type",
										"serialNumber": "serial_number",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"device_type",
										"serial_number",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"device",
						},
					},
				},
			},
			"decryption": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "success",
						"type": "`$BOOLEAN`",
					},
				},
				"name": "decryption",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/decryption",
								"parts": []any{
									"decryption",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"device": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "activatedBy",
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "activationDate",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "alternateKey",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "auditNextDate",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "auditNotificationDate",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "client",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "created",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "createdBy",
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "deviceBuild",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "deviceState",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "deviceType",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "errorCounter",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "errorLastDate",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "initializedBy",
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "initializedDate",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "injectKey",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "isVirtual",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "kif",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "lastActivityDate",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "location",
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "modified",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modifiedBy",
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "notes",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "partner",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "serialNumber",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"type": "`$INTEGER`",
					},
				},
				"name": "device",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/devices",
								"parts": []any{
									"devices",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "client",
											"orig": "client",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "device_state",
											"orig": "device_state",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "kif",
											"orig": "kif",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "partner",
											"orig": "partner",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "serial_number",
											"orig": "serial_number",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": "asc",
											"kind": "query",
											"name": "sorting_direction",
											"orig": "sorting_direction",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "serialnumber",
											"kind": "query",
											"name": "sorting_field",
											"orig": "sorting_field",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/devices",
								"parts": []any{
									"devices",
								},
								"select": map[string]any{
									"exist": []any{
										"client",
										"device_state",
										"kif",
										"partner",
										"serial_number",
										"skip",
										"sorting_direction",
										"sorting_field",
										"take",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "device_type",
											"orig": "device_type",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "serial_number",
											"orig": "serial_number",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/devices/{serialNumber}/{deviceType}",
								"parts": []any{
									"devices",
									"{serial_number}",
									"{device_type}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"deviceType": "device_type",
										"serialNumber": "serial_number",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"device_type",
										"serial_number",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/devices/{id}",
								"parts": []any{
									"devices",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"device",
						},
					},
				},
			},
			"device_build": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "appVersion",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "buildNumber",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "configFileName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "created",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "deviceType",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "firmwareVersion",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "hardwareVersion",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "isActive",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "modified",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "notes",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "whiteListingBinRanges",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "whiteListingUsed",
						"type": "`$BOOLEAN`",
					},
				},
				"name": "device_build",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "device_type",
											"orig": "device_type",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/deviceBuilds",
								"parts": []any{
									"deviceBuilds",
								},
								"select": map[string]any{
									"exist": []any{
										"device_type",
										"skip",
										"take",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/deviceBuilds/{id}",
								"parts": []any{
									"deviceBuilds",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"device_custody_detail": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "completeDate",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "created",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "createdBy",
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "custodian",
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "device",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "id",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "location",
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "modified",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modifiedBy",
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "notes",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "status",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "transferMethod",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "version",
						"type": "`$INTEGER`",
					},
				},
				"name": "device_custody_detail",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "device_type",
											"orig": "device_type",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "serial_number",
											"orig": "serial_number",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/devices/{serialNumber}/{deviceType}/custody/{id}",
								"parts": []any{
									"devices",
									"{serial_number}",
									"{device_type}",
									"custody",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"deviceType": "device_type",
										"serialNumber": "serial_number",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"device_type",
										"id",
										"serial_number",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"device",
						},
					},
				},
			},
			"device_custody_list": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "completeDate",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "created",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "createdBy",
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "custodian",
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "device",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "id",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "location",
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "modified",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modifiedBy",
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "notes",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "status",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "transferMethod",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "version",
						"type": "`$INTEGER`",
					},
				},
				"name": "device_custody_list",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "device_type",
											"orig": "device_type",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "serial_number",
											"orig": "serial_number",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/devices/{serialNumber}/{deviceType}/custody",
								"parts": []any{
									"devices",
									"{serial_number}",
									"{device_type}",
									"custody",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"deviceType": "device_type",
										"serialNumber": "serial_number",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"device_type",
										"serial_number",
										"skip",
										"take",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"device",
						},
					},
				},
			},
			"device_list": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "data",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "total",
						"type": "`$INTEGER`",
					},
				},
				"name": "device_list",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "share_partner_to",
											"orig": "share_partner_to",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": "asc",
											"kind": "query",
											"name": "sorting_direction",
											"orig": "sorting_direction",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "serialnumber",
											"kind": "query",
											"name": "sorting_field",
											"orig": "sorting_field",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/virtualDevices/{sharePartnerTo}",
								"parts": []any{
									"virtualDevices",
									"{share_partner_to}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"sharePartnerTo": "share_partner_to",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"share_partner_to",
										"skip",
										"sorting_direction",
										"sorting_field",
										"take",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"virtual_device",
						},
					},
				},
			},
			"device_receive_result": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "success",
						"req": true,
						"type": "`$BOOLEAN`",
					},
				},
				"name": "device_receive_result",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/devices/receive",
								"parts": []any{
									"devices",
									"receive",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"device_rki_activate_result": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "success",
						"req": true,
						"type": "`$BOOLEAN`",
					},
				},
				"name": "device_rki_activate_result",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/devices/rki/activate",
								"parts": []any{
									"devices",
									"rki",
									"activate",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"device_state": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
					},
				},
				"name": "device_state",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/deviceStates",
								"parts": []any{
									"deviceStates",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"device_type": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "created",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "deviceTypeMode",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "hardwareVersion",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "isActive",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "manufacturer",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "model",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modified",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "photoUrl",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"type": "`$INTEGER`",
					},
				},
				"name": "device_type",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/deviceTypes",
								"parts": []any{
									"deviceTypes",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/deviceTypes/{id}",
								"parts": []any{
									"deviceTypes",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"inject_key": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "created",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "isActive",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "isP2PE",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "keyType",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modified",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"type": "`$INTEGER`",
					},
				},
				"name": "inject_key",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/injectKeys",
								"parts": []any{
									"injectKeys",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/injectKeys/{id}",
								"parts": []any{
									"injectKeys",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"kif": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
					},
				},
				"name": "kif",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/kifs",
								"parts": []any{
									"kifs",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"location": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "address1",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "address2",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "billingId",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "city",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "country",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "created",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "customReference",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "locationType",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mailAddress1",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mailAddress2",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mailCity",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mailCountry",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mailPostalCode",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mailStateProvince",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modified",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "nameOfBusiness",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "notes",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "postalCode",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "stateProvince",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "uniqueId",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"type": "`$INTEGER`",
					},
				},
				"name": "location",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/locations",
								"parts": []any{
									"locations",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "client",
											"orig": "client",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/locations",
								"parts": []any{
									"locations",
								},
								"select": map[string]any{
									"exist": []any{
										"client",
										"skip",
										"take",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/locations/{id}",
								"parts": []any{
									"locations",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "DELETE",
								"orig": "/locations/{id}",
								"parts": []any{
									"locations",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"partner": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "billingId",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "clientCanOrderEquipment",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "contact",
						"op": map[string]any{
							"list": map[string]any{
								"req": true,
								"type": "`$OBJECT`",
							},
						},
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "created",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "isActive",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "location",
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "modified",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "parent",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "partnerId",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "reference",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "verificationPhrase",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"type": "`$INTEGER`",
					},
				},
				"name": "partner",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/partners",
								"parts": []any{
									"partners",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "partner",
											"orig": "partner",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/partners",
								"parts": []any{
									"partners",
								},
								"select": map[string]any{
									"exist": []any{
										"partner",
										"skip",
										"take",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/partners/{id}",
								"parts": []any{
									"partners",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"shipment": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "carrier",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "client",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "created",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "dateReceived",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "dateShipped",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "dcKif",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "items",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "kif",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "modified",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "partner",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "shipmentType",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "tracking",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"type": "`$INTEGER`",
					},
				},
				"name": "shipment",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/shipments",
								"parts": []any{
									"shipments",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "kif",
											"orig": "kif",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "mode",
											"orig": "mode",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/shipments",
								"parts": []any{
									"shipments",
								},
								"select": map[string]any{
									"exist": []any{
										"kif",
										"mode",
										"skip",
										"take",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/shipments/{id}",
								"parts": []any{
									"shipments",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"success": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "success",
						"type": "`$BOOLEAN`",
					},
				},
				"name": "success",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "share_partner_to",
											"orig": "share_partner_to",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/virtualDevices/{sharePartnerTo}",
								"parts": []any{
									"virtualDevices",
									"{share_partner_to}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"sharePartnerTo": "share_partner_to",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"share_partner_to",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "share_partner_to",
											"orig": "share_partner_to",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "DELETE",
								"orig": "/virtualDevices/{sharePartnerTo}",
								"parts": []any{
									"virtualDevices",
									"{share_partner_to}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"sharePartnerTo": "share_partner_to",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"share_partner_to",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"virtual_device",
						},
					},
				},
			},
			"transaction": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "alternateKey",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "client",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "clientRef",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "created",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "decrypted",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "deviceName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "directPartner",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "encrypted",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "endDate",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "errCode",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "errMessage",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "ipAddress",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "isVirtual",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "keyType",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "location",
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "messageId",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "method",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "partner",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "reference",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "serialNumber",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "startDate",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "success",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "transactionSource",
						"type": "`$STRING`",
					},
				},
				"name": "transaction",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/transactions",
								"parts": []any{
									"transactions",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "client",
											"orig": "client",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "client_ref",
											"orig": "client_ref",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "date_from",
											"orig": "date_from",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "date_to",
											"orig": "date_to",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "location",
											"orig": "location",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "message_id",
											"orig": "message_id",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "nocount",
											"kind": "query",
											"name": "paging_mode",
											"orig": "paging_mode",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "partner",
											"orig": "partner",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "reference",
											"orig": "reference",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "serial_number",
											"orig": "serial_number",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "success",
											"orig": "success",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/transactions",
								"parts": []any{
									"transactions",
								},
								"select": map[string]any{
									"exist": []any{
										"client",
										"client_ref",
										"date_from",
										"date_to",
										"location",
										"message_id",
										"paging_mode",
										"partner",
										"reference",
										"serial_number",
										"skip",
										"success",
										"take",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/transactions/{id}",
								"parts": []any{
									"transactions",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"update_result": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "client",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "email",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "firstName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "isActive",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "kif",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "lastName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "partner",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "phone",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "userName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "userRole",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "version",
						"type": "`$INTEGER`",
					},
				},
				"name": "update_result",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/users",
								"parts": []any{
									"users",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "client",
											"orig": "client",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "kif",
											"orig": "kif",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "partner",
											"orig": "partner",
											"type": "`$ANY`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/users",
								"parts": []any{
									"users",
								},
								"select": map[string]any{
									"exist": []any{
										"client",
										"kif",
										"partner",
										"skip",
										"take",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"update": map[string]any{
						"input": "data",
						"name": "update",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "PATCH",
								"orig": "/clients/{id}",
								"parts": []any{
									"clients",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "PATCH",
								"orig": "/devices/{id}",
								"parts": []any{
									"devices",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "PATCH",
								"orig": "/locations/{id}",
								"parts": []any{
									"locations",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "PATCH",
								"orig": "/partners/{id}",
								"parts": []any{
									"partners",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "PATCH",
								"orig": "/shipments/{id}",
								"parts": []any{
									"shipments",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "PATCH",
								"orig": "/transactions/{id}",
								"parts": []any{
									"transactions",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "PATCH",
								"orig": "/users/{id}",
								"parts": []any{
									"users",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"user": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "client",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "created",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "email",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "firstName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "isActive",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "kif",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "lastName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modified",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "partner",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "phone",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "userName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "userRole",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "version",
						"type": "`$INTEGER`",
					},
				},
				"name": "user",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/users/{id}",
								"parts": []any{
									"users",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "DELETE",
								"orig": "/users/{id}",
								"parts": []any{
									"users",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}

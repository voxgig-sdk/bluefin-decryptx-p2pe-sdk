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
			"slug": "bluefin-decryptx-p2pe",
			"version": "0.1.1",
			"target": "go",
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
						"short": "Reference to the associated Client resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "completeDate",
						"short": "The date and time that the Attestation took place.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "created",
						"short": "Creation timestamp in ISO 8601 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "device",
						"short": "Reference to the associated Device resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "id",
						"short": "This resource's unique identifier.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"short": "Text describing the attestation.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "notes",
						"short": "Free form field that allows the Client associate notes with the Attestation.",
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
									"res": "`body.data`",
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
						"short": "Reference to the associated User resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "created",
						"short": "Creation timestamp in ISO 8601 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "directPartner",
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "id",
						"short": "This resource's unique identifier.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "isActive",
						"short": "This property indicates if the Client account is active or disabled.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "location",
						"req": true,
						"short": "Reference to the associated Location resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "mid",
						"short": "Some Partners will have an merchant ids on their own software offerings.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modified",
						"short": "Last modified timestamp.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"short": "The Client's name.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "partner",
						"short": "Reference to the Client's root Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "version",
						"short": "The number of times that this resource has been updated.",
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
									"res": "`body.data`",
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
						"short": "true if the payload decryption was successful.",
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
						"short": "Reference to the associated User resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "activationDate",
						"short": "Timestamp from when the Device was activated.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "alternateKey",
						"short": "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "auditNextDate",
						"short": "Date and time that the Device is due its next PCI Audit.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "auditNotificationDate",
						"short": "Date and time that a notification should be sent that a PCI audit is due.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "client",
						"short": "Reference to the associated Client resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "created",
						"short": "Creation timestamp in ISO 8601 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "createdBy",
						"req": true,
						"short": "Reference to the associated User resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "deviceBuild",
						"short": "Reference to the associated Device Build resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "deviceState",
						"short": "Reference to the associated Device State resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "deviceType",
						"short": "Reference to the associated Device Type resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "errorCounter",
						"short": "The number times the Device has been in error.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "errorLastDate",
						"short": "Timestamp from the last time that the Device had an error.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"short": "The Device's unique identifier.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "initializedBy",
						"req": true,
						"short": "Reference to the associated User resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "initializedDate",
						"short": "Timestamp from when the Device was initialized.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "injectKey",
						"short": "Reference to the associated Device resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "isVirtual",
						"short": "Indicates if a Device is Virtual (represents a Device shared with a partner).",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "kif",
						"short": "Reference to the associated KIF resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "lastActivityDate",
						"short": "Timestamp from the last time that the Device was used.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "location",
						"req": true,
						"short": "Reference to the associated Location resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "modified",
						"short": "Last modified timestamp.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modifiedBy",
						"req": true,
						"short": "Reference to the associated User resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "name",
						"short": "The Device's name.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "notes",
						"short": "Arbitary note that can be attached to a Device entry.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "partner",
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "serialNumber",
						"short": "The Device's serial number.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"short": "The number of times that this resource has been updated.",
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
									"res": "`body.data`",
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
						"short": "If a Device Type has more than one Application Code version the supported version is specified here.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "buildNumber",
						"short": "The Build Number.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "configFileName",
						"short": "The name of the configuration file that is uploaded to the device.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "created",
						"short": "Creation timestamp in ISO 8601 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "deviceType",
						"short": "The Device Type Name.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "firmwareVersion",
						"short": "A list of firmware versions that this Device Build covers.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "hardwareVersion",
						"short": "A list of hardware versions that this Device Build covers.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"short": "This resource's unique identifier.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "isActive",
						"short": "This property indicates if the device build is still active and not succeeded by subsequent build.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "modified",
						"short": "Last modified timestamp.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"short": "The Device Builds's name.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "notes",
						"short": "Notes attached to the device build by Bluefin CISO.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"short": "The number of times that this resource has been updated.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "whiteListingBinRanges",
						"short": "A comma separated list of BIN ranges that aren't encrypted by the terminal.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "whiteListingUsed",
						"short": "This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal.",
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
									"res": "`body.data`",
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
						"short": "The date and time that the Custody change took place.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "created",
						"short": "Creation timestamp in ISO 8601 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "createdBy",
						"req": true,
						"short": "Reference to the associated User resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "custodian",
						"req": true,
						"short": "Reference to the associated User resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "device",
						"short": "Reference to the associated Device resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "id",
						"short": "This resource's unique identifier.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "location",
						"req": true,
						"short": "Reference to the associated Location resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "modified",
						"short": "Last modified timestamp.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modifiedBy",
						"req": true,
						"short": "Reference to the associated User resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "notes",
						"short": "Free form field that allows the Client associate notes with the Custody Change.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "status",
						"short": "Reference to the associated Custody Status.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "transferMethod",
						"short": "Reference to the associated Transfer Method.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "version",
						"short": "The number of times that this resource has been updated.",
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
						"short": "The date and time that the Custody change took place.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "created",
						"short": "Creation timestamp in ISO 8601 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "createdBy",
						"req": true,
						"short": "Reference to the associated User resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "custodian",
						"req": true,
						"short": "Reference to the associated User resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "device",
						"short": "Reference to the associated Device resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "id",
						"short": "This resource's unique identifier.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "location",
						"req": true,
						"short": "Reference to the associated Location resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "modified",
						"short": "Last modified timestamp.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modifiedBy",
						"req": true,
						"short": "Reference to the associated User resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "notes",
						"short": "Free form field that allows the Client associate notes with the Custody Change.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "status",
						"short": "Reference to the associated Custody Status.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "transferMethod",
						"short": "Reference to the associated Transfer Method.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "version",
						"short": "The number of times that this resource has been updated.",
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
									"res": "`body.data`",
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
						"short": "List of Devices.",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "total",
						"short": "Total number of Devices available (not the number of Users in the response).",
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
						"short": "Indicates if the action succeeded.",
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
						"short": "Indicates if the RKI activation succeeded.",
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
						"short": "Unique identifier for this Device state.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "name",
						"short": "Descriptive name for this Device state.",
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
									"res": "`body.data`",
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
						"short": "Creation timestamp in ISO 8601 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "deviceTypeMode",
						"short": "The Device type.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "hardwareVersion",
						"short": "The Device hardware version.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"short": "Unique idenifier.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "isActive",
						"short": "This property indicates if the DeviceType is active.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "manufacturer",
						"short": "The Device manufacturer.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "model",
						"short": "The Device model.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modified",
						"short": "Last modified timestamp.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"short": "The DeviceType name.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "photoUrl",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productName",
						"short": "The Device name.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"short": "The number of times that this resource has been updated.",
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
									"res": "`body.data`",
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
						"short": "Creation timestamp in ISO 8601 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"short": "unique idenifier",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "isActive",
						"short": "Active flag, inactive keys cannot be assigned to devices.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "isP2PE",
						"short": "Flags if a key is for a P2PE compliant cypher.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "keyType",
						"short": "The cipher type that the key works with.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modified",
						"short": "Last modified timestamp in ISO 8601 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"short": "Key name.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"short": "The number of times that this resource has been updated.",
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
									"res": "`body.data`",
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
						"short": "This resource's unique identifier.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "name",
						"short": "The KIF's name.",
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
									"res": "`body.data`",
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
						"short": "The Location's street address.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "address2",
						"short": "The Location's street address.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "billingId",
						"short": "\\?",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "city",
						"short": "The Location's city.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "country",
						"short": "The Location's country.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "created",
						"short": "Creation timestamp in ISO 8601 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "customReference",
						"short": "A Partner specified reference for a location.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"short": "This resource's unique identifier.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "locationType",
						"short": "The Location's clasification.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mailAddress1",
						"short": "The Location's street address.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mailAddress2",
						"short": "The Location's street address.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mailCity",
						"short": "The Location's city.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mailCountry",
						"short": "The Location's street address.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mailPostalCode",
						"short": "The Location's postal code.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mailStateProvince",
						"short": "The Location's street state or province.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modified",
						"short": "Last modified timestamp.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"short": "The Location's name.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "nameOfBusiness",
						"short": "The name of the business at this location.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "notes",
						"short": "Note for delivery driver.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "postalCode",
						"short": "The Location's postal code.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "stateProvince",
						"short": "The Location's street state or province.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "uniqueId",
						"short": "Unique Identifier for the Location.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"short": "The number of times that this resource has been updated.",
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
									"res": "`body.data`",
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
						"short": "The Partner's billing identifier.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "clientCanOrderEquipment",
						"short": "This property indicates if the Partner is allowed to order Equipment.",
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
						"short": "Reference to the associated User resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "created",
						"short": "Creation timestamp in ISO 8601 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"short": "This resource's unique identifier.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "isActive",
						"short": "This property indicates if the Parter account is active or disabled.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "location",
						"req": true,
						"short": "Reference to the associated Location resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "modified",
						"short": "Last modified timestamp.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"short": "The Partner's name.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "parent",
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "partnerId",
						"short": "The Partner's id.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "reference",
						"short": "The Partner's reference string.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "verificationPhrase",
						"short": "The verification phrase is a message that the Partner creates.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"short": "The number of times that this resource has been updated.",
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
									"res": "`body.data`",
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
						"short": "The name of the courier.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "client",
						"short": "Reference to the associated Client resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "created",
						"short": "Creation timestamp in ISO 8601 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "dateReceived",
						"short": "The date and time that a package is recieved.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "dateShipped",
						"short": "The date and time that a package is shipped.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "dcKif",
						"short": "Reference to the associated KIF resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "id",
						"short": "This resource's unique identifier.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "items",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "kif",
						"short": "Reference to the associated KIF resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "modified",
						"short": "Last modified timestamp.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "partner",
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "shipmentType",
						"short": "The type of shipment.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "tracking",
						"short": "The courier's tracking number.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"short": "The number of times that this resource has been updated.",
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
									"res": "`body.data`",
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
						"short": "Indicates if the action was a success.",
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
						"short": "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "client",
						"short": "Reference to the associated Client resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "clientRef",
						"short": "Client Reference property that is included in the decrypt API call.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "created",
						"short": "Creation timestamp in ISO 8601 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "decrypted",
						"short": "A Transcation can process muliple decryptions.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "deviceName",
						"short": "The name of the Device that generated the payload to decrypt.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "directPartner",
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "encrypted",
						"short": "A Transcation can process muliple encryptions.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "endDate",
						"short": "Timestamp from the end of the transaction.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "errCode",
						"short": "The error code that is sent in response to a failed decrypt API call.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "errMessage",
						"short": "The error messge that is sent in response to a failed decrypt API call.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"short": "This resource's unique identifier.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "ipAddress",
						"short": "The IP address of the http client that makes the decrypt API call.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "isVirtual",
						"short": "Indicates if the Transaction came from a virtual Device.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "keyType",
						"short": "The type of cipher used during decrytion.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "location",
						"req": true,
						"short": "Reference to the associated Location resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "messageId",
						"short": "Message ID.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "method",
						"short": "The decryption cypher/method.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "partner",
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "reference",
						"short": "The reference property that the Client includes in the decrypt API call.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "serialNumber",
						"short": "The serial number of the Device that generated the payload to decrypt.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "startDate",
						"short": "Timestamp from the beginning of the transaction.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "success",
						"short": "The success indicator.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "transactionSource",
						"short": "The source of the Transaction.",
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
									"res": "`body.data`",
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
						"short": "Reference to the associated Client resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "email",
						"short": "The User's email address.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "firstName",
						"short": "The User's name.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"short": "ID of newly created resource",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "isActive",
						"short": "This property indicates if the User account is active or disabled.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "kif",
						"short": "Reference to the associated KIF resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "lastName",
						"short": "The User's Surname.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "partner",
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "phone",
						"short": "The User's phone number without dashes, spaces, or brackets.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "userName",
						"short": "The User's unique username.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "userRole",
						"short": "Reference to the associated User Role.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "version",
						"short": "The number of times that this resource has been updated.",
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
									"res": "`body.data`",
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
						"short": "Reference to the associated Client resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "created",
						"short": "Creation timestamp in ISO 8601 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "email",
						"short": "The User's email address.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "firstName",
						"short": "The User's name.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"short": "This resource's unique identifier.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "isActive",
						"short": "This property indicates if the User account is active or disabled.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "kif",
						"short": "Reference to the associated KIF resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "lastName",
						"short": "The User's Surname.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modified",
						"short": "Last modified timestamp.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "partner",
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "phone",
						"short": "The User's phone number without dashes, spaces, or brackets.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "userName",
						"short": "The User's unique username.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "userRole",
						"short": "Reference to the associated User Role.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "version",
						"short": "The number of times that this resource has been updated.",
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

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
			"audit": map[string]any{
				"options": map[string]any{
					"active": false,
					"actor": "anonymous",
					"max": 1000,
				},
				"optspec": map[string]any{
					"now": "`$FUNCTION`",
					"sink": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "none",
			},
			"clienttrack": map[string]any{
				"options": map[string]any{
					"active": false,
					"clientVersion": "0.0.1",
				},
				"optspec": map[string]any{
					"clientName": "`$STRING`",
					"clientVersion": "`$STRING`",
					"headers": "`$MAP`",
					"idgen": "`$FUNCTION`",
					"sessionId": "`$STRING`",
				},
				"strict": false,
				"transport": "none",
			},
			"debug": map[string]any{
				"options": map[string]any{
					"active": false,
					"max": 100,
					"redact": []any{
						"authorization",
						"cookie",
						"set-cookie",
						"api-key",
						"apikey",
						"x-api-key",
						"idempotency-key",
					},
				},
				"optspec": map[string]any{
					"now": "`$FUNCTION`",
					"onEntry": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "none",
			},
			"idempotency": map[string]any{
				"options": map[string]any{
					"active": false,
					"header": "Idempotency-Key",
					"methods": []any{
						"POST",
						"PUT",
						"PATCH",
						"DELETE",
					},
					"ops": []any{
						"create",
						"update",
						"remove",
					},
				},
				"optspec": map[string]any{
					"keygen": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "none",
			},
			"log": map[string]any{
				"options": map[string]any{
					"active": true,
				},
				"optspec": map[string]any{
					"level": "`$STRING`",
					"logger": "`$ANY`",
				},
				"strict": false,
				"transport": "none",
			},
			"metrics": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"optspec": map[string]any{
					"now": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "none",
			},
			"paging": map[string]any{
				"options": map[string]any{
					"active": false,
					"afterVar": "after",
					"cursorParam": "cursor",
					"firstVar": "first",
					"limitParam": "limit",
					"pageParam": "page",
					"startPage": 1,
				},
				"optspec": map[string]any{
					"limit": "`$NUMBER`",
					"ops": "`$LIST`",
				},
				"strict": false,
				"transport": "none",
			},
			"ratelimit": map[string]any{
				"options": map[string]any{
					"active": false,
					"burst": 5,
					"rate": 5,
				},
				"optspec": map[string]any{
					"now": "`$FUNCTION`",
					"sleep": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
			"retry": map[string]any{
				"options": map[string]any{
					"active": false,
					"factor": 2,
					"maxDelay": 2000,
					"minDelay": 50,
					"retries": 2,
					"statuses": []any{
						408,
						425,
						429,
						500,
						502,
						503,
						504,
					},
				},
				"optspec": map[string]any{
					"jitter": "`$BOOLEAN`",
					"sleep": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
			"telemetry": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"optspec": map[string]any{
					"exporter": "`$FUNCTION`",
					"headers": "`$MAP`",
					"idgen": "`$FUNCTION`",
					"now": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "none",
			},
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"optspec": map[string]any{
					"entity": "`$MAP`",
					"net": "`$MAP`",
				},
				"strict": false,
				"transport": "base",
			},
			"timeout": map[string]any{
				"options": map[string]any{
					"active": false,
					"ms": 30000,
				},
				"optspec": map[string]any{
					"clearTimer": "`$FUNCTION`",
					"setTimer": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
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
				"device_custody_list_item": map[string]any{},
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
				"virtual_device": map[string]any{},
			},
		},
		"entity": map[string]any{
			"attestation": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "client",
						"title": "Client",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Client resource.",
					},
					map[string]any{
						"name": "completeDate",
						"title": "Complete Date",
						"type": "`$STRING`",
						"short": "The date and time that the Attestation took place.",
						"format": "datetime",
					},
					map[string]any{
						"name": "created",
						"title": "Created",
						"type": "`$STRING`",
						"short": "Creation timestamp in ISO 8601 format.",
						"format": "datetime",
					},
					map[string]any{
						"name": "device",
						"title": "Device",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Device resource.",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
						"short": "This resource's unique identifier.",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"short": "Text describing the attestation.",
					},
					map[string]any{
						"name": "notes",
						"title": "Notes",
						"type": "`$STRING`",
						"short": "Free form field that allows the Client associate notes with the Attestation.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "attestation",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/attestations",
								"segments": []any{
									map[string]any{
										"lit": "attestations",
									},
								},
								"parts": []any{
									"attestations",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/attestations",
								"segments": []any{
									map[string]any{
										"lit": "attestations",
									},
								},
								"parts": []any{
									"attestations",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "client",
											"orig": "client",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 0,
										},
										map[string]any{
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 10,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"client",
										"skip",
										"take",
									},
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/attestations/{id}",
								"segments": []any{
									map[string]any{
										"lit": "attestations",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"attestations",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
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
						"title": "Contact",
						"type": "`$OBJECT`",
						"op": map[string]any{
							"list": map[string]any{
								"req": true,
								"type": "`$OBJECT`",
							},
						},
						"short": "Reference to the associated User resource.",
					},
					map[string]any{
						"name": "created",
						"title": "Created",
						"type": "`$STRING`",
						"short": "Creation timestamp in ISO 8601 format.",
						"format": "datetime",
					},
					map[string]any{
						"name": "directPartner",
						"title": "Direct Partner",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
						"short": "This resource's unique identifier.",
					},
					map[string]any{
						"name": "isActive",
						"title": "Is Active",
						"type": "`$BOOLEAN`",
						"short": "This property indicates if the Client account is active or disabled.",
					},
					map[string]any{
						"name": "location",
						"title": "Location",
						"type": "`$OBJECT`",
						"req": true,
						"short": "Reference to the associated Location resource.",
					},
					map[string]any{
						"name": "mid",
						"title": "Mid",
						"type": "`$STRING`",
						"short": "Some Partners will have an merchant ids on their own software offerings.",
					},
					map[string]any{
						"name": "modified",
						"title": "Modified",
						"type": "`$STRING`",
						"short": "Last modified timestamp.",
						"format": "datetime",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"short": "The Client's name.",
					},
					map[string]any{
						"name": "partner",
						"title": "Partner",
						"type": "`$OBJECT`",
						"short": "Reference to the Client's root Partner.",
					},
					map[string]any{
						"name": "version",
						"title": "Version",
						"type": "`$INTEGER`",
						"short": "The number of times that this resource has been updated.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "client",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/clients",
								"segments": []any{
									map[string]any{
										"lit": "clients",
									},
								},
								"parts": []any{
									"clients",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/clients",
								"segments": []any{
									map[string]any{
										"lit": "clients",
									},
								},
								"parts": []any{
									"clients",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "partner",
											"orig": "partner",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 0,
										},
										map[string]any{
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 10,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"partner",
										"skip",
										"take",
									},
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/clients/{id}",
								"segments": []any{
									map[string]any{
										"lit": "clients",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"clients",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
							},
						},
					},
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "DELETE",
								"orig": "/clients/{id}",
								"segments": []any{
									map[string]any{
										"lit": "clients",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"clients",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
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
								"kind": "http",
								"method": "POST",
								"orig": "/devices/{serialNumber}/{deviceType}/custody",
								"segments": []any{
									map[string]any{
										"lit": "devices",
									},
									map[string]any{
										"var": "serial_number",
									},
									map[string]any{
										"var": "device_type",
									},
									map[string]any{
										"lit": "custody",
									},
								},
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
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "device_type",
											"orig": "device_type",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
										map[string]any{
											"name": "serial_number",
											"orig": "serial_number",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"device_type",
										"serial_number",
									},
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"$.main.kit.entity.device",
						},
					},
				},
			},
			"decryption": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "success",
						"title": "Success",
						"type": "`$BOOLEAN`",
						"short": "true if the payload decryption was successful.",
					},
				},
				"name": "decryption",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/decryption",
								"segments": []any{
									map[string]any{
										"lit": "decryption",
									},
								},
								"parts": []any{
									"decryption",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
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
						"title": "Activated By",
						"type": "`$OBJECT`",
						"req": true,
						"short": "Reference to the associated User resource.",
					},
					map[string]any{
						"name": "activationDate",
						"title": "Activation Date",
						"type": "`$STRING`",
						"short": "Timestamp from when the Device was activated.",
						"format": "datetime",
					},
					map[string]any{
						"name": "alternateKey",
						"title": "Alternate Key",
						"type": "`$STRING`",
						"short": "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.",
					},
					map[string]any{
						"name": "auditNextDate",
						"title": "Audit Next Date",
						"type": "`$STRING`",
						"short": "Date and time that the Device is due its next PCI Audit.",
						"format": "datetime",
					},
					map[string]any{
						"name": "auditNotificationDate",
						"title": "Audit Notification Date",
						"type": "`$STRING`",
						"short": "Date and time that a notification should be sent that a PCI audit is due.",
						"format": "datetime",
					},
					map[string]any{
						"name": "client",
						"title": "Client",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Client resource.",
					},
					map[string]any{
						"name": "created",
						"title": "Created",
						"type": "`$STRING`",
						"short": "Creation timestamp in ISO 8601 format.",
						"format": "datetime",
					},
					map[string]any{
						"name": "createdBy",
						"title": "Created By",
						"type": "`$OBJECT`",
						"req": true,
						"short": "Reference to the associated User resource.",
					},
					map[string]any{
						"name": "deviceBuild",
						"title": "Device Build",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Device Build resource.",
					},
					map[string]any{
						"name": "deviceState",
						"title": "Device State",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Device State resource.",
					},
					map[string]any{
						"name": "deviceType",
						"title": "Device Type",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Device Type resource.",
					},
					map[string]any{
						"name": "errorCounter",
						"title": "Error Counter",
						"type": "`$INTEGER`",
						"short": "The number times the Device has been in error.",
					},
					map[string]any{
						"name": "errorLastDate",
						"title": "Error Last Date",
						"type": "`$STRING`",
						"short": "Timestamp from the last time that the Device had an error.",
						"format": "datetime",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
						"short": "The Device's unique identifier.",
					},
					map[string]any{
						"name": "initializedBy",
						"title": "Initialized By",
						"type": "`$OBJECT`",
						"req": true,
						"short": "Reference to the associated User resource.",
					},
					map[string]any{
						"name": "initializedDate",
						"title": "Initialized Date",
						"type": "`$STRING`",
						"short": "Timestamp from when the Device was initialized.",
						"format": "datetime",
					},
					map[string]any{
						"name": "injectKey",
						"title": "Inject Key",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Device resource.",
					},
					map[string]any{
						"name": "isVirtual",
						"title": "Is Virtual",
						"type": "`$BOOLEAN`",
						"short": "Indicates if a Device is Virtual (represents a Device shared with a partner).",
					},
					map[string]any{
						"name": "kif",
						"title": "Kif",
						"type": "`$OBJECT`",
						"short": "Reference to the associated KIF resource.",
					},
					map[string]any{
						"name": "lastActivityDate",
						"title": "Last Activity Date",
						"type": "`$STRING`",
						"short": "Timestamp from the last time that the Device was used.",
						"format": "datetime",
					},
					map[string]any{
						"name": "location",
						"title": "Location",
						"type": "`$OBJECT`",
						"req": true,
						"short": "Reference to the associated Location resource.",
					},
					map[string]any{
						"name": "modified",
						"title": "Modified",
						"type": "`$STRING`",
						"short": "Last modified timestamp.",
						"format": "datetime",
					},
					map[string]any{
						"name": "modifiedBy",
						"title": "Modified By",
						"type": "`$OBJECT`",
						"req": true,
						"short": "Reference to the associated User resource.",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"short": "The Device's name.",
					},
					map[string]any{
						"name": "notes",
						"title": "Notes",
						"type": "`$STRING`",
						"short": "Arbitary note that can be attached to a Device entry.",
					},
					map[string]any{
						"name": "partner",
						"title": "Partner",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "serialNumber",
						"title": "Serial Number",
						"type": "`$STRING`",
						"short": "The Device's serial number.",
					},
					map[string]any{
						"name": "version",
						"title": "Version",
						"type": "`$INTEGER`",
						"short": "The number of times that this resource has been updated.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "device",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/devices",
								"segments": []any{
									map[string]any{
										"lit": "devices",
									},
								},
								"parts": []any{
									"devices",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/devices",
								"segments": []any{
									map[string]any{
										"lit": "devices",
									},
								},
								"parts": []any{
									"devices",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "client",
											"orig": "client",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "device_state",
											"orig": "device_state",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "kif",
											"orig": "kif",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "partner",
											"orig": "partner",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "serial_number",
											"orig": "serial_number",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 0,
										},
										map[string]any{
											"name": "sorting_direction",
											"orig": "sorting_direction",
											"type": "`$STRING`",
											"kind": "query",
											"example": "asc",
										},
										map[string]any{
											"name": "sorting_field",
											"orig": "sorting_field",
											"type": "`$STRING`",
											"kind": "query",
											"example": "serialnumber",
										},
										map[string]any{
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 10,
										},
									},
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
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/devices/{serialNumber}/{deviceType}",
								"segments": []any{
									map[string]any{
										"lit": "devices",
									},
									map[string]any{
										"var": "serial_number",
									},
									map[string]any{
										"var": "device_type",
									},
								},
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
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "device_type",
											"orig": "device_type",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
										map[string]any{
											"name": "serial_number",
											"orig": "serial_number",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"device_type",
										"serial_number",
									},
								},
							},
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/devices/{id}",
								"segments": []any{
									map[string]any{
										"lit": "devices",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"devices",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"device_build": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "appVersion",
						"title": "App Version",
						"type": "`$STRING`",
						"short": "If a Device Type has more than one Application Code version the supported version is specified here.",
					},
					map[string]any{
						"name": "buildNumber",
						"title": "Build Number",
						"type": "`$STRING`",
						"short": "The Build Number.",
					},
					map[string]any{
						"name": "configFileName",
						"title": "Config File Name",
						"type": "`$STRING`",
						"short": "The name of the configuration file that is uploaded to the device.",
					},
					map[string]any{
						"name": "created",
						"title": "Created",
						"type": "`$STRING`",
						"short": "Creation timestamp in ISO 8601 format.",
						"format": "date-time",
					},
					map[string]any{
						"name": "deviceType",
						"title": "Device Type",
						"type": "`$STRING`",
						"short": "The Device Type Name.",
					},
					map[string]any{
						"name": "firmwareVersion",
						"title": "Firmware Version",
						"type": "`$STRING`",
						"short": "A list of firmware versions that this Device Build covers.",
					},
					map[string]any{
						"name": "hardwareVersion",
						"title": "Hardware Version",
						"type": "`$STRING`",
						"short": "A list of hardware versions that this Device Build covers.",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$INTEGER`",
						"short": "This resource's unique identifier.",
						"format": "int64",
					},
					map[string]any{
						"name": "isActive",
						"title": "Is Active",
						"type": "`$BOOLEAN`",
						"short": "This property indicates if the device build is still active and not succeeded by subsequent build.",
					},
					map[string]any{
						"name": "modified",
						"title": "Modified",
						"type": "`$STRING`",
						"short": "Last modified timestamp.",
						"format": "date-time",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"short": "The Device Builds's name.",
					},
					map[string]any{
						"name": "notes",
						"title": "Notes",
						"type": "`$STRING`",
						"short": "Notes attached to the device build by Bluefin CISO.",
					},
					map[string]any{
						"name": "version",
						"title": "Version",
						"type": "`$INTEGER`",
						"short": "The number of times that this resource has been updated.",
					},
					map[string]any{
						"name": "whiteListingBinRanges",
						"title": "White Listing Bin Ranges",
						"type": "`$STRING`",
						"short": "A comma separated list of BIN ranges that aren't encrypted by the terminal.",
					},
					map[string]any{
						"name": "whiteListingUsed",
						"title": "White Listing Used",
						"type": "`$BOOLEAN`",
						"short": "This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "device_build",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/deviceBuilds",
								"segments": []any{
									map[string]any{
										"lit": "deviceBuilds",
									},
								},
								"parts": []any{
									"deviceBuilds",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "device_type",
											"orig": "device_type",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 0,
										},
										map[string]any{
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 10,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"device_type",
										"skip",
										"take",
									},
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/deviceBuilds/{id}",
								"segments": []any{
									map[string]any{
										"lit": "deviceBuilds",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"deviceBuilds",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
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
						"title": "Complete Date",
						"type": "`$STRING`",
						"short": "The date and time that the Custody change took place.",
						"format": "date-time",
					},
					map[string]any{
						"name": "created",
						"title": "Created",
						"type": "`$STRING`",
						"short": "Creation timestamp in ISO 8601 format.",
						"format": "date-time",
					},
					map[string]any{
						"name": "createdBy",
						"title": "Created By",
						"type": "`$OBJECT`",
						"req": true,
						"short": "Reference to the associated User resource.",
					},
					map[string]any{
						"name": "custodian",
						"title": "Custodian",
						"type": "`$OBJECT`",
						"req": true,
						"short": "Reference to the associated User resource.",
					},
					map[string]any{
						"name": "device",
						"title": "Device",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Device resource.",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$INTEGER`",
						"short": "This resource's unique identifier.",
						"format": "int64",
					},
					map[string]any{
						"name": "location",
						"title": "Location",
						"type": "`$OBJECT`",
						"req": true,
						"short": "Reference to the associated Location resource.",
					},
					map[string]any{
						"name": "modified",
						"title": "Modified",
						"type": "`$STRING`",
						"short": "Last modified timestamp.",
						"format": "date-time",
					},
					map[string]any{
						"name": "modifiedBy",
						"title": "Modified By",
						"type": "`$OBJECT`",
						"req": true,
						"short": "Reference to the associated User resource.",
					},
					map[string]any{
						"name": "notes",
						"title": "Notes",
						"type": "`$STRING`",
						"short": "Free form field that allows the Client associate notes with the Custody Change.",
					},
					map[string]any{
						"name": "status",
						"title": "Status",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Custody Status.",
					},
					map[string]any{
						"name": "transferMethod",
						"title": "Transfer Method",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Transfer Method.",
					},
					map[string]any{
						"name": "version",
						"title": "Version",
						"type": "`$INTEGER`",
						"short": "The number of times that this resource has been updated.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "device_custody_detail",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/devices/{serialNumber}/{deviceType}/custody/{id}",
								"segments": []any{
									map[string]any{
										"lit": "devices",
									},
									map[string]any{
										"var": "serial_number",
									},
									map[string]any{
										"var": "device_type",
									},
									map[string]any{
										"lit": "custody",
									},
									map[string]any{
										"var": "id",
									},
								},
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
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "device_type",
											"orig": "device_type",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
										map[string]any{
											"name": "serial_number",
											"orig": "serial_number",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"device_type",
										"id",
										"serial_number",
									},
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"$.main.kit.entity.device",
						},
					},
				},
			},
			"device_custody_list_item": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "completeDate",
						"title": "Complete Date",
						"type": "`$STRING`",
						"short": "The date and time that the Custody change took place.",
						"format": "date-time",
					},
					map[string]any{
						"name": "created",
						"title": "Created",
						"type": "`$STRING`",
						"short": "Creation timestamp in ISO 8601 format.",
						"format": "date-time",
					},
					map[string]any{
						"name": "createdBy",
						"title": "Created By",
						"type": "`$OBJECT`",
						"req": true,
						"short": "Reference to the associated User resource.",
					},
					map[string]any{
						"name": "custodian",
						"title": "Custodian",
						"type": "`$OBJECT`",
						"req": true,
						"short": "Reference to the associated User resource.",
					},
					map[string]any{
						"name": "device",
						"title": "Device",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Device resource.",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$INTEGER`",
						"short": "This resource's unique identifier.",
						"format": "int64",
					},
					map[string]any{
						"name": "location",
						"title": "Location",
						"type": "`$OBJECT`",
						"req": true,
						"short": "Reference to the associated Location resource.",
					},
					map[string]any{
						"name": "modified",
						"title": "Modified",
						"type": "`$STRING`",
						"short": "Last modified timestamp.",
						"format": "date-time",
					},
					map[string]any{
						"name": "modifiedBy",
						"title": "Modified By",
						"type": "`$OBJECT`",
						"req": true,
						"short": "Reference to the associated User resource.",
					},
					map[string]any{
						"name": "notes",
						"title": "Notes",
						"type": "`$STRING`",
						"short": "Free form field that allows the Client associate notes with the Custody Change.",
					},
					map[string]any{
						"name": "status",
						"title": "Status",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Custody Status.",
					},
					map[string]any{
						"name": "transferMethod",
						"title": "Transfer Method",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Transfer Method.",
					},
					map[string]any{
						"name": "version",
						"title": "Version",
						"type": "`$INTEGER`",
						"short": "The number of times that this resource has been updated.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "device_custody_list_item",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/devices/{serialNumber}/{deviceType}/custody",
								"segments": []any{
									map[string]any{
										"lit": "devices",
									},
									map[string]any{
										"var": "serial_number",
									},
									map[string]any{
										"var": "device_type",
									},
									map[string]any{
										"lit": "custody",
									},
								},
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
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "device_type",
											"orig": "device_type",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
										map[string]any{
											"name": "serial_number",
											"orig": "serial_number",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
									"query": []any{
										map[string]any{
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 0,
										},
										map[string]any{
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 10,
										},
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
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"$.main.kit.entity.device",
						},
					},
				},
			},
			"device_receive_result": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "success",
						"title": "Success",
						"type": "`$BOOLEAN`",
						"req": true,
						"short": "Indicates if the action succeeded.",
					},
				},
				"name": "device_receive_result",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/devices/receive",
								"segments": []any{
									map[string]any{
										"lit": "devices",
									},
									map[string]any{
										"lit": "receive",
									},
								},
								"parts": []any{
									"devices",
									"receive",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
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
						"title": "Success",
						"type": "`$BOOLEAN`",
						"req": true,
						"short": "Indicates if the RKI activation succeeded.",
					},
				},
				"name": "device_rki_activate_result",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/devices/rki/activate",
								"segments": []any{
									map[string]any{
										"lit": "devices",
									},
									map[string]any{
										"lit": "rki",
									},
									map[string]any{
										"lit": "activate",
									},
								},
								"parts": []any{
									"devices",
									"rki",
									"activate",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
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
						"title": "Id",
						"type": "`$INTEGER`",
						"short": "Unique identifier for this Device state.",
						"format": "int64",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"short": "Descriptive name for this Device state.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "device_state",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/deviceStates",
								"segments": []any{
									map[string]any{
										"lit": "deviceStates",
									},
								},
								"parts": []any{
									"deviceStates",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
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
						"title": "Created",
						"type": "`$STRING`",
						"short": "Creation timestamp in ISO 8601 format.",
						"format": "datetime",
					},
					map[string]any{
						"name": "deviceTypeMode",
						"title": "Device Type Mode",
						"type": "`$STRING`",
						"short": "The Device type.",
					},
					map[string]any{
						"name": "hardwareVersion",
						"title": "Hardware Version",
						"type": "`$STRING`",
						"short": "The Device hardware version.",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
						"short": "Unique idenifier.",
					},
					map[string]any{
						"name": "isActive",
						"title": "Is Active",
						"type": "`$BOOLEAN`",
						"short": "This property indicates if the DeviceType is active.",
					},
					map[string]any{
						"name": "manufacturer",
						"title": "Manufacturer",
						"type": "`$STRING`",
						"short": "The Device manufacturer.",
					},
					map[string]any{
						"name": "model",
						"title": "Model",
						"type": "`$STRING`",
						"short": "The Device model.",
					},
					map[string]any{
						"name": "modified",
						"title": "Modified",
						"type": "`$STRING`",
						"short": "Last modified timestamp.",
						"format": "datetime",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"short": "The DeviceType name.",
					},
					map[string]any{
						"name": "photoUrl",
						"title": "Photo Url",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productName",
						"title": "Product Name",
						"type": "`$STRING`",
						"short": "The Device name.",
					},
					map[string]any{
						"name": "version",
						"title": "Version",
						"type": "`$INTEGER`",
						"short": "The number of times that this resource has been updated.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "device_type",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/deviceTypes",
								"segments": []any{
									map[string]any{
										"lit": "deviceTypes",
									},
								},
								"parts": []any{
									"deviceTypes",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/deviceTypes/{id}",
								"segments": []any{
									map[string]any{
										"lit": "deviceTypes",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"deviceTypes",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
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
						"title": "Created",
						"type": "`$STRING`",
						"short": "Creation timestamp in ISO 8601 format.",
						"format": "datetime",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
						"short": "unique idenifier",
					},
					map[string]any{
						"name": "isActive",
						"title": "Is Active",
						"type": "`$BOOLEAN`",
						"short": "Active flag, inactive keys cannot be assigned to devices.",
					},
					map[string]any{
						"name": "isP2PE",
						"title": "Is P2 Pe",
						"type": "`$BOOLEAN`",
						"short": "Flags if a key is for a P2PE compliant cypher.",
					},
					map[string]any{
						"name": "keyType",
						"title": "Key Type",
						"type": "`$STRING`",
						"short": "The cipher type that the key works with.",
					},
					map[string]any{
						"name": "modified",
						"title": "Modified",
						"type": "`$STRING`",
						"short": "Last modified timestamp in ISO 8601 format.",
						"format": "datetime",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"short": "Key name.",
					},
					map[string]any{
						"name": "version",
						"title": "Version",
						"type": "`$INTEGER`",
						"short": "The number of times that this resource has been updated.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "inject_key",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/injectKeys",
								"segments": []any{
									map[string]any{
										"lit": "injectKeys",
									},
								},
								"parts": []any{
									"injectKeys",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/injectKeys/{id}",
								"segments": []any{
									map[string]any{
										"lit": "injectKeys",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"injectKeys",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
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
						"title": "Id",
						"type": "`$INTEGER`",
						"short": "This resource's unique identifier.",
						"format": "int64",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"short": "The KIF's name.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "kif",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/kifs",
								"segments": []any{
									map[string]any{
										"lit": "kifs",
									},
								},
								"parts": []any{
									"kifs",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
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
						"title": "Address1",
						"type": "`$STRING`",
						"short": "The Location's street address.",
					},
					map[string]any{
						"name": "address2",
						"title": "Address2",
						"type": "`$STRING`",
						"short": "The Location's street address.",
					},
					map[string]any{
						"name": "billingId",
						"title": "Billing Id",
						"type": "`$STRING`",
						"short": "\\?",
					},
					map[string]any{
						"name": "city",
						"title": "City",
						"type": "`$STRING`",
						"short": "The Location's city.",
					},
					map[string]any{
						"name": "country",
						"title": "Country",
						"type": "`$STRING`",
						"short": "The Location's country.",
					},
					map[string]any{
						"name": "created",
						"title": "Created",
						"type": "`$STRING`",
						"short": "Creation timestamp in ISO 8601 format.",
						"format": "datetime",
					},
					map[string]any{
						"name": "customReference",
						"title": "Custom Reference",
						"type": "`$STRING`",
						"short": "A Partner specified reference for a location.",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
						"short": "This resource's unique identifier.",
					},
					map[string]any{
						"name": "locationType",
						"title": "Location Type",
						"type": "`$STRING`",
						"short": "The Location's clasification.",
					},
					map[string]any{
						"name": "mailAddress1",
						"title": "Mail Address1",
						"type": "`$STRING`",
						"short": "The Location's street address.",
					},
					map[string]any{
						"name": "mailAddress2",
						"title": "Mail Address2",
						"type": "`$STRING`",
						"short": "The Location's street address.",
					},
					map[string]any{
						"name": "mailCity",
						"title": "Mail City",
						"type": "`$STRING`",
						"short": "The Location's city.",
					},
					map[string]any{
						"name": "mailCountry",
						"title": "Mail Country",
						"type": "`$STRING`",
						"short": "The Location's street address.",
					},
					map[string]any{
						"name": "mailPostalCode",
						"title": "Mail Postal Code",
						"type": "`$STRING`",
						"short": "The Location's postal code.",
					},
					map[string]any{
						"name": "mailStateProvince",
						"title": "Mail State Province",
						"type": "`$STRING`",
						"short": "The Location's street state or province.",
					},
					map[string]any{
						"name": "modified",
						"title": "Modified",
						"type": "`$STRING`",
						"short": "Last modified timestamp.",
						"format": "datetime",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"short": "The Location's name.",
					},
					map[string]any{
						"name": "nameOfBusiness",
						"title": "Name Of Business",
						"type": "`$STRING`",
						"short": "The name of the business at this location.",
					},
					map[string]any{
						"name": "notes",
						"title": "Notes",
						"type": "`$STRING`",
						"short": "Note for delivery driver.",
					},
					map[string]any{
						"name": "postalCode",
						"title": "Postal Code",
						"type": "`$STRING`",
						"short": "The Location's postal code.",
					},
					map[string]any{
						"name": "stateProvince",
						"title": "State Province",
						"type": "`$STRING`",
						"short": "The Location's street state or province.",
					},
					map[string]any{
						"name": "uniqueId",
						"title": "Unique Id",
						"type": "`$STRING`",
						"short": "Unique Identifier for the Location.",
					},
					map[string]any{
						"name": "version",
						"title": "Version",
						"type": "`$INTEGER`",
						"short": "The number of times that this resource has been updated.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "location",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/locations",
								"segments": []any{
									map[string]any{
										"lit": "locations",
									},
								},
								"parts": []any{
									"locations",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/locations",
								"segments": []any{
									map[string]any{
										"lit": "locations",
									},
								},
								"parts": []any{
									"locations",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "client",
											"orig": "client",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 0,
										},
										map[string]any{
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 10,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"client",
										"skip",
										"take",
									},
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/locations/{id}",
								"segments": []any{
									map[string]any{
										"lit": "locations",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"locations",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
							},
						},
					},
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "DELETE",
								"orig": "/locations/{id}",
								"segments": []any{
									map[string]any{
										"lit": "locations",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"locations",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
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
						"title": "Billing Id",
						"type": "`$STRING`",
						"short": "The Partner's billing identifier.",
					},
					map[string]any{
						"name": "clientCanOrderEquipment",
						"title": "Client Can Order Equipment",
						"type": "`$BOOLEAN`",
						"short": "This property indicates if the Partner is allowed to order Equipment.",
					},
					map[string]any{
						"name": "contact",
						"title": "Contact",
						"type": "`$OBJECT`",
						"op": map[string]any{
							"list": map[string]any{
								"req": true,
								"type": "`$OBJECT`",
							},
						},
						"short": "Reference to the associated User resource.",
					},
					map[string]any{
						"name": "created",
						"title": "Created",
						"type": "`$STRING`",
						"short": "Creation timestamp in ISO 8601 format.",
						"format": "datetime",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
						"short": "This resource's unique identifier.",
					},
					map[string]any{
						"name": "isActive",
						"title": "Is Active",
						"type": "`$BOOLEAN`",
						"short": "This property indicates if the Parter account is active or disabled.",
					},
					map[string]any{
						"name": "location",
						"title": "Location",
						"type": "`$OBJECT`",
						"req": true,
						"short": "Reference to the associated Location resource.",
					},
					map[string]any{
						"name": "modified",
						"title": "Modified",
						"type": "`$STRING`",
						"short": "Last modified timestamp.",
						"format": "datetime",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"short": "The Partner's name.",
					},
					map[string]any{
						"name": "parent",
						"title": "Parent",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "partnerId",
						"title": "Partner Id",
						"type": "`$STRING`",
						"short": "The Partner's id.",
					},
					map[string]any{
						"name": "reference",
						"title": "Reference",
						"type": "`$STRING`",
						"short": "The Partner's reference string.",
					},
					map[string]any{
						"name": "verificationPhrase",
						"title": "Verification Phrase",
						"type": "`$STRING`",
						"short": "The verification phrase is a message that the Partner creates.",
					},
					map[string]any{
						"name": "version",
						"title": "Version",
						"type": "`$INTEGER`",
						"short": "The number of times that this resource has been updated.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "partner",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/partners",
								"segments": []any{
									map[string]any{
										"lit": "partners",
									},
								},
								"parts": []any{
									"partners",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/partners",
								"segments": []any{
									map[string]any{
										"lit": "partners",
									},
								},
								"parts": []any{
									"partners",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "partner",
											"orig": "partner",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 0,
										},
										map[string]any{
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 10,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"partner",
										"skip",
										"take",
									},
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/partners/{id}",
								"segments": []any{
									map[string]any{
										"lit": "partners",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"partners",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
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
						"title": "Carrier",
						"type": "`$STRING`",
						"short": "The name of the courier.",
					},
					map[string]any{
						"name": "client",
						"title": "Client",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Client resource.",
					},
					map[string]any{
						"name": "created",
						"title": "Created",
						"type": "`$STRING`",
						"short": "Creation timestamp in ISO 8601 format.",
						"format": "datetime",
					},
					map[string]any{
						"name": "dateReceived",
						"title": "Date Received",
						"type": "`$STRING`",
						"short": "The date and time that a package is recieved.",
						"format": "datetime",
					},
					map[string]any{
						"name": "dateShipped",
						"title": "Date Shipped",
						"type": "`$STRING`",
						"short": "The date and time that a package is shipped.",
						"format": "datetime",
					},
					map[string]any{
						"name": "dcKif",
						"title": "Dc Kif",
						"type": "`$OBJECT`",
						"short": "Reference to the associated KIF resource.",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
						"short": "This resource's unique identifier.",
					},
					map[string]any{
						"name": "items",
						"title": "Items",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "kif",
						"title": "Kif",
						"type": "`$OBJECT`",
						"short": "Reference to the associated KIF resource.",
					},
					map[string]any{
						"name": "modified",
						"title": "Modified",
						"type": "`$STRING`",
						"short": "Last modified timestamp.",
						"format": "datetime",
					},
					map[string]any{
						"name": "partner",
						"title": "Partner",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "shipmentType",
						"title": "Shipment Type",
						"type": "`$STRING`",
						"short": "The type of shipment.",
					},
					map[string]any{
						"name": "tracking",
						"title": "Tracking",
						"type": "`$STRING`",
						"short": "The courier's tracking number.",
					},
					map[string]any{
						"name": "version",
						"title": "Version",
						"type": "`$INTEGER`",
						"short": "The number of times that this resource has been updated.",
						"format": "int32",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "shipment",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/shipments",
								"segments": []any{
									map[string]any{
										"lit": "shipments",
									},
								},
								"parts": []any{
									"shipments",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/shipments",
								"segments": []any{
									map[string]any{
										"lit": "shipments",
									},
								},
								"parts": []any{
									"shipments",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "kif",
											"orig": "kif",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "mode",
											"orig": "mode",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 0,
										},
										map[string]any{
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 10,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"kif",
										"mode",
										"skip",
										"take",
									},
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/shipments/{id}",
								"segments": []any{
									map[string]any{
										"lit": "shipments",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"shipments",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
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
						"title": "Success",
						"type": "`$BOOLEAN`",
						"short": "Indicates if the action was a success.",
					},
				},
				"name": "success",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/virtualDevices/{sharePartnerTo}",
								"segments": []any{
									map[string]any{
										"lit": "virtualDevices",
									},
									map[string]any{
										"var": "share_partner_to",
									},
								},
								"parts": []any{
									"virtualDevices",
									"{share_partner_to}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"sharePartnerTo": "share_partner_to",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "share_partner_to",
											"orig": "share_partner_to",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"share_partner_to",
									},
								},
							},
						},
					},
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "DELETE",
								"orig": "/virtualDevices/{sharePartnerTo}",
								"segments": []any{
									map[string]any{
										"lit": "virtualDevices",
									},
									map[string]any{
										"var": "share_partner_to",
									},
								},
								"parts": []any{
									"virtualDevices",
									"{share_partner_to}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"sharePartnerTo": "share_partner_to",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "share_partner_to",
											"orig": "share_partner_to",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"share_partner_to",
									},
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"$.main.kit.entity.virtual_device",
						},
					},
				},
			},
			"transaction": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "alternateKey",
						"title": "Alternate Key",
						"type": "`$STRING`",
						"short": "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.",
					},
					map[string]any{
						"name": "client",
						"title": "Client",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Client resource.",
					},
					map[string]any{
						"name": "clientRef",
						"title": "Client Ref",
						"type": "`$STRING`",
						"short": "Client Reference property that is included in the decrypt API call.",
					},
					map[string]any{
						"name": "created",
						"title": "Created",
						"type": "`$STRING`",
						"short": "Creation timestamp in ISO 8601 format.",
						"format": "datetime",
					},
					map[string]any{
						"name": "decrypted",
						"title": "Decrypted",
						"type": "`$INTEGER`",
						"short": "A Transcation can process muliple decryptions.",
						"format": "int32",
					},
					map[string]any{
						"name": "deviceName",
						"title": "Device Name",
						"type": "`$STRING`",
						"short": "The name of the Device that generated the payload to decrypt.",
					},
					map[string]any{
						"name": "directPartner",
						"title": "Direct Partner",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "encrypted",
						"title": "Encrypted",
						"type": "`$INTEGER`",
						"short": "A Transcation can process muliple encryptions.",
						"format": "int32",
					},
					map[string]any{
						"name": "endDate",
						"title": "End Date",
						"type": "`$STRING`",
						"short": "Timestamp from the end of the transaction.",
						"format": "datetime",
					},
					map[string]any{
						"name": "errCode",
						"title": "Err Code",
						"type": "`$STRING`",
						"short": "The error code that is sent in response to a failed decrypt API call.",
					},
					map[string]any{
						"name": "errMessage",
						"title": "Err Message",
						"type": "`$STRING`",
						"short": "The error messge that is sent in response to a failed decrypt API call.",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
						"short": "This resource's unique identifier.",
					},
					map[string]any{
						"name": "ipAddress",
						"title": "Ip Address",
						"type": "`$STRING`",
						"short": "The IP address of the http client that makes the decrypt API call.",
					},
					map[string]any{
						"name": "isVirtual",
						"title": "Is Virtual",
						"type": "`$BOOLEAN`",
						"short": "Indicates if the Transaction came from a virtual Device.",
					},
					map[string]any{
						"name": "keyType",
						"title": "Key Type",
						"type": "`$STRING`",
						"short": "The type of cipher used during decrytion.",
					},
					map[string]any{
						"name": "location",
						"title": "Location",
						"type": "`$OBJECT`",
						"req": true,
						"short": "Reference to the associated Location resource.",
					},
					map[string]any{
						"name": "messageId",
						"title": "Message Id",
						"type": "`$STRING`",
						"short": "Message ID.",
					},
					map[string]any{
						"name": "method",
						"title": "Method",
						"type": "`$STRING`",
						"short": "The decryption cypher/method.",
					},
					map[string]any{
						"name": "partner",
						"title": "Partner",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "reference",
						"title": "Reference",
						"type": "`$STRING`",
						"short": "The reference property that the Client includes in the decrypt API call.",
					},
					map[string]any{
						"name": "serialNumber",
						"title": "Serial Number",
						"type": "`$STRING`",
						"short": "The serial number of the Device that generated the payload to decrypt.",
					},
					map[string]any{
						"name": "startDate",
						"title": "Start Date",
						"type": "`$STRING`",
						"short": "Timestamp from the beginning of the transaction.",
						"format": "datetime",
					},
					map[string]any{
						"name": "success",
						"title": "Success",
						"type": "`$BOOLEAN`",
						"short": "The success indicator.",
					},
					map[string]any{
						"name": "transactionSource",
						"title": "Transaction Source",
						"type": "`$STRING`",
						"short": "The source of the Transaction.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "transaction",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/transactions",
								"segments": []any{
									map[string]any{
										"lit": "transactions",
									},
								},
								"parts": []any{
									"transactions",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/transactions",
								"segments": []any{
									map[string]any{
										"lit": "transactions",
									},
								},
								"parts": []any{
									"transactions",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "client",
											"orig": "client",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "client_ref",
											"orig": "client_ref",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "date_from",
											"orig": "date_from",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "date_to",
											"orig": "date_to",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "location",
											"orig": "location",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "message_id",
											"orig": "message_id",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "paging_mode",
											"orig": "paging_mode",
											"type": "`$STRING`",
											"kind": "query",
											"example": "nocount",
										},
										map[string]any{
											"name": "partner",
											"orig": "partner",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "reference",
											"orig": "reference",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "serial_number",
											"orig": "serial_number",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 0,
										},
										map[string]any{
											"name": "success",
											"orig": "success",
											"type": "`$BOOLEAN`",
											"kind": "query",
										},
										map[string]any{
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 10,
										},
									},
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
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/transactions/{id}",
								"segments": []any{
									map[string]any{
										"lit": "transactions",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"transactions",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
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
						"title": "Client",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Client resource.",
					},
					map[string]any{
						"name": "email",
						"title": "Email",
						"type": "`$STRING`",
						"short": "The User's email address.",
					},
					map[string]any{
						"name": "firstName",
						"title": "First Name",
						"type": "`$STRING`",
						"short": "The User's name.",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
						"short": "ID of newly created resource",
					},
					map[string]any{
						"name": "isActive",
						"title": "Is Active",
						"type": "`$BOOLEAN`",
						"short": "This property indicates if the User account is active or disabled.",
					},
					map[string]any{
						"name": "kif",
						"title": "Kif",
						"type": "`$OBJECT`",
						"short": "Reference to the associated KIF resource.",
					},
					map[string]any{
						"name": "lastName",
						"title": "Last Name",
						"type": "`$STRING`",
						"short": "The User's Surname.",
					},
					map[string]any{
						"name": "partner",
						"title": "Partner",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "phone",
						"title": "Phone",
						"type": "`$STRING`",
						"short": "The User's phone number without dashes, spaces, or brackets.",
					},
					map[string]any{
						"name": "userName",
						"title": "User Name",
						"type": "`$STRING`",
						"short": "The User's unique username.",
					},
					map[string]any{
						"name": "userRole",
						"title": "User Role",
						"type": "`$OBJECT`",
						"short": "Reference to the associated User Role.",
					},
					map[string]any{
						"name": "version",
						"title": "Version",
						"type": "`$INTEGER`",
						"short": "The number of times that this resource has been updated.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "update_result",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/users",
								"segments": []any{
									map[string]any{
										"lit": "users",
									},
								},
								"parts": []any{
									"users",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/users",
								"segments": []any{
									map[string]any{
										"lit": "users",
									},
								},
								"parts": []any{
									"users",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "client",
											"orig": "client",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "kif",
											"orig": "kif",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "partner",
											"orig": "partner",
											"type": "`$ANY`",
											"kind": "query",
										},
										map[string]any{
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 0,
										},
										map[string]any{
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 10,
										},
									},
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
							},
						},
					},
					"update": map[string]any{
						"input": "data",
						"name": "update",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "PATCH",
								"orig": "/clients/{id}",
								"segments": []any{
									map[string]any{
										"lit": "clients",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"clients",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
							},
							map[string]any{
								"kind": "http",
								"method": "PATCH",
								"orig": "/devices/{id}",
								"segments": []any{
									map[string]any{
										"lit": "devices",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"devices",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
							},
							map[string]any{
								"kind": "http",
								"method": "PATCH",
								"orig": "/locations/{id}",
								"segments": []any{
									map[string]any{
										"lit": "locations",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"locations",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
							},
							map[string]any{
								"kind": "http",
								"method": "PATCH",
								"orig": "/partners/{id}",
								"segments": []any{
									map[string]any{
										"lit": "partners",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"partners",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
							},
							map[string]any{
								"kind": "http",
								"method": "PATCH",
								"orig": "/shipments/{id}",
								"segments": []any{
									map[string]any{
										"lit": "shipments",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"shipments",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
							},
							map[string]any{
								"kind": "http",
								"method": "PATCH",
								"orig": "/transactions/{id}",
								"segments": []any{
									map[string]any{
										"lit": "transactions",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"transactions",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
							},
							map[string]any{
								"kind": "http",
								"method": "PATCH",
								"orig": "/users/{id}",
								"segments": []any{
									map[string]any{
										"lit": "users",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"users",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
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
						"title": "Client",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Client resource.",
					},
					map[string]any{
						"name": "created",
						"title": "Created",
						"type": "`$STRING`",
						"short": "Creation timestamp in ISO 8601 format.",
						"format": "datetime",
					},
					map[string]any{
						"name": "email",
						"title": "Email",
						"type": "`$STRING`",
						"short": "The User's email address.",
					},
					map[string]any{
						"name": "firstName",
						"title": "First Name",
						"type": "`$STRING`",
						"short": "The User's name.",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
						"short": "This resource's unique identifier.",
					},
					map[string]any{
						"name": "isActive",
						"title": "Is Active",
						"type": "`$BOOLEAN`",
						"short": "This property indicates if the User account is active or disabled.",
					},
					map[string]any{
						"name": "kif",
						"title": "Kif",
						"type": "`$OBJECT`",
						"short": "Reference to the associated KIF resource.",
					},
					map[string]any{
						"name": "lastName",
						"title": "Last Name",
						"type": "`$STRING`",
						"short": "The User's Surname.",
					},
					map[string]any{
						"name": "modified",
						"title": "Modified",
						"type": "`$STRING`",
						"short": "Last modified timestamp.",
						"format": "datetime",
					},
					map[string]any{
						"name": "partner",
						"title": "Partner",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "phone",
						"title": "Phone",
						"type": "`$STRING`",
						"short": "The User's phone number without dashes, spaces, or brackets.",
					},
					map[string]any{
						"name": "userName",
						"title": "User Name",
						"type": "`$STRING`",
						"short": "The User's unique username.",
					},
					map[string]any{
						"name": "userRole",
						"title": "User Role",
						"type": "`$OBJECT`",
						"short": "Reference to the associated User Role.",
					},
					map[string]any{
						"name": "version",
						"title": "Version",
						"type": "`$INTEGER`",
						"short": "The number of times that this resource has been updated.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "user",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/users/{id}",
								"segments": []any{
									map[string]any{
										"lit": "users",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"users",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
							},
						},
					},
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "DELETE",
								"orig": "/users/{id}",
								"segments": []any{
									map[string]any{
										"lit": "users",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"users",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"virtual_device": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "data",
						"title": "Data",
						"type": "`$ARRAY`",
						"short": "List of Devices.",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "total",
						"title": "Total",
						"type": "`$INTEGER`",
						"short": "Total number of Devices available (not the number of Users in the response).",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "virtual_device",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/virtualDevices/{sharePartnerTo}",
								"segments": []any{
									map[string]any{
										"lit": "virtualDevices",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"virtualDevices",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"sharePartnerTo": "id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "share_partner_to",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
									"query": []any{
										map[string]any{
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 0,
										},
										map[string]any{
											"name": "sorting_direction",
											"orig": "sorting_direction",
											"type": "`$STRING`",
											"kind": "query",
											"example": "asc",
										},
										map[string]any{
											"name": "sorting_field",
											"orig": "sorting_field",
											"type": "`$STRING`",
											"kind": "query",
											"example": "serialnumber",
										},
										map[string]any{
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 10,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
										"skip",
										"sorting_direction",
										"sorting_field",
										"take",
									},
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

// The plugin definitions the model selected per feature, as []any so a
// feature package can consume them without core naming its types. Empty
// when no active feature declares active plugin groups for this target.
var featurePlugins = map[string][]any{
}

// FeaturePlugins is the definitions list for one feature's chain.
func FeaturePlugins(name string) []any {
	return featurePlugins[name]
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
	case "audit":
		if NewAuditFeatureFunc != nil {
			return NewAuditFeatureFunc()
		}
	case "clienttrack":
		if NewClienttrackFeatureFunc != nil {
			return NewClienttrackFeatureFunc()
		}
	case "debug":
		if NewDebugFeatureFunc != nil {
			return NewDebugFeatureFunc()
		}
	case "idempotency":
		if NewIdempotencyFeatureFunc != nil {
			return NewIdempotencyFeatureFunc()
		}
	case "log":
		if NewLogFeatureFunc != nil {
			return NewLogFeatureFunc()
		}
	case "metrics":
		if NewMetricsFeatureFunc != nil {
			return NewMetricsFeatureFunc()
		}
	case "paging":
		if NewPagingFeatureFunc != nil {
			return NewPagingFeatureFunc()
		}
	case "ratelimit":
		if NewRatelimitFeatureFunc != nil {
			return NewRatelimitFeatureFunc()
		}
	case "retry":
		if NewRetryFeatureFunc != nil {
			return NewRetryFeatureFunc()
		}
	case "telemetry":
		if NewTelemetryFeatureFunc != nil {
			return NewTelemetryFeatureFunc()
		}
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	case "timeout":
		if NewTimeoutFeatureFunc != nil {
			return NewTimeoutFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}

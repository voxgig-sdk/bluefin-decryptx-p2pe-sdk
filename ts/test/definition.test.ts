import { describe, test } from 'node:test'
import { SDK } from '..'
import { runDefinitionPoint } from './definition-runner'
import { isControlSkipped } from './utility'


// Generated from the API definition, not from the model this SDK was built
// from: the route, the declared query parameters, the credential the security
// scheme names, and the definition's own response example.
const PLAN: any[] = [
  {
    "entity": "attestation",
    "accessor": "Attestation",
    "op": "create",
    "method": "POST",
    "path": "/attestations",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": [
      {
        "id": "73",
        "device": {
          "id": "73",
          "serialNumber": "85000711"
        }
      }
    ],
    "idField": "id"
  },
  {
    "entity": "attestation",
    "accessor": "Attestation",
    "op": "list",
    "method": "GET",
    "path": "/attestations",
    "args": [],
    "select": {
      "client": "v1",
      "skip": 0,
      "take": 10
    },
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [
      "client",
      "take",
      "skip"
    ],
    "queryArgs": [
      {
        "name": "client",
        "wire": "client"
      },
      {
        "name": "skip",
        "wire": "skip"
      },
      {
        "name": "take",
        "wire": "take"
      }
    ],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "total": 1,
      "data": [
        {
          "id": "4566",
          "name": "2015 Attestation Atlanta Shop (Terminal 85000711)",
          "completeDate": "2017-02-08T20:14:45.000Z",
          "notes": "Terminal 85000711 meets all the attestation requirements.",
          "client": {
            "id": "4684",
            "name": "The Tired Window"
          },
          "device": {
            "id": "73",
            "serialNumber": "85000711"
          }
        }
      ]
    },
    "idField": "id"
  },
  {
    "entity": "attestation",
    "accessor": "Attestation",
    "op": "load",
    "method": "GET",
    "path": "/attestations/{id}",
    "args": [
      {
        "name": "id",
        "wire": "id",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "73",
      "name": "2015 Attestation Atlanta Shop (Terminal 85000711)",
      "completeDate": "2017-02-08T20:14:45.000Z",
      "notes": "Terminal 85000711 meets all the attestation requirements.",
      "client": {
        "id": "4684",
        "name": "The Tired Window"
      },
      "device": {
        "id": "73",
        "serialNumber": "85000711"
      },
      "created": "2017-02-08T20:14:45.000Z"
    },
    "idField": "id"
  },
  {
    "entity": "client",
    "accessor": "Client",
    "op": "create",
    "method": "POST",
    "path": "/clients",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "10"
    },
    "idField": "id"
  },
  {
    "entity": "client",
    "accessor": "Client",
    "op": "list",
    "method": "GET",
    "path": "/clients",
    "args": [],
    "select": {
      "partner": "v1",
      "skip": 0,
      "take": 10
    },
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [
      "partner",
      "take",
      "skip"
    ],
    "queryArgs": [
      {
        "name": "partner",
        "wire": "partner"
      },
      {
        "name": "skip",
        "wire": "skip"
      },
      {
        "name": "take",
        "wire": "take"
      }
    ],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "total": 1,
      "data": [
        {
          "id": "73",
          "name": "The Tired Window",
          "mid": "220654321577",
          "isActive": true,
          "version": 3,
          "partner": {
            "id": "73",
            "name": "ASM Software Corporate"
          },
          "directPartner": {
            "id": "6580",
            "name": "ASM Software"
          },
          "location": {
            "id": "33668",
            "name": "The Tired Window Atlanta Downtown"
          },
          "contact": {
            "id": "56"
          }
        }
      ]
    },
    "idField": "id"
  },
  {
    "entity": "client",
    "accessor": "Client",
    "op": "load",
    "method": "GET",
    "path": "/clients/{id}",
    "args": [
      {
        "name": "id",
        "wire": "id",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "73",
      "name": "The Tired Window",
      "mid": "220654321577",
      "isActive": true,
      "version": 3,
      "partner": {
        "id": "73",
        "name": "ASM Software Corporate"
      },
      "directPartner": {
        "id": "6580",
        "name": "ASM Software"
      },
      "location": {
        "id": "33668",
        "name": "The Tired Window Atlanta Downtown"
      },
      "contact": {
        "id": "56",
        "firstName": "Kaleena",
        "lastName": "Gilluley",
        "email": "kgilluley0@zdnet.com"
      },
      "created": "2017-02-08T20:14:45.000Z",
      "modified": "2017-02-08T20:14:45.000Z"
    },
    "idField": "id"
  },
  {
    "entity": "client",
    "accessor": "Client",
    "op": "remove",
    "method": "DELETE",
    "path": "/clients/{id}",
    "args": [
      {
        "name": "id",
        "wire": "id",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": null,
    "idField": "id"
  },
  {
    "entity": "create_result",
    "accessor": "CreateResult",
    "op": "create",
    "method": "POST",
    "path": "/devices/{serialNumber}/{deviceType}/custody",
    "args": [
      {
        "name": "device_type",
        "wire": "deviceType",
        "value": "p1"
      },
      {
        "name": "serial_number",
        "wire": "serialNumber",
        "value": "p2"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": [
      {
        "id": "10"
      }
    ],
    "idField": "id"
  },
  {
    "entity": "decryption",
    "accessor": "Decryption",
    "op": "create",
    "method": "POST",
    "path": "/decryption",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "success": true
    },
    "idField": "id"
  },
  {
    "entity": "device",
    "accessor": "Device",
    "op": "create",
    "method": "POST",
    "path": "/devices",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "10"
    },
    "idField": "id"
  },
  {
    "entity": "device",
    "accessor": "Device",
    "op": "list",
    "method": "GET",
    "path": "/devices",
    "args": [],
    "select": {
      "client": "v1",
      "device_state": "v1",
      "kif": "v1",
      "partner": "v1",
      "serial_number": "v1",
      "skip": 0,
      "sorting_direction": "asc",
      "sorting_field": "serialnumber",
      "take": 10
    },
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [
      "partner",
      "client",
      "kif",
      "serialNumber",
      "deviceState",
      "take",
      "skip",
      "sorting.field",
      "sorting.direction"
    ],
    "queryArgs": [
      {
        "name": "client",
        "wire": "client"
      },
      {
        "name": "device_state",
        "wire": "deviceState"
      },
      {
        "name": "kif",
        "wire": "kif"
      },
      {
        "name": "partner",
        "wire": "partner"
      },
      {
        "name": "serial_number",
        "wire": "serialNumber"
      },
      {
        "name": "skip",
        "wire": "skip"
      },
      {
        "name": "sorting_direction",
        "wire": "sorting.direction"
      },
      {
        "name": "sorting_field",
        "wire": "sorting.field"
      },
      {
        "name": "take",
        "wire": "take"
      }
    ],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "total": 1,
      "data": [
        {
          "id": "73",
          "serialNumber": "85000711",
          "alternateKey": "ID85000711",
          "name": "Atlanta Downtown Front Desk 1",
          "deviceType": {
            "id": "23",
            "name": "SREDKey"
          },
          "deviceState": {
            "id": "2",
            "name": "activated"
          },
          "deviceBuild": {
            "id": "1305",
            "name": "SREDKey 2 - PTS 5.X",
            "buildNumber": "IDTECH-007"
          },
          "kif": {
            "id": "4",
            "name": "Kriptithe Technologies"
          },
          "location": {
            "id": "33668",
            "name": "The Tired Window Atlanta Downtown"
          },
          "partner": {
            "id": "6580",
            "name": "ASM Software"
          },
          "client": {
            "id": "4684",
            "name": "The Tired Window"
          },
          "activationDate": "2017-05-08T20:14:45.000Z",
          "lastActivityDate": "2017-05-08T20:14:45.000Z",
          "created": "2017-02-08T20:14:45.000Z",
          "modified": "2017-05-08T20:14:45.000Z",
          "version": 3,
          "isVirtual": false,
          "notes": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        }
      ]
    },
    "idField": "id"
  },
  {
    "entity": "device",
    "accessor": "Device",
    "op": "load",
    "method": "GET",
    "path": "/devices/{serialNumber}/{deviceType}",
    "args": [
      {
        "name": "device_type",
        "wire": "deviceType",
        "value": "p1"
      },
      {
        "name": "serial_number",
        "wire": "serialNumber",
        "value": "p2"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "73",
      "serialNumber": "85000711",
      "alternateKey": "ID85000711",
      "name": "Atlanta Downtown Front Desk 1",
      "deviceType": {
        "id": "23",
        "name": "SREDKey"
      },
      "deviceState": {
        "id": "2",
        "name": "activated"
      },
      "kif": {
        "id": "4",
        "name": "Kriptithe Technologies"
      },
      "location": {
        "id": "33668",
        "name": "The Tired Window Atlanta Downtown"
      },
      "partner": {
        "id": "6580",
        "name": "ASM Software"
      },
      "client": {
        "id": "4684",
        "name": "The Tired Window"
      },
      "injectKey": {
        "id": "1",
        "name": "BPSDecrypt 8"
      },
      "deviceBuild": {
        "id": "1305",
        "name": "SREDKey 2 - PTS 5.X",
        "buildNumber": "IDTECH-007"
      },
      "initializedDate": "2017-05-08T20:14:45.000Z",
      "activationDate": "2017-05-08T20:14:45.000Z",
      "auditNextDate": "2017-05-08T20:14:45.000Z",
      "auditNotificationDate": "2017-05-08T20:14:45.000Z",
      "lastActivityDate": "2017-05-08T20:14:45.000Z",
      "errorCounter": 1,
      "errorLastDate": "2017-02-08T20:14:45.000Z",
      "initializedBy": {
        "id": "56"
      },
      "activatedBy": {
        "id": "56"
      },
      "createdBy": {
        "id": "56"
      },
      "modifiedBy": {
        "id": "56"
      },
      "created": "2017-02-08T20:14:45.000Z",
      "modified": "2017-02-08T20:14:45.000Z",
      "version": 3,
      "notes": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    },
    "idField": "id"
  },
  {
    "entity": "device",
    "accessor": "Device",
    "op": "load",
    "method": "GET",
    "path": "/devices/{id}",
    "args": [
      {
        "name": "id",
        "wire": "id",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "73",
      "serialNumber": "85000711",
      "alternateKey": "ID85000711",
      "name": "Atlanta Downtown Front Desk 1",
      "deviceType": {
        "id": "23",
        "name": "SREDKey"
      },
      "deviceState": {
        "id": "2",
        "name": "activated"
      },
      "kif": {
        "id": "4",
        "name": "Kriptithe Technologies"
      },
      "location": {
        "id": "33668",
        "name": "The Tired Window Atlanta Downtown"
      },
      "partner": {
        "id": "6580",
        "name": "ASM Software"
      },
      "client": {
        "id": "4684",
        "name": "The Tired Window"
      },
      "injectKey": {
        "id": "1",
        "name": "BPSDecrypt 8"
      },
      "deviceBuild": {
        "id": "1305",
        "name": "SREDKey 2 - PTS 5.X",
        "buildNumber": "IDTECH-007"
      },
      "initializedDate": "2017-05-08T20:14:45.000Z",
      "activationDate": "2017-05-08T20:14:45.000Z",
      "auditNextDate": "2017-05-08T20:14:45.000Z",
      "auditNotificationDate": "2017-05-08T20:14:45.000Z",
      "lastActivityDate": "2017-05-08T20:14:45.000Z",
      "errorCounter": 1,
      "errorLastDate": "2017-02-08T20:14:45.000Z",
      "initializedBy": {
        "id": "56"
      },
      "activatedBy": {
        "id": "56"
      },
      "createdBy": {
        "id": "56"
      },
      "modifiedBy": {
        "id": "56"
      },
      "created": "2017-02-08T20:14:45.000Z",
      "modified": "2017-02-08T20:14:45.000Z",
      "version": 3,
      "notes": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    },
    "idField": "id"
  },
  {
    "entity": "device_build",
    "accessor": "DeviceBuild",
    "op": "list",
    "method": "GET",
    "path": "/deviceBuilds",
    "args": [],
    "select": {
      "device_type": "v1",
      "skip": 0,
      "take": 10
    },
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [
      "deviceType",
      "take",
      "skip"
    ],
    "queryArgs": [
      {
        "name": "device_type",
        "wire": "deviceType"
      },
      {
        "name": "skip",
        "wire": "skip"
      },
      {
        "name": "take",
        "wire": "take"
      }
    ],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "total": 1,
      "data": [
        {
          "id": 1305,
          "name": "SREDKey 2 - PTS 5.X",
          "isActive": true,
          "deviceType": "SREDKey 2",
          "buildNumber": "IDTECH-007",
          "appVersion": "N/A",
          "hardwareVersion": "80172001(With MSR), 80172002(Without MSR)",
          "firmwareVersion": "SREDKEY2 FW v1.00.xxx.xxxx.S",
          "whiteListingUsed": true,
          "whiteListingBinRanges": "410000",
          "configFileName": "4.234.72"
        }
      ]
    },
    "idField": "id"
  },
  {
    "entity": "device_build",
    "accessor": "DeviceBuild",
    "op": "load",
    "method": "GET",
    "path": "/deviceBuilds/{id}",
    "args": [
      {
        "name": "id",
        "wire": "id",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": 1305,
      "name": "SREDKey 2 - PTS 5.X",
      "isActive": true,
      "deviceType": "SREDKey 2",
      "buildNumber": "IDTECH-007",
      "notes": "Firmware only device - Bluefin build ordered with Encryption enabled from Manufacturer",
      "appVersion": "N/A",
      "hardwareVersion": "80172001(With MSR), 80172002(Without MSR)",
      "firmwareVersion": "SREDKEY2 FW v1.00.xxx.xxxx.S",
      "whiteListingUsed": true,
      "whiteListingBinRanges": "410000",
      "configFileName": "4.234.72",
      "version": 3,
      "created": "2017-02-08T20:14:45.000Z",
      "modified": "2017-02-08T20:14:45.000Z"
    },
    "idField": "id"
  },
  {
    "entity": "device_custody_detail",
    "accessor": "DeviceCustodyDetail",
    "op": "load",
    "method": "GET",
    "path": "/devices/{serialNumber}/{deviceType}/custody/{id}",
    "args": [
      {
        "name": "device_type",
        "wire": "deviceType",
        "value": "p1"
      },
      {
        "name": "id",
        "wire": "id",
        "value": "p2"
      },
      {
        "name": "serial_number",
        "wire": "serialNumber",
        "value": "p3"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": 10,
      "device": {
        "id": "73",
        "serialNumber": "85000711"
      },
      "location": {
        "id": "33668",
        "name": "The Tired Window Atlanta Downtown"
      },
      "transferMethod": {
        "id": 3,
        "name": "Shipment"
      },
      "status": {
        "id": 2,
        "name": "Received"
      },
      "custodian": {
        "id": "56",
        "name": "Joan Smith"
      },
      "completeDate": "2017-02-08T20:14:45.000Z",
      "notes": "Altering custody due to change of personel at site.",
      "createdBy": {
        "id": "56",
        "name": "Joan Smith"
      },
      "modifiedBy": {
        "id": "56",
        "name": "Joan Smith"
      },
      "created": "2017-02-08T20:14:45.000Z",
      "modified": "2017-05-08T20:14:45.000Z",
      "version": 3
    },
    "idField": "id"
  },
  {
    "entity": "device_custody_list_item",
    "accessor": "DeviceCustodyListItem",
    "op": "list",
    "method": "GET",
    "path": "/devices/{serialNumber}/{deviceType}/custody",
    "args": [
      {
        "name": "device_type",
        "wire": "deviceType",
        "value": "p1"
      },
      {
        "name": "serial_number",
        "wire": "serialNumber",
        "value": "p2"
      }
    ],
    "select": {
      "skip": 0,
      "take": 10
    },
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [
      "take",
      "skip"
    ],
    "queryArgs": [
      {
        "name": "skip",
        "wire": "skip"
      },
      {
        "name": "take",
        "wire": "take"
      }
    ],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "total": 1,
      "data": [
        {
          "id": 10,
          "device": {
            "id": "73",
            "serialNumber": "85000711"
          },
          "location": {
            "id": "33668",
            "name": "The Tired Window Atlanta Downtown"
          },
          "transferMethod": {
            "id": 3,
            "name": "Shipment"
          },
          "status": {
            "id": 2,
            "name": "Received"
          },
          "custodian": {
            "id": "56"
          },
          "completeDate": "2017-02-08T20:14:45.000Z",
          "notes": "Altering custody due to change of personel at site.",
          "createdBy": {
            "id": "56"
          },
          "modifiedBy": {
            "id": "56"
          },
          "created": "2017-02-08T20:14:45.000Z",
          "modified": "2017-05-08T20:14:45.000Z",
          "version": 3
        }
      ]
    },
    "idField": "id"
  },
  {
    "entity": "device_receive_result",
    "accessor": "DeviceReceiveResult",
    "op": "create",
    "method": "POST",
    "path": "/devices/receive",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "success": false
    },
    "idField": "id"
  },
  {
    "entity": "device_rki_activate_result",
    "accessor": "DeviceRkiActivateResult",
    "op": "create",
    "method": "POST",
    "path": "/devices/rki/activate",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "success": false
    },
    "idField": "id"
  },
  {
    "entity": "device_state",
    "accessor": "DeviceState",
    "op": "list",
    "method": "GET",
    "path": "/deviceStates",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "total": 1,
      "data": [
        {
          "id": 2,
          "name": "Injected"
        }
      ]
    },
    "idField": "id"
  },
  {
    "entity": "device_type",
    "accessor": "DeviceType",
    "op": "list",
    "method": "GET",
    "path": "/deviceTypes",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "total": 1,
      "data": [
        {
          "id": "23",
          "name": "IDtech SecuRED",
          "isActive": true
        }
      ]
    },
    "idField": "id"
  },
  {
    "entity": "device_type",
    "accessor": "DeviceType",
    "op": "load",
    "method": "GET",
    "path": "/deviceTypes/{id}",
    "args": [
      {
        "name": "id",
        "wire": "id",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "23",
      "name": "IDtech SecuRED",
      "isActive": true,
      "photoUrl": "",
      "manufacturer": "IDTech",
      "productName": "SecuRed",
      "model": "IDSK-534833TEB",
      "hardwareVersion": "1.0",
      "deviceTypeMode": "Default",
      "version": 3,
      "created": "2017-02-08T20:14:45.000Z",
      "modified": "2017-02-08T20:14:45.000Z"
    },
    "idField": "id"
  },
  {
    "entity": "inject_key",
    "accessor": "InjectKey",
    "op": "list",
    "method": "GET",
    "path": "/injectKeys",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "total": 1,
      "data": [
        {
          "id": "1",
          "name": "ANSI TEST KEY (3)",
          "isActive": true,
          "isP2PE": true
        }
      ]
    },
    "idField": "id"
  },
  {
    "entity": "inject_key",
    "accessor": "InjectKey",
    "op": "load",
    "method": "GET",
    "path": "/injectKeys/{id}",
    "args": [
      {
        "name": "id",
        "wire": "id",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "1",
      "name": "ANSI TEST KEY (3)",
      "isActive": true,
      "isP2PE": true,
      "keyType": "3DES/CBC",
      "version": 3,
      "created": "2017-02-08T20:14:45.000Z",
      "modified": "2017-02-08T20:14:45.000Z"
    },
    "idField": "id"
  },
  {
    "entity": "kif",
    "accessor": "Kif",
    "op": "list",
    "method": "GET",
    "path": "/kifs",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "total": 1,
      "data": [
        {
          "id": 4,
          "name": "Kriptithe Technologies"
        }
      ]
    },
    "idField": "id"
  },
  {
    "entity": "location",
    "accessor": "Location",
    "op": "create",
    "method": "POST",
    "path": "/locations",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "10"
    },
    "idField": "id"
  },
  {
    "entity": "location",
    "accessor": "Location",
    "op": "list",
    "method": "GET",
    "path": "/locations",
    "args": [],
    "select": {
      "client": "v1",
      "skip": 0,
      "take": 10
    },
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [
      "client",
      "take",
      "skip"
    ],
    "queryArgs": [
      {
        "name": "client",
        "wire": "client"
      },
      {
        "name": "skip",
        "wire": "skip"
      },
      {
        "name": "take",
        "wire": "take"
      }
    ],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "total": 1,
      "data": [
        {
          "id": "73",
          "name": "ASM Software Headquarters",
          "customReference": "ASDF234",
          "billingId": "x",
          "nameOfBusiness": "The Tired Window",
          "locationType": "Merchant retail location",
          "country": "United States",
          "address1": "123 Main St",
          "address2": "Suite 100",
          "city": "Atlanta",
          "stateProvince": "Georgia",
          "postalCode": "30350",
          "mailCountry": "United States",
          "mailAddress1": "123 Main St",
          "mailAddress2": "Suite 100",
          "mailCity": "Atlanta",
          "mailStateProvince": "Georgia",
          "mailPostalCode": "30350",
          "notes": "Dial 129 on the intercom to speak with our receptionist.",
          "version": 3
        }
      ]
    },
    "idField": "id"
  },
  {
    "entity": "location",
    "accessor": "Location",
    "op": "load",
    "method": "GET",
    "path": "/locations/{id}",
    "args": [
      {
        "name": "id",
        "wire": "id",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "73",
      "name": "ASM Software Headquarters",
      "customReference": "ASDF234",
      "billingId": "x",
      "nameOfBusiness": "The Tired Window",
      "locationType": "Merchant retail location",
      "uniqueId": "8",
      "country": "United States",
      "address1": "123 Main St",
      "address2": "Suite 100",
      "city": "Atlanta",
      "stateProvince": "Georgia",
      "postalCode": "30350",
      "mailCountry": "United States",
      "mailAddress1": "123 Main St",
      "mailAddress2": "Suite 100",
      "mailCity": "Atlanta",
      "mailStateProvince": "Georgia",
      "mailPostalCode": "30350",
      "notes": "Dial 129 on the intercom to speak with our receptionist.",
      "version": 3,
      "created": "2017-02-08T20:14:45.000Z",
      "modified": "2017-02-08T20:14:45.000Z"
    },
    "idField": "id"
  },
  {
    "entity": "location",
    "accessor": "Location",
    "op": "remove",
    "method": "DELETE",
    "path": "/locations/{id}",
    "args": [
      {
        "name": "id",
        "wire": "id",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": null,
    "idField": "id"
  },
  {
    "entity": "partner",
    "accessor": "Partner",
    "op": "create",
    "method": "POST",
    "path": "/partners",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "10"
    },
    "idField": "id"
  },
  {
    "entity": "partner",
    "accessor": "Partner",
    "op": "list",
    "method": "GET",
    "path": "/partners",
    "args": [],
    "select": {
      "partner": "v1",
      "skip": 0,
      "take": 10
    },
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [
      "partner",
      "take",
      "skip"
    ],
    "queryArgs": [
      {
        "name": "partner",
        "wire": "partner"
      },
      {
        "name": "skip",
        "wire": "skip"
      },
      {
        "name": "take",
        "wire": "take"
      }
    ],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "total": 1,
      "data": [
        {
          "id": "73",
          "name": "ASM Software",
          "reference": "asmsoftware",
          "billingId": "001J000001ngZle",
          "partnerId": "10",
          "verificationPhrase": "The quick brown fox jumps over the lazy dog",
          "clientCanOrderEquipment": false,
          "isActive": true,
          "version": 3,
          "parent": {
            "id": "6580",
            "name": "ASM Software"
          },
          "location": {
            "id": "33668",
            "name": "The Tired Window Atlanta Downtown"
          },
          "contact": {
            "id": "56"
          }
        }
      ]
    },
    "idField": "id"
  },
  {
    "entity": "partner",
    "accessor": "Partner",
    "op": "load",
    "method": "GET",
    "path": "/partners/{id}",
    "args": [
      {
        "name": "id",
        "wire": "id",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "73",
      "name": "ASM Software",
      "reference": "asmsoftware",
      "billingId": "001J000001ngZle",
      "partnerId": "10",
      "verificationPhrase": "The quick brown fox jumps over the lazy dog",
      "clientCanOrderEquipment": false,
      "isActive": true,
      "version": 3,
      "parent": {
        "id": "6580",
        "name": "ASM Software"
      },
      "location": {
        "id": "33668",
        "name": "The Tired Window Atlanta Downtown"
      },
      "contact": {
        "id": "56",
        "firstName": "Kaleena",
        "lastName": "Gilluley",
        "email": "kgilluley0@zdnet.com"
      },
      "created": "2017-02-08T20:14:45.000Z",
      "modified": "2017-02-08T20:14:45.000Z"
    },
    "idField": "id"
  },
  {
    "entity": "shipment",
    "accessor": "Shipment",
    "op": "create",
    "method": "POST",
    "path": "/shipments",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "10"
    },
    "idField": "id"
  },
  {
    "entity": "shipment",
    "accessor": "Shipment",
    "op": "list",
    "method": "GET",
    "path": "/shipments",
    "args": [],
    "select": {
      "kif": "v1",
      "mode": "v1",
      "skip": 0,
      "take": 10
    },
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [
      "kif",
      "mode",
      "take",
      "skip"
    ],
    "queryArgs": [
      {
        "name": "kif",
        "wire": "kif"
      },
      {
        "name": "mode",
        "wire": "mode"
      },
      {
        "name": "skip",
        "wire": "skip"
      },
      {
        "name": "take",
        "wire": "take"
      }
    ],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "total": 1,
      "data": [
        {
          "id": "73",
          "carrier": "UPS",
          "tracking": "1Z999AA10123456784",
          "dateShipped": "2017-02-08T20:14:45.000Z",
          "dateReceived": "2017-02-09T20:14:45.000Z",
          "shipmentType": "KIF Shipment",
          "version": 3,
          "partner": {
            "id": "6580",
            "name": "ASM Software"
          },
          "client": {
            "id": "4684",
            "name": "The Tired Window"
          },
          "kif": {
            "id": "4",
            "name": "Kriptithe Technologies"
          },
          "dcKif": {
            "id": "4",
            "name": "Kriptithe Technologies"
          }
        }
      ]
    },
    "idField": "id"
  },
  {
    "entity": "shipment",
    "accessor": "Shipment",
    "op": "load",
    "method": "GET",
    "path": "/shipments/{id}",
    "args": [
      {
        "name": "id",
        "wire": "id",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "73",
      "carrier": "UPS",
      "tracking": "1Z999AA10123456784",
      "dateShipped": "2017-02-08T20:14:45.000Z",
      "dateReceived": "2017-02-09T20:14:45.000Z",
      "shipmentType": "KIF Shipment",
      "version": 3,
      "partner": {
        "id": "6580",
        "name": "ASM Software"
      },
      "client": {
        "id": "4684",
        "name": "The Tired Window"
      },
      "kif": {
        "id": "4",
        "name": "Kriptithe Technologies"
      },
      "dcKif": {
        "id": "4",
        "name": "Kriptithe Technologies"
      },
      "items": [
        {
          "id": "73",
          "tamperLabel": "BF120877",
          "dateReceived": "2017-02-09T20:14:45.000Z",
          "alternateKey": "",
          "deviceState": "x",
          "serialNumber": "85000711",
          "deviceName": "x",
          "version": 3,
          "created": "2017-02-08T20:14:45.000Z",
          "modified": "2017-02-08T20:14:45.000Z"
        }
      ],
      "created": "2017-02-08T20:14:45.000Z",
      "modified": "2017-02-08T20:14:45.000Z"
    },
    "idField": "id"
  },
  {
    "entity": "success",
    "accessor": "Success",
    "op": "create",
    "method": "POST",
    "path": "/virtualDevices/{sharePartnerTo}",
    "args": [
      {
        "name": "share_partner_to",
        "wire": "sharePartnerTo",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "success": true
    },
    "idField": "id"
  },
  {
    "entity": "success",
    "accessor": "Success",
    "op": "remove",
    "method": "DELETE",
    "path": "/virtualDevices/{sharePartnerTo}",
    "args": [
      {
        "name": "share_partner_to",
        "wire": "sharePartnerTo",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "success": true
    },
    "idField": "id"
  },
  {
    "entity": "transaction",
    "accessor": "Transaction",
    "op": "create",
    "method": "POST",
    "path": "/transactions",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "10"
    },
    "idField": "id"
  },
  {
    "entity": "transaction",
    "accessor": "Transaction",
    "op": "list",
    "method": "GET",
    "path": "/transactions",
    "args": [],
    "select": {
      "client": "v1",
      "client_ref": "v1",
      "date_from": "v1",
      "date_to": "v1",
      "location": "v1",
      "message_id": "v1",
      "paging_mode": "nocount",
      "partner": "v1",
      "reference": "v1",
      "serial_number": "v1",
      "skip": 0,
      "success": "v1",
      "take": 10
    },
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [
      "partner",
      "client",
      "location",
      "success",
      "dateFrom",
      "dateTo",
      "messageId",
      "clientRef",
      "serialNumber",
      "reference",
      "take",
      "skip",
      "paging.mode"
    ],
    "queryArgs": [
      {
        "name": "client",
        "wire": "client"
      },
      {
        "name": "client_ref",
        "wire": "clientRef"
      },
      {
        "name": "date_from",
        "wire": "dateFrom"
      },
      {
        "name": "date_to",
        "wire": "dateTo"
      },
      {
        "name": "location",
        "wire": "location"
      },
      {
        "name": "message_id",
        "wire": "messageId"
      },
      {
        "name": "paging_mode",
        "wire": "paging.mode"
      },
      {
        "name": "partner",
        "wire": "partner"
      },
      {
        "name": "reference",
        "wire": "reference"
      },
      {
        "name": "serial_number",
        "wire": "serialNumber"
      },
      {
        "name": "skip",
        "wire": "skip"
      },
      {
        "name": "success",
        "wire": "success"
      },
      {
        "name": "take",
        "wire": "take"
      }
    ],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "total": 1,
      "data": [
        {
          "id": "73",
          "method": "/decrypt/3DES/CBC",
          "success": true,
          "encrypted": 0,
          "decrypted": 2,
          "deviceName": "WisePad 2",
          "serialNumber": "WPC204633000146",
          "alternateKey": "204633000146",
          "isVirtual": false,
          "messageId": "1201712060850502212320171",
          "clientRef": "The Tired Window",
          "reference": "723f57e1-e9c8-48cb-81d9-547ad2b76435",
          "startDate": "2017-02-08T20:14:45.000Z",
          "endDate": "2017-02-08T20:14:45.000Z",
          "created": "2017-02-08T20:14:45.000Z",
          "client": {
            "id": "4684",
            "name": "The Tired Window"
          },
          "partner": {
            "id": "6580",
            "name": "ASM Software"
          },
          "directPartner": {
            "id": "6580",
            "name": "ASM Software"
          },
          "location": {
            "id": "33668",
            "name": "The Tired Window Atlanta Downtown"
          }
        }
      ]
    },
    "idField": "id"
  },
  {
    "entity": "transaction",
    "accessor": "Transaction",
    "op": "load",
    "method": "GET",
    "path": "/transactions/{id}",
    "args": [
      {
        "name": "id",
        "wire": "id",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "73",
      "method": "/decrypt/3DES/CBC",
      "success": true,
      "encrypted": 0,
      "decrypted": 2,
      "deviceName": "WisePad 2",
      "serialNumber": "WPC204633000146",
      "alternateKey": "204633000146",
      "isVirtual": false,
      "messageId": "1201712060850502212320171",
      "clientRef": "The Tired Window",
      "reference": "723f57e1-e9c8-48cb-81d9-547ad2b76435",
      "errMessage": "Device not found",
      "errCode": "1701",
      "ipAddress": "199.83.131.136",
      "startDate": "2017-02-08T20:14:45.000Z",
      "endDate": "2017-02-08T20:14:45.000Z",
      "created": "2017-02-08T20:14:45.000Z",
      "keyType": "3DES/CBC",
      "transactionSource": "Api",
      "client": {
        "id": "4684",
        "name": "The Tired Window"
      },
      "partner": {
        "id": "6580",
        "name": "ASM Software"
      },
      "directPartner": {
        "id": "6580",
        "name": "ASM Software"
      },
      "location": {
        "id": "33668",
        "name": "The Tired Window Atlanta Downtown"
      }
    },
    "idField": "id"
  },
  {
    "entity": "update_result",
    "accessor": "UpdateResult",
    "op": "create",
    "method": "POST",
    "path": "/users",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "10"
    },
    "idField": "id"
  },
  {
    "entity": "update_result",
    "accessor": "UpdateResult",
    "op": "list",
    "method": "GET",
    "path": "/users",
    "args": [],
    "select": {
      "client": "v1",
      "kif": "v1",
      "partner": "v1",
      "skip": 0,
      "take": 10
    },
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [
      "partner",
      "client",
      "kif",
      "take",
      "skip"
    ],
    "queryArgs": [
      {
        "name": "client",
        "wire": "client"
      },
      {
        "name": "kif",
        "wire": "kif"
      },
      {
        "name": "partner",
        "wire": "partner"
      },
      {
        "name": "skip",
        "wire": "skip"
      },
      {
        "name": "take",
        "wire": "take"
      }
    ],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "total": 10,
      "data": [
        {
          "id": "10",
          "userName": "kgilluley0",
          "firstName": "Kaleena",
          "lastName": "Gilluley",
          "email": "kgilluley0@zdnet.com",
          "phone": "2025550162",
          "isActive": true,
          "version": 3,
          "userRole": {
            "name": "Client User"
          },
          "partner": {
            "id": "6580",
            "name": "ASM Software"
          },
          "client": {
            "id": "4684",
            "name": "The Tired Window"
          },
          "kif": {
            "id": "4",
            "name": "Kriptithe Technologies"
          }
        }
      ]
    },
    "idField": "id"
  },
  {
    "entity": "user",
    "accessor": "User",
    "op": "load",
    "method": "GET",
    "path": "/users/{id}",
    "args": [
      {
        "name": "id",
        "wire": "id",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "id": "10",
      "userName": "kgilluley0",
      "firstName": "Kaleena",
      "lastName": "Gilluley",
      "email": "kgilluley0@zdnet.com",
      "phone": "2025550162",
      "isActive": true,
      "version": 3,
      "userRole": {
        "name": "Client User"
      },
      "partner": {
        "id": "6580",
        "name": "ASM Software"
      },
      "client": {
        "id": "4684",
        "name": "The Tired Window"
      },
      "kif": {
        "id": "4",
        "name": "Kriptithe Technologies"
      },
      "created": "2017-02-08T20:14:45.000Z",
      "modified": "2017-02-08T20:14:45.000Z"
    },
    "idField": "id"
  },
  {
    "entity": "user",
    "accessor": "User",
    "op": "remove",
    "method": "DELETE",
    "path": "/users/{id}",
    "args": [
      {
        "name": "id",
        "wire": "id",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": null,
    "idField": "id"
  },
  {
    "entity": "virtual_device",
    "accessor": "VirtualDevice",
    "op": "load",
    "method": "GET",
    "path": "/virtualDevices/{sharePartnerTo}",
    "args": [
      {
        "name": "id",
        "wire": "sharePartnerTo",
        "value": "p1"
      }
    ],
    "select": {
      "skip": 0,
      "sorting_direction": "asc",
      "sorting_field": "serialnumber",
      "take": 10
    },
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [
      "take",
      "skip",
      "sorting.field",
      "sorting.direction"
    ],
    "queryArgs": [
      {
        "name": "skip",
        "wire": "skip"
      },
      {
        "name": "sorting_direction",
        "wire": "sorting.direction"
      },
      {
        "name": "sorting_field",
        "wire": "sorting.field"
      },
      {
        "name": "take",
        "wire": "take"
      }
    ],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "total": 1,
      "data": [
        {
          "id": "73",
          "serialNumber": "85000711",
          "alternateKey": "ID85000711",
          "name": "Atlanta Downtown Front Desk 1",
          "deviceType": {
            "id": "23",
            "name": "SREDKey"
          },
          "deviceState": {
            "id": "2",
            "name": "activated"
          },
          "deviceBuild": {
            "id": "1305",
            "name": "SREDKey 2 - PTS 5.X",
            "buildNumber": "IDTECH-007"
          },
          "kif": {
            "id": "4",
            "name": "Kriptithe Technologies"
          },
          "location": {
            "id": "33668",
            "name": "The Tired Window Atlanta Downtown"
          },
          "partner": {
            "id": "6580",
            "name": "ASM Software"
          },
          "client": {
            "id": "4684",
            "name": "The Tired Window"
          },
          "activationDate": "2017-05-08T20:14:45.000Z",
          "lastActivityDate": "2017-05-08T20:14:45.000Z",
          "created": "2017-02-08T20:14:45.000Z",
          "modified": "2017-05-08T20:14:45.000Z",
          "version": 3,
          "isVirtual": false,
          "notes": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        }
      ]
    },
    "idField": "id"
  }
]


describe('definition', () => {
  for (const point of PLAN) {
    test(point.entity + '.' + point.op + ' ' + point.method + ' ' + point.path, async (t) => {
      const control = isControlSkipped('entityOp', point.entity + '.' + point.op, 'definition')
      if (control.skip) {
        t.skip(control.reason || 'skipped via sdk-test-control.json')
        return
      }
      await runDefinitionPoint(SDK, point)
    })
  }
})

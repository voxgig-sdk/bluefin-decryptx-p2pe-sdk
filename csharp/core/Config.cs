// BluefinDecryptxP2pe SDK - generated model configuration and feature
// factory. GENERATED from the API model - do not edit by hand.

namespace BluefinDecryptxP2peSdk;

public static class SdkConfig
{
    public static Dictionary<string, object?> MakeConfig()
    {
        return new Dictionary<string, object?>
        {
            ["main"] = new Dictionary<string, object?>
            {
                ["name"] = "BluefinDecryptxP2pe",
                ["slug"] = "bluefin-decryptx-p2pe",
                ["version"] = "0.1.1",
                ["target"] = "csharp",
            },
            ["feature"] = new Dictionary<string, object?>
            {
                ["audit"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["actor"] = "anonymous",
                        ["max"] = 1000,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["now"] = "`$FUNCTION`",
                        ["sink"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["clienttrack"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["clientVersion"] = "0.0.1",
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["clientName"] = "`$STRING`",
                        ["clientVersion"] = "`$STRING`",
                        ["headers"] = "`$MAP`",
                        ["idgen"] = "`$FUNCTION`",
                        ["sessionId"] = "`$STRING`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["debug"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["max"] = 100,
                        ["redact"] = new List<object?>
                        {
                            "authorization",
                            "cookie",
                            "set-cookie",
                            "api-key",
                            "apikey",
                            "x-api-key",
                            "idempotency-key",
                        },
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["now"] = "`$FUNCTION`",
                        ["onEntry"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["idempotency"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["header"] = "Idempotency-Key",
                        ["methods"] = new List<object?>
                        {
                            "POST",
                            "PUT",
                            "PATCH",
                            "DELETE",
                        },
                        ["ops"] = new List<object?>
                        {
                            "create",
                            "update",
                            "remove",
                        },
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["keygen"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["log"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = true,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["level"] = "`$STRING`",
                        ["logger"] = "`$ANY`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["metrics"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["now"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["paging"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["afterVar"] = "after",
                        ["cursorParam"] = "cursor",
                        ["firstVar"] = "first",
                        ["limitParam"] = "limit",
                        ["pageParam"] = "page",
                        ["startPage"] = 1,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["limit"] = "`$NUMBER`",
                        ["ops"] = "`$LIST`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["ratelimit"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["burst"] = 5,
                        ["rate"] = 5,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["now"] = "`$FUNCTION`",
                        ["sleep"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "wrap",
                },
                ["retry"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["factor"] = 2,
                        ["maxDelay"] = 2000,
                        ["minDelay"] = 50,
                        ["retries"] = 2,
                        ["statuses"] = new List<object?>
                        {
                            408,
                            425,
                            429,
                            500,
                            502,
                            503,
                            504,
                        },
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["jitter"] = "`$BOOLEAN`",
                        ["sleep"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "wrap",
                },
                ["telemetry"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["exporter"] = "`$FUNCTION`",
                        ["headers"] = "`$MAP`",
                        ["idgen"] = "`$FUNCTION`",
                        ["now"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["test"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["entity"] = "`$MAP`",
                        ["net"] = "`$MAP`",
                    },
                    ["strict"] = false,
                    ["transport"] = "base",
                },
                ["timeout"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["ms"] = 30000,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["clearTimer"] = "`$FUNCTION`",
                        ["setTimer"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "wrap",
                },
            },
            ["options"] = new Dictionary<string, object?>
            {
                ["base"] = "https://apis.p2pemanager.com/api/v1",
                ["auth"] = new Dictionary<string, object?>
                {
                    ["prefix"] = "Basic",
                    ["basic"] = true,
                },
                ["headers"] = new Dictionary<string, object?>
                {
                    ["content-type"] = "application/json",
                },
                ["entity"] = new Dictionary<string, object?>
                {
                    ["attestation"] = new Dictionary<string, object?>(),
                    ["client"] = new Dictionary<string, object?>(),
                    ["create_result"] = new Dictionary<string, object?>(),
                    ["decryption"] = new Dictionary<string, object?>(),
                    ["device"] = new Dictionary<string, object?>(),
                    ["device_build"] = new Dictionary<string, object?>(),
                    ["device_custody_detail"] = new Dictionary<string, object?>(),
                    ["device_custody_list_item"] = new Dictionary<string, object?>(),
                    ["device_receive_result"] = new Dictionary<string, object?>(),
                    ["device_rki_activate_result"] = new Dictionary<string, object?>(),
                    ["device_state"] = new Dictionary<string, object?>(),
                    ["device_type"] = new Dictionary<string, object?>(),
                    ["inject_key"] = new Dictionary<string, object?>(),
                    ["kif"] = new Dictionary<string, object?>(),
                    ["location"] = new Dictionary<string, object?>(),
                    ["partner"] = new Dictionary<string, object?>(),
                    ["shipment"] = new Dictionary<string, object?>(),
                    ["success"] = new Dictionary<string, object?>(),
                    ["transaction"] = new Dictionary<string, object?>(),
                    ["update_result"] = new Dictionary<string, object?>(),
                    ["user"] = new Dictionary<string, object?>(),
                    ["virtual_device"] = new Dictionary<string, object?>(),
                },
            },
            ["entity"] = new Dictionary<string, object?>
            {
                ["attestation"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "client",
                            ["title"] = "Client",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Client resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "completeDate",
                            ["title"] = "Complete Date",
                            ["type"] = "`$STRING`",
                            ["short"] = "The date and time that the Attestation took place.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["title"] = "Created",
                            ["type"] = "`$STRING`",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "device",
                            ["title"] = "Device",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Device resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "This resource's unique identifier.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["title"] = "Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "Text describing the attestation.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "notes",
                            ["title"] = "Notes",
                            ["type"] = "`$STRING`",
                            ["short"] = "Free form field that allows the Client associate notes with the Attestation.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "attestation",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/attestations",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "attestations",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "attestations",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                            },
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/attestations",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "attestations",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "attestations",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 10,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "client",
                                            "skip",
                                            "take",
                                        },
                                    },
                                },
                            },
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/attestations/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "attestations",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "attestations",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["client"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "contact",
                            ["title"] = "Contact",
                            ["type"] = "`$OBJECT`",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                            ["short"] = "Reference to the associated User resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["title"] = "Created",
                            ["type"] = "`$STRING`",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "directPartner",
                            ["title"] = "Direct Partner",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "This resource's unique identifier.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["title"] = "Is Active",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "This property indicates if the Client account is active or disabled.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "location",
                            ["title"] = "Location",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["short"] = "Reference to the associated Location resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mid",
                            ["title"] = "Mid",
                            ["type"] = "`$STRING`",
                            ["short"] = "Some Partners will have an merchant ids on their own software offerings.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modified",
                            ["title"] = "Modified",
                            ["type"] = "`$STRING`",
                            ["short"] = "Last modified timestamp.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["title"] = "Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Client's name.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["title"] = "Partner",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the Client's root Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["title"] = "Version",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number of times that this resource has been updated.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "client",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/clients",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "clients",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                            },
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/clients",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "clients",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 10,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "partner",
                                            "skip",
                                            "take",
                                        },
                                    },
                                },
                            },
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/clients/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "clients",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                        ["remove"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "remove",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "DELETE",
                                    ["orig"] = "/clients/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "clients",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["create_result"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>(),
                    ["name"] = "create_result",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/devices/{serialNumber}/{deviceType}/custody",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "devices",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "serial_number",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "device_type",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "custody",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "{serial_number}",
                                        "{device_type}",
                                        "custody",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["deviceType"] = "device_type",
                                            ["serialNumber"] = "serial_number",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "device_type",
                                                ["orig"] = "device_type",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "device_type",
                                            "serial_number",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "$.main.kit.entity.device",
                            },
                        },
                    },
                },
                ["decryption"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "success",
                            ["title"] = "Success",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "true if the payload decryption was successful.",
                        },
                    },
                    ["name"] = "decryption",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/decryption",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "decryption",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "decryption",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["device"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "activatedBy",
                            ["title"] = "Activated By",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "activationDate",
                            ["title"] = "Activation Date",
                            ["type"] = "`$STRING`",
                            ["short"] = "Timestamp from when the Device was activated.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "alternateKey",
                            ["title"] = "Alternate Key",
                            ["type"] = "`$STRING`",
                            ["short"] = "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "auditNextDate",
                            ["title"] = "Audit Next Date",
                            ["type"] = "`$STRING`",
                            ["short"] = "Date and time that the Device is due its next PCI Audit.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "auditNotificationDate",
                            ["title"] = "Audit Notification Date",
                            ["type"] = "`$STRING`",
                            ["short"] = "Date and time that a notification should be sent that a PCI audit is due.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "client",
                            ["title"] = "Client",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Client resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["title"] = "Created",
                            ["type"] = "`$STRING`",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "createdBy",
                            ["title"] = "Created By",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "deviceBuild",
                            ["title"] = "Device Build",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Device Build resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "deviceState",
                            ["title"] = "Device State",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Device State resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "deviceType",
                            ["title"] = "Device Type",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Device Type resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "errorCounter",
                            ["title"] = "Error Counter",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number times the Device has been in error.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "errorLastDate",
                            ["title"] = "Error Last Date",
                            ["type"] = "`$STRING`",
                            ["short"] = "Timestamp from the last time that the Device had an error.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Device's unique identifier.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "initializedBy",
                            ["title"] = "Initialized By",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "initializedDate",
                            ["title"] = "Initialized Date",
                            ["type"] = "`$STRING`",
                            ["short"] = "Timestamp from when the Device was initialized.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "injectKey",
                            ["title"] = "Inject Key",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Device resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isVirtual",
                            ["title"] = "Is Virtual",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "Indicates if a Device is Virtual (represents a Device shared with a partner).",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "kif",
                            ["title"] = "Kif",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated KIF resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "lastActivityDate",
                            ["title"] = "Last Activity Date",
                            ["type"] = "`$STRING`",
                            ["short"] = "Timestamp from the last time that the Device was used.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "location",
                            ["title"] = "Location",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["short"] = "Reference to the associated Location resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modified",
                            ["title"] = "Modified",
                            ["type"] = "`$STRING`",
                            ["short"] = "Last modified timestamp.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modifiedBy",
                            ["title"] = "Modified By",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["title"] = "Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Device's name.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "notes",
                            ["title"] = "Notes",
                            ["type"] = "`$STRING`",
                            ["short"] = "Arbitary note that can be attached to a Device entry.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["title"] = "Partner",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "serialNumber",
                            ["title"] = "Serial Number",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Device's serial number.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["title"] = "Version",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number of times that this resource has been updated.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "device",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/devices",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "devices",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                            },
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/devices",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "devices",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "device_state",
                                                ["orig"] = "device_state",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "kif",
                                                ["orig"] = "kif",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "sorting_direction",
                                                ["orig"] = "sorting_direction",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["example"] = "asc",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "sorting_field",
                                                ["orig"] = "sorting_field",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["example"] = "serialnumber",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 10,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
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
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/devices/{serialNumber}/{deviceType}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "devices",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "serial_number",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "device_type",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "{serial_number}",
                                        "{device_type}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["deviceType"] = "device_type",
                                            ["serialNumber"] = "serial_number",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "device_type",
                                                ["orig"] = "device_type",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "device_type",
                                            "serial_number",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/devices/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "devices",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["device_build"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "appVersion",
                            ["title"] = "App Version",
                            ["type"] = "`$STRING`",
                            ["short"] = "If a Device Type has more than one Application Code version the supported version is specified here.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "buildNumber",
                            ["title"] = "Build Number",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Build Number.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "configFileName",
                            ["title"] = "Config File Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The name of the configuration file that is uploaded to the device.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["title"] = "Created",
                            ["type"] = "`$STRING`",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["format"] = "date-time",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "deviceType",
                            ["title"] = "Device Type",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Device Type Name.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "firmwareVersion",
                            ["title"] = "Firmware Version",
                            ["type"] = "`$STRING`",
                            ["short"] = "A list of firmware versions that this Device Build covers.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "hardwareVersion",
                            ["title"] = "Hardware Version",
                            ["type"] = "`$STRING`",
                            ["short"] = "A list of hardware versions that this Device Build covers.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "This resource's unique identifier.",
                            ["format"] = "int64",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["title"] = "Is Active",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "This property indicates if the device build is still active and not succeeded by subsequent build.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modified",
                            ["title"] = "Modified",
                            ["type"] = "`$STRING`",
                            ["short"] = "Last modified timestamp.",
                            ["format"] = "date-time",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["title"] = "Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Device Builds's name.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "notes",
                            ["title"] = "Notes",
                            ["type"] = "`$STRING`",
                            ["short"] = "Notes attached to the device build by Bluefin CISO.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["title"] = "Version",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number of times that this resource has been updated.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "whiteListingBinRanges",
                            ["title"] = "White Listing Bin Ranges",
                            ["type"] = "`$STRING`",
                            ["short"] = "A comma separated list of BIN ranges that aren't encrypted by the terminal.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "whiteListingUsed",
                            ["title"] = "White Listing Used",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "device_build",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/deviceBuilds",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "deviceBuilds",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "deviceBuilds",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "device_type",
                                                ["orig"] = "device_type",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 10,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "device_type",
                                            "skip",
                                            "take",
                                        },
                                    },
                                },
                            },
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/deviceBuilds/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "deviceBuilds",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "deviceBuilds",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["device_custody_detail"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "completeDate",
                            ["title"] = "Complete Date",
                            ["type"] = "`$STRING`",
                            ["short"] = "The date and time that the Custody change took place.",
                            ["format"] = "date-time",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["title"] = "Created",
                            ["type"] = "`$STRING`",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["format"] = "date-time",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "createdBy",
                            ["title"] = "Created By",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "custodian",
                            ["title"] = "Custodian",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "device",
                            ["title"] = "Device",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Device resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "This resource's unique identifier.",
                            ["format"] = "int64",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "location",
                            ["title"] = "Location",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["short"] = "Reference to the associated Location resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modified",
                            ["title"] = "Modified",
                            ["type"] = "`$STRING`",
                            ["short"] = "Last modified timestamp.",
                            ["format"] = "date-time",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modifiedBy",
                            ["title"] = "Modified By",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "notes",
                            ["title"] = "Notes",
                            ["type"] = "`$STRING`",
                            ["short"] = "Free form field that allows the Client associate notes with the Custody Change.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "status",
                            ["title"] = "Status",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Custody Status.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "transferMethod",
                            ["title"] = "Transfer Method",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Transfer Method.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["title"] = "Version",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number of times that this resource has been updated.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "device_custody_detail",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/devices/{serialNumber}/{deviceType}/custody/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "devices",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "serial_number",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "device_type",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "custody",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "{serial_number}",
                                        "{device_type}",
                                        "custody",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["deviceType"] = "device_type",
                                            ["serialNumber"] = "serial_number",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "device_type",
                                                ["orig"] = "device_type",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "device_type",
                                            "id",
                                            "serial_number",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "$.main.kit.entity.device",
                            },
                        },
                    },
                },
                ["device_custody_list_item"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "completeDate",
                            ["title"] = "Complete Date",
                            ["type"] = "`$STRING`",
                            ["short"] = "The date and time that the Custody change took place.",
                            ["format"] = "date-time",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["title"] = "Created",
                            ["type"] = "`$STRING`",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["format"] = "date-time",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "createdBy",
                            ["title"] = "Created By",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "custodian",
                            ["title"] = "Custodian",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "device",
                            ["title"] = "Device",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Device resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "This resource's unique identifier.",
                            ["format"] = "int64",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "location",
                            ["title"] = "Location",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["short"] = "Reference to the associated Location resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modified",
                            ["title"] = "Modified",
                            ["type"] = "`$STRING`",
                            ["short"] = "Last modified timestamp.",
                            ["format"] = "date-time",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modifiedBy",
                            ["title"] = "Modified By",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "notes",
                            ["title"] = "Notes",
                            ["type"] = "`$STRING`",
                            ["short"] = "Free form field that allows the Client associate notes with the Custody Change.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "status",
                            ["title"] = "Status",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Custody Status.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "transferMethod",
                            ["title"] = "Transfer Method",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Transfer Method.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["title"] = "Version",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number of times that this resource has been updated.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "device_custody_list_item",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/devices/{serialNumber}/{deviceType}/custody",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "devices",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "serial_number",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "device_type",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "custody",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "{serial_number}",
                                        "{device_type}",
                                        "custody",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["deviceType"] = "device_type",
                                            ["serialNumber"] = "serial_number",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "device_type",
                                                ["orig"] = "device_type",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 10,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
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
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "$.main.kit.entity.device",
                            },
                        },
                    },
                },
                ["device_receive_result"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "success",
                            ["title"] = "Success",
                            ["type"] = "`$BOOLEAN`",
                            ["req"] = true,
                            ["short"] = "Indicates if the action succeeded.",
                        },
                    },
                    ["name"] = "device_receive_result",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/devices/receive",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "devices",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "receive",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "receive",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["device_rki_activate_result"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "success",
                            ["title"] = "Success",
                            ["type"] = "`$BOOLEAN`",
                            ["req"] = true,
                            ["short"] = "Indicates if the RKI activation succeeded.",
                        },
                    },
                    ["name"] = "device_rki_activate_result",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/devices/rki/activate",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "devices",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "rki",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "activate",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "rki",
                                        "activate",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["device_state"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "Unique identifier for this Device state.",
                            ["format"] = "int64",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["title"] = "Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "Descriptive name for this Device state.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "device_state",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/deviceStates",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "deviceStates",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "deviceStates",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["device_type"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["title"] = "Created",
                            ["type"] = "`$STRING`",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "deviceTypeMode",
                            ["title"] = "Device Type Mode",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Device type.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "hardwareVersion",
                            ["title"] = "Hardware Version",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Device hardware version.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "Unique idenifier.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["title"] = "Is Active",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "This property indicates if the DeviceType is active.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "manufacturer",
                            ["title"] = "Manufacturer",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Device manufacturer.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "model",
                            ["title"] = "Model",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Device model.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modified",
                            ["title"] = "Modified",
                            ["type"] = "`$STRING`",
                            ["short"] = "Last modified timestamp.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["title"] = "Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The DeviceType name.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "photoUrl",
                            ["title"] = "Photo Url",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productName",
                            ["title"] = "Product Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Device name.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["title"] = "Version",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number of times that this resource has been updated.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "device_type",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/deviceTypes",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "deviceTypes",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "deviceTypes",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                            },
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/deviceTypes/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "deviceTypes",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "deviceTypes",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["inject_key"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["title"] = "Created",
                            ["type"] = "`$STRING`",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "unique idenifier",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["title"] = "Is Active",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "Active flag, inactive keys cannot be assigned to devices.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isP2PE",
                            ["title"] = "Is P2 Pe",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "Flags if a key is for a P2PE compliant cypher.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "keyType",
                            ["title"] = "Key Type",
                            ["type"] = "`$STRING`",
                            ["short"] = "The cipher type that the key works with.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modified",
                            ["title"] = "Modified",
                            ["type"] = "`$STRING`",
                            ["short"] = "Last modified timestamp in ISO 8601 format.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["title"] = "Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "Key name.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["title"] = "Version",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number of times that this resource has been updated.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "inject_key",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/injectKeys",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "injectKeys",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "injectKeys",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                            },
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/injectKeys/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "injectKeys",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "injectKeys",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["kif"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "This resource's unique identifier.",
                            ["format"] = "int64",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["title"] = "Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The KIF's name.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "kif",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/kifs",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "kifs",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "kifs",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["location"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "address1",
                            ["title"] = "Address1",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Location's street address.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "address2",
                            ["title"] = "Address2",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Location's street address.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "billingId",
                            ["title"] = "Billing Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "\\?",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "city",
                            ["title"] = "City",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Location's city.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "country",
                            ["title"] = "Country",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Location's country.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["title"] = "Created",
                            ["type"] = "`$STRING`",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "customReference",
                            ["title"] = "Custom Reference",
                            ["type"] = "`$STRING`",
                            ["short"] = "A Partner specified reference for a location.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "This resource's unique identifier.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "locationType",
                            ["title"] = "Location Type",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Location's clasification.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mailAddress1",
                            ["title"] = "Mail Address1",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Location's street address.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mailAddress2",
                            ["title"] = "Mail Address2",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Location's street address.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mailCity",
                            ["title"] = "Mail City",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Location's city.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mailCountry",
                            ["title"] = "Mail Country",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Location's street address.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mailPostalCode",
                            ["title"] = "Mail Postal Code",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Location's postal code.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mailStateProvince",
                            ["title"] = "Mail State Province",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Location's street state or province.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modified",
                            ["title"] = "Modified",
                            ["type"] = "`$STRING`",
                            ["short"] = "Last modified timestamp.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["title"] = "Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Location's name.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "nameOfBusiness",
                            ["title"] = "Name Of Business",
                            ["type"] = "`$STRING`",
                            ["short"] = "The name of the business at this location.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "notes",
                            ["title"] = "Notes",
                            ["type"] = "`$STRING`",
                            ["short"] = "Note for delivery driver.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "postalCode",
                            ["title"] = "Postal Code",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Location's postal code.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "stateProvince",
                            ["title"] = "State Province",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Location's street state or province.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "uniqueId",
                            ["title"] = "Unique Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "Unique Identifier for the Location.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["title"] = "Version",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number of times that this resource has been updated.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "location",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/locations",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "locations",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "locations",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                            },
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/locations",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "locations",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "locations",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 10,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "client",
                                            "skip",
                                            "take",
                                        },
                                    },
                                },
                            },
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/locations/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "locations",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "locations",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                        ["remove"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "remove",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "DELETE",
                                    ["orig"] = "/locations/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "locations",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "locations",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["partner"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "billingId",
                            ["title"] = "Billing Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Partner's billing identifier.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "clientCanOrderEquipment",
                            ["title"] = "Client Can Order Equipment",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "This property indicates if the Partner is allowed to order Equipment.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "contact",
                            ["title"] = "Contact",
                            ["type"] = "`$OBJECT`",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                            ["short"] = "Reference to the associated User resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["title"] = "Created",
                            ["type"] = "`$STRING`",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "This resource's unique identifier.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["title"] = "Is Active",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "This property indicates if the Parter account is active or disabled.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "location",
                            ["title"] = "Location",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["short"] = "Reference to the associated Location resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modified",
                            ["title"] = "Modified",
                            ["type"] = "`$STRING`",
                            ["short"] = "Last modified timestamp.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["title"] = "Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Partner's name.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "parent",
                            ["title"] = "Parent",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partnerId",
                            ["title"] = "Partner Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Partner's id.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "reference",
                            ["title"] = "Reference",
                            ["type"] = "`$STRING`",
                            ["short"] = "The Partner's reference string.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "verificationPhrase",
                            ["title"] = "Verification Phrase",
                            ["type"] = "`$STRING`",
                            ["short"] = "The verification phrase is a message that the Partner creates.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["title"] = "Version",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number of times that this resource has been updated.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "partner",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/partners",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "partners",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                            },
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/partners",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "partners",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 10,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "partner",
                                            "skip",
                                            "take",
                                        },
                                    },
                                },
                            },
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/partners/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "partners",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["shipment"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "carrier",
                            ["title"] = "Carrier",
                            ["type"] = "`$STRING`",
                            ["short"] = "The name of the courier.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "client",
                            ["title"] = "Client",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Client resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["title"] = "Created",
                            ["type"] = "`$STRING`",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "dateReceived",
                            ["title"] = "Date Received",
                            ["type"] = "`$STRING`",
                            ["short"] = "The date and time that a package is recieved.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "dateShipped",
                            ["title"] = "Date Shipped",
                            ["type"] = "`$STRING`",
                            ["short"] = "The date and time that a package is shipped.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "dcKif",
                            ["title"] = "Dc Kif",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated KIF resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "This resource's unique identifier.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "items",
                            ["title"] = "Items",
                            ["type"] = "`$ARRAY`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "kif",
                            ["title"] = "Kif",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated KIF resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modified",
                            ["title"] = "Modified",
                            ["type"] = "`$STRING`",
                            ["short"] = "Last modified timestamp.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["title"] = "Partner",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "shipmentType",
                            ["title"] = "Shipment Type",
                            ["type"] = "`$STRING`",
                            ["short"] = "The type of shipment.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "tracking",
                            ["title"] = "Tracking",
                            ["type"] = "`$STRING`",
                            ["short"] = "The courier's tracking number.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["title"] = "Version",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["format"] = "int32",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "shipment",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/shipments",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "shipments",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "shipments",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                            },
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/shipments",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "shipments",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "shipments",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "kif",
                                                ["orig"] = "kif",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["reqd"] = true,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "mode",
                                                ["orig"] = "mode",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 10,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "kif",
                                            "mode",
                                            "skip",
                                            "take",
                                        },
                                    },
                                },
                            },
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/shipments/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "shipments",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "shipments",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["success"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "success",
                            ["title"] = "Success",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "Indicates if the action was a success.",
                        },
                    },
                    ["name"] = "success",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/virtualDevices/{sharePartnerTo}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "virtualDevices",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "share_partner_to",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "virtualDevices",
                                        "{share_partner_to}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["sharePartnerTo"] = "share_partner_to",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "share_partner_to",
                                                ["orig"] = "share_partner_to",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "share_partner_to",
                                        },
                                    },
                                },
                            },
                        },
                        ["remove"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "remove",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "DELETE",
                                    ["orig"] = "/virtualDevices/{sharePartnerTo}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "virtualDevices",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "share_partner_to",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "virtualDevices",
                                        "{share_partner_to}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["sharePartnerTo"] = "share_partner_to",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "share_partner_to",
                                                ["orig"] = "share_partner_to",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "share_partner_to",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>
                        {
                            new List<object?>
                            {
                                "$.main.kit.entity.virtual_device",
                            },
                        },
                    },
                },
                ["transaction"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "alternateKey",
                            ["title"] = "Alternate Key",
                            ["type"] = "`$STRING`",
                            ["short"] = "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "client",
                            ["title"] = "Client",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Client resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "clientRef",
                            ["title"] = "Client Ref",
                            ["type"] = "`$STRING`",
                            ["short"] = "Client Reference property that is included in the decrypt API call.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["title"] = "Created",
                            ["type"] = "`$STRING`",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "decrypted",
                            ["title"] = "Decrypted",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "A Transcation can process muliple decryptions.",
                            ["format"] = "int32",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "deviceName",
                            ["title"] = "Device Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The name of the Device that generated the payload to decrypt.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "directPartner",
                            ["title"] = "Direct Partner",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "encrypted",
                            ["title"] = "Encrypted",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "A Transcation can process muliple encryptions.",
                            ["format"] = "int32",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "endDate",
                            ["title"] = "End Date",
                            ["type"] = "`$STRING`",
                            ["short"] = "Timestamp from the end of the transaction.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "errCode",
                            ["title"] = "Err Code",
                            ["type"] = "`$STRING`",
                            ["short"] = "The error code that is sent in response to a failed decrypt API call.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "errMessage",
                            ["title"] = "Err Message",
                            ["type"] = "`$STRING`",
                            ["short"] = "The error messge that is sent in response to a failed decrypt API call.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "This resource's unique identifier.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "ipAddress",
                            ["title"] = "Ip Address",
                            ["type"] = "`$STRING`",
                            ["short"] = "The IP address of the http client that makes the decrypt API call.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isVirtual",
                            ["title"] = "Is Virtual",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "Indicates if the Transaction came from a virtual Device.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "keyType",
                            ["title"] = "Key Type",
                            ["type"] = "`$STRING`",
                            ["short"] = "The type of cipher used during decrytion.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "location",
                            ["title"] = "Location",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["short"] = "Reference to the associated Location resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "messageId",
                            ["title"] = "Message Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "Message ID.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "method",
                            ["title"] = "Method",
                            ["type"] = "`$STRING`",
                            ["short"] = "The decryption cypher/method.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["title"] = "Partner",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "reference",
                            ["title"] = "Reference",
                            ["type"] = "`$STRING`",
                            ["short"] = "The reference property that the Client includes in the decrypt API call.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "serialNumber",
                            ["title"] = "Serial Number",
                            ["type"] = "`$STRING`",
                            ["short"] = "The serial number of the Device that generated the payload to decrypt.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "startDate",
                            ["title"] = "Start Date",
                            ["type"] = "`$STRING`",
                            ["short"] = "Timestamp from the beginning of the transaction.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "success",
                            ["title"] = "Success",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "The success indicator.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "transactionSource",
                            ["title"] = "Transaction Source",
                            ["type"] = "`$STRING`",
                            ["short"] = "The source of the Transaction.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "transaction",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/transactions",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "transactions",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "transactions",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                            },
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/transactions",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "transactions",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "transactions",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "client_ref",
                                                ["orig"] = "client_ref",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "date_from",
                                                ["orig"] = "date_from",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "date_to",
                                                ["orig"] = "date_to",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "location",
                                                ["orig"] = "location",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "message_id",
                                                ["orig"] = "message_id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "paging_mode",
                                                ["orig"] = "paging_mode",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["example"] = "nocount",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "success",
                                                ["orig"] = "success",
                                                ["type"] = "`$BOOLEAN`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 10,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
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
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/transactions/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "transactions",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "transactions",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["update_result"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "client",
                            ["title"] = "Client",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Client resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "email",
                            ["title"] = "Email",
                            ["type"] = "`$STRING`",
                            ["short"] = "The User's email address.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "firstName",
                            ["title"] = "First Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The User's name.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "ID of newly created resource",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["title"] = "Is Active",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "This property indicates if the User account is active or disabled.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "kif",
                            ["title"] = "Kif",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated KIF resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "lastName",
                            ["title"] = "Last Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The User's Surname.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["title"] = "Partner",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "phone",
                            ["title"] = "Phone",
                            ["type"] = "`$STRING`",
                            ["short"] = "The User's phone number without dashes, spaces, or brackets.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "userName",
                            ["title"] = "User Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The User's unique username.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "userRole",
                            ["title"] = "User Role",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated User Role.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["title"] = "Version",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number of times that this resource has been updated.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "update_result",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/users",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "users",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                            },
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/users",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "users",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "kif",
                                                ["orig"] = "kif",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$ANY`",
                                                ["kind"] = "query",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 10,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
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
                        ["update"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "update",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "PATCH",
                                    ["orig"] = "/clients/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "clients",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "PATCH",
                                    ["orig"] = "/devices/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "devices",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "PATCH",
                                    ["orig"] = "/locations/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "locations",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "locations",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "PATCH",
                                    ["orig"] = "/partners/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "partners",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "PATCH",
                                    ["orig"] = "/shipments/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "shipments",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "shipments",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "PATCH",
                                    ["orig"] = "/transactions/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "transactions",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "transactions",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "PATCH",
                                    ["orig"] = "/users/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "users",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["user"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "client",
                            ["title"] = "Client",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Client resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "created",
                            ["title"] = "Created",
                            ["type"] = "`$STRING`",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "email",
                            ["title"] = "Email",
                            ["type"] = "`$STRING`",
                            ["short"] = "The User's email address.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "firstName",
                            ["title"] = "First Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The User's name.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "This resource's unique identifier.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["title"] = "Is Active",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "This property indicates if the User account is active or disabled.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "kif",
                            ["title"] = "Kif",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated KIF resource.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "lastName",
                            ["title"] = "Last Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The User's Surname.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modified",
                            ["title"] = "Modified",
                            ["type"] = "`$STRING`",
                            ["short"] = "Last modified timestamp.",
                            ["format"] = "datetime",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["title"] = "Partner",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated Partner.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "phone",
                            ["title"] = "Phone",
                            ["type"] = "`$STRING`",
                            ["short"] = "The User's phone number without dashes, spaces, or brackets.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "userName",
                            ["title"] = "User Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The User's unique username.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "userRole",
                            ["title"] = "User Role",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Reference to the associated User Role.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["title"] = "Version",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "The number of times that this resource has been updated.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "user",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/users/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "users",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                        ["remove"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "remove",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "DELETE",
                                    ["orig"] = "/users/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "users",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["virtual_device"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "data",
                            ["title"] = "Data",
                            ["type"] = "`$ARRAY`",
                            ["short"] = "List of Devices.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "total",
                            ["title"] = "Total",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "Total number of Devices available (not the number of Users in the response).",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "virtual_device",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/virtualDevices/{sharePartnerTo}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "virtualDevices",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "virtualDevices",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["sharePartnerTo"] = "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "share_partner_to",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "sorting_direction",
                                                ["orig"] = "sorting_direction",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["example"] = "asc",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "sorting_field",
                                                ["orig"] = "sorting_field",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "query",
                                                ["example"] = "serialnumber",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                                ["kind"] = "query",
                                                ["example"] = 10,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
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
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
            },
        };
    }

    private static readonly Lazy<Dictionary<string, object?>> SharedConfigVal =
        new(MakeConfig);

    // The process-wide config, built once on first use.
    //
    // The returned dictionary is SHARED: treat it as read-only. Callers that
    // need to mutate should use MakeConfig, which always returns a fresh copy.
    public static Dictionary<string, object?> SharedConfig()
    {
        return SharedConfigVal.Value;
    }

    public static List<object?> FeaturePlugins(string name)
    {
        switch (name)
        {
            default:
                return new List<object?>();
        }
    }

    public static Feature.BaseFeature MakeFeature(string name)
    {
        switch (name)
        {
            case "audit":
                return new Feature.AuditFeature();
            case "clienttrack":
                return new Feature.ClienttrackFeature();
            case "debug":
                return new Feature.DebugFeature();
            case "idempotency":
                return new Feature.IdempotencyFeature();
            case "log":
                return new Feature.LogFeature();
            case "metrics":
                return new Feature.MetricsFeature();
            case "paging":
                return new Feature.PagingFeature();
            case "ratelimit":
                return new Feature.RatelimitFeature();
            case "retry":
                return new Feature.RetryFeature();
            case "telemetry":
                return new Feature.TelemetryFeature();
            case "test":
                return new Feature.TestFeature();
            case "timeout":
                return new Feature.TimeoutFeature();
            default:
                return new Feature.BaseFeature();
        }
    }
}

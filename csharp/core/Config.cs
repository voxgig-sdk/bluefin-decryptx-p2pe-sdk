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
                    ["device_custody_list"] = new Dictionary<string, object?>(),
                    ["device_list"] = new Dictionary<string, object?>(),
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
                            ["short"] = "Reference to the associated Client resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "completeDate",
                            ["short"] = "The date and time that the Attestation took place.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "created",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "device",
                            ["short"] = "Reference to the associated Device resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["short"] = "This resource's unique identifier.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["short"] = "Text describing the attestation.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "notes",
                            ["short"] = "Free form field that allows the Client associate notes with the Attestation.",
                            ["type"] = "`$STRING`",
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
                                    ["args"] = new Dictionary<string, object?>(),
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
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "attestations",
                                    },
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "client",
                                            "skip",
                                            "take",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "attestations",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "attestations",
                                        "{id}",
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
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                            ["short"] = "Reference to the associated User resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "created",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "directPartner",
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["short"] = "This resource's unique identifier.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["short"] = "This property indicates if the Client account is active or disabled.",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "location",
                            ["req"] = true,
                            ["short"] = "Reference to the associated Location resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mid",
                            ["short"] = "Some Partners will have an merchant ids on their own software offerings.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "modified",
                            ["short"] = "Last modified timestamp.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["short"] = "The Client's name.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["short"] = "Reference to the Client's root Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["type"] = "`$INTEGER`",
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
                                    ["args"] = new Dictionary<string, object?>(),
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
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                    },
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "partner",
                                            "skip",
                                            "take",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                        "{id}",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                        "{id}",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "device_type",
                                                ["orig"] = "device_type",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/devices/{serialNumber}/{deviceType}/custody",
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["deviceType"] = "device_type",
                                            ["serialNumber"] = "serial_number",
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "device_type",
                                            "serial_number",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "{serial_number}",
                                        "{device_type}",
                                        "custody",
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
                                "device",
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
                            ["short"] = "true if the payload decryption was successful.",
                            ["type"] = "`$BOOLEAN`",
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
                                    ["args"] = new Dictionary<string, object?>(),
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
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "decryption",
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
                ["device"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "activatedBy",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "activationDate",
                            ["short"] = "Timestamp from when the Device was activated.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "alternateKey",
                            ["short"] = "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "auditNextDate",
                            ["short"] = "Date and time that the Device is due its next PCI Audit.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "auditNotificationDate",
                            ["short"] = "Date and time that a notification should be sent that a PCI audit is due.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "client",
                            ["short"] = "Reference to the associated Client resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "created",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "createdBy",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "deviceBuild",
                            ["short"] = "Reference to the associated Device Build resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "deviceState",
                            ["short"] = "Reference to the associated Device State resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "deviceType",
                            ["short"] = "Reference to the associated Device Type resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "errorCounter",
                            ["short"] = "The number times the Device has been in error.",
                            ["type"] = "`$INTEGER`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "errorLastDate",
                            ["short"] = "Timestamp from the last time that the Device had an error.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["short"] = "The Device's unique identifier.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "initializedBy",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "initializedDate",
                            ["short"] = "Timestamp from when the Device was initialized.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "injectKey",
                            ["short"] = "Reference to the associated Device resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isVirtual",
                            ["short"] = "Indicates if a Device is Virtual (represents a Device shared with a partner).",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "kif",
                            ["short"] = "Reference to the associated KIF resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "lastActivityDate",
                            ["short"] = "Timestamp from the last time that the Device was used.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "location",
                            ["req"] = true,
                            ["short"] = "Reference to the associated Location resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "modified",
                            ["short"] = "Last modified timestamp.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modifiedBy",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["short"] = "The Device's name.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "notes",
                            ["short"] = "Arbitary note that can be attached to a Device entry.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "serialNumber",
                            ["short"] = "The Device's serial number.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["type"] = "`$INTEGER`",
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
                                    ["args"] = new Dictionary<string, object?>(),
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
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                    },
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "device_state",
                                                ["orig"] = "device_state",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "kif",
                                                ["orig"] = "kif",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = "asc",
                                                ["kind"] = "query",
                                                ["name"] = "sorting_direction",
                                                ["orig"] = "sorting_direction",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = "serialnumber",
                                                ["kind"] = "query",
                                                ["name"] = "sorting_field",
                                                ["orig"] = "sorting_field",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "device_type",
                                                ["orig"] = "device_type",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/devices/{serialNumber}/{deviceType}",
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["deviceType"] = "device_type",
                                            ["serialNumber"] = "serial_number",
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "device_type",
                                            "serial_number",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "{serial_number}",
                                        "{device_type}",
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "{id}",
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
                                "device",
                            },
                        },
                    },
                },
                ["device_build"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "appVersion",
                            ["short"] = "If a Device Type has more than one Application Code version the supported version is specified here.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "buildNumber",
                            ["short"] = "The Build Number.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "configFileName",
                            ["short"] = "The name of the configuration file that is uploaded to the device.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "date-time",
                            ["name"] = "created",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "deviceType",
                            ["short"] = "The Device Type Name.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "firmwareVersion",
                            ["short"] = "A list of firmware versions that this Device Build covers.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "hardwareVersion",
                            ["short"] = "A list of hardware versions that this Device Build covers.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "int64",
                            ["name"] = "id",
                            ["short"] = "This resource's unique identifier.",
                            ["type"] = "`$INTEGER`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["short"] = "This property indicates if the device build is still active and not succeeded by subsequent build.",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "date-time",
                            ["name"] = "modified",
                            ["short"] = "Last modified timestamp.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["short"] = "The Device Builds's name.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "notes",
                            ["short"] = "Notes attached to the device build by Bluefin CISO.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["type"] = "`$INTEGER`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "whiteListingBinRanges",
                            ["short"] = "A comma separated list of BIN ranges that aren't encrypted by the terminal.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "whiteListingUsed",
                            ["short"] = "This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal.",
                            ["type"] = "`$BOOLEAN`",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "device_type",
                                                ["orig"] = "device_type",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "device_type",
                                            "skip",
                                            "take",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "deviceBuilds",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "deviceBuilds",
                                        "{id}",
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
                            ["format"] = "date-time",
                            ["name"] = "completeDate",
                            ["short"] = "The date and time that the Custody change took place.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "date-time",
                            ["name"] = "created",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "createdBy",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "custodian",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "device",
                            ["short"] = "Reference to the associated Device resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "int64",
                            ["name"] = "id",
                            ["short"] = "This resource's unique identifier.",
                            ["type"] = "`$INTEGER`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "location",
                            ["req"] = true,
                            ["short"] = "Reference to the associated Location resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "date-time",
                            ["name"] = "modified",
                            ["short"] = "Last modified timestamp.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modifiedBy",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "notes",
                            ["short"] = "Free form field that allows the Client associate notes with the Custody Change.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "status",
                            ["short"] = "Reference to the associated Custody Status.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "transferMethod",
                            ["short"] = "Reference to the associated Transfer Method.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["type"] = "`$INTEGER`",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "device_type",
                                                ["orig"] = "device_type",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/devices/{serialNumber}/{deviceType}/custody/{id}",
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["deviceType"] = "device_type",
                                            ["serialNumber"] = "serial_number",
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "device_type",
                                            "id",
                                            "serial_number",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "{serial_number}",
                                        "{device_type}",
                                        "custody",
                                        "{id}",
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
                                "device",
                            },
                        },
                    },
                },
                ["device_custody_list"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["format"] = "date-time",
                            ["name"] = "completeDate",
                            ["short"] = "The date and time that the Custody change took place.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "date-time",
                            ["name"] = "created",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "createdBy",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "custodian",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "device",
                            ["short"] = "Reference to the associated Device resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "int64",
                            ["name"] = "id",
                            ["short"] = "This resource's unique identifier.",
                            ["type"] = "`$INTEGER`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "location",
                            ["req"] = true,
                            ["short"] = "Reference to the associated Location resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "date-time",
                            ["name"] = "modified",
                            ["short"] = "Last modified timestamp.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "modifiedBy",
                            ["req"] = true,
                            ["short"] = "Reference to the associated User resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "notes",
                            ["short"] = "Free form field that allows the Client associate notes with the Custody Change.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "status",
                            ["short"] = "Reference to the associated Custody Status.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "transferMethod",
                            ["short"] = "Reference to the associated Transfer Method.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["type"] = "`$INTEGER`",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "device_custody_list",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "device_type",
                                                ["orig"] = "device_type",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/devices/{serialNumber}/{deviceType}/custody",
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["deviceType"] = "device_type",
                                            ["serialNumber"] = "serial_number",
                                        },
                                    },
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "{serial_number}",
                                        "{device_type}",
                                        "custody",
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
                                "device",
                            },
                        },
                    },
                },
                ["device_list"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "data",
                            ["short"] = "List of Devices.",
                            ["type"] = "`$ARRAY`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "total",
                            ["short"] = "Total number of Devices available (not the number of Users in the response).",
                            ["type"] = "`$INTEGER`",
                        },
                    },
                    ["name"] = "device_list",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "share_partner_to",
                                                ["orig"] = "share_partner_to",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = "asc",
                                                ["kind"] = "query",
                                                ["name"] = "sorting_direction",
                                                ["orig"] = "sorting_direction",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = "serialnumber",
                                                ["kind"] = "query",
                                                ["name"] = "sorting_field",
                                                ["orig"] = "sorting_field",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/virtualDevices/{sharePartnerTo}",
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["sharePartnerTo"] = "share_partner_to",
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "share_partner_to",
                                            "skip",
                                            "sorting_direction",
                                            "sorting_field",
                                            "take",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "virtualDevices",
                                        "{share_partner_to}",
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
                                "virtual_device",
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
                            ["req"] = true,
                            ["short"] = "Indicates if the action succeeded.",
                            ["type"] = "`$BOOLEAN`",
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
                                    ["args"] = new Dictionary<string, object?>(),
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
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "receive",
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
                ["device_rki_activate_result"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "success",
                            ["req"] = true,
                            ["short"] = "Indicates if the RKI activation succeeded.",
                            ["type"] = "`$BOOLEAN`",
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
                                    ["args"] = new Dictionary<string, object?>(),
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
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "rki",
                                        "activate",
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
                ["device_state"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["format"] = "int64",
                            ["name"] = "id",
                            ["short"] = "Unique identifier for this Device state.",
                            ["type"] = "`$INTEGER`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["short"] = "Descriptive name for this Device state.",
                            ["type"] = "`$STRING`",
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
                                    ["args"] = new Dictionary<string, object?>(),
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
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "deviceStates",
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
                ["device_type"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "created",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "deviceTypeMode",
                            ["short"] = "The Device type.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "hardwareVersion",
                            ["short"] = "The Device hardware version.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["short"] = "Unique idenifier.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["short"] = "This property indicates if the DeviceType is active.",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "manufacturer",
                            ["short"] = "The Device manufacturer.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "model",
                            ["short"] = "The Device model.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "modified",
                            ["short"] = "Last modified timestamp.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["short"] = "The DeviceType name.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "photoUrl",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productName",
                            ["short"] = "The Device name.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["type"] = "`$INTEGER`",
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
                                    ["args"] = new Dictionary<string, object?>(),
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
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "deviceTypes",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "deviceTypes",
                                        "{id}",
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
                            ["format"] = "datetime",
                            ["name"] = "created",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["short"] = "unique idenifier",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["short"] = "Active flag, inactive keys cannot be assigned to devices.",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isP2PE",
                            ["short"] = "Flags if a key is for a P2PE compliant cypher.",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "keyType",
                            ["short"] = "The cipher type that the key works with.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "modified",
                            ["short"] = "Last modified timestamp in ISO 8601 format.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["short"] = "Key name.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["type"] = "`$INTEGER`",
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
                                    ["args"] = new Dictionary<string, object?>(),
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
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "injectKeys",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "injectKeys",
                                        "{id}",
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
                            ["format"] = "int64",
                            ["name"] = "id",
                            ["short"] = "This resource's unique identifier.",
                            ["type"] = "`$INTEGER`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["short"] = "The KIF's name.",
                            ["type"] = "`$STRING`",
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
                                    ["args"] = new Dictionary<string, object?>(),
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
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "kifs",
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
                ["location"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "address1",
                            ["short"] = "The Location's street address.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "address2",
                            ["short"] = "The Location's street address.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "billingId",
                            ["short"] = "\\?",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "city",
                            ["short"] = "The Location's city.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "country",
                            ["short"] = "The Location's country.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "created",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "customReference",
                            ["short"] = "A Partner specified reference for a location.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["short"] = "This resource's unique identifier.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "locationType",
                            ["short"] = "The Location's clasification.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mailAddress1",
                            ["short"] = "The Location's street address.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mailAddress2",
                            ["short"] = "The Location's street address.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mailCity",
                            ["short"] = "The Location's city.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mailCountry",
                            ["short"] = "The Location's street address.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mailPostalCode",
                            ["short"] = "The Location's postal code.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mailStateProvince",
                            ["short"] = "The Location's street state or province.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "modified",
                            ["short"] = "Last modified timestamp.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["short"] = "The Location's name.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "nameOfBusiness",
                            ["short"] = "The name of the business at this location.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "notes",
                            ["short"] = "Note for delivery driver.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "postalCode",
                            ["short"] = "The Location's postal code.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "stateProvince",
                            ["short"] = "The Location's street state or province.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "uniqueId",
                            ["short"] = "Unique Identifier for the Location.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["type"] = "`$INTEGER`",
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
                                    ["args"] = new Dictionary<string, object?>(),
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
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "locations",
                                    },
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "client",
                                            "skip",
                                            "take",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "locations",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "locations",
                                        "{id}",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "locations",
                                        "{id}",
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
                            ["short"] = "The Partner's billing identifier.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "clientCanOrderEquipment",
                            ["short"] = "This property indicates if the Partner is allowed to order Equipment.",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "contact",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                            ["short"] = "Reference to the associated User resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "created",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["short"] = "This resource's unique identifier.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["short"] = "This property indicates if the Parter account is active or disabled.",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "location",
                            ["req"] = true,
                            ["short"] = "Reference to the associated Location resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "modified",
                            ["short"] = "Last modified timestamp.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "name",
                            ["short"] = "The Partner's name.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "parent",
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partnerId",
                            ["short"] = "The Partner's id.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "reference",
                            ["short"] = "The Partner's reference string.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "verificationPhrase",
                            ["short"] = "The verification phrase is a message that the Partner creates.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["type"] = "`$INTEGER`",
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
                                    ["args"] = new Dictionary<string, object?>(),
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
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
                                    },
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "partner",
                                            "skip",
                                            "take",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
                                        "{id}",
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
                            ["short"] = "The name of the courier.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "client",
                            ["short"] = "Reference to the associated Client resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "created",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "dateReceived",
                            ["short"] = "The date and time that a package is recieved.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "dateShipped",
                            ["short"] = "The date and time that a package is shipped.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "dcKif",
                            ["short"] = "Reference to the associated KIF resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["short"] = "This resource's unique identifier.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "items",
                            ["type"] = "`$ARRAY`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "kif",
                            ["short"] = "Reference to the associated KIF resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "modified",
                            ["short"] = "Last modified timestamp.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "shipmentType",
                            ["short"] = "The type of shipment.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "tracking",
                            ["short"] = "The courier's tracking number.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "int32",
                            ["name"] = "version",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["type"] = "`$INTEGER`",
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
                                    ["args"] = new Dictionary<string, object?>(),
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
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "shipments",
                                    },
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "kif",
                                                ["orig"] = "kif",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "mode",
                                                ["orig"] = "mode",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "shipments",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "shipments",
                                        "{id}",
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
                            ["short"] = "Indicates if the action was a success.",
                            ["type"] = "`$BOOLEAN`",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "share_partner_to",
                                                ["orig"] = "share_partner_to",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/virtualDevices/{sharePartnerTo}",
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["sharePartnerTo"] = "share_partner_to",
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "share_partner_to",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "virtualDevices",
                                        "{share_partner_to}",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "share_partner_to",
                                                ["orig"] = "share_partner_to",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["kind"] = "http",
                                    ["method"] = "DELETE",
                                    ["orig"] = "/virtualDevices/{sharePartnerTo}",
                                    ["rename"] = new Dictionary<string, object?>
                                    {
                                        ["param"] = new Dictionary<string, object?>
                                        {
                                            ["sharePartnerTo"] = "share_partner_to",
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "share_partner_to",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "virtualDevices",
                                        "{share_partner_to}",
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
                                "virtual_device",
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
                            ["short"] = "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "client",
                            ["short"] = "Reference to the associated Client resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "clientRef",
                            ["short"] = "Client Reference property that is included in the decrypt API call.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "created",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "int32",
                            ["name"] = "decrypted",
                            ["short"] = "A Transcation can process muliple decryptions.",
                            ["type"] = "`$INTEGER`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "deviceName",
                            ["short"] = "The name of the Device that generated the payload to decrypt.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "directPartner",
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "int32",
                            ["name"] = "encrypted",
                            ["short"] = "A Transcation can process muliple encryptions.",
                            ["type"] = "`$INTEGER`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "endDate",
                            ["short"] = "Timestamp from the end of the transaction.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "errCode",
                            ["short"] = "The error code that is sent in response to a failed decrypt API call.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "errMessage",
                            ["short"] = "The error messge that is sent in response to a failed decrypt API call.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["short"] = "This resource's unique identifier.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "ipAddress",
                            ["short"] = "The IP address of the http client that makes the decrypt API call.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isVirtual",
                            ["short"] = "Indicates if the Transaction came from a virtual Device.",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "keyType",
                            ["short"] = "The type of cipher used during decrytion.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "location",
                            ["req"] = true,
                            ["short"] = "Reference to the associated Location resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "messageId",
                            ["short"] = "Message ID.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "method",
                            ["short"] = "The decryption cypher/method.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "reference",
                            ["short"] = "The reference property that the Client includes in the decrypt API call.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "serialNumber",
                            ["short"] = "The serial number of the Device that generated the payload to decrypt.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "startDate",
                            ["short"] = "Timestamp from the beginning of the transaction.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "success",
                            ["short"] = "The success indicator.",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "transactionSource",
                            ["short"] = "The source of the Transaction.",
                            ["type"] = "`$STRING`",
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
                                    ["args"] = new Dictionary<string, object?>(),
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
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "transactions",
                                    },
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "client_ref",
                                                ["orig"] = "client_ref",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "date_from",
                                                ["orig"] = "date_from",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "date_to",
                                                ["orig"] = "date_to",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "location",
                                                ["orig"] = "location",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "message_id",
                                                ["orig"] = "message_id",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = "nocount",
                                                ["kind"] = "query",
                                                ["name"] = "paging_mode",
                                                ["orig"] = "paging_mode",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "success",
                                                ["orig"] = "success",
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "transactions",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "transactions",
                                        "{id}",
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
                            ["short"] = "Reference to the associated Client resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "email",
                            ["short"] = "The User's email address.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "firstName",
                            ["short"] = "The User's name.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["short"] = "ID of newly created resource",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["short"] = "This property indicates if the User account is active or disabled.",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "kif",
                            ["short"] = "Reference to the associated KIF resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "lastName",
                            ["short"] = "The User's Surname.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "phone",
                            ["short"] = "The User's phone number without dashes, spaces, or brackets.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "userName",
                            ["short"] = "The User's unique username.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "userRole",
                            ["short"] = "Reference to the associated User Role.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["type"] = "`$INTEGER`",
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
                                    ["args"] = new Dictionary<string, object?>(),
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
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                    },
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "kif",
                                                ["orig"] = "kif",
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["type"] = "`$ANY`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
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
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.data`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                        "{id}",
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "{id}",
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "locations",
                                        "{id}",
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
                                        "{id}",
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "shipments",
                                        "{id}",
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "transactions",
                                        "{id}",
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                        "{id}",
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
                            ["short"] = "Reference to the associated Client resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "created",
                            ["short"] = "Creation timestamp in ISO 8601 format.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "email",
                            ["short"] = "The User's email address.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "firstName",
                            ["short"] = "The User's name.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["short"] = "This resource's unique identifier.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "isActive",
                            ["short"] = "This property indicates if the User account is active or disabled.",
                            ["type"] = "`$BOOLEAN`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "kif",
                            ["short"] = "Reference to the associated KIF resource.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "lastName",
                            ["short"] = "The User's Surname.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["format"] = "datetime",
                            ["name"] = "modified",
                            ["short"] = "Last modified timestamp.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "partner",
                            ["short"] = "Reference to the associated Partner.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "phone",
                            ["short"] = "The User's phone number without dashes, spaces, or brackets.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "userName",
                            ["short"] = "The User's unique username.",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "userRole",
                            ["short"] = "Reference to the associated User Role.",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "version",
                            ["short"] = "The number of times that this resource has been updated.",
                            ["type"] = "`$INTEGER`",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                        "{id}",
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
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
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
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                        "{id}",
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

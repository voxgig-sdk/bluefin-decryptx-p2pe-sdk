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
            },
            ["feature"] = new Dictionary<string, object?>
            {
                ["test"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                    },
                },
            },
            ["options"] = new Dictionary<string, object?>
            {
                ["base"] = "https://apis.p2pemanager.com/api/v1",
                ["auth"] = new Dictionary<string, object?>
                {
                    ["prefix"] = "Basic",
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
                            ["active"] = true,
                            ["name"] = "client",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "complete_date",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "device",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "note",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "POST",
                                    ["orig"] = "/attestations",
                                    ["parts"] = new List<object?>
                                    {
                                        "attestations",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/attestations",
                                    ["parts"] = new List<object?>
                                    {
                                        "attestations",
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
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/attestations/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "attestations",
                                        "{id}",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
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
                            ["active"] = true,
                            ["name"] = "contact",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "direct_partner",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "is_active",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "location",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "mid",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "modified",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "partner",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "version",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 10,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "POST",
                                    ["orig"] = "/clients",
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/clients",
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
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
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/clients/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                        "{id}",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
                        },
                        ["remove"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "remove",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "DELETE",
                                    ["orig"] = "/clients/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                        "{id}",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "remove",
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "device_type",
                                                ["orig"] = "device_type",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/devices/{serialNumber}/{deviceType}/custody",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "success",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 0,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "POST",
                                    ["orig"] = "/decryption",
                                    ["parts"] = new List<object?>
                                    {
                                        "decryption",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "activated_by",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "activation_date",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "alternate_key",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "audit_next_date",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "audit_notification_date",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "client",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created_by",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "device_build",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "device_state",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "device_type",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "error_counter",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 11,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "error_last_date",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 12,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 13,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "initialized_by",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 14,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "initialized_date",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 15,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "inject_key",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 16,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "is_virtual",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 17,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "kif",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 18,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "last_activity_date",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 19,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "location",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 20,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "modified",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 21,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "modified_by",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 22,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 23,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "note",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 24,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "partner",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 25,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "serial_number",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 26,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "version",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 27,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "POST",
                                    ["orig"] = "/devices",
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "device_state",
                                                ["orig"] = "device_state",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "kif",
                                                ["orig"] = "kif",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "asc",
                                                ["kind"] = "query",
                                                ["name"] = "sorting_direction",
                                                ["orig"] = "sorting_direction",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "serialnumber",
                                                ["kind"] = "query",
                                                ["name"] = "sorting_field",
                                                ["orig"] = "sorting_field",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/devices",
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
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
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "device_type",
                                                ["orig"] = "device_type",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/devices/{serialNumber}/{deviceType}",
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
                                    ["index$"] = 0,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/devices/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "{id}",
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
                                    ["index$"] = 1,
                                },
                            },
                            ["key$"] = "load",
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
                            ["active"] = true,
                            ["name"] = "app_version",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "build_number",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "config_file_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "device_type",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "firmware_version",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "hardware_version",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "is_active",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "modified",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "note",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 11,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "version",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 12,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "white_listing_bin_range",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 13,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "white_listing_used",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 14,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "device_type",
                                                ["orig"] = "device_type",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/deviceBuilds",
                                    ["parts"] = new List<object?>
                                    {
                                        "deviceBuilds",
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
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/deviceBuilds/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "deviceBuilds",
                                        "{id}",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
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
                            ["active"] = true,
                            ["name"] = "complete_date",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created_by",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "custodian",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "device",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "location",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "modified",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "modified_by",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "note",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "status",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "transfer_method",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 11,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "version",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 12,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "device_type",
                                                ["orig"] = "device_type",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 2,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/devices/{serialNumber}/{deviceType}/custody/{id}",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
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
                            ["active"] = true,
                            ["name"] = "complete_date",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created_by",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "custodian",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "device",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "location",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "modified",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "modified_by",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "note",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "status",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "transfer_method",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 11,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "version",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 12,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "device_type",
                                                ["orig"] = "device_type",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 1,
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/devices/{serialNumber}/{deviceType}/custody",
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
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
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
                            ["active"] = true,
                            ["name"] = "data",
                            ["req"] = false,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "total",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 1,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "share_partner_to",
                                                ["orig"] = "share_partner_to",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "asc",
                                                ["kind"] = "query",
                                                ["name"] = "sorting_direction",
                                                ["orig"] = "sorting_direction",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "serialnumber",
                                                ["kind"] = "query",
                                                ["name"] = "sorting_field",
                                                ["orig"] = "sorting_field",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/virtualDevices/{sharePartnerTo}",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
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
                            ["active"] = true,
                            ["name"] = "success",
                            ["req"] = true,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 0,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "POST",
                                    ["orig"] = "/devices/receive",
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "receive",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "success",
                            ["req"] = true,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 0,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "POST",
                                    ["orig"] = "/devices/rki/activate",
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "rki",
                                        "activate",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "GET",
                                    ["orig"] = "/deviceStates",
                                    ["parts"] = new List<object?>
                                    {
                                        "deviceStates",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
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
                            ["active"] = true,
                            ["name"] = "created",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "device_type_mode",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "hardware_version",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "is_active",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "manufacturer",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "model",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "modified",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "photo_url",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "product_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "version",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 11,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "GET",
                                    ["orig"] = "/deviceTypes",
                                    ["parts"] = new List<object?>
                                    {
                                        "deviceTypes",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/deviceTypes/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "deviceTypes",
                                        "{id}",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
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
                            ["active"] = true,
                            ["name"] = "created",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "is_active",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "is_p2_pe",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "key_type",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "modified",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "version",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 7,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "GET",
                                    ["orig"] = "/injectKeys",
                                    ["parts"] = new List<object?>
                                    {
                                        "injectKeys",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/injectKeys/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "injectKeys",
                                        "{id}",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
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
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "GET",
                                    ["orig"] = "/kifs",
                                    ["parts"] = new List<object?>
                                    {
                                        "kifs",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
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
                            ["active"] = true,
                            ["name"] = "address1",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "address2",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "billing_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "city",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "country",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "custom_reference",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "location_type",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "mail_address1",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "mail_address2",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "mail_city",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 11,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "mail_country",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 12,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "mail_postal_code",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 13,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "mail_state_province",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 14,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "modified",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 15,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 16,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name_of_business",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 17,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "note",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 18,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "postal_code",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 19,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "state_province",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 20,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "unique_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 21,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "version",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 22,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "POST",
                                    ["orig"] = "/locations",
                                    ["parts"] = new List<object?>
                                    {
                                        "locations",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/locations",
                                    ["parts"] = new List<object?>
                                    {
                                        "locations",
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
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/locations/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "locations",
                                        "{id}",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
                        },
                        ["remove"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "remove",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "DELETE",
                                    ["orig"] = "/locations/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "locations",
                                        "{id}",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "remove",
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
                            ["active"] = true,
                            ["name"] = "billing_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "client_can_order_equipment",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "contact",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["list"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "is_active",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "location",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "modified",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "parent",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "partner_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "reference",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 11,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "verification_phrase",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 12,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "version",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 13,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "POST",
                                    ["orig"] = "/partners",
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/partners",
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
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
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/partners/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
                                        "{id}",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
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
                            ["active"] = true,
                            ["name"] = "carrier",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "client",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "date_received",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "date_shipped",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "dc_kif",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "item",
                            ["req"] = false,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "kif",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "modified",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "partner",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "shipment_type",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 11,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "tracking",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 12,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "version",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 13,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "POST",
                                    ["orig"] = "/shipments",
                                    ["parts"] = new List<object?>
                                    {
                                        "shipments",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "kif",
                                                ["orig"] = "kif",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "mode",
                                                ["orig"] = "mode",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/shipments",
                                    ["parts"] = new List<object?>
                                    {
                                        "shipments",
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
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/shipments/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "shipments",
                                        "{id}",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
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
                            ["active"] = true,
                            ["name"] = "success",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 0,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "share_partner_to",
                                                ["orig"] = "share_partner_to",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/virtualDevices/{sharePartnerTo}",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["remove"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "remove",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "share_partner_to",
                                                ["orig"] = "share_partner_to",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "DELETE",
                                    ["orig"] = "/virtualDevices/{sharePartnerTo}",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "remove",
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
                            ["active"] = true,
                            ["name"] = "alternate_key",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "client",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "client_ref",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "decrypted",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "device_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "direct_partner",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "encrypted",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "end_date",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "err_code",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "err_message",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 11,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "ip_address",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 12,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "is_virtual",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 13,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "key_type",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 14,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "location",
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 15,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "message_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 16,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "method",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 17,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "partner",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 18,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "reference",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 19,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "serial_number",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 20,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "start_date",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 21,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "success",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 22,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "transaction_source",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 23,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "POST",
                                    ["orig"] = "/transactions",
                                    ["parts"] = new List<object?>
                                    {
                                        "transactions",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "client_ref",
                                                ["orig"] = "client_ref",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "date_from",
                                                ["orig"] = "date_from",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "date_to",
                                                ["orig"] = "date_to",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "location",
                                                ["orig"] = "location",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "message_id",
                                                ["orig"] = "message_id",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = "nocount",
                                                ["kind"] = "query",
                                                ["name"] = "paging_mode",
                                                ["orig"] = "paging_mode",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "reference",
                                                ["orig"] = "reference",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "serial_number",
                                                ["orig"] = "serial_number",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "success",
                                                ["orig"] = "success",
                                                ["reqd"] = false,
                                                ["type"] = "`$BOOLEAN`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/transactions",
                                    ["parts"] = new List<object?>
                                    {
                                        "transactions",
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
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/transactions/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "transactions",
                                        "{id}",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
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
                            ["active"] = true,
                            ["name"] = "client",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "email",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "first_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "is_active",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "kif",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "last_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "partner",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "phone",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "user_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "user_role",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "version",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 11,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "POST",
                                    ["orig"] = "/users",
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
                        },
                        ["list"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "list",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["query"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "client",
                                                ["orig"] = "client",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "kif",
                                                ["orig"] = "kif",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "query",
                                                ["name"] = "partner",
                                                ["orig"] = "partner",
                                                ["reqd"] = false,
                                                ["type"] = "`$ANY`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 0,
                                                ["kind"] = "query",
                                                ["name"] = "skip",
                                                ["orig"] = "skip",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["example"] = 10,
                                                ["kind"] = "query",
                                                ["name"] = "take",
                                                ["orig"] = "take",
                                                ["reqd"] = false,
                                                ["type"] = "`$INTEGER`",
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/users",
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
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
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "list",
                        },
                        ["update"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "update",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "PATCH",
                                    ["orig"] = "/clients/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "clients",
                                        "{id}",
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
                                    ["index$"] = 0,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "PATCH",
                                    ["orig"] = "/devices/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "devices",
                                        "{id}",
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
                                    ["index$"] = 1,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "PATCH",
                                    ["orig"] = "/locations/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "locations",
                                        "{id}",
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
                                    ["index$"] = 2,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "PATCH",
                                    ["orig"] = "/partners/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "partners",
                                        "{id}",
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
                                    ["index$"] = 3,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "PATCH",
                                    ["orig"] = "/shipments/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "shipments",
                                        "{id}",
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
                                    ["index$"] = 4,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "PATCH",
                                    ["orig"] = "/transactions/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "transactions",
                                        "{id}",
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
                                    ["index$"] = 5,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "PATCH",
                                    ["orig"] = "/users/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                        "{id}",
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
                                    ["index$"] = 6,
                                },
                            },
                            ["key$"] = "update",
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
                            ["active"] = true,
                            ["name"] = "client",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "created",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "email",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "first_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "is_active",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "kif",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "last_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "modified",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "partner",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "phone",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "user_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 11,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "user_role",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 12,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "version",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 13,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/users/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                        "{id}",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
                        },
                        ["remove"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "remove",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "DELETE",
                                    ["orig"] = "/users/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "users",
                                        "{id}",
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
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "remove",
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

    public static Feature.BaseFeature MakeFeature(string name)
    {
        switch (name)
        {
            case "test":
                return new Feature.TestFeature();
            default:
                return new Feature.BaseFeature();
        }
    }
}

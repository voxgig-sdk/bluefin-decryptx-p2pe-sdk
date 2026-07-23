package utility

import "github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/go/core"

func prepareMethodUtil(ctx *core.Context) string {
	opname := ctx.Op.Name

	methodMap := map[string]string{
		"create": "POST",
		"update": "PUT",
		"load":   "GET",
		"list":   "GET",
		"remove": "DELETE",
		"patch":  "PATCH",
	}

	if m, ok := methodMap[opname]; ok {
		return m
	}
	return "GET"
}

package core

type BluefinDecryptxP2peError struct {
	IsBluefinDecryptxP2peError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewBluefinDecryptxP2peError(code string, msg string, ctx *Context) *BluefinDecryptxP2peError {
	return &BluefinDecryptxP2peError{
		IsBluefinDecryptxP2peError: true,
		Sdk:              "BluefinDecryptxP2pe",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *BluefinDecryptxP2peError) Error() string {
	return e.Msg
}

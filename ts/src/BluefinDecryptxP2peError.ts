
import { Context } from './Context'


class BluefinDecryptxP2peError extends Error {

  isBluefinDecryptxP2peError = true

  sdk = 'BluefinDecryptxP2pe'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  BluefinDecryptxP2peError
}


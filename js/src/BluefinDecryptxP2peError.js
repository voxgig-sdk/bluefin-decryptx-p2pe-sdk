

class BluefinDecryptxP2peError extends Error {

  isBluefinDecryptxP2peError = true

  sdk = 'BluefinDecryptxP2pe'

  constructor(code, msg, ctx) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

module.exports = {
  BluefinDecryptxP2peError
}


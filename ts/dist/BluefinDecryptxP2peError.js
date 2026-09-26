"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.BluefinDecryptxP2peError = void 0;
class BluefinDecryptxP2peError extends Error {
    isBluefinDecryptxP2peError = true;
    sdk = 'BluefinDecryptxP2pe';
    code;
    ctx;
    status = -1;
    // `err.notFound` rather than a magic number at every call site.
    get notFound() { return 404 === this.status; }
    constructor(code, msg, ctx) {
        super(msg);
        this.code = code;
        this.ctx = ctx;
    }
}
exports.BluefinDecryptxP2peError = BluefinDecryptxP2peError;
//# sourceMappingURL=BluefinDecryptxP2peError.js.map
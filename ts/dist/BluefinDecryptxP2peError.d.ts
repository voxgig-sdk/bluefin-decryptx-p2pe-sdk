import { Context } from './Context';
declare class BluefinDecryptxP2peError extends Error {
    isBluefinDecryptxP2peError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { BluefinDecryptxP2peError };

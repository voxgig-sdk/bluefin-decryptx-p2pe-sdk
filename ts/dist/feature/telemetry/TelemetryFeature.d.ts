import type { Context, FeatureOptions } from '../../types';
import type { BluefinDecryptxP2peSDK } from '../../BluefinDecryptxP2peSDK';
import { BaseFeature } from '../base/BaseFeature';
declare class TelemetryFeature extends BaseFeature {
    version: string;
    name: string;
    active: boolean;
    _client?: BluefinDecryptxP2peSDK;
    _options: any;
    _spans: WeakMap<object, any>;
    _seq: number;
    init(ctx: Context, options: FeatureOptions): void | Promise<any>;
    PrePoint(this: any, ctx: any): void;
    PreRequest(this: any, ctx: any): void;
    PreDone(this: any, ctx: any): void;
    PreUnexpected(this: any, ctx: any): void;
    _close(this: any, ctx: any, ok: boolean): void;
    _id(this: any, kind: string): string;
    _now(this: any): number;
}
export { TelemetryFeature };

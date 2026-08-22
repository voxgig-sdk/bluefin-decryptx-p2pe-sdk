import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { Kif, KifListMatch } from '../BluefinDecryptxP2peTypes';
declare class KifEntity extends BluefinDecryptxP2peEntityBase<Kif> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: KifEntity): KifEntity;
    list(this: any, reqmatch?: KifListMatch, ctrl?: Control): Promise<KifEntity[]>;
}
export { KifEntity };

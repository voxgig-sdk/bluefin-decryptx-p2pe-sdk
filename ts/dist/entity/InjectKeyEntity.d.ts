import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { InjectKey, InjectKeyLoadMatch, InjectKeyListMatch } from '../BluefinDecryptxP2peTypes';
declare class InjectKeyEntity extends BluefinDecryptxP2peEntityBase<InjectKey> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: InjectKeyEntity): InjectKeyEntity;
    load(this: any, reqmatch?: InjectKeyLoadMatch, ctrl?: Control): Promise<InjectKeyEntity>;
    list(this: any, reqmatch?: InjectKeyListMatch, ctrl?: Control): Promise<InjectKeyEntity[]>;
}
export { InjectKeyEntity };

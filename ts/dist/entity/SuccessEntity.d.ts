import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { Success, SuccessCreateData, SuccessRemoveMatch } from '../BluefinDecryptxP2peTypes';
declare class SuccessEntity extends BluefinDecryptxP2peEntityBase<Success> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: SuccessEntity): SuccessEntity;
    create(this: any, reqdata?: SuccessCreateData, ctrl?: Control): Promise<SuccessEntity>;
    remove(this: any, reqmatch?: SuccessRemoveMatch, ctrl?: Control): Promise<SuccessEntity>;
}
export { SuccessEntity };

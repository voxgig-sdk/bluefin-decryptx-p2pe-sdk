import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { Decryption, DecryptionCreateData } from '../BluefinDecryptxP2peTypes';
declare class DecryptionEntity extends BluefinDecryptxP2peEntityBase<Decryption> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: DecryptionEntity): DecryptionEntity;
    create(this: any, reqdata?: DecryptionCreateData, ctrl?: Control): Promise<DecryptionEntity>;
}
export { DecryptionEntity };

import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { CreateResult, CreateResultCreateData } from '../BluefinDecryptxP2peTypes';
declare class CreateResultEntity extends BluefinDecryptxP2peEntityBase<CreateResult> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: CreateResultEntity): CreateResultEntity;
    create(this: any, reqdata?: CreateResultCreateData, ctrl?: Control): Promise<CreateResultEntity>;
}
export { CreateResultEntity };

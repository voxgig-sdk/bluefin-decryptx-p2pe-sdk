import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { UpdateResult, UpdateResultListMatch, UpdateResultCreateData, UpdateResultUpdateData } from '../BluefinDecryptxP2peTypes';
declare class UpdateResultEntity extends BluefinDecryptxP2peEntityBase<UpdateResult> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: UpdateResultEntity): UpdateResultEntity;
    list(this: any, reqmatch?: UpdateResultListMatch, ctrl?: Control): Promise<UpdateResultEntity[]>;
    create(this: any, reqdata?: UpdateResultCreateData, ctrl?: Control): Promise<UpdateResultEntity>;
    update(this: any, reqdata?: UpdateResultUpdateData, ctrl?: Control): Promise<UpdateResultEntity>;
}
export { UpdateResultEntity };

import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { Partner, PartnerLoadMatch, PartnerListMatch, PartnerCreateData } from '../BluefinDecryptxP2peTypes';
declare class PartnerEntity extends BluefinDecryptxP2peEntityBase<Partner> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: PartnerEntity): PartnerEntity;
    load(this: any, reqmatch?: PartnerLoadMatch, ctrl?: Control): Promise<PartnerEntity>;
    list(this: any, reqmatch?: PartnerListMatch, ctrl?: Control): Promise<PartnerEntity[]>;
    create(this: any, reqdata?: PartnerCreateData, ctrl?: Control): Promise<PartnerEntity>;
}
export { PartnerEntity };

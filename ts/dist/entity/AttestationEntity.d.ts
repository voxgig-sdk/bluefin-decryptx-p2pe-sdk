import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { Attestation, AttestationLoadMatch, AttestationListMatch, AttestationCreateData } from '../BluefinDecryptxP2peTypes';
declare class AttestationEntity extends BluefinDecryptxP2peEntityBase<Attestation> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: AttestationEntity): AttestationEntity;
    load(this: any, reqmatch?: AttestationLoadMatch, ctrl?: Control): Promise<AttestationEntity>;
    list(this: any, reqmatch?: AttestationListMatch, ctrl?: Control): Promise<AttestationEntity[]>;
    create(this: any, reqdata?: AttestationCreateData, ctrl?: Control): Promise<AttestationEntity>;
}
export { AttestationEntity };

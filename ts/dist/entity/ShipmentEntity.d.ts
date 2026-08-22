import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { Shipment, ShipmentLoadMatch, ShipmentListMatch, ShipmentCreateData } from '../BluefinDecryptxP2peTypes';
declare class ShipmentEntity extends BluefinDecryptxP2peEntityBase<Shipment> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: ShipmentEntity): ShipmentEntity;
    load(this: any, reqmatch?: ShipmentLoadMatch, ctrl?: Control): Promise<ShipmentEntity>;
    list(this: any, reqmatch?: ShipmentListMatch, ctrl?: Control): Promise<ShipmentEntity[]>;
    create(this: any, reqdata?: ShipmentCreateData, ctrl?: Control): Promise<ShipmentEntity>;
}
export { ShipmentEntity };

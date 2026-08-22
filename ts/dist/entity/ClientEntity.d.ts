import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { Client, ClientLoadMatch, ClientListMatch, ClientCreateData, ClientRemoveMatch } from '../BluefinDecryptxP2peTypes';
declare class ClientEntity extends BluefinDecryptxP2peEntityBase<Client> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: ClientEntity): ClientEntity;
    load(this: any, reqmatch?: ClientLoadMatch, ctrl?: Control): Promise<ClientEntity>;
    list(this: any, reqmatch?: ClientListMatch, ctrl?: Control): Promise<ClientEntity[]>;
    create(this: any, reqdata?: ClientCreateData, ctrl?: Control): Promise<ClientEntity>;
    remove(this: any, reqmatch?: ClientRemoveMatch, ctrl?: Control): Promise<ClientEntity>;
}
export { ClientEntity };

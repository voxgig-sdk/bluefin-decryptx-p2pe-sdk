import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { Transaction, TransactionLoadMatch, TransactionListMatch, TransactionCreateData } from '../BluefinDecryptxP2peTypes';
declare class TransactionEntity extends BluefinDecryptxP2peEntityBase<Transaction> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: TransactionEntity): TransactionEntity;
    load(this: any, reqmatch?: TransactionLoadMatch, ctrl?: Control): Promise<TransactionEntity>;
    list(this: any, reqmatch?: TransactionListMatch, ctrl?: Control): Promise<TransactionEntity[]>;
    create(this: any, reqdata?: TransactionCreateData, ctrl?: Control): Promise<TransactionEntity>;
}
export { TransactionEntity };

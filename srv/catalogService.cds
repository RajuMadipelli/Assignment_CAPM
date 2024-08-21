using {  ust.raju.madipelli.db.transaction,ust.raju.madipelli.db.master} from '../db/datamodels';

service catalogservice {
  
  entity purchaseorderSet@(odata.draft.enabled:true) as projection on transaction.purchaseorder;
  entity productSet as projection on master.product;
  entity poitems as projection on transaction.poitems;
  function highestprice() returns array of  productSet;
  }
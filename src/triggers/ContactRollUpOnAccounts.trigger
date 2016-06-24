trigger ContactRollUpOnAccounts on Contact (after delete, after insert, after update) {        
   public Boolean isFirst = true;


    set<ID> AccountIds = new set<ID>();
    set<ID> conIDs = new Set<ID>(); 
        if(trigger.isInsert || trigger.isUpdate){
        for(Contact c : trigger.new){
            AccountIds.add(c.AccountId);
        }
    }
  
    if(trigger.isDelete){
        for(Contact c : trigger.old){
            AccountIds.add(c.AccountId);
        }
    }

    List<Account> AccountsToUpdate = new  List<Account>();

    List<AggregateResult> aggs = [select AccountId, FirstName ,count(ID) Contact_Count__c 
                                from Contact where AccountId in : AccountIds Group By AccountId,FirstName]; 
 
    Map<Id,Integer> conCountMap = new Map<Id,Integer>();
    set<String> conNames=new set<String>();
    List<String> conNamesLst=new  List<String>();
    for (AggregateResult agg : aggs) {
        conCountMap.put(String.valueOf(agg.get('AccountId')),Integer.valueOf(agg.get('Contact_Count__c')));
        conNames.add(String.valueOf(agg.get('FirstName')));
    }
    conNamesLst.addAll(conNames);
     List<Account> AccntLst=[select Id,wipro123__ContactCount__c,wipro123__ContactNames__c,(select Id,FirstName from contacts)from Account where Id in :AccountIds ];
    for(Id accId: AccountIds ){
        Account newAcct = new Account(id=accId);
        newAcct.wipro123__ContactCount__c = conCountMap.get(accId); 
        newAcct.wipro123__ContactNames__c = '';
        for(String str:conNamesLst){
        newAcct.wipro123__ContactNames__c+=str;
        }
       AccountsToUpdate.add(newAcct);
            }

    update AccountsToUpdate;
    
}
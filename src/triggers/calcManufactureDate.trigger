trigger calcManufactureDate on Asset (before insert,before update,after insert,after update) {
List<Asset> upAsstLst=new List<Asset>();
List<Account> accLst=new List<Account>();
Map<Id,Account> mapAccount=new Map<Id,Account>();
Set<Id> accIds=new Set<Id>();

if(trigger.isbefore&& (trigger.isupdate || trigger.isinsert)){

    for(Asset ast:Trigger.new){
         if(ast.AccountId!=null){
        accIds.add(ast.AccountId);
        
        system.debug('account id------'+accIds);
        }
       } 
        if(!accIds.isEmpty()){ 
      upAsstLst=[select Id,AccountId,wipro123__Warranty_End_Date__c from Asset where wipro123__Warranty_End_Date__c=3000-01-01 AND AccountId IN:accIds];
      system.debug('asset list with wDate---'+upAsstLst);
      if(upAsstLst.size()>=1){
      for(Asset ast:Trigger.new){
      ast.wipro123__Warranty_End_Date__c= Date.newInstance(3000, 01, 01);
      system.debug(ast.wipro123__Warranty_End_Date__c);
      }
      
      }
  }
/* if(ast.SerialNumber!=null){
String str =ast.SerialNumber;
System.debug(str);
System.debug('substring-----'+str.substring(3,4));
MfgDateSettings__c  settings = MfgDateSettings__c.getInstance(str.substring(3,4));
System.debug(settings);
Date mfDate=settings.wipro123__DateValue__c;
ast.Manufacture_Date__c= mfDate;
} */

}
/**if(str.charAt(1)==65){
ast.Manufacture_Date__c=date.valueof('2002/01/01');
ast.Manufacture_Date__c=Date.newInstance(1999, 01, 01);
upAsstLst.add(ast);

} **/

if(trigger.isafter&& (trigger.isupdate || trigger.isinsert)){
for(Asset ast:Trigger.new){
 if(ast.AccountId!=null){
accIds.add(ast.AccountId);
}
}
if(!accIds.isEmpty()){
accLst=[select Id,Name,wipro123__Not_in_Good_Standing__c from Account where Id IN:accIds];
for(Account acc:accLst){
mapAccount.put(acc.Id,acc);
}
}
upAsstLst=[select Id,AccountId,wipro123__Meter_Not_Received_Within_120_Days__c from Asset where wipro123__Meter_Not_Received_Within_120_Days__c=true AND AccountId IN:mapAccount.keyset()];
if(upAsstLst.size()>=5){
for(Asset ast:upAsstLst){
  Account acnt= mapAccount.get(ast.AccountId);
                acnt.wipro123__Not_in_Good_Standing__c= true;
               mapAccount.put(acnt.Id,acnt);
}
 
}
    else
            {
              for(Asset ast:upAsstLst){
                 Account acnt= mapAccount.get(ast.AccountId);
                acnt.wipro123__Not_in_Good_Standing__c= false;
               mapAccount.put(acnt.Id,acnt);
                        }
             }

    if(mapAccount.values().size() > 0){
        update mapAccount.values();
    }

}


}
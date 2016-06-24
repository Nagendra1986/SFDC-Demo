trigger duplicateName on wipro123__Student__c(before insert,before update) {
Map<Id,wipro123__Student__c> stdMap = new Map<Id, wipro123__Student__c>([select Id,Name from  wipro123__Student__c]);
public  Integer index=0; 
   for (Integer i = 0; i < Trigger.old.size(); i++) {

  wipro123__Student__c old = Trigger.old[i];

  wipro123__Student__c nw = Trigger.new[i];

  if (nw.Name != old.Name )
 {
 insert nw;
 }
            
       
      
}

}
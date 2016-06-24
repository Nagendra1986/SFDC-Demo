global class scheduleDialy implements Schedulable{
List<Id> conIds=new List<Id>();
List<Id> AccId=new List<Id>();
global void execute(SchedulableContext sc){


List<contact> conTdy=[Select Id,FirstName,LastName,AccountId from Contact whrere WHERE CreatedDate = TODAY];
for(Contact con:conTdy ){
AccId.add(con.AccountId);
conIds.add(con.Id);
}

LIST<AggregateResult> noOfContacts = new LIST<AggregateResult> ();
 noOfContacts =  [select AccountId, FirstName ,count(ID) Contact_Count__c 
                                from Contact where AccountId in : AccId AND CreatedDate = TODAY Group By AccountId,FirstName ];
     Map<Id,Integer> conCountMap = new Map<Id,Integer>();                            
   for(AggregateResult agg : noOfContacts ) {
        conCountMap.put(String.valueOf(agg.get('AccountId')),Integer.valueOf(agg.get('Contact_Count__c')));
        }
                                
}
public void SendEmail()
  {
       Messaging.MassEmailMessage mail = new Messaging.MassEmailMessage();
       mail.setTargetObjectIds(AccId);
       mail.setTemplateId('00X90000000kccM');
       Messaging.sendEmail(new Messaging.MassEmailMessage[] { mail });
  }  
}
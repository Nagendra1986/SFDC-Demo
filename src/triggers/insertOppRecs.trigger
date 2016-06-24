trigger insertOppRecs on Contact (after insert,before update) {
List<opportunity> oppList=new List<opportunity>();

for(Contact con:Trigger.new){
 Id AccntId=con.AccountId;
 Id conId=con.Id;
Opportunity opp=new Opportunity ();
opp.Name=con.lastname + 'Opportunity';
opp.description=con.description;
oppList.add(opp);
opp.AccountId=AccntId;
opp.closedate=system.today()+10;
opp.StageName='Prospecting';
opp.wipro123__Contact__c=conId;
}

insert oppList;
}
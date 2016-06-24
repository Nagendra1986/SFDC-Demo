trigger description on Book_Detail__c (before insert, before update) {
for (Book_Detail__c c:Trigger.new){
c.wipro123__Description__c=c.Name;
}

}
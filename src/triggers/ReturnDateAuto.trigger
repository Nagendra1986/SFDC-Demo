trigger ReturnDateAuto on Book_Detail__c (before insert) {
for(wipro123__Book_Detail__c book:Trigger.new)
book.wipro123__Return_Date__c=book.wipro123__Issue_Date__c+10;
}
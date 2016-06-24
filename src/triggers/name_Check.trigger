trigger name_Check on Book_Detail__c (before insert,before update) {
List<Book_Detail__c> bNames=[select  Id,Name from Book_Detail__c where Book_Detail__c.Name=:trigger.new[0].Name];
if(bNames.size()>0){
trigger.new[0].name.addError('Book name already exists');

}

}
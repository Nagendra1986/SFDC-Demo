public with sharing class GenerateCSV {

    
List<contact> myContacts{get;set;}
public List<Contact> getContacts(){
myContacts=[Select Id,FirstName,LastName from Contact whrere WHERE CreatedDate = TODAY];
return myContacts;
}
}
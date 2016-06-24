global class batchUpdateStudents implements Database.Batchable<sObject>
{
    global String query;
    global Database.QueryLocator start(Database.BatchableContext BC)
     {
     query='Select Id,wipro123__Institution_Name__c from wipro123__Student__c';
     return Database.getQueryLocator(query);
     }

    global void execute(Database.BatchableContext BC,List<wipro123__Student__c> scope)
       {
           for( wipro123__Student__c std:scope)
           {
             std.wipro123__Institution_Name__c='SSIT';
           }  
           update scope;
       }
   
    global void finish(Database.BatchableContext BC)
    {
    }
}
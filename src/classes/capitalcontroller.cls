public with sharing class capitalcontroller {
public List<wipro123__state__c> code {get;set;}
   
    public capitalcontroller()
    {
        Map<String,wipro123__state__c> allCodes = wipro123__state__c.getAll();
        code = allCodes.values();
    }  
}
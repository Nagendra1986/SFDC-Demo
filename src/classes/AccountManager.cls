@RestResource(urlMapping='/Account/*/Contacts')
global with sharing class AccountManager{
  @HttpGet
   global static Account getAccount(){
      RestRequest request = RestContext.request;
      // grab the caseId from the end of the URL
       /* String AccountId= request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);  */
        String AccountId = request.requestURI.substringBetween('Account/', '/Contacts'); 
        Account result =  [SELECT Id,Name,(Select Name from Contacts) FROM Account
                            WHERE Id = :AccountId];  
         /* Account result =  [SELECT Id,Name FROM Account WHERE Id = :AccountId]; */              
        return result;

   }
 
}
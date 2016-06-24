@isTest 
public class TestReturnDateAuto {
    static testMethod void insertNewRec() {
       
       wipro123__Book_Detail__c  BookToCreate = new wipro123__Book_Detail__c();
       
       // Do you recognize these fields?
      
      
       BookToCreate.wipro123__User__c = 'sruthi.macherla@wipro.com';
       

       
       
       insert BookToCreate;
    }
}
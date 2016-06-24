public class UpdatingRelatedRecords {
    public static string updateRelRecs(){
try {
    // Query for the contact, which has been associated with an account.
    Contact queriedContact = [SELECT Account.Name,Account.Industry,phone
                              FROM Contact 
                              WHERE FirstName = 'sfdc contact' AND LastName='one' 
      
    
                              LIMIT 1];
    
    
    
  
    // Update the contact's phone number
    queriedContact.Phone = '415';

    // Update the related account industry
    queriedContact.Account.Industry = 'Technology';

    // Make two separate calls     // 1. This call is to update the contact's phone. 
       update queriedContact;
    // 2. This call is to update the related account's Industry field.    
    update queriedContact.Account; 
} catch(Exception e) {
    System.debug('An unexpected error has occurred: ' + e.getMessage());
}

        
   return 'done'  ;   
   
        
        
        
        
        
   
        
        
        
        
    }

}
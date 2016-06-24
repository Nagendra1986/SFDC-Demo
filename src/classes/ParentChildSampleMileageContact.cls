public class ParentChildSampleMileageContact {
    public static void InsertParentChild() {
        Date dt = Date.today();
                Mileage__c  newmileage = new Mileage__c(
                        Miles__c=50,
                         Date__c=dt);
        
        // Create the parent reference.        // Used only for foreign key reference        // and doesn't contain any other fields.
        contact conctReference = new contact(
           LastName='Jones',
            MyExtID__c='SAP111111');                
        newmileage.Contact__r= conctReference;
        
        // Create the Account object to insert.        // Same as above but has Name field.        // Used for the insert.
        contact parentContact = new contact(
             FirstName='Harry', LastName='Jones',
            MyExtID__c='SAP111111');      
        
        // Create the account and the opportunity.
        Database.SaveResult[] results = Database.insert(new SObject[] {
             parentContact,newmileage});
        
        
        // Check results.        
        for (Integer i = 0; i < results.size(); i++) {
            if (results[i].isSuccess()) {
            System.debug('Successfully created ID: '
                  + results[i].getId());
            } else {
            System.debug('Error: could not create sobject '
                  + 'for array element ' + i + '.');
            System.debug('   The error reported was: '
                  + results[i].getErrors()[0].getMessage() + '\n');
            }
        }
    }
    
}
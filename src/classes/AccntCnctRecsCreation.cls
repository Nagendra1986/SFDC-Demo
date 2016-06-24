public class AccntCnctRecsCreation {
    public static void myInsert(){
    
    Account a = new Account(Name = 'Acme');
    insert a; 
    system.debug('Account:'+a.Name);
 // Inserting the record automatically assigns a       
 // value to its ID field
    Contact c = new Contact(LastName = 'Weissman');
    c.AccountId = a.Id;

     insert c;

     c = [SELECT Account.Name FROM Contact WHERE Id = :c.Id];


   c.Account.Name = 'salesforce.com';
   c.LastName = 'Roth';

// To update the database, the two types of records must be
// updated separately
     update c;         
// This only changes the contact's last name
     update c.Account;  

      
    }

}
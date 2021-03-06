trigger accountDeletion on Account (before delete) {
   
    // Prevent the deletion of accounts if they have related contacts.
    for (Account a : [SELECT Id FROM Account
                     WHERE Id IN
                      :Trigger.old]) {
        Trigger.oldMap.get(a.Id).addError(
            'Cannot delete account with related opportunities.');
    }
    
}
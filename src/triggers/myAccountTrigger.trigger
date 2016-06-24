trigger myAccountTrigger on Account(before delete)
    {
if (Trigger.isBefore) {
    if (Trigger.isDelete) {

        // In a before delete trigger, the trigger accesses the records that will be   
             // deleted with the Trigger.old list.   
             for (Account a : Trigger.old) {
            if (a.Name != 'okToDelete') {
                a.addError('You can\'t delete this record!');
            } 
        }
    }
  }
 }
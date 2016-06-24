trigger TestShare1 on Test__c (after insert) {
    if(trigger.isInsert){

   List<Test__Share> jobShares  = new List<Test__Share>();

    for(Test__c t : trigger.new){
          Test__Share studentRecord = new Test__Share();

           studentRecord.ParentId = t.Id;
      // Then, set the ID of user or group being granted access. In this case,


        // we’re setting the Id of the student__c that was specified by

        // the Test Result in the student__c lookup field on the Test record.

        studentRecord.UserOrGroupId = t.wipro123__User__c;

        System.debug(t.wipro123__User__c + 'User Id inside loop');

        studentRecord.AccessLevel = 'edit';

        studentRecord.RowCause =Schema.Test__Share.RowCause.Manual;

        jobShares.add(studentRecord);
    }

        Database.SaveResult[] jobShareInsertResult = Database.insert(jobShares,false);
    
   }
}
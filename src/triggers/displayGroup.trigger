trigger displayGroup on Test__c (before insert,before update) {
Set<Id> UIds= new Set<Id>();
set<Id> GrpIds=new Set<Id>();
set<String> groupNames=new set<String>();
Map<Id,Id> userGrpMap= new Map<Id,Id>();
Map<Id,Id> userGrpMap1= new Map<Id,Id>();
string temp;
for(Test__c  tst:trigger.new){
if(tst.User__c!=null){
   uids.add(tst.User__c);          
  }
}
List<GroupMember> listGroupMembers = [SELECT GroupId,UserOrGroupId  FROM GroupMember  WHERE UserOrGroupId IN :UIds];
System.debug('listGroupMembers----'+listGroupMembers);

for(GroupMember gm:listGroupMembers ){
GrpIds.add(gm.GroupId); 
   userGrpMap.put(gm.UserOrGroupId,gm.GroupId);
}
//List<Group> grpNames=[Select Id,Name from Group where Id In:GrpIds];

//System.debug('Group Name------------'+grpNames);

for(Test__c  tst:trigger.new){
   for(Id Key :userGrpMap.keyset())
   {
     temp = temp + userGrpMap.get(tst.User__c);
   }
system.debug('Values in Group Names set--'+ groupNames);
tst.group__c= temp;
system.debug('grp---------name'+tst.group__c);
}

}
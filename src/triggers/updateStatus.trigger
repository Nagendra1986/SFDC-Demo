trigger updateStatus on Account (before insert,before update) {
List<Account> updateLst = new List<Account>();
for(Account acc:Trigger.new){
  system.debug('trigger.new values'+acc);
  System.debug('trigger.old'+trigger.old);
  acc.status__c='active';
 
}
for(Account a:trigger.new){
  if(a.site!=trigger.oldmap.get(a.id).site){
List<Account> accs = [Select Id,Status__C from Account];

for(Account acc:accs){
    system.debug('all accounts'+acc);
  acc.Status__c='Obsolete';
  updateLst.add(acc);
}
}
if(updateLst.size()>0  && AccountFlag.recControl){
AccountFlag.recControl=false;
update updateLst;
}
}
}
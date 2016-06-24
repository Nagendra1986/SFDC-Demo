trigger AccountSharw on Account (after insert,after update) {
  Set<String> TerrSet = new Set<String>();
  for(Account a:trigger.new){
      TerrSet.add(a.wipro123__Territory_Custom__c);
  }
  List<User> userLst = [Select Id,Name,UserRole.NAme from User where UserRole.NAme = 'CEO'];

}
Trigger updatecontact on Account (before update,after delete) {
 
  if(trigger.isbefore && trigger.isupdate){
     List<Account> newTriggerRecs = Trigger.new;
        List<Account> oldTriggerRecs = Trigger.old;
        system.debug(newTriggerRecs);
        system.debug(oldTriggerRecs);
  map<id,account> mapcon = trigger.newmap;
  list<contact> cont = new list<contact>();
  list<contact> con = [select id,phone,accountid from contact where accountid in : mapcon.keyset()];
  for(contact c : con){
   c.phone = mapcon.get(c.accountid).phone;
   cont.add(c);

  }
  update cont;
}
  if(trigger.isafter && trigger.isdelete){
   map<id,account> delcon = trigger.oldmap;
   list<contact> ccc = [select id from contact where accountid in : delcon.keyset()];
   delete ccc;
  
 
  }
}
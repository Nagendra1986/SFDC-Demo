public with sharing class jqueryClass {
public List<Account> lst{get;set;}
public jqueryClass(){
lst=[select id,name,(select id,name from contacts)from Account];
}
}
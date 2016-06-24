public with sharing class sample
{
    public PageReference searchAndfind() {
        return null;
    }



    public List<Account> acc {get;set;}
    public sample()
    {
        acc = [SELECT Name, AccountNumber FROM Account];
    }  
    
}
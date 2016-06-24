public with sharing class NewandExistingController {
public Account accnt{get;set;}
public NewandExistingController (){
Id accid=apexpages.currentpage().getparameters().get('id');
accnt=[select Name,AccountNumber,NumberOfEmployees from Account where id=:accid ];
}
public PageReference Save(){
try{
update accnt;
}
catch(System.DMLException e){
 ApexPages.addMessages(e);
            return null;
}
return (new ApexPages.StandardController(accnt)).view();

}

}
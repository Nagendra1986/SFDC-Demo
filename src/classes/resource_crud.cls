public class resource_crud {
 private ApexPages.StandardController controller {get; set;}
  public String var {get;set;}
public String nickName{get;set;}
public List<Resources__c> recs;
public List<Resources__c> recs1;
public List<Resources__c> recsdel;
public string sId {get;set;}
public Resources__c curObj{get; set;}
public integer size{get;set;}
  
  Private final Resources__c rsrc;
  public Resources__c rsrc1=new Resources__c();
  public Resources__c rsrc2=new Resources__c();
        public List<Resources__c> getrecords() {

                recs= [select Name,Resources__c.Resource_Name__c,Resources__c.EmpID__c,Resources__c.Contact_No__c,Resources__c.OverAll_Experience__c from Resources__c ];

                return recs;
}
public resource_crud(ApexPages.StandardController stdController) { 
}
  
  public PageReference save1(){
    upsert curObj;
    return null;
  }
public PageReference save2(){
  insert rsrc;
    return null;
  }


public Pagereference  savenew() {
    curObj = new  Resources__c();
     return null;
}
        
public PageReference edit() {
    var=ApexPages.currentPage().getParameters().get('id');
    PageReference pageRef = new PageReference('/apex/editpage?id='+var);
    pageRef.setRedirect(true);
    return pageRef;
}
public PageReference detailpage() {
    //var=ApexPages.currentPage().getParameters().get('id');
    //PageReference pageRef = new PageReference('/apex/resourcedetail?id='+sId);
    
    
    getCurObjValue();
    //pageRef.setRedirect(true);
    return null;
}

public void getCurObjValue(){
    curObj = new Resources__c();
    if(sId.trim() != ''){
        curObj = [select Id, Resource_Name__c, EmpID__c, Contact_No__c, OverAll_Experience__c, Salesforce_Experience__c, Practice_Joining_Date__c, Current_Status__c from Resources__c WHERE ID =:sId Limit 1]; 
    }
}

public PageReference delete1() {
      var=ApexPages.currentPage().getParameters().get('id');
     recsdel= [select Id,Name, wipro123__Practice_Joining_Date__c, Resources__c.Resource_Name__c,Resources__c.EmpID__c,Resources__c.Contact_No__c,Resources__c.OverAll_Experience__c from Resources__c WHERE Id = :ApexPages.currentPage().getParameters().get('Id')];
     delete recsdel;
     PageReference pageRef = new PageReference('/apex/ListPage');
     pageRef.setRedirect(true);
     return pageRef;
}
  }
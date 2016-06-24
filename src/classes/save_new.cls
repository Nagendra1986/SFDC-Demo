public class save_new  {
 private ApexPages.StandardController controller {get; set;}
public String var {get;set;}
Private final Resources__c rsrc;
public List<Resources__c> recs;
public List<Resources__c> recsdel;
Public string searchText{get;set;}
  public List<Resources__c> searchResults {get{
                                              if(searchResults == null){
                                                  searchResults = new List<Resources__c>();
                                              }
                                              return searchResults;
                                              }
                                              set;}
  public integer size{get;set;}
  
  public string msg{get;set;}

  
    public Resources__c rsrc1=new Resources__c();
        public List<Resources__c> getrecords() {

                recs= [select Name,Resources__c.Resource_Name__c,Resources__c.EmpID__c,Resources__c.Contact_No__c,Resources__c.OverAll_Experience__c from Resources__c limit 10];

                return recs;
}
public save_new(ApexPages.StandardController stdController) {   
  this.rsrc=(Resources__c)stdController.getRecord();    }

public PageReference savenew() {
rsrc1.Resource_Name__c = rsrc.Resource_Name__c;
rsrc1.EmpID__c = rsrc.EmpID__c;
rsrc1.Contact_No__c = rsrc.Contact_No__c;
rsrc1.OverAll_Experience__c= rsrc.OverAll_Experience__c;
rsrc1.Practice_Joining_Date__c = rsrc.Practice_Joining_Date__c;
rsrc1.Salesforce_Experience__c = rsrc.Salesforce_Experience__c;
rsrc1.Current_Status__c = rsrc.Current_Status__c;
insert rsrc1;
PageReference pageRef = new PageReference('/apex/ResourcePage');
       pageRef.setRedirect(true);
  return pageRef;
        }
public PageReference edit() {
    var=ApexPages.currentPage().getParameters().get('id');
    PageReference pageRef = new PageReference('/apex/editpage?id='+var);
    pageRef.setRedirect(true);
    return pageRef;
}
public PageReference delete1() {
      var=ApexPages.currentPage().getParameters().get('id');
     recsdel= [select Id,Name,Resources__c.Resource_Name__c,Resources__c.EmpID__c,Resources__c.Contact_No__c,Resources__c.OverAll_Experience__c from Resources__c WHERE Id = :ApexPages.currentPage().getParameters().get('Id')];
     delete recsdel;
     PageReference pageRef = new PageReference('/apex/ListPage');
     pageRef.setRedirect(true);
     return pageRef;
}
public PageReference search1() {
    /*String qry = [select id, Resource_Name__c, Contact_No__c from Resources__c where Resource_Name__c LIKE \'%'+searchText+'%\' order by Resource_Name__c];
      searchResults = Database.query(qry);
    
    

searchText= '%' + searchText + '%';     
*/
            if(null != searchText  && searchText.trim() != '') {
             searchResults= [select id, Resource_Name__c, Contact_No__c from Resources__c where Resource_Name__c LIKE   :'%' + searchText + '%' order by Resource_Name__c];
             }else{
                 searchResults = new List<Resources__c>();
             }
         
             size = searchResults.size();

           if(size<=0)
         {
        ApexPages.Message errormessage = new ApexPages.Message(ApexPages.Severity.ERROR,'No Records found.');   
         ApexPages.addMessage(errormessage);
         }
       return null;
   }

  }
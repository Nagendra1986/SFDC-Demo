public with sharing class pagination_editing{
    List<wipro123__Organisation__c> selectedOrgs = new List<wipro123__Organisation__c>();
    List<orgwrapper> orgList = new List<orgwrapper>();
    Public Integer noOfRecords{get; set;}
    Public Integer param1{get;set;}
    Public Integer PageSize{get;set;}
    Public Integer size{get;set;}
    Public Integer PageNumber1{get;set;}
    Public Integer pagNumber{get;set;}
    Public Integer curPage{get {if(curPage == null){
                                curPage = Integer.valueOf('1');
                                }
                               return curPage;
                           }
                            set;}
      
    public Integer selectedPage{ get; set;} 
    Public Boolean valCheck{get;set;}
    Public Integer display{get;set;}
    
    public List<SelectOption> getItems() {
        List<SelectOption> options= new List<SelectOption>();
        options.add(new selectOption('None','None'));
        options.add(new selectOption('1','1'));
        options.add(new selectOption('2','2'));
        options.add(new selectOption('3','3'));
        options.add(new selectOption('4','4'));
        options.add(new selectOption('5','5'));
        options.add(new selectOption('6','6'));
         return options;
        }

      public List<SelectOption> getPages() {
        List<SelectOption> options= new List<SelectOption>();
        for(Integer i = 1; i <= noOfPages; i++){
            options.add(new selectOption(String.valueOf(i),String.valueOf(i)));
        }    
         return options;
        }
public ApexPages.StandardSetController setCon {
        get{
            if(setCon == null){
                pageSize=3;
                display=pageSize;
                string queryString = 'Select Name,wipro123__Country__c, wipro123__State__c from wipro123__Organisation__c order by Name';
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(queryString));
                setCon.setPageSize(pageSize);
                if(curPage == null){
                    curPage = Integer.valueOf('1');
                }
                //setCon.setPageNumber(curPage );
                noOfRecords = setCon.getResultSize();
            }
            return setCon;
        }set;
    }

     Public List<orgwrapper> getOrganisations() {
         orgList = new List<orgwrapper>();
         for(wipro123__Organisation__c a : (List<wipro123__Organisation__c>)setCon.getRecords())
            orgList.add(new orgwrapper(a));
             
             return orgList; 
         }

     public PageReference tosave() { 
   
      if(selectedOrgs.size()>0)
        update selectedOrgs;
        else
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Please select at least one organisation.'));
        
        return null;
     }
    
     public class orgwrapper
      {
        public wipro123__Organisation__c org11{get; set;}
        public Boolean selected {get; set;}
          public orgwrapper(Organisation__c org)
          {
            org11= org;
            selected = false;
          }
     }
     
       public  PageReference  getSelected() {
          selectedOrgs.clear();
          for(orgwrapper orgwrpr: orgList ) 
             if(orgwrpr.selected == true)
             
             selectedOrgs.add(orgwrpr.org11); 
             
             return null;
         }
        
        public List<wipro123__Organisation__c> GetSelectedOrgs(){
        if(selectedOrgs .size()>0)
        return selectedOrgs ;
        else
        return null;
       } 
    
    public pageReference refresh() {
        //selectedpage=PageNumber;
        //setCon = null;
        //getOrganisations();
        
        setCon.setPageSize(PageSize);
        display=PageSize;
        setCon.setPageNumber(PageNumber);
        
        
        return null;
    }
    
    public Boolean hasNext {
        get {
            return setCon.getHasNext();
        }
        set;
    }
    public Boolean hasPrevious {
        get {
            return setCon.getHasPrevious();
        }
        set;
    }
  
    
    public Integer pageNumber {
        get {
            return setCon.getPageNumber();
            }
        set;
    } 
  
    
  /*  public Integer noOfPages{
    get{
  noOfPages=noOfRecords/PageSize;
  return noOfPages;
  }
  set;
  } */
  public Integer noOfPages{
get{
if (setCon!=null)
{
noOfPages= setCon.getResultSize() / pageSize;
Integer mod = setCon.getResultSize() - (noOfPages* pageSize);
if (mod > 0)
noOfPages++;
}
return noOfPages;
}
set;
}
    public void first() {
        setCon.first();
    }
  
    public void last() {
        setCon.last();
    }
  
    public void previous() {
        setCon.save();
        setCon.setPageNumber(curPage );
        if(setCon.getHasPrevious()){
            //curPage -= 1;
            setCon.previous();
            curPage  = setcon.getPageNumber();
        }
        
    }
  
    public void next() {
        setCon.save();
       setCon.setPageNumber(curPage );
        if(setCon.getHasNext()){
           //curPage += 1;
            setCon.next();
            curPage  = setcon.getPageNumber();
        }
        
    }
    
    
}
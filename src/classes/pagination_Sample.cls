public with sharing class pagination_Sample{
    Public Integer noOfRecords{get; set;}
    Public Integer PageSize{get;set;}
    Public Integer size{get;set;}
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
         return options;
        }
    
    public ApexPages.StandardSetController setCon {
        get{
            if(setCon == null){
                size=4;
                display=size;
                string queryString = 'Select Name,wipro123__Country__c, wipro123__State__c from wipro123__Organisation__c order by Name';
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(queryString));
                setCon.setPageSize(size);
                noOfRecords = setCon.getResultSize();
            }
            return setCon;
        }set;
    }
     
    Public List<wipro123__Organisation__c> getOrganisations() {
        List<wipro123__Organisation__c> orgList = new List<wipro123__Organisation__c>();
        for(wipro123__Organisation__c a : (List<wipro123__Organisation__c>)setCon.getRecords())
            orgList .add(a);
        return orgList ;
    }
     
    public pageReference refresh() {
        setCon = null;
        getOrganisations();
        setCon.setPageSize(PageSize);
        display=PageSize;
        setCon.setPageNumber(1);
        
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
  
    public void first() {
        setCon.first();
    }
  
    public void last() {
        setCon.last();
    }
  
    public void previous() {
        setCon.previous();
    }
  
    public void next() {
        setCon.next();
    }
}
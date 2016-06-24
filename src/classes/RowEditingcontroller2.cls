public class RowEditingcontroller2 {
     public String upval{get;set;}
     public wipro123__Organisation__c organistn{get;set;}

     public Id Id{get;set;}
     List<orgwrapper> orgList = new List<orgwrapper>();
     List<wipro123__Organisation__c> selectedOrganisations = new List<wipro123__Organisation__c>();

     
     public RowEditingcontroller2(ApexPages.StandardController controller) {
    
         wipro123__Organisation__c organistn= new wipro123__Organisation__c();

      }

     public  List<orgwrapper> getOrganisations() {
    
        for(wipro123__Organisation__c c: [select Id,Name,Country__c,State__c from wipro123__Organisation__c order by createdDate desc ])
     
              orgList .add(new orgwrapper(c));
              return orgList ;
          }
       public PageReference getSelected() {
    
         selectedOrganisations.clear();
         for(orgwrapper orgwrap: orgList ) 
            if(orgwrap.selected == true)
       
           selectedOrganisations.add(orgwrap.orgs); 
       
            return null;
        }
      public List<wipro123__Organisation__c> GetselectedOrganisations(){
    
        if(selectedOrganisations.size()>0)
        return selectedOrganisations;
        else
       // ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Please select at least one Contact.'));
        return null;
    } 

     public PageReference tosave() { 
      if(selectedOrganisations.size()>0){
      for(Integer i=0;i<selectedOrganisations.size();i++)
      {
      selectedOrganisations[i].Name=upval;
       update selectedOrganisations;
      }
       
        PageReference RowEditing=new PageReference('/apex/MultipleRowEditing2');
        RowEditing.setRedirect(true);
        return RowEditing;
        }
        else{
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Please select at least one Contact.'));
         return null;
        }
       
       }

    public class orgwrapper
    {
        public wipro123__Organisation__c orgs{get; set;}
        public Boolean selected {get; set;}
        public orgwrapper(wipro123__Organisation__c oc)
        {
            orgs= oc;
            selected = false;
        }
    }
 }
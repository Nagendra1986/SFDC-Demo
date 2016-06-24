public with sharing class inlinecont {
public String upval{get;set;}
public  List<wipro123__Organisation__c> orgn{get;set;}
    public inlinecont(ApexPages.StandardController controller) {
     wipro123__Organisation__c neworg= new wipro123__Organisation__c();
    }

public  List<wipro123__Organisation__c> getorg;
public  List<wipro123__Organisation__c> getOrganisations() {
    
      getorg=[select Id,Name,Country__c,State__c from wipro123__Organisation__c order by createdDate desc ];
     
              
              return getorg;
          }
     public PageReference  savenew() {
          
          orgn=[select Id,Name,Country__c,State__c from wipro123__Organisation__c  ];
       for(Integer i=0;i<getorg.size()-10;i++)
      {
      getorg[i].Name=upval;
       
      }
          
          

     update getorg;
     return null;
     }
}
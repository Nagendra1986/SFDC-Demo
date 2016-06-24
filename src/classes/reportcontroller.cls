public with sharing class reportcontroller {
public List<Resources__c> listrec{get;set;}
public string pval{get;set;}
public Resources__c rept{get;set;}
public reportcontroller(ApexPages.standardController controller) {
      this.rept= (Resources__c)controller.getRecord();
    }

public PageReference displayrec() {
        listrec = [SELECT Resources__c.Resource_Name__c,Resources__c.OverAll_Experience__c 
                   FROM Resources__c WHERE Current_Status__c= : rept.Current_Status__c];
        System.debug('+++++ : ' + listrec + ' : ' + rept.Current_Status__c);
       //return listrec ;
       return null; 
    }
  public String getChooserender() {
     if (ApexPages.currentPage().getParameters().get('p') != null)
        return 'pdf';
        else
      return null;
  }
public PageReference deliverAsPDF() {
      PageReference pdf =  Page.demoreports;
        pdf.getParameters().put('p','p');
        
        return pdf;
  }
  
}
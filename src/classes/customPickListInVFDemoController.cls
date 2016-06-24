public class customPickListInVFDemoController {
    
    public String selectedTemplate{get;set;}
    public String xmlResponse{get;set;}
    public customPickListInVFDemoController(){
    }
     
    
    public List<SelectOption> getTemplateTypes() {
        List<SelectOption> countryOptions = new List<SelectOption>();
        countryOptions.add(new SelectOption('','-None-'));
        countryOptions.add(new SelectOption('Template A','Template A'));
        countryOptions.add(new SelectOption('Template B','Template B'));
        return countryOptions;
    }
   
     public String XMLResponse(){
      
        List<String> fieldsLst = new List<String>();
        System.debug('This is selectedTemplate :'+selectedTemplate);
        Map<String,TemplateType__c> mcs = TemplateType__c.getAll();
        System.debug('This is mcs :'+mcs);
        TemplateType__c Fields= mcs.get(selectedTemplate);
        String field1 = String.valueof(Fields);
        System.debug('This is field1 :'+field1);
         //String field2 = Afieldsdup1.Field2__c;
        
        //fieldsLst.add(field1);
       // fieldsLst.add(field2);
        return field1 ;
    }
}
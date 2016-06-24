public class schedulebatchcontroller {
  
   public String selectedTemplate{get;set;}
   public String xmlResponse{get;set;}
   public List<String> finalFields= new List<String>();
   
   public schedulebatchcontroller()
   {
      
      
   }
   public List<SelectOption> getTemplateTypes() {
        List<SelectOption> countryOptions = new List<SelectOption>();
        countryOptions.add(new SelectOption('','-None-'));
        countryOptions.add(new SelectOption('Template A','Template A'));
        countryOptions.add(new SelectOption('Template B','Template B'));
        return countryOptions;
    }
   
     public void XMLResponse(){
        
        String fieldsLst = '';
        TemplateType__c myCS1 = TemplateType__c.getValues(selectedTemplate);
        TemplateType__c Fields=myCS1;
        string strxmlResponse ;
        strxmlResponse = String.valueof(Fields);
        String r = strxmlResponse.substring(strxmlResponse.indexof('{')+1,strxmlResponse.indexof('}'));
        List<String> custFields= r.split(',');
        for(String s:custFields)
        {
             if(s.contains('__c')){
               fieldsLst +=s+',';
           }
        }
        String ABC='';
        List<String> ArrayValues =fieldsLst.split(',');
       
        for(String o: ArrayValues)
        {
            List<String> ortt = o.split('=');
            for(String or1 : ortt)
            {
               
                ABC +=or1+',';
            }
        }
        List<String> Arr1 = ABC.split(',');
        List<String> Arr3 = new  List<String>();
        List<String> Arr2 = new  List<String>();
        for (Integer i=0;i<Arr1.size();i++){
           
            if (math.mod(i+2,2)==0) {
                Arr3.add(Arr1[i]);
            }
            else {
                Arr2.add(Arr1[i]);
            }
         
         }
         System.debug('This is Arr3 :'+Arr3);
         System.debug('This is Arr2 :'+Arr2);
         String finalFields='';
         for(String s:Arr2){
          finalFields+=s+',';
         }
        xmlResponse = finalFields;
        
    }
}
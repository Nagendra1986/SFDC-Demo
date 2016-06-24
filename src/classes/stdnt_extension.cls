public class stdnt_extension {

    public wipro123__Student__c stdnt{get;set;}
    public string sId {get; set;}
    public stdnt_extension(ApexPages.StandardController controller) {
        sId = System.currentPageReference().getParameters().get('sId');
        getStudent();
    }

    /**
     * Method to get the student provided record Id
     */
    public void getStudent(){
        if(sId != null){
            List<wipro123__Student__c> lstStudent = [SELECT Id, Name, wipro123__Course__c,
                                                            wipro123__Department__c,
                                                            wipro123__Subject__c
                                                     FROM wipro123__Student__c
                                                     WHERE Id =: sId ];
            if(lstStudent.size() > 0){
                stdnt = lstStudent[0];
            }
        }
    }
    
    /**
     * Method to save modifications
     */
    public void saveRecord(){
        try{
                update stdnt;
        }catch(Exception e){
                System.debug(e.getStackTraceString());
        }
        sId = stdnt.Id;
        getStudent();
    }
    
    
//////////////////////////////////////////////////////////////////////////////////////
    public class studentwrapper{
        public String wname{get;set;}
        public String wdept{get;set;}
        public String wcourse{get;set;}
        public String wsubj{get;set;}

        public studentwrapper(String name,String dept,String course,String subj){
            wname=name;
            wdept=dept;
            wcourse=course;
            wsubj=subj;
         }
      }
}
global class student_controller {
public static wipro123__Student__c stndt1{ get; set; }

    public student_controller(ApexPages.StandardController controller) {
      controller.getRecord();
    }

public List<wipro123__Student__c> stndt=new List<wipro123__Student__c>();
@RemoteAction
    global static List<wipro123__Student__c> getStudent(String accountName) {
     List<wipro123__Student__c>   stndt=new List<wipro123__Student__c>();
        stndt= [SELECT Id, Name, Department__c, Course__c, Subject__c  FROM wipro123__Student__c WHERE Name = :'Sruthi'];
                  
        return stndt;
    }
}
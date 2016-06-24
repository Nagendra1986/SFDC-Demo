public with sharing class studenteditpage_Controller {


    public Student__c stdnt { get; private set; }

    public studenteditpage_Controller() {
        Id id = ApexPages.currentPage().getParameters().get('id');
        stdnt = (id == null) ? new Student__c() : 
            [SELECT Name, Course__c FROM Student__c WHERE Id = :id];
    }

    public PageReference save() {
        try {
            upsert(stdnt );
        } catch(System.DMLException e) {
            ApexPages.addMessages(e);
            return null;
        }
        //  After Save, navigate to the default view page:
        return (new ApexPages.StandardController(stdnt )).view();
    }
}
public with sharing class student_list {

    public PageReference Records() {
         string sortFullExp = sortExpression  + ' ' + sortDirection;
        recs= Database.query('select Name,Department__r.Dept_Name__c,Course__c,Subject__r.Name  from wipro123__Student__c  order by '+ sortFullExp +' limit 10'  );
        return null;
    }

    public boolean displayPopup {get; set;}
    public String recid{get;set;}
    public List<wipro123__Student__c> stdnt1{get;set;}
    private String sortDirection = 'ASC';
    private String sortExp = 'name';
    public student_list(ApexPages.StandardController controller) {
       Records();
    }
     public String sortExpression
   {
     get
     {
        return sortExp;
     }
     set
     {
       //if the column is clicked on then switch between Ascending and Descending modes
       if (value == sortExp)
         sortDirection = (sortDirection == 'ASC')? 'DESC' : 'ASC';
       else
         sortDirection = 'ASC';
       sortExp = value;
     }
   }

 public String getSortDirection()
 {
    //if not column is selected 
    if (sortExpression == null || sortExpression == '')
      return 'ASC';
    else
     return sortDirection;
 }

 public void setSortDirection(String value)
 {  
   sortDirection = value;
 }
  public List<wipro123__Student__c> recs{get;set;}
    
    public List<wipro123__Student__c>getRecords() {
                
               
                return recs;
                }
          
    public void closePopup() {
        displayPopup = false;
    }
 
    public void showPopup() {
        displayPopup = true;
        getStudent();
        
    }
    public void getStudent(){
        
            stdnt1= [SELECT Id, Name, Department__r.Dept_Name__c,
                                                            Course__c,
                                                            Subject__r.Name 
                                                     FROM wipro123__Student__c
                                                     WHERE Id =: recid];
            System.debug('+++++ : ' + stdnt1[0].Name);
        }
     public void saveRecord(){
                update stdnt1;
             displayPopup = false;
     }  
}
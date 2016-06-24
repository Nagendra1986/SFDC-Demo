public class sampleDetailPageCon { 
   private List<user> oppz;  
   user usr;
   
         public sampleDetailPageCon(ApexPages.StandardController controller) {  
               this.usr= (user)controller.getRecord();    }  
                 public List<user> getOppz()    {   
                      user user1= [Select id, Name FROM user where id = '00590000001BK14'];   
                                  
                               oppz = [Select id, Name,Manager.Name   from user where ManagerID= :user1.id];  
                                     return oppz;    }}
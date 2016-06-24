public class AngularRemoting_Con {  
   @RemoteAction  
   public static List<SObject> getData(){  
     return [SELECT Id,Name FROM Account];  
   }  
 }
public class partialPageRefreshController {
 public Integer count{get;set;}

  
   public partialPageRefreshController(){
     count=0;
   }
   public PageReference Increment(){
    count++;
    return null;
   }
}
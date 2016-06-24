public class dashboardController {
    public id dList{get;set;}

    public dashboardController(){
        dList = [select id from dashboard limit 1].Id;
    }
    
    public PageReference getRecs() {
        PageReference pref = new PageReference('https://wipro123.ap1.visual.force.com/apex/dashboardInVFPage');  
        pref.setRedirect(true); 
        return pref ;       
   }
  public list<String> getRprtIds(){
     return new List<String>{'00O90000008mjzq','00O90000008mjzl','00O90000008mj5O'};
  }
}
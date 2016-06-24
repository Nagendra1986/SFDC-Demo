public class anglrJsgetAccContcts {
  public String contactJson { get; set; }
  public Contact Contact { get; set; }
  

    public PageReference save() {
        if(contactJson!=''){
         Contact = [select id,firstname,lastname,Account.Name from Contact where Account.Name = 'contactJson'];
        }
        return null;
    }


    

    
}
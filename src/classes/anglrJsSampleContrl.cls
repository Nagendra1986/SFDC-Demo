public class anglrJsSampleContrl {
  List<Contact> ContactLSt;
 @RemoteAction

 public static List<Contact> GetAllContacts(String SearchText) {
   String SearchString = '%'+SearchText+'%';
       
       List<Contact>  ContactLSt = [select id,firstname,lastname,Account.Name from Contact where Account.Name like:SearchString];
        
        return ContactLSt;
    }
}
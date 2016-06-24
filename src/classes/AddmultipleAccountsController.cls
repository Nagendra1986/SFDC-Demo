public class AddmultipleAccountsController {
 Account account = new Account();
 public Integer i;
 public Integer size1;
 public list<Account> listAccount{ get; set; }
 
public AddmultipleAccountsController()
 {
 listAccount=new list<Account>();
 listAccount.add(account);
 }
 
Public void addAccount()
 {
 Account acc = new Account();
 listAccount.add(acc);
 size1=listAccount.size();
 
  }
 

  
Public void delAccount()
 {
 
 for(Integer i=1;i<size1;i++);
 listAccount.remove(i);
 } 
 public PageReference saveAccount() {
 for(Integer i=0; i<listAccount.size(); i++)
 {
 insert listAccount;
 }
 return Page.Allaccountssaved;
 }
 }
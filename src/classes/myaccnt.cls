public class myaccnt {

    public myaccnt(ApexPages.StandardController controller) {

    }

list<Account>myaccnts= new List<Account>();
public List<Account> getAccounts()
{
myaccnts=[Select name from Account limit 5];
return myaccnts;
}
}
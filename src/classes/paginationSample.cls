public class paginationSample{

    public paginationSample(ApexPages.StandardSetController controller) {

    }

public List<Account> prdct;
private final Account pdt;

public ApexPages.StandardSetController con{get; set;}


public paginationSample(ApexPages.StandardController controller){
this.pdt=(Account)controller.getRecord();

}
public pageReference returnrecord()
{
prdct=[select Name,AccountNumber,AnnualRevenue from Account ];
return  null;
}
    // indicates whether there are more records after the current page set.
    public Boolean hasNext {
        get {
            return con.getHasNext();

        }
        set;
    }

    // indicates whether there are more records before the current page set.
    public Boolean hasPrevious {
        get {
            return con.getHasPrevious();
        }
        set;
    }

    // returns the page number of the current page set
    public Integer pageNumber {
        get {
            return con.getPageNumber();
        }
        set;
    }

    // returns the first page of records
    public void first() { 

        try{
        con.first();  


        }
        catch (Exception e) 
            {
               ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Code Error '+e));
            }

    }

    // returns the last page of records
    public void last() {   

        try{
        con.last();        

        }
        catch (Exception e) 
            {
               ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Code Error '+e));
            }
    }

    // returns the previous page of records
    public void previous() {   

         try{
            con.previous();      

            }
            catch (Exception e) 
            {
               ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Code Error '+e));
            }
        }

    // returns the next page of records
    public void next() {  
    try{   

        con.next();      

        }
         catch (Exception e) 
            {
               ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Code Error '+e));
            }

    }   

}
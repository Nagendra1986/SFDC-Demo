public with sharing class ImportFromCSVFile {
    public String getContcsToupload() {
        return null;
    }


public String myfile{get;set;}
public Blob contentfile{get;set;}
String[] fileLines=new String[]{};
List<Account> accntsToUpload;
List<contact> contcsToupload;

 public Pagereference ReadFile()
    {
        myfile= contentFile.toString();
        filelines = myfile.split('\n');
        accntsToUpload= new List<Account>();
        
        contcsToupload=new List<contact>();
        
        for (Integer i=1;i<filelines.size();i++)
        {
            String[] inputvalues = new String[]{};
            inputvalues = filelines[i].split(',');
            
            Account a = new Account();
            contact c=new contact();
            a.Name = inputvalues[0];
            a.ShippingStreet = inputvalues[1];       
            a.ShippingCity = inputvalues[2];
            
            c.LastName=inputvalues[3];
            
            accntsToUpload.add(a);
            contcsToupload.add(c);
        }
        try{
        insert accntsToUpload;
           insert contcsToupload;
        }
        catch (Exception e)
        {
            ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured. Please check the template or try again later');
            ApexPages.addMessage(errormsg);
        }    
        return null;
    }
  public List<Account> getuploadedAccounts()
    {
        if (accntsToUpload!= NULL)
            if (accntsToUpload.size() > 0)
                return accntsToUpload;
            else
                return null;                    
        else
            return null;
    }  
  public List<contact> getuploadedContacts(){
  if (contcsToupload!= NULL)
            if (contcsToupload.size() > 0)
                return contcsToupload;
            else
                return null;                    
        else
            return null;

  }
      
}
public class Campaign {

    public pagereference newCampaings(){
    PageReference newPage;
    newPage = new PageReference('/701/e');
    newPage.setredirect(true);
    return newPage ;
   
    }




    public pagereference editCampaings(){
   // Campaign cam ;
    
    PageReference newPageedit;
     ID cam = ApexPages.currentPage().getParameters().get('id');
  // ID camId = ApexPages.currentPage().getParameters().get('id');
   // system.debug('Namitha -- > camId '+ camId );

        newPageedit= new PageReference('/' + cam + '/e?retURL=%2F701'+cam );
   
    newPageedit.setRedirect(true);
   
              return newPageedit;
              
    }

}
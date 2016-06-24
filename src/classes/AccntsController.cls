public class AccntsController {
private ApexPages.StandardSetController standardController;

    public AccntsController(ApexPages.StandardSetController standardController)
    {
        this.standardController = standardController;
    }

    public PageReference deleteSelected()
    {       
        // Get the selected records (optional, you can use getSelected to obtain ID's and do your own SOQL)
        List<Account> selectedAccnts= (List<Account>) standardController.getSelected();

        delete selectedAccnts;
        return null;
              
    }

    
}
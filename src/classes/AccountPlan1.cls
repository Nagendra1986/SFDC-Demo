global class AccountPlan1{
 webservice String area;
 webservice String region;

 global class Plan{
    webservice string Name;
    Webservice Integer planNumber;
    webservice Date planningPeriod;
    webservice Id   planID;
 }
 
 webservice static Plan createAccountPlan(Plan vPlan) {
       
       //A plan maps to the Account object in salesforce.com. 
       //So need to map the Plan class object to Account standard object
       Account acct = new Account();
       acct.Name = vPlan.name;
       acct.AccountNumber = String.valueOf(vPlan.planNumber);
       insert acct;
       
       vPlan.planId=acct.Id;
       return vPlan;
  }

}
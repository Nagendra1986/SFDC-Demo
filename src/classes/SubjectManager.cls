@RestResource(urlMapping='/Subject/*')
global  class SubjectManager {
    @HttpGet
    global static wipro123__Subject__c getSubjectById() {
        RestRequest req = RestContext.request;
        String subId = req.requestURI.substring(
                                        req.requestURI.lastIndexOf('/')+1);
        wipro123__Subject__c result = [SELECT Name,   wipro123__Description__c 
                                        FROM wipro123__Subject__c
                                        WHERE Id = :subId];
        return result;
    }
    @HttpPost
    global static String createSubject(String name,
        String description) {
        wipro123__Subject__c m = new wipro123__Subject__c(
                                                            Name=name,
                                                            wipro123__Description__c=description);
        insert m;
        return m.Id;
    }
}
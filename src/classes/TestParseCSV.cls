@isTest

public class TestParseCSV {
static testMethod void test()
    {
        string csvContent = '"firstname","lastname"\n"Test","Guy"';
        List<List<String>> parsedContent = parseCSV.parseCSV(csvContent,false);
        list<contact> contactList = (list<contact>)parseCSV.csvTosObject(parsedContent, 'contact');
        system.assertEquals(contactList.size(),1);
        system.assertEquals(contactList[0].firstname,'Test');
        system.assertEquals(contactList[0].lastname,'Guy');
    
    }    
}
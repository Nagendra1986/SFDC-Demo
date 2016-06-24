public with sharing class MyTest {

    public PageReference showlist() {
        return null;
    }

    public string mystr {get;set;}
    {mystr='santhi';}
    public PageReference showtext() {
        mystr = Apexpages.currentPage().getParameters().get('myParam');
        return null;
    }
}
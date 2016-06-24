public with sharing class page1controller {

    public page1controller(ApexPages.StandardController controller) {
        str1='Sruthiiii';
    }

public string str1{get;set;}
    public page1controller (){
    str1='Sruthiiii';
    }
    public string getName(){
      return 'Welcome';
    }
}
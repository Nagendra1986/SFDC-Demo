@RestResource(urlMapping='/Account/*') 
global with sharing class MyRestResource { 
  @Httppost
    global static Account doPost(String name,String phone) { 
      Account a = new Account();
      a.Name = name;
      a.phone = phone;
      insert a;
      return a;
    } 

}
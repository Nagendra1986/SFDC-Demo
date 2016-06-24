public with sharing class picklistcontroller {
public String profiles{get;set;}
    public List<SelectOption> getItems() {
        List<SelectOption> options= new List<SelectOption>();
        options.add(new selectOption('b','Bangalore'));
        options.add(new selectOption('h','Hyderabad'));
         return options;
        }


    }
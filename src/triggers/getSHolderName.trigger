trigger getSHolderName on Case (before insert,before update) {
for(case cs:trigger.new){
//List<wipro123__StakeHolder__c> ShNAmes=[Select Distinct(Name) from wipro123__StakeHolder__c where wipro123__country__c=:cs.wipro123__country__c  ];
//List<String> ShNAmes=[SELECT Name FROM wipro123__StakeHolder__c limit 1 ];
//Set<wipro123__StakeHolder__c> ShNoduplicate= new Set<wipro123__StakeHolder__c>();
//ShNoduplicate.addAll(ShNAmes);
//system.debug(ShNoduplicate);
string dup ='';

for (wipro123__StakeHolder__c a : [SELECT Name FROM wipro123__StakeHolder__c where wipro123__country__c=:cs.wipro123__country__c ]) {  
System.debug('bEFORE********* ' + a.Name); 

 if(dup != (String)a.Name)
 {
 dup =dup + (String)a.Name;
 }
 
 System.debug('aFTER######### ' + a.Name); 
 
}



//sObject[] acc = [SELECT Name FROM wipro123__StakeHolder__c where wipro123__country__c=:cs.wipro123__country__c];
//String profileName = String.valueOf( acc.getSobject('Name'));
//String[] profileName = (String)acc.get('Name');
//System.debug('ppp'+profileName );
//String dup='';
//for(String str: (Stri){
//dup=dup+':'+String.valueOf(str);

//System.debug('**********************************************'+dup);


//}
cs.wipro123__FieldRelatedToStakeHolder1__c=dup;
}

}
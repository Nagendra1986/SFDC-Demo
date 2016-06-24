trigger chckStage on Opportunity (before update) {
    Integer countold=0;
    Integer countnew=0;
    List<String> str= new List<String>();
    List<String> str1= new List<String>();
 
      for (Opportunity opp:trigger.new){
                 Opportunity oldopp = Trigger.oldMap.get(opp.ID);
                 str.add(trigger.oldMap.get(opp.Id).StageName);
                
        }
 List<Schema.PicklistEntry> pckLstVals=Opportunity.StageName.getDescribe().getPickListValues();
 system.debug('picklist values'+pckLstVals);
    for(PicklistEntry ple:pckLstVals){
          str1.add(ple.getvalue());
          system.debug('str1-----'+str1);
          }
 

for(Opportunity opp:trigger.new){
 String chckStrold=trigger.oldMap.get(opp.Id).StageName;
 String chckStrNew=opp.StageName;
for (Integer i = 0; i < str1.size()-1;i++){ 
  if(str1[i]==chckStrold)
  {
  countold=i;
  system.debug('countold------'+countold);
  }
  if(str1[i]==chckStrnew){
  countnew=i;
  system.debug('countnew------'+countnew);

  }
  
}
   if(countnew < countold){
      opp.addError('Cannot Edit opportunity when stage is in Perception Analysis');
        } 


}
/* if(trigger.newMap.get(opp.Id).StageName == trigger.oldMap.get(opp.Id).StageName  && (opp.StageName=='Prospecting' || opp.StageName=='Qualification' || opp.StageName=='Needs Analysis'
 || opp.StageName=='Value Proposition' || opp.StageName=='Id. Decision Makers' || trigger.newMap.get(opp.Id).StageName != trigger.oldMap.get(opp.Id).StageName)){
opp.addError('Cannot Edit opportunity when stage is in Perception Analysis');
} */


}
trigger IdeaTrigger on Idea__c (after insert) {
 /* try {            
 List<CollaborationGroup> vLstCollGroup = new List<CollaborationGroup>();
 List<CollaborationGroupMember> vLstCollGroupMem = new List<CollaborationGroupMember>();
 CollaborationGroup vCollGroup;
 CollaborationGroupMember vCollGroupMem;
 List<FeedItem> vLstFeedItem = new List<FeedItem>();
 FeedItem vPost;
 Map<String, CollaborationGroup> vMapIdeaIdGroup = new Map<String, CollaborationGroup>();
 List<Idea__c> vLstIdea1 = new List<Idea__c>();
    for( Idea__c vIdea: Trigger.new)
    {
       if(vIdea.Description__c != NULL){
   vCollGroup = new CollaborationGroup();
   vCollGroup.Description = 'Your group';
   vCollGroup.Name = vIdea.Title__c+'Group';
   vCollGroup.CollaborationType = 'Private';
   vLstCollGroup.add(vCollGroup);

    vLstIdea1.add(vIdea);
  
   String oppURL = URL.getSalesforceBaseUrl().toExternalForm() + '/' + vIdea.id;
   vPost = new FeedItem();
   vPost.ParentId = vIdea.Id;
   vPost.Title = vIdea.Title__c;
   vPost.Body = vIdea.Description__c;
   vPost.LinkUrl = oppURL;
   vPost.Type = 'LinkPost';
   vLstFeedItem.add(vPost);  
    } }
  system.debug('vLstCollGroup='+vLstCollGroup.size());
 if(!vLstCollGroup.isEmpty() && !vLstFeedItem.isEmpty())
 {
  insert vMapIdeaIdGroup.values();
  insert vLstFeedItem;
 }    
  
 for(Idea__c vIdea: Trigger.new)
 {
  if(vMapIdeaIdGroup.containsKey(vIdea.Id)) 
  {
   vCollGroupMem = new CollaborationGroupMember();
   system.debug('vMapIdeaIdGroup.get(vIdea.Id).Id'+vMapIdeaIdGroup.get(vIdea.Id).Id);
   vCollGroupMem.CollaborationGroupId = vMapIdeaIdGroup.get(vIdea.Id).Id;
   vCollGroupMem.MemberId = vIdea.OwnerId;
   vLstCollGroupMem.add(vCollGroupMem);
  }
 }
 system.debug('vLstCollGroupMem='+vLstCollGroupMem.size());
 if(!vLstCollGroupMem.isEmpty())
 {
  insert vLstCollGroupMem;
 }
 
    Map<Id, list<CollaborationGroupMember>> vMapGroupIdGroupMems = new map<Id, list<CollaborationGroupMember>>();
    list<CollaborationGroupMember> vLstGroupMems = [SELECT CollaborationGroupId,Id,MemberId FROM CollaborationGroupMember where CollaborationGroupId In: vMapIdeaIdGroup.values()];
    list<CollaborationGroupMember> vLstGroupMems1;
   
    for(CollaborationGroupMember vGroupMem : vLstGroupMems) 
    {
        if(vMapGroupIdGroupMems.containsKey(vGroupMem.CollaborationGroupId)) 
        {
            vLstGroupMems1 = vMapGroupIdGroupMems.get(vGroupMem.CollaborationGroupId);
        } 
        else 
        {
            vLstGroupMems1 = new list<CollaborationGroupMember>();
        }
       
        vLstGroupMems1.add(vGroupMem);
        vMapGroupIdGroupMems.put(vGroupMem.CollaborationGroupId, vLstGroupMems1);
    }
 system.debug('vMapGroupIdGroupMems='+vMapGroupIdGroupMems);                    
}            
                    


  catch (Exception e) 
  {
   // Generic exception handling code here Contact.AccountId
   system.debug('Exeption ->  ' + e );
  }*/
}
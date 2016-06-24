public class IdeaController {
public PageReference submit() {
User u = [SELECT id FROM User WHERE id = :UserInfo.getUserId()];

//FeedItem fItem = new FeedItem();
//fItem.Type = 'TextPost';
//fItem.ParentId = u.id;
//fItem.Body = this.Description;
//insert fItem;
return null;
}

public String Description { get; set; }
}
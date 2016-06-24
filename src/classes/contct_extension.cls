global class contct_extension {
    public contct_extension(ApexPages.StandardController controller) {

    }
@RemoteAction
global static  contact getContact(String id) {
 List<contact> contactl=new List<contact>();
    contactl= [SELECT Id, Phone FROM Contact WHERE Id = :id ];

    return contactl[0];
}

@RemoteAction
global static pageReference saveContact(String id, String phone) {

    Contact updatedContact = [ SELECT Id, Phone FROM Contact
                              WHERE Id = :id ];

    updatedContact.Phone= phone;
      update updatedContact;
    return null;
}

}
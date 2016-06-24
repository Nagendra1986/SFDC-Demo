global class OutboundEmails {

WebService static void SendEmailNotification(Id id) {

//create a mail object to send a single email.
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

//set the email properties
mail.setToAddresses(new string[] {'msruthi10@gmail.com'});
mail.setSenderDisplayName('SF.com Email Agent');
mail.setSubject('A new reminder');
mail.setHtmlBody('an object with ID='+ id + ' is just clicked on.');

//send the email
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail } );

}
}
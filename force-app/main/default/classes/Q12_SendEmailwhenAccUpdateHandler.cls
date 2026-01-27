public with sharing class Q12_SendEmailwhenAccUpdateHandler {
   
 public static void sendEmailwhenAcctypeUpdate(List<Account> accList,Map<Id,Account> OldMap){
set<Id>AccIds= new Set<Id>();
    if(!accList.isEmpty()){

        for(Account acc: accList){
            if(acc.Type!=OldMap.get(acc.Id).Type){
               AccIds.add(acc.Id);
            }

        }

    }

    List<Contact>conlist=[Select Id, LastName, Email from Contact Where AccountId IN:AccIds];
    list<Messaging.SingleEmailMessage> sendEmail= new list<Messaging.SingleEmailMessage>();
    for(Contact con: conlist){

        Messaging.SingleEmailMessage Email= new Messaging.SingleEmailMessage();
        Email.setTargetObjectId(con.Id);
        Email.setSubject('Account Updated Info');
        Email.setSenderDisplayName('System admin');
        String body='Hii'+con.LastName+'\n   '+'Your Account Type Change please CheckOut';
        Email.setPlainTextBody(body);
        Email.setToAddresses(new String[]{con.Email});
        sendEmail.add(Email);
    }
     Messaging.sendEmail(sendEmail);
 }
   
}
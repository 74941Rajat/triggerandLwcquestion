trigger Q12_SendEmailwhenAccUpdate on Account (after update) {

    Q12_SendEmailwhenAccUpdateHandler.sendEmailwhenAcctypeUpdate(Trigger.new, Trigger.oldMap);

}
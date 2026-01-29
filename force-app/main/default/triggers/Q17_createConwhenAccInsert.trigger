trigger Q17_createConwhenAccInsert on Account (after insert) {
    
 Q17_createConwhenAccInsertHandler.CreateContact(Trigger.new);
    

}
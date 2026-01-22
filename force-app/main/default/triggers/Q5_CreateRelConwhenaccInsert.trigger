trigger Q5_CreateRelConwhenaccInsert on Account (after insert) {

    Q5_CreateRelConwhenaccInsertHandler.createContact(trigger.new);

}
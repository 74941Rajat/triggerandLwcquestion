trigger Q1_whenAccIsUPThNRelatedConUP on Account (after update) {
     //Check out Trigger Excution 
    if(trigger.isAfter&&trigger.isUpdate){
        // Call apex Class Handler
        Q1_whenAccIsUPThNRelatedConUPHandler.updateRelatedcontact(Trigger.new,Trigger.oldMap,Trigger.newMap);
    }
}
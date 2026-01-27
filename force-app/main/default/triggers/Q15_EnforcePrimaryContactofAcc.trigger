trigger Q15_EnforcePrimaryContactofAcc on Contact (before insert, before Update) {

           if(trigger.isBefore&&trigger.isUpdate){
      
        Q15_EnforcePrimaryContactofAccHandler.enforcePrimaryContact(Trigger.new, Trigger.oldMap);
   
   }
    if(trigger.isBefore&&trigger.isInsert){
        
   Q15_EnforcePrimaryContactofAccHandler.enforcePrimaryContact(Trigger.new, null);
}

}
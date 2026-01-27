trigger Q14_UpdateTheHighAmoutNameOnacc on Opportunity (after insert, after Update, after Delete,after undelete) {

        if(trigger.isAfter&&trigger.isUpdate){
       
         Q14_UpdateTheHighAmoutNameOnaccHandler.updateOppoNameOnHighAmtonAcc(Trigger.new, Trigger.oldMap);

    
    }
     if(trigger.isAfter&&(trigger.isInsert||trigger.isUndelete)){
         Q14_UpdateTheHighAmoutNameOnaccHandler.updateOppoNameOnHighAmtonAcc(Trigger.new, null);
    
 }
  if(trigger.isAfter&&trigger.isDelete){
     Q14_UpdateTheHighAmoutNameOnaccHandler.updateOppoNameOnHighAmtonAcc(Trigger.new,null);
    
 }

}
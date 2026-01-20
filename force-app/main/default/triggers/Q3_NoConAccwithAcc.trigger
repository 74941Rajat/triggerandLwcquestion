trigger Q3_NoConAccwithAcc on Contact (after insert,after delete,after undelete) {

    if(trigger.isAfter){
        if(trigger.isInsert||trigger.isUndelete){
            Q3_NoConAccwithAcchandler.totalcontacts(trigger.new);
        }

        if(trigger.isDelete){
            Q3_NoConAccwithAcchandler.totalcontacts(trigger.old);
        }
    }

}
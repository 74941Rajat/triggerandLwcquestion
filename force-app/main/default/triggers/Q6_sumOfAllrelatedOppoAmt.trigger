trigger Q6_sumOfAllrelatedOppoAmt on Opportunity (after insert,after update,after Delete,after undelete) {

    if(trigger.isAfter){
        if(trigger.isInsert&&trigger.isUndelete){
            Q6_sumOfAllrelatedOppoAmtHandler.sumOfAmmout(Trigger.new);
        }
         
        if(trigger.isUpdate){
            Q6_sumOfAllrelatedOppoAmtHandler.sumOfAmmout(trigger.new);
        }
        if(trigger.isDelete){
           Q6_sumOfAllrelatedOppoAmtHandler.sumOfAmmout(Trigger.old); 
        }
    }

}
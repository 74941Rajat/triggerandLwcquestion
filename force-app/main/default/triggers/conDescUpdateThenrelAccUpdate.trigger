trigger conDescUpdateThenrelAccUpdate on Contact (After Update) {

    if(trigger.isAfter&&trigger.isUpdate){
        conDescUpdateThenrelAccUpdateHandler.updateAccount(Trigger.new,Trigger.oldMap);
    }

}
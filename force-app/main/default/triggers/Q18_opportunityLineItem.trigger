trigger Q18_opportunityLineItem on OpportunityLineItem(after insert,after update,after Delete,after undelete) 
{

    if(trigger.isAfter){
    if(trigger.isInsert&&trigger.isUndelete){
          Q18_opportunityLineItemHandler.getnoofproduct(Trigger.new,null);
        
    }
     
    if(trigger.isUpdate){
        Q18_opportunityLineItemHandler.getnoofproduct(Trigger.new, Trigger.oldMap);
        
    }
    if(trigger.isDelete){
       Q18_opportunityLineItemHandler.getnoofproduct(Trigger.old, null);
        

    }

}
}
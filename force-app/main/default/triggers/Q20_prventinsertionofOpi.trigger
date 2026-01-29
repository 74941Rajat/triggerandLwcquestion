trigger Q20_prventinsertionofOpi on OpportunityLineItem (before insert) {

    Q20_prventinsertionofOpiHandler.preventInsertion(Trigger.new);

}
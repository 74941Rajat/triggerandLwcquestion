trigger Q19_automaticAssectCreation on OpportunityLineItem(after insert) {

    Q19_automaticAssectCreationHandler.assetCreation(Trigger.new);

}
trigger Q7_whenaccUpdateTheoppoUpdate on Account (after Update) {

    Q7_whenaccUpdateTheoppoUpdateHandler.UpdateOpportunityData(Trigger.new);

}
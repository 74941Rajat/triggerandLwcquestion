trigger Q10_updateCaseNumberonAcc on Case (After insert) {

    Q10_updateCaseNumberonAccHandler.updateCaseNumber(Trigger.new);

}
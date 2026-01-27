trigger Q11_preventDupliacteCon on Contact (before insert,before update) {

    Q11_preventDupliacteConHandler.prevetconduplicate(Trigger.new);

}
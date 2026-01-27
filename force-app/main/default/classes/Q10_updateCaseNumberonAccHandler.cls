//Case_Number__c
public with sharing class Q10_updateCaseNumberonAccHandler {
  public static void updateCaseNumber(list<Case> caslist){

    if(!caslist.isEmpty()){
        map<Id,String>accIds=new Map<Id,String>();
           for(Case cs:caslist){
            if(cs.AccountId!=null){
               accIds.put(cs.AccountId, cs.CaseNumber);
            }

           }

           List<Account> acclist=[Select Id,Case_Number__c from Account Where Id IN:accIds.keySet()];
           for(Account acc: acclist){
              acc.Case_Number__c=accIds.get(acc.Id);
              update acc;
           }
    }

  }
}
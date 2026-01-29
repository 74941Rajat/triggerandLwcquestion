public with sharing class Q16_whencheckAcctheOppoChangeHandler {
  //Active_opportunity__c
  
  public static void changeoppostge(List<Account> acclist){

    if(!acclist.isEmpty()){
        set<Id>accIds= new set<Id>();
        for(Account acc:acclist){
            if(acc.Active_opportunity__c==true){
                 accIds.add(acc.Id);
            }

        }

        List<Opportunity> opplist=[SELECT Id, Name, StageName,Probability,AccountId from Opportunity where AccountId IN:accIds];
         list<Opportunity> updatedopp= new List<Opportunity>();
        for(Opportunity opp:opplist){
            if(accIds.contains(opp.AccountId)&&opp.Probability>70){
                opp.StageName='Closed Won';
                  updatedopp.add(opp);
            }
          
        }
        update updatedopp;

    }

  }

    
}
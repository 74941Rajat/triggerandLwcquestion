public with sharing class Q14_UpdateTheHighAmoutNameOnaccHandler {
//OppoName__c
   public static void updateOppoNameOnHighAmtonAcc(List<Opportunity> opplist,Map<Id,Opportunity> oldMap){

      if(!opplist.isEmpty()){
       Set<Id> accIds= new Set<Id>();
        for(Opportunity opp:opplist){
            if(oldMap!=null){
                if(opp.Amount!=oldMap.get(opp.Id).Amount){
                    accIds.add(opp.AccountId);
                    accIds.add(oldMap.get(opp.Id).AccountId);

                }
                else {
                    accIds.add(opp.AccountId);
                }

            }
            else {
                accIds.add(opp.AccountId);
            }

        }
        Opportunity updateOpportunity = [
    SELECT Id, Name, Amount,AccountId
    FROM Opportunity
    WHERE AccountId IN :accIds
    ORDER BY Amount DESC
    LIMIT 1
];
    Account acc=new Account();
    acc.OppoName__c=updateOpportunity.Name;
    acc.Id=updateOpportunity.AccountId;
    Update acc;

      }

   }

}
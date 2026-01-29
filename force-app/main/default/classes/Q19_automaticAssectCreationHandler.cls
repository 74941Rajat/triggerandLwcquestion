public with sharing class Q19_automaticAssectCreationHandler {
   

     public static void assetCreation(list<OpportunityLineItem> opilist){
        set<Id> oppIds= new Set<Id>();
        for(OpportunityLineItem opi:opilist){
            if(opi.OpportunityId!=null){
                  oppIds.add(opi.OpportunityId);
            }

        }

        List<Opportunity> opplist=[Select Id, Account.Name, AccountId from Opportunity where Id IN:oppIds];
        list<Asset> InserAsset= new List<Asset>();
        for(Opportunity opp: opplist){

            if(opp.AccountId!=null){
                Asset Ass = new Asset(
                    Name=opp.Account.Name+'opportunityLineItem',
                    AccountId=opp.AccountId
                );
                InserAsset.add(Ass);
            }

        }
        insert InserAsset;
     }
   

}
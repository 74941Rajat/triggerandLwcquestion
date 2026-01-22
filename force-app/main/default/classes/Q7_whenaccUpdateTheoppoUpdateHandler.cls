public with sharing class Q7_whenaccUpdateTheoppoUpdateHandler {
    public static void UpdateOpportunityData(list<Account> accList){

        if(!accList.isEmpty()){
            set<Id> accids= new set<Id>();
            for(Account acc:accList){
             accids.add(acc.Id);
            }
         list<Opportunity>opplist=[SElECT Id, Name,AccountId, 
         CloseDate,CreatedDate__c,StageName from Opportunity where AccountId IN:accids];
          list<Opportunity> oppupdate= new list<Opportunity>();
         for(Opportunity opp:opplist){
            Date day30=Date.today()-30;
            if(opp.CreatedDate__c<day30&&opp.StageName=='Closed Won'){
              opp.CloseDate=Date.today();
              opp.StageName='Closed Lost';
            oppupdate.add(opp);
            }
           
         }
         update oppupdate;
        }

    }
}
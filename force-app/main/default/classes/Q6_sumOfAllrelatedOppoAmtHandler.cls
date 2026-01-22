public with sharing class Q6_sumOfAllrelatedOppoAmtHandler {

    public static void sumOfAmmout(List<Opportunity>opplist){

         if(!opplist.isEmpty()){
            set<Id> AccIds= new set<Id>();
           for(Opportunity opp:opplist){

               AccIds.add(opp.AccountId);

           }

           list<AggregateResult> results=[Select AccountId Ids, sum(Amount) 
           totalAmount from Opportunity where AccountId IN:AccIds group by AccountId];
           map<Id,Decimal> TotalAmount= new Map<Id,decimal>();
           for(AggregateResult agr:results){
              Id accId= (Id)agr.get('Ids');
              Decimal totalAmt=(Decimal)agr.get('totalAmount');
              TotalAmount.put(accId, totalAmt);
           }
          List<Account> acclist= new List<Account>();
           for(Id ids:TotalAmount.keySet()){
                  Account acc= new Account();
                  acc.Id=ids;
                  acc.TotalAmt__c=TotalAmount.get(ids);
                  acclist.add(acc);

           }
           update acclist;
         }
    }



}
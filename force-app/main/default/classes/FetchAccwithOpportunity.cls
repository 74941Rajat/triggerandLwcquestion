public with sharing class FetchAccwithOpportunity {
    @AuraEnabled(cacheable=true)
    public static list<OutputWapper> fetchData(){
        try {

            list<Account>accList=[SELECT Id,Name ,Type,BillingCountry,(SELECT Id from Opportunities) from Account where OwnerId=: UserInfo.getUserId()];
            list<OutputWapper>OutputWapperlist= new list<OutputWapper>();
            for(Account acc:accList){
                OutputWapper out= new OutputWapper();
                out.Name=acc.Name;
                out.Type=acc.Type;
                out.Nameurl='/'+acc.Id;
                out.AccountId=acc.Id;
                out.Contry=acc.BillingCountry;
                out.TotalOpportunity=acc.Opportunities.size();
                OutputWapperlist.add(Out);
            }
            return OutputWapperlist;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

    }

    @AuraEnabled
    public static void deleteAccountaccToOppo(string accountId){
        Account acc=[Select Id, Name,(Select Id from Opportunities where isClosed=false ) from Account where id= :accountId];
           if(acc.Opportunities.size()>0){
              throw new AuraHandledException('Account cannot be delete due to open opportunities');
           }
           else {
            delete acc;
           }
    }

            public class OutputWapper{
            
                @AuraEnabled
            public string Nameurl;

            @AuraEnabled
            public string AccountId;
            
            @AuraEnabled
            public string Name;

            @AuraEnabled
            public string Type;
            
            @AuraEnabled
             public string Contry;

            @AuraEnabled
             public Decimal TotalOpportunity;
            
        }
}
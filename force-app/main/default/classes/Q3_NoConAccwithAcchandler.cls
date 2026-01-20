public with sharing class Q3_NoConAccwithAcchandler {
    public static void totalcontacts(list<Contact>conlist) {
     set<Id> accIds= new set<Id>();
      if(!conlist.isEmpty()){
        for(contact con:conlist){
          if(con.AccountId!=null){
              accIds.add(con.AccountId);
          }
        }

        list<Account>acclist=[Select Id, Name, Contact_Count__c,(select Id from contacts) from Account];

        for(Account acc: acclist){
           if(accIds.contains(acc.Id)){
                  acc.Contact_Count__c=acc.contacts.size();
           }
        }
      }     
       
    }
}
public with sharing class Q8_preventAccDeletionHandler {
   
     public static void preventdelete(List<Account>acclist){

        for(Account acc:acclist){
           if(acc.Active_account__c==true){
            acc.AddError('You Cannot delete this Account.');
           }
        }

     }
   
}
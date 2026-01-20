public with sharing class Q4_preventduplicatioHandler {
    public static void prventduplicateAccount(list<Account>acclist) {
     
       List<Account>oldacclist=[select Id, Name from Account];
         set<string> exictingaccNname= new set<string>();

         for(Account oldacc:oldacclist){
             exictingaccNname.add(oldacc.Name);
         }
       
         for(Account acc:acclist){
            if(exictingaccNname.contains(acc.Name)){
                acc.addError('Account with same name Already exicts');
            }
         }
    }
}
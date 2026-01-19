/* Whenever Account's Phone Feild is Update then all Related Contact's Phone Feild Should also get Update with parent Account's Phone */

public class Q1_whenAccIsUPThNRelatedConUPHandler {

    public static void updateRelatedcontact(list<Account>acclist,map<Id,Account>oldMap,map<Id,Account>newMap){
        set<Id>AccountIds=new set<Id>();
        if(!acclist.IsEmpty()){
            for(Account acc:acclist){
                //check phone field update or not 
                if(acc.Phone!=null && acc.Phone!=oldMap.get(acc.Id).Phone){
                    AccountIds.add(acc.Id);
                }
            }
            // write a loop to fetch related contact to Account Id
            list<Contact>conlist=[SELECT Id, Name, Phone,AccountId FROM Contact WHERE AccountId IN:AccountIds];
            list<Contact>updatecontactphone=new list<Contact>();
            if(!conlist.isEmpty()){
                for(Contact con:conlist){
                    if(AccountIds.contains(con.AccountId)){
                        con.Phone=newMap.get(con.AccountId).Phone;// assgn new Account Feild Value into the Contact Phone Feild Value 
                        updatecontactphone.add(con);
                    }
                }
                // Use DML Action To Update contact Details 
                if(!updatecontactphone.isEmpty()){
                    update updatecontactphone;
                }
            }
          
        }
    }
}
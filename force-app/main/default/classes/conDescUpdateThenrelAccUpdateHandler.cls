//whne a Contact's Description Update then its Parent Account's should also get update by it.
public with sharing class conDescUpdateThenrelAccUpdateHandler {
    public static void updateAccount(list<Contact>conlist,map<Id,Contact>oldMap) {
         
        if(!conlist.isEmpty()){
            List<Account> accList=new list<Account>();
          for(Contact con:conlist){
            //Check DeDescription is Update or not 
             if(con.Description!=null&&con.Description!=oldmap.get(con.Id).Description){
                Account acc= new Account();
                acc.Description=con.Description;
                acc.Id=Con.AccountId;// assgn accountId 
                accList.add(acc);
             }
          }
          if(!accList.isEmpty()){
           update accList;// Update Account
          }        
        }
    }
}
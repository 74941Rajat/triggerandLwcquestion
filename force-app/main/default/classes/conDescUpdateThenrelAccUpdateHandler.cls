public with sharing class conDescUpdateThenrelAccUpdateHandler {
    public static void updateAccount(list<Contact>conlist,map<Id,Contact>oldMap) {
         
        if(!conlist.isEmpty()){
            List<Account> accList=new list<Account>();
          for(Contact con:conlist){
             if(con.Description!=null&&con.Description!=oldmap.get(con.Id).Description){
                Account acc= new Account();
                acc.Description=con.Description;
                acc.Id=Con.AccountId;
                accList.add(acc);
             }
          }
          if(!accList.isEmpty()){
           update accList;
          }        
        }
    }
}
public with sharing class Q5_CreateRelConwhenaccInsertHandler {

    public static void createContact(List<Account>acclist){

        if(!acclist.isEmpty()){
            List<Contact> conlist= new list<Contact>();
             for(Account acc:acclist){

                contact con= new Contact();
                con.LastName=acc.Name;
                con.Phone=acc.Phone;
                con.AccountId=acc.Id;
                conlist.add(con);

             }
             insert conlist;
        }

    }

}
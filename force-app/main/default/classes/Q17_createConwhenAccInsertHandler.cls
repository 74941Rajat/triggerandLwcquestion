public with sharing class Q17_createConwhenAccInsertHandler {
  
  public static void CreateContact(List<Account> accList){
    List<Contact> conlist= new list<Contact>();
    set<Id> accId= new set<Id>();
    if(!accList.isEmpty()){
        for(Account acc:accList){
          contact con= new contact();
          con.AccountId= acc.Id;
          con.LastName=acc.Name + 'contact';
          con.Phone=acc.Phone;
             conlist.add(con);
             accId.add(acc.Id);

        }
        insert conlist;
    }

    list<Account>acclisttoUpdate=[Select Id, Name, Client_Contact__c from Account where Id IN:accId];
    map<Id, Account>accMap= new Map<Id,Account>();
    list<Account> listToUpdate= new list<Account>();
    for(Account acc:acclisttoUpdate){
       accMap.put(acc.Id, acc);
    }
     for(contact con : conlist){
       Account acc=accMap.get(con.AccountId);
       acc.Client_Contact__c=con.Id;
       listToUpdate.add(acc);
     }
     update listToUpdate;
  }

}
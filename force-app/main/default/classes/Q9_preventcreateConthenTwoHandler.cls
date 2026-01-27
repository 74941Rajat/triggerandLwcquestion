public with sharing class Q9_preventcreateConthenTwoHandler {
   

   public static void preventCretionMoreThenTwoCon(list<contact>conlist){

    if(!conlist.isEmpty()){
        set<Id>accIds= new set<Id>();
        for(Contact con:conlist){
          if(con.AccountId!=null){
             accIds.add(con.AccountId);
          }

        }

        List<Contact> AvaliableContact=[Select Id , AccountId from contact where AccountId IN:accIds];

        for(Contact con:conlist){
            if(AvaliableContact.size()>=2){
             con.addError('You Cannot Create More the Two Contact');
            }
        }
    }
          
   }
}
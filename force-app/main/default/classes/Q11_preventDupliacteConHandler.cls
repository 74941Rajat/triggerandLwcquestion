public with sharing class Q11_preventDupliacteConHandler {

    public static void prevetconduplicate(List<Contact> conlist){

        List<Contact> avaliableConlist=[Select Id, Phone, Email from Contact];
           set<String> Phonenumber= new set<string>();
            set<String> EmailId= new set<string>();
        for(contact con:avaliableConlist){
            if(con.Phone!=null||con.Email!=null){
               Phonenumber.add(con.Phone);
               EmailId.add(con.Email);
            }
        }
       for(Contact con1:conlist){
         if(Phonenumber.contains(con1.Phone)||EmailId.contains(con1.Email)){

            con1.addError('Phone and Email Is Alraedy exicts');

         }
       }
    }



}
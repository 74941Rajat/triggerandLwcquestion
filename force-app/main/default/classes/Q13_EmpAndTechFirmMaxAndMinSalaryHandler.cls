public with sharing class Q13_EmpAndTechFirmMaxAndMinSalaryHandler {
   

      public static void calculateSalary(list<Employee__c> emplist, map<Id,Employee__c> oldMap){

         set<Id> TechFirmIds= new set<Id>();

         if(!emplist.isEmpty()){

            for(Employee__c emp:emplist){

                if(oldMap!=null){
                  Employee__c oldEmp=oldMap.get(emp.Id);
                   if(emp.TechFirm__c!=oldEmp.TechFirm__c){
                     TechFirmIds.add(emp.TechFirm__c);
                     TechFirmIds.add(oldEmp.TechFirm__c);
                   }
                   else {
                     TechFirmIds.add(emp.TechFirm__c);
                   }

                }
                else {
                    TechFirmIds.add(emp.TechFirm__c);
                }

            }

            list<AggregateResult> agglist=[Select TechFirm__c techIds, min(Salary__c) minSalary,
             max(Salary__c) maxSalary from Employee__c Where TechFirm__c IN:TechFirmIds group by TechFirm__c ];
            list<TechFirm__c> techlist=new list<TechFirm__c>();
             for(AggregateResult agg:agglist){
              TechFirm__c tech= new TechFirm__c();
              tech.Id=(Id)agg.get('techIds');
              tech.Max_Salary__c=(Decimal)agg.get('maxSalary');
              tech.Min_Salary__c=(Decimal)agg.get('minSalary');
              techlist.add(tech);
             }
          update techlist;
         }
      




      }
   

}
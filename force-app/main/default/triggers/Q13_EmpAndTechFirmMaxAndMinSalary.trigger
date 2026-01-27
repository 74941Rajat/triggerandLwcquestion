trigger Q13_EmpAndTechFirmMaxAndMinSalary on Employee__c (after insert, after Update, after Delete,after undelete) {

    if(trigger.isAfter&&trigger.isUpdate){
        Q13_EmpAndTechFirmMaxAndMinSalaryHandler.calculateSalary(Trigger.new, Trigger.oldMap);

    
    }
     if(trigger.isAfter&&(trigger.isInsert||trigger.isUndelete)){
     Q13_EmpAndTechFirmMaxAndMinSalaryHandler.calculateSalary(Trigger.new, null);
 }
  if(trigger.isAfter&&trigger.isDelete){
     Q13_EmpAndTechFirmMaxAndMinSalaryHandler.calculateSalary(Trigger.old, null);
 }

}
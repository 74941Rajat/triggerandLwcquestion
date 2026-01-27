public with sharing class Q15_EnforcePrimaryContactofAccHandler {

    public static void enforcePrimaryContact(
        List<Contact> newList,
        Map<Id, Contact> oldMap
    ) {

        Set<Id> accIds = new Set<Id>();

        // Collect AccountIds where Primary flag is involved
        for (Contact con : newList) {
            if (con.AccountId != null && con.IsPrimary__c == true) {
                accIds.add(con.AccountId);
            }
        }

        if (accIds.isEmpty()) return;

        // Fetch existing primary contacts
        List<Contact> existingPrimaryContacts = [
            SELECT Id, AccountId
            FROM Contact
            WHERE AccountId IN :accIds
            AND IsPrimary__c = true
        ];

        // Map<AccountId, PrimaryContactCount>
        Map<Id, Integer> primaryCountMap = new Map<Id, Integer>();

        for (Contact con : existingPrimaryContacts) {
            if (!primaryCountMap.containsKey(con.AccountId)) {
                primaryCountMap.put(con.AccountId, 1);
            } else {
                primaryCountMap.put(con.AccountId, primaryCountMap.get(con.AccountId) + 1);
            }
        }

        // Validation
        for (Contact con : newList) {

            if (con.IsPrimary__c == true && con.AccountId != null) {

                Boolean wasPrimaryBefore =
                    oldMap != null &&
                    oldMap.containsKey(con.Id) &&
                    oldMap.get(con.Id).IsPrimary__c == true;

                if (!wasPrimaryBefore &&
                    primaryCountMap.containsKey(con.AccountId)) {

                    con.addError('Only one Primary Contact is allowed per Account.');
                }
            }
        }
    }
}

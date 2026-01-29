public with sharing class Q18_opportunityLineItemHandler {

    public static void getnoofproduct(
        List<OpportunityLineItem> newList,
        Map<Id, OpportunityLineItem> oldMap
    ) {

        if (newList == null || newList.isEmpty()) return;

        // 1️⃣ Collect Opportunity Ids
        Set<Id> oppIds = new Set<Id>();

        for (OpportunityLineItem oli : newList) {
            oppIds.add(oli.OpportunityId);

            if (oldMap != null && oldMap.containsKey(oli.Id)) {
                OpportunityLineItem oldOli = oldMap.get(oli.Id);
                if (oldOli.OpportunityId != oli.OpportunityId) {
                    oppIds.add(oldOli.OpportunityId);
                }
            }
        }

        if (oppIds.isEmpty()) return;

        // 2️⃣ Get related Account Ids
        Map<Id, Id> oppToAccMap = new Map<Id, Id>();
        for (Opportunity opp : [
            SELECT Id, AccountId
            FROM Opportunity
            WHERE Id IN :oppIds
        ]) {
            if (opp.AccountId != null) {
                oppToAccMap.put(opp.Id, opp.AccountId);
            }
        }

        Set<Id> accountIds = new Set<Id>(oppToAccMap.values());
        if (accountIds.isEmpty()) return;

        // 3️⃣ Aggregate count of products per Account
        Map<Id, Decimal> accToProductCount = new Map<Id, Decimal>();

        for (AggregateResult ar : [
            SELECT Opportunity.AccountId accId, COUNT(Id) prodCount
            FROM OpportunityLineItem
            WHERE Opportunity.AccountId IN :accountIds
            GROUP BY Opportunity.AccountId
        ]) {
            accToProductCount.put(
                (Id) ar.get('accId'),
                (Decimal) ar.get('prodCount')
            );
        }

        // 4️⃣ Update Accounts
        List<Account> accountsToUpdate = new List<Account>();
        for (Id accId : accountIds) {
            accountsToUpdate.add(new Account(
                Id = accId,
                no_of_Product__c = accToProductCount.get(accId)
            ));
        }

        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}

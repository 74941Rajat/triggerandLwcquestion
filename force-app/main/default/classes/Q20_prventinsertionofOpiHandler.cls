public with sharing class Q20_prventinsertionofOpiHandler {

    public static void preventInsertion(List<OpportunityLineItem> opiList) {

        if (opiList == null || opiList.isEmpty()) return;

        Set<Id> oppIds = new Set<Id>();
        Set<Id> productIds = new Set<Id>();

        // Collect Ids
        for (OpportunityLineItem opi : opiList) {
            if (opi.OpportunityId != null) {
                oppIds.add(opi.OpportunityId);
            }
            if (opi.Product2Id != null) {
                productIds.add(opi.Product2Id);
            }
        }

        // Fetch Opportunities
        Map<Id, Opportunity> oppMap = new Map<Id, Opportunity>(
            [SELECT Id, Product_family__c
             FROM Opportunity
             WHERE Id IN :oppIds]
        );

        // Fetch Products
        Map<Id, Product2> productMap = new Map<Id, Product2>(
            [SELECT Id, Family
             FROM Product2
             WHERE Id IN :productIds]
        );

        // Validation
        for (OpportunityLineItem opi : opiList) {

            Opportunity opp = oppMap.get(opi.OpportunityId);
            Product2 prod = productMap.get(opi.Product2Id);

            if (opp == null || prod == null) continue;

            // Compare Opportunity Product Family vs Product Family
            if (opp.Product_family__c != prod.Family) {
                opi.addError(
                    'Product Family does not match Opportunity Product Family.'
                );
            }
        }
    }
}

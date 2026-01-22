public with sharing class Q2_lwcOpportuntyStageController {

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> oppostageFliter(
        String stageName,
        String sortBy,
        String sortDirection
    ) {
        String query =
            'SELECT Id, Name, StageName, CloseDate, Amount FROM Opportunity';

        if (String.isNotBlank(stageName) && stageName != 'All') {
            query += ' WHERE StageName = :stageName';
        }

        if (String.isBlank(sortBy)) {
            query += ' ORDER BY Amount DESC';
        } else {
            query += ' ORDER BY ' +
                sortBy +
                ' ' +
                sortDirection;
        }

        System.debug('Dynamic Query => ' + query);
        return Database.query(query);
    }
}

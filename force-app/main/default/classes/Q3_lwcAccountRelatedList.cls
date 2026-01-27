public with sharing class Q3_lwcAccountRelatedList {

    @AuraEnabled(cacheable=true)
    public static List<Account> accountList() {
        return [
            SELECT Id, Name
            FROM Account
            ORDER BY Name
        ];
    }

    @AuraEnabled(cacheable=true)
    public static RelatedWrapper relatedList(Id accountId) {

        Account acc = [
            SELECT Id,
                   (SELECT Id, CaseNumber, Subject, Status
                    FROM Cases
                    WHERE Status != 'Closed'),
                   (SELECT Id, FirstName, LastName, Email, Phone
                    FROM Contacts)
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];

        RelatedWrapper rw = new RelatedWrapper();
        rw.cases = acc.Cases;
        rw.contacts = acc.Contacts;
        return rw;
    }

    public class RelatedWrapper {
        @AuraEnabled public List<Case> cases;
        @AuraEnabled public List<Contact> contacts;
    }
}

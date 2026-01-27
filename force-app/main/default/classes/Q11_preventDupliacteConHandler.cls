public with sharing class Q11_preventDupliacteConHandler {

    public static void preventConDuplicate(List<Contact> conList) {

        Set<String> phoneSet = new Set<String>();
        Set<String> emailSet = new Set<String>();
        Set<Id> contactIds = new Set<Id>();

        // Collect incoming values
        for (Contact con : conList) {
            if (con.Phone != null) {
                phoneSet.add(con.Phone);
            }
            if (con.Email != null) {
                emailSet.add(con.Email);
            }
            if (con.Id != null) {
                contactIds.add(con.Id);
            }
        }

        // Query only relevant existing contacts
        List<Contact> existingContacts = [
            SELECT Id, Phone, Email
            FROM Contact
            WHERE (Phone IN :phoneSet OR Email IN :emailSet)
            AND Id NOT IN :contactIds
        ];

        Set<String> existingPhones = new Set<String>();
        Set<String> existingEmails = new Set<String>();

        for (Contact con : existingContacts) {
            if (con.Phone != null) {
                existingPhones.add(con.Phone);
            }
            if (con.Email != null) {
                existingEmails.add(con.Email);
            }
        }

        // Validation check
        for (Contact con : conList) {
            if (
                (con.Phone != null && existingPhones.contains(con.Phone)) ||
                (con.Email != null && existingEmails.contains(con.Email))
            ) {
                con.addError('Contact with same Phone or Email already exists.');
            }
        }
    }
}

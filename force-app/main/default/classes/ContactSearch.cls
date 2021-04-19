public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(string lname, String postCode) {
        Contact[] res=[SELECT Name  FROM Contact WHERE LastName=:lname and MailingPostalCode=:postCode];
        return res;
    }
}

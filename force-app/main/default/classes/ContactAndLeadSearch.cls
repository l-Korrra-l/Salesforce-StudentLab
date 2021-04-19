public with sharing class ContactAndLeadSearch {

    public static List<List< SObject>> searchContactsAndLeads(String a)
    {
        List<List< SObject>> res=[FIND :a IN ALL FIELDS RETURNING Contact(Name), Lead(FirstName) ];
        return res;
    }
}

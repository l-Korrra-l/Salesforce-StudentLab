public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> lis) {
        
        
        List<Account> acc=[Select Id, (select id from Contacts) from Account Where Id IN :lis];
        for (Account a:acc)
        {
            a.Number_Of_Contacts__c=a.contacts.size();
        }
        
        update acc;
    }
}

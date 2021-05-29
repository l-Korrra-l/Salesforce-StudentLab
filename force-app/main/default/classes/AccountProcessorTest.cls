@istest
public with sharing class AccountProcessorTest {
    @istest
    private static void countContactsTest() {

        List<Account> accs=new List<Account>();
        for (integer i=0; i<300; i++)
        {
            accs.add(new Account(Name='Test Account'+i));
        }
        insert accs;
        
        List<Contact> contacts=new List<Contact>();
        List<Id> accIds=new List<Id>();
        for (Account a:accs)
        {
            contacts.add(new Contact(FirstName=a.Name, LastName='testContact', AccountId=a.Id));
            accIds.add(a.Id);
        }
        insert contacts;

        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();

        List<Account> accList=[select Id,Number_Of_Contacts__c from Account];
        for (Account a: accList)
        {
            System.assertEquals(1,a.Number_Of_Contacts__c, 'ERROR: At least 1 account record with incorrect');
        }
    }
}

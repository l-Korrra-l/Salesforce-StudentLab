@istest
public with sharing class AddPrimaryContactTest {
@istest
static void Addtest(){
    List<Account> listAcc = new List<Account>();
    for(Integer i = 0; i <250 ; i++){
        listAcc.add( new Account (Name='PrimaryContact ' + i, BillingState = 'NY'));
    }
    
    for(Integer i = 250; i <500 ; i++){
        listAcc.add( new Account (Name='PrimaryContact ' + i, BillingState = 'CA'));
    }
    
    insert listAcc;

    Contact cont=new Contact(LastName='Merhel', FirstName='Carol');
    insert cont;
    
    Test.startTest();
    Id jobId= System.enqueueJob(new AddPrimaryContact(cont, 'CA'));
    Test.stopTest();

    List<Contact> contacts=[select Id from Contact where Contact.Account.BillingState='CA'];
    System.assertEquals(200, contacts.size(),'error message');
}
}

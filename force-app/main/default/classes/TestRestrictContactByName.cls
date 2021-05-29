@istest
public with sharing class TestRestrictContactByName {
    @istest 
    private static void TestSome()
    {
        Contact cont= new Contact();
        cont.LastName='INVALIDNAME';
        insert cont;
    }
}

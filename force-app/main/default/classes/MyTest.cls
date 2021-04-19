@isTest(SeeAllData=true)
private class MyTest {
   @isTest static void MyTest() {
        Account a=new Account(Name='Hello', AccountNumber='12345678');
        Account b=new Account(Name='Hello', Phone='+1234567', AccountNumber='12345678');

        Test.startTest();
        Database.SaveResult res=Database.insert(a,false);
        Test.stopTest();

        System.assert(res.isSuccess());
        
        insert b;
        List<Account> aa=[SELECT Name FROM Account WHERE Name='Hello'];

        System.assertEquals(aa.size(), 2);
    }
}

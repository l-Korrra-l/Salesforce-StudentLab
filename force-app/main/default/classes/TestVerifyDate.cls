@isTest
public with sharing class TestVerifyDate {
   @istest public static void TestAccount() {
        Account acc=new Account();
        acc=[select id, Name, Match_Billing_Address__c, BillingPostalCode from Account limit 1];
        acc.Name='Any Name';
        acc.BillingPostalCode='12345';
        acc.ShippingPostalCode='98762';
        insert acc;
        //update acc;
    }

    @istest public static void TestDateWithin30Days(){
        Date date1=Date.newInstance(2002,3,20);
        Date date2=Date.newInstance(2002,3,20);
        VerifyDate.CheckDates(date1, date2);
        date2=Date.newInstance(2003,3,20);
        VerifyDate.CheckDates(date1, date2);
    }


}

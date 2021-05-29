@istest
public with sharing class LeadProcessorTest {
    @istest
    static void setup(){
        List<Lead> leads = new List<Lead>();
        for(Integer i = 0; i < 200; i++){
            leads.add(new Lead(Company='BSTU', LastName='Merhel'));
        }
    	insert leads;

        Test.startTest();
        LeadProcessor leadProcessor = new LeadProcessor();
        Id BatchId = database.executeBatch(leadProcessor,200);
        Test.stopTest();

        List<Lead> li=[select id from Lead where LeadSource='Dreamforce'];
       System.assertEquals(0, li.size(),'Error message');

    }
}

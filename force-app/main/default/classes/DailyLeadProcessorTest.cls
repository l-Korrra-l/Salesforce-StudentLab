@istest
public with sharing class DailyLeadProcessorTest {
    static String CRON_EXP = '0 16 12 26 4 ? 2021';
    @istest
    static void DailyLeadProcessorTest() {
        List<Lead> li=new List<Lead>();
        for(Integer i=0; i<200;i++)
        {
            li.add(new Lead(LastName='Test'+i, Company='Test'));
        }

        insert li;

        Test.startTest();
        Id jobId=System.schedule('jobName', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();

        List<Lead> lis=[select id from lead where LeadSource='Dreamforce'];
        System.assertEquals(200, lis.size(),'error message');

        List<crontrigger> cts=[select id, timestriggered, nextfiretime from crontrigger where id=:jobId];
        system.debug('next fire time'+cts[0].nextfiretime);
    }
}

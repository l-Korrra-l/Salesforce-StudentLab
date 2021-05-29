public class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful{

    public integer count=0;

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, LeadSource from Lead'
        );
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        for (Lead a:scope)
        {
            a.LeadSource='Dreamforce';
        }
        count=count+scope.size();
    }
    public void finish(Database.BatchableContext bc){
        System.debug(count+'records processed');
    }
}

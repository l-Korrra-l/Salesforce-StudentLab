trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasks = new List<Task>();
    if((Trigger.isAfter && Trigger.isInsert)||(Trigger.isAfter && Trigger.isUpdate))
    {
        for (Opportunity a : Trigger.new)
        {
            if(a.StageName=='Closed Won')
            {
                tasks.add(new Task(Subject = 'Follow Up Test Task', WhatId = a.Id));
                
            }
        }
    }
    insert tasks;

}
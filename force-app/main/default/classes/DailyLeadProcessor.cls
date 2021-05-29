public class DailyLeadProcessor implements Schedulable {

    public void execute(SchedulableContext context)
    {
            List<Lead> li=[select id, LeadSource from lead where LeadSource=null limit 200];
            for(Lead l:li)
            l.LeadSource='Dreamforce';

            update li;
    }
}

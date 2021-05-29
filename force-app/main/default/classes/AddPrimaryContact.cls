public with sharing class AddPrimaryContact implements Queueable {
    contact cont;
    string state;
    public AddPrimaryContact(Contact c, string st) {
        this.cont=c;
        this.state=st;
    }

    public void execute(QueueableContext context)
    {
        List<Account> listAcc= [Select Id, BillingState, (Select Id From Contacts) From Account Where BillingState = :state limit 200];
        for(Account a: listAcc){
            Contact con=cont.clone();
            con.AccountId=a.Id;
            a.Contacts.add(con);
        }
        
        update listAcc;
    }
}

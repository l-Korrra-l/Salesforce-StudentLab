public with sharing class AccountHandler {
    public static Account insertNewAccount(String str){
        Account a=new Account(Name=str, AccountNumber='12345678');
        try{
        Database.SaveResult r=Database.insert(a, false);
        }
        catch(DmlException e)
        {
            return null;
        }
        return a;
    }
}

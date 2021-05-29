public with sharing class NewController {
    
public List<Contact> getContacts()
{
    List<Contact> li=[select id, lastname, firstname from Contact limit 20];
    return li;
}

public List<Contact> SortByName()
{
    List<Contact> li=[select id, lastname, firstname from Contact Order by firstname limit 20];
    return li;
}

}

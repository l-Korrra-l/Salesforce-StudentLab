
public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(integer contN, string lastN)
    {
        List<Contact> conts=new List<Contact>();

        for (Integer i=0; i<contN; i++)
        {
            Conts.add(new Contact(LastName=lastN, FirstName=string.valueOf(i)));
        }

        return conts;
    }
}

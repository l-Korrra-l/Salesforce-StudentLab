public class StringArrayTest 
{

    public static List<String> generateStringArray(Integer a)
    {
        List<String> l=new List<String>();
        for(Integer i=0; i<a;i++)
        l.add('Test '+i);
        return l;
    }
}

public class AccountTriiggerHandler 
{
    public static void DemoMethod(List<Account> newList)
    {
        for(Account acc : newList)
        {
            acc.Description = 'Test Description (calling apex method in trigger)';
		} 
    }
}
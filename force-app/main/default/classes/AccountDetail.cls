public class AccountDetail 
{
    public static List<Account> customerAccounts(Integer limitSize)
    {
        String detail = 'SELECT Id, Name, Phone, Owner.Name, Type FROM Account WHERE Type LIKE \'Customer%\'ORDER BY Name DESC LIMIT:limitSize';
        return database.query(detail);
    }
    
}




/* TEST


List<Account> accdetail = AccountDetail.customerAccounts(6);

for(Account acc:accdetail)
{
	System.debug('Account Name: '+acc.Name+' | Phone: '+acc.Phone+' | Owner Name: '+acc.Owner.Name+' | Type: '+acc.Type);
    
    }


*/
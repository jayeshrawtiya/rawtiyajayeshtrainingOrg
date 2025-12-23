public class E_SOSL_statement 
{
    public void SOSLQuery()
    {
        List<List<sObject>> searchList = [FIND 'Jayesh' IN ALL FIELDS RETURNING Account(Name), Contact(FirstName, LastName, Email)];
        
        List<Account> accList = new List<Account>();
        List<contact> conList = new List<Contact>();

        accList = (List<Account>)searchList[0];
        conList = (List<contact>)searchList[1];

        for(Account acc:accList)
        {
            System.debug('Name => '+acc.Name);
        }

        for(contact con:conlist)
        {
            System.debug('Contact => '+con.LastName);
        }
    }

}
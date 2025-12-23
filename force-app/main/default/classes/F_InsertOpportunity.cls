public class F_InsertOpportunity 
{
    public void insertOppo()
    {
        //Scenario : creating Opportunity on existing Account records
        List<Account> accList = new List<Account>([SELECT Id, Name FROM Account WHERE CreatedDate=THIS_YEAR]);
        List<Opportunity> OppoToBeCreated = new List<Opportunity>();

        If(accList.size()>0)
        {
            For(Account acc:accList)
            {
                Opportunity oppo = new Opportunity();
                Oppo.Name = acc.Name;
                Oppo.StageName = 'Closed Won';
                Oppo.CloseDate=System.today();
                Oppo.AccountId = acc.Id;
                OppoToBeCreated.add(Oppo);
                
			}
            insert OppoToBeCreated;
        }
    }
}
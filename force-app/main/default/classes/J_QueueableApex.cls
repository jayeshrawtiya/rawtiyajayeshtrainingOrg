public class J_QueueableApex implements Queueable 
{
    private List<Account> accList;
    Private Id ParentAccId;
    
    public J_QueueableApex(List<Account> Alist, Id id)
    {
        this.accList = Alist;
        this.ParentAccId = id;
    }
    
    public void execute(QueueableContext context)
    {
        for(account acc :accList)
        {
            acc.ParentId = ParentAccId;
        }
        update accList;
    }
}


/*
List<Account> accList =[SELECT Id FROM Account WHERE BillingState='CA'];

Id ParentAccId=([SELECT Id FROM Account WHERE name='aaaab'][0].Id);
    
J_QueueableApex updatejob = new J_QueueableApex(accList, ParentAccId);
Id jobId = system.enqueueJob(updatejob);


 */
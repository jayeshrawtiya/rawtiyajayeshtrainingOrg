//Next assignment - Write a queueable apex which will add a specific account provided 
//In the class constructor to all the contacts with Lead Source  as "External Referral".

public class Assignment10_QueueableApex implements Queueable
{
    private Id Accid;
    Private List<contact> conList;
    
	public Assignment10_QueueableApex(List<Contact> conRecords, Id id)
    {
        this.conList=conRecords;
        this.Accid = id;
    }
    public void execute(QueueableContext context)
    {
        For(contact con:conList)
        {
            con.AccountId = Accid;
        }
        update conList;
    }
    
}

/*

List<contact> conRecord = [select Id FROM contact WHERE LeadSource='External Referral'];
Id AccId = ([SELECT Id FROM Account WHERE Name = 'aaaab'][0].Id);

Assignment10_QueueableApex updateJob = new Assignment10_QueueableApex(conRecord, AccId);
Id jobId = system.enqueueJob(updatejob);

*/
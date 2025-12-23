@isTest
public class TestAssignmnet10_QueueableApex 
{
    @testSetup
	static void setup()
    {
        list<contact> ConList= new List<Contact>();
        for(Integer i=0; i<100; i++)
        {
            contact con = new contact();
            con.LastName='Testing'+i;
            con.LeadSource='External Referral';
            conList.add(con);
        }
        Account acc = new account(name='testAssign10');
        insert conList;
        insert acc; 
    }
    
    @isTest
    private static void testQueueable()
    {
        Id accId = [SELECT Id, name FROM Account WHERE Name='testAssign10'][0].id;
        
        List<Contact> conlist = [SELECT Id, Name FROM Contact WHERE name Like 'Testing%'];
        
        Assignment10_QueueableApex updatejob = new Assignment10_QueueableApex(conlist, accId);
        
        test.startTest();
        System.enqueueJob(updateJob);
        test.StopTest();
        
        System.assertEquals(100, [select count() From contact where AccountId=:accId]);
        
	}
    
    
    
}
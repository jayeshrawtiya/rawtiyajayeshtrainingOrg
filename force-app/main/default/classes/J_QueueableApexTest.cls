@isTest
public class J_QueueableApexTest 
{
    @testSetup
    static void setups()
    {
        List<Account> accList = new List<Account>();
        accList.add(new Account(name='Parent'));
        For(integer i=0; i<=100; i++)
        {
            accList.add(new Account(name='Test Account'+i));
        }
        insert accList;
	}

    
    @isTest
    private static void testQueueable()
    {
        Id ParentId = [SELECT id FROM Account WHERE Name='parent'][0].Id;
        List<Account> accList = [SELECT Id, Name FROM Account WHERE name LIKE 'Test Account%'];
        J_QueueableApex updateJob = new J_QueueableApex(AccList, ParentId);
        
        Test.StartTest();
        System.enqueueJob(updateJob);
        Test.stopTest();
        
        System.assertEquals(100, [SELECT count() FROM Account WHERE parentId=:ParentId]);
    }
}
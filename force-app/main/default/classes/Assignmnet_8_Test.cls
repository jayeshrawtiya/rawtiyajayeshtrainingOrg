@isTest
public class Assignmnet_8_Test 
{    
    @isTest
    static void testInsertTrigger() 
    {
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        
 
        List<Contact> contacts = [SELECT Id FROM Contact WHERE AccountId = :testAccount.Id];
        System.assertEquals(5, contacts.size(), 'Expected 5 contacts to be created');
    }
    
    @isTest
    static void testUpdateTrigger() 
    {
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 1; i <= 5; i++) {
            contacts.add(new Contact(FirstName = testAccount.Name, LastName=' '+i, AccountId = testAccount.Id));
        }
        insert contacts;

        
        testAccount.Name = 'Updated Test Account';
        update testAccount;
        
        contacts = [SELECT FirstName FROM Contact WHERE AccountId = :testAccount.Id];
        for (Contact con : contacts) {
            System.assertEquals(testAccount.Name, con.FirstName, 'Contact FirstName MIismatched with Account');
        }
    }  
}
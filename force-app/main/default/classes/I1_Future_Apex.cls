/*
Future Apex runs process in a seperate thread, at a later time when system resources become available.
Use @Future annotation to create future method.
In Synchronous processing, all methods calls are made from the same thread and no additional processing can occur until the process is complete.
Whereas in future method, methods runs asynchronously in its own thread.
This unblocks users from performing other operations.
Provides higher governor & execution limits for processing.

WHEN TO USE FUTURE METHOD
Callouts to external web services.(we cannot callout externel web services through trigger so we will call future method from trigger then it will call)
process that needs to executed in a seperate or their own thread.
prevent the mixed DML error.


Syntax
public class I1_Future_Apex 
{
    @Future
    public static void futureMethod(List<Id> recordIds)
    {
        List<Account> accounts = [SELECT Id FROM Account WHERE Id IN:recordIds];
        //some operations
    }
}

*/

public class I1_Future_Apex 
{
    @Future
    public static void countContacts(List<Id> accIds)
    {
        List<Account> accList = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN: accIds];

        For(Account acc:accList)
        {
            acc.Number_of_contacts__c = acc.contacts.size();
        }
        If(!accList.isEmpty())
			update accList;
    }      
}
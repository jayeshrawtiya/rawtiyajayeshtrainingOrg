trigger oldestDOB on Contact (after insert, after update) 
{
    set<Id> accountIds = new set<Id>();
    for(contact con : Trigger.new)
    {
        if(trigger.isinsert)
        {
            accountIds.add(con.accountId);
        }
        if(trigger.isupdate)
        {
            if(con.Birthdate != trigger.oldMap.get(con.Id).Birthdate)
            {
                AccountIds.add(con.AccountId);
            }
        }
    }
    List<Account> accIds = new list<Account>();
    accIds=[select id, (select id, Birthdate from contacts) FROM Account WHERE Id IN :accountIds];
    
    //List<contact> conList = new List<contact>();
    for(Account acc : accIds)
    {
        //conlist = [SELECT Id, Birthdate from contact WHERE AccountId =: acc.Id];
        date temp = system.today();
        for(contact con:acc.contacts)
        {
            if(temp>con.Birthdate)
            {
                temp=con.Birthdate;
            }   
        }
        acc.oldest_contcat__c = temp;      
    }
    
    update accIds;

}
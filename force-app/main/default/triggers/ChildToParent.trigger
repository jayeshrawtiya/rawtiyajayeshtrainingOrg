// If we update any field on child same should be populated to any field in parent.
// keep in mind that all records have parent or not.
// one parent can have more than one child then which value is going to updated.

trigger ChildToParent on Contact (after update) 
{

    List<contact> conList = new List<contact>();     //List Of Updated contacts
    Set<Id> AccIds = new set<Id>();                  //Ids of Account need to updated
    For(Contact con : Trigger.new)
    {
        If(con.Department != Trigger.oldMap.get(con.Id).Department)
        {
            conList.add(Con);
            AccIds.add(con.AccountId);
        }
    }
    
    List<Account> accList  = [SELECT Id, Description FROM Account WHERE Id IN : AccIds];  //List of account need to be updated
    
    for(contact con : conList)
    {
        for(Account acc : accList)
        {
            If(con.AccountId == acc.Id)
            {
                acc.Description = con.Department;
            }
        }
    }
    
    update accList;
    
}



/*
trigger ContactTOAccount on Contact (After insert,After Delete) 
{
    if(trigger.isAfter && trigger.isInsert)
    {
        Set<Id> sid = new Set<Id>();
        for(Contact c : trigger.new)
        {
            sid.add(c.accountid);
        }
        Map<Id,Account> mapacc = New Map<ID,Account>([select id,NoOfContact__c,(Select id from Contacts) from Account where id In :sid]);
        for(Account a : mapacc.Values())
        {
            a.NoOfContact__c = mapacc.get(a.id).contacts.size();
        }
        update mapacc.Values();
    }
    if(trigger.isAfter && trigger.isDelete)
    {
        set<id> sid = new Set<id>();
        for(Contact c : trigger.old)
        {
            system.debug('size of tirgger.old'+trigger.old.size());
            sid.add(c.AccountId);
            system.debug('iii'+c.ID);
        }
        system.debug('size of sid:'+sid.size());
        MAp<ID,account> mapacc = new Map<id,account>([select id,NoOfContact__c,Name,(select id from Contacts) from Account where id In :sid]);
        for(Account a : mapacc.values())
        {
            system.debug('Name of account:'+a.Name);
            system.debug('eeee'+a.NoOfContact__c);
            a.NoOfContact__c = mapacc.get(a.id).contacts.size();
            system.debug('uuuuu'+mapacc.get(a.id).contacts.size());
            system.debug('wwi'+a.NoOfContact__c);
        }
        update mapacc.values();
    }
}
*/
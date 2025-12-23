//write a trigger user can not delete contact which is related to account when related contacts are less than 3
//and populate error message

trigger errorOnDeleteRelatedContacts on Contact (before delete) 
{
    list<Account> accList = new list<Account>();
    set<Id> accIds= new set<Id>();
    set<Id>conIds = new set <id>();
    For(contact con :Trigger.old)
    {
        if(con.AccountId != NULL)
        {
            AccIds.add(con.AccountId);
            conIds.add(con.Id);
        }
    }
    
    Acclist = [SELECT Id, Name, (SELECT Id FROM contacts) FROM Account];
    for(Account acc: acclist)
    {
        if(acc.contacts.size()<3 && acc.contacts.size()>0)
        {
            for(contact con : acc.contacts)
            {
                if(conIds.contains(con.Id))
                {
                    //can't delete and give error.
                    con.addError('Cannot delete');
                }
            }
        }
    }
}
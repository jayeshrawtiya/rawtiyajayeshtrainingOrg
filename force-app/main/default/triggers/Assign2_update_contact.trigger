//Write a logic to update Contact Name of all related Contacts 
//on Update of Account Name’s update

trigger Assign2_update_contact on Account (before update) 
{
    for(Account acc : trigger.new)
    {
        Account Oacc = trigger.OldMap.get(acc.Id);
        if(acc.Name != Oacc.Name)
        {
            List<contact> conlist = [SELECT  FirstName, LastName, Id from contact where AccountId =: acc.Id];
            for(contact con : conlist)
                con.LastName = acc.Name;
            update conlist;
        }       
    }
}
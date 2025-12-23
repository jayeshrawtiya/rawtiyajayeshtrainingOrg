//Write a trigger on the Account object that updates all related Contacts' "Department" field to "Sales" 
//if the Account's "Industry" field is updated to "Retail".


trigger updateRelatedContactDept on Account (after update) 
{
    set<Id> accIds = new set<Id>();
    for(Account acc:Trigger.new)
    {
        if(acc.Industry != trigger.oldmap.get(acc.Id).Industry && acc.Industry=='Retail')
        {
            accIds.add(acc.Id);
            System.debug(acc.Name + acc.Industry);
        }
    }
    
    list<contact> conlist = [SELECT Id, Name, department FROM contact WHERE Account.Id IN:accIds];
    for(contact con:conlist)
    {
        System.debug(con.Name);
        con.Department='Sales';
    }
    update conlist;
}
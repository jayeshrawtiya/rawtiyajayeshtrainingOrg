trigger updateRelatedContact on Account (after update) 
{
    Set<Id> accountIds = new set<Id>();
    If(trigger.isupdate)
    {
        for(Account acc:Trigger.new)
        {
            If(acc.Type =='Customer - Direct' && acc.Type != Trigger.oldmap.get(acc.Id).Type)
                accountIds.add(acc.Id);
        }
        List<contact> conlist = new list<contact>();
        conlist.addall([SELECT Id, DoNotCall FROM contact WHERE AccountId IN :accountIds]);
        For(contact con : conlist)
        {
            con.DoNotCall=true;
        }
        update conlist;
        
    }

}
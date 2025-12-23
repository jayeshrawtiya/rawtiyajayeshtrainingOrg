//whenever we update or insert billingCity on Account same should be populated on related contacts mailingCity

trigger chnageMilingCity on Account (after update) 
{
    set<id> sid = new set<id>();
    list<account> accountx = new List<account>();
    for(Account a: trigger.new)
    {
        if(a.BillingCity != trigger.oldmap.get(a.id).BillingCity)
        {
            sid.add(a.id);
            accountx.add(a);
        }
    }
    Map<id,account> accMap = new Map<id,Account>([select id,BillingCity,(select id,MailingAddress from contacts) from Account where id in:sid]);
    List<contact> conlist = new List<Contact>();
	for(Account accx: Trigger.new)
    {
        for(Contact conx: conList)
        {
            if(conx.AccountId == accx.Id)
            {
                conx.mailingCity=accx.BillingCity;
            }
        }

    }
    update conlist;
}
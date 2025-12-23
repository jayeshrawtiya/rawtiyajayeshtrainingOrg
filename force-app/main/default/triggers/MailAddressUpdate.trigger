//Whenever Billing city of account is changed then it should be copied to all of it's contact's mailing city.

trigger MailAddressUpdate on Account (after update) 
{
    list<account> acclist = new list<account>();
    set<Id> accIds = new set<Id>();
    for(Account acc: Trigger.New)
    {
        if(acc.Billingcity != Trigger.oldmap.get(acc.Id).BillingCity)
        {
            accIds.add(acc.Id);
        }
    }
    
    acclist=[SELECT Id,Name, BillingCity, (SELECT Id, Name, MailingCity FROM contacts) FRom Account WHERE Id IN:accIds];
	list<contact> conlist = new list<contact>();
    for(Account acc : acclist)
    {
        for(contact con : acc.contacts)
        {
            con.MailingCity=acc.BillingCity;
            conlist.add(con);
        }
    }	
    update conlist;
}




/*
trigger MailAddressUpdate on Account (after insert,after update) 
{
    Set<Id> updatedAccount = new Set<Id>();
    list<Contact> conList = new List<Contact>();
    Set<id> sid = new Set<id>();
    
    if(Trigger.isInsert ||Trigger.isUpdate)
    {
        for(Account acc:Trigger.new)
        {
            If(acc.Billingcity !=trigger.oldmap.get(acc.id).Billingcity)
            {
                updatedAccount.add(Acc.Id);
            }
        }
        
        if(!updatedAccount.isEmpty())
        {
            conList.add([SELECT Id FROM Contact WHERE AccountId IN:updatedAccount]);       
        }
        for(Contact c : conList)
        {
            sid.add(c.Accountid);
        }
        
        List<Account> axx=[SELECT Id FROM Account WHERE id In : sid];
        
        for(contact con:conList)
        {
            //Account Acc = [SELECT Id FROM Account WHERE id =:con.AccountId];
            for(Account a:axx)
            {
                if(con.Accountid == a.id)
                {
                    con.MailingCity = a.BillingCity;
                }
            }            
        }   
    }
    update conList;
}
*/
//Write a trigger to throw the validation error if someone tries to deleted the Opporunity record which is in  "Closed Won" status.

trigger DeleteOpportunity_error on Opportunity (before delete) 
{
    for(Opportunity opp: Trigger.old)
    {
        If(Opp.stageName == 'closed Won')
        {
            Opp.adderror('Cannot delete this closed Won Opportunity');
        }
    }
    

}


/*
trigger MailAddressUpdate on Account (after insert, after update) 
{
    Set<Id> updatedAccount = new Set<Id>(); 
    Set<Id> contactIds = new set<Id>();
    list<Contact> conList = new List<Contact>();
   
    if(Trigger.isInsert ||Trigger.isUpdate)
    {
        for(Account acc:Trigger.new)
        {
            If(acc.Billingcity !=trigger.oldmap.get(acc.id).Billingcity)
            {
                updatedAccount.add(Acc.Id); //All Account Ids in set whose related contcat needs to be updated
            }
        }
        
        if(!updatedAccount.isEmpty())
        {
            conList.add([SELECT Id ,AccountId FROM Contact WHERE AccountId IN:updatedAccount]);       
        }
        
        for(contact con:conList)
        {
            contactIds.add(con.AccountId);
        } 
        if(!contactIds.isEmpty())
        {
            List<Account> accList = [SELECT Id ,BillingCity FROM Account WHERE id IN : contactIds];
        }
        for(contact c:conList)
        {
            for(Account acc:AccList)
            {
                if(c.Accountid == Acc.id)
                {
                    c.MailingCity=Acc.BillingCity;
                }
            }
            
        }
    }
    update conList;
}*/
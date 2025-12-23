//We will Update field of Parent, and updated value will be copied to one of thefield of child
/*
trigger ParentToChild on Account (after update) 
{
    set<Id> accIds = new set<Id>();
    for(Account acc: Trigger.new)
    {
        If(acc.BillingCity != Trigger.oldmap.get(acc.Id).BillingCity)
        {
            accIds.add(acc.Id);   //Ids of updated Account
        }
    }
    List<Contact> conList = [SELECT Id, MailingCity, Account.BillingCity FROM Contact WHERE AccountId IN :accIds];   //related contacts
    for(contact con : conList)
    {
        con.MailingCity = con.Account.BillingCity;
    }
    
    update conList;
}*/

trigger ParentToChild on Account (after update) 
{
    Map<Id, string> mapAcc = new Map<Id, string>();
   
    for(Account acc:Trigger.new)
    {
        If(trigger.isUpdate && acc.BillingCity != trigger.oldMap.get(acc.Id).BillingCity)
        {
            mapAcc.put(acc.Id, acc.BillingCity);
        }
    }
    
    List<contact> conList = [SELECT Id, MailingCity, AccountId FROM Contact WHERE AccountId IN:mapAcc.keyset()];
    
    for(contact con:conList)
    {
        con.MailingCity = mapAcc.get(con.AccountId);
    }
    update conList;
}
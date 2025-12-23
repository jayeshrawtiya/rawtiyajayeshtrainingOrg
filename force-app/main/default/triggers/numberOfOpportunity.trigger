trigger numberOfOpportunity on Opportunity (after Insert, after Delete)
{
    set<Id> OppIds = new set<Id>();
    set<Id> AccIds = new set<Id>();
    If (trigger.isInsert)
    {
        For(opportunity oppo :Trigger.new)
        {
            OppIds.add(Oppo.Id);
            AccIds.add(Oppo.AccountId);
        } 
    }
    If(trigger.isDelete)
    {
		For(Opportunity Oppo:Trigger.old)
        {
            OppIds.add(Oppo.Id);
            AccIds.add(Oppo.AccountId);
        }
    }
    
    Map<Id, Account> mapAcc = new Map<id, account>([SELECT Id, numberOfOppo__c FROM account WHERE Id IN:AccIds]);
    
}
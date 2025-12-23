// Validation on Opportunity Stage Change : Write a trigger that prevents an Opportunity from moving to the "Closed Won" stage
// if certain criteria are not met. For instance, ensure that account type is Customer%

trigger oppo_validation on Opportunity (before update) 
{
    set<Id> accIds = new set<Id>();
    List<account> accList = new List<Account>();
    for(Opportunity opp : Trigger.new)
    {
        if (opp.StageName=='closed Won' && opp.StageName != Trigger.OldMap.get(opp.Id).StageName)
        {
            accIds.add(Opp.AccountId);  
        }
        accList = [SELECT Id, Type FROM account WHERE Id IN :AccIds AND Type LIKE 'Customer%'];
        
    }       
}
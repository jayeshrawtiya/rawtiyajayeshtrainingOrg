trigger NumberOfOpenCases on Case (before insert, before update) 
{
    Set<Id> AccountIds = new set<Id>();
    for (case casenew : Trigger.new)
    {
        accountIds.add(casenew.AccountId);
    }
    
    
}
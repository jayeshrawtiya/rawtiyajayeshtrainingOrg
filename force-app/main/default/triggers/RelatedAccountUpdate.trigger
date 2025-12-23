//Write a trigger when StageName feild updated to closed won of opportunity then  related account description feild updated by status value of opportunity

trigger RelatedAccountUpdate on Opportunity (after update) 
{
    set<Id> accIds = new set<Id>();
    for(Opportunity oppo : Trigger.new)
    {
        if(oppo.StageName == 'Closed Won')
        {
            accIds.add(oppo.AccountId);
        }
    }
    List<Account> accList = new List<Account>();
    accList= [SELECT Id, Name, Description, (SELECT Id, StageName FROM Opportunities) FROM Account WHERE Id IN:accIds];
    for(Account acc:accList)
    {
        for(opportunity oppo: acc.opportunities)
        {
            acc.Description=oppo.StageName;
        }
    }
    update accList;
}


//Write a trigger when StageName feild updated to closed won of opportunity then  related account description feild updated by status value of opportunity
/*
trigger RelatedAccountUpdate on Opportunity (after update) 
{
    list<opportunity> OppoList = new List<opportunity>();
    set<Id> accIds = new set<Id>();
    System.debug('insideZZZZZ');
    For (Opportunity Oppo : Trigger.new)
    {
        System.debug('insideYYY');
        If(Trigger.isUpdate)
        {
            System.debug('inside');
            OppoList.add(Oppo);
            accIds.add(Oppo.AccountId);
        }
    }
    
    List<Account> accList = [SELECT Id, description FROM Account WHERE Id IN:accIds];
    
    for(Account acc : accList)
    {
        for (opportunity Oppo : OppoList)
        {
            If(acc.Id == Oppo.AccountId)
            {
                acc.description = Oppo.StageName;
            }
        }
    }
    update AccList;
    
}
*/
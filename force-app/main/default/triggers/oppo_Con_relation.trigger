//Whenever any opportunity's closeddate is updated, find the oldest closedate, and populate the same to all the contcats of related account.
trigger oppo_Con_relation on Opportunity (After update) 
{
    set<Id> AccIds = new Set<Id> ();
    For(Opportunity Oppo : Trigger.new)
    {
        If(Oppo.CloseDate != trigger.oldMap.get(Oppo.Id).Closedate)
        {
            AccIds.add(Oppo.AccountId);
        }
    }
    
    List<Opportunity> OppoList = [SELECT Id, Name, closeDate, AccountId FROM Opportunity WHERE AccountId IN:AccIds];
    List<Contact> Conlist = [SELECT Id, Name, BirthDate, AccountId FROM contact WHERE AccountId IN:AccIds];
    
    Date DemoDate = Date.newinstance(2025,3,1);
    
    for(Contact con:Conlist)
    {
        for(Opportunity Oppo:OppoList)
        {
            If(Con.AccountId == Oppo.AccountId)
            {
                If(demoDate>Oppo.CloseDate)
                {
                    demoDate=Oppo.CloseDate;
                }
            }
        }
        con.Birthdate=demoDate;
    }
    update conList;
        
    
}
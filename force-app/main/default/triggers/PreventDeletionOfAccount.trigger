//you need to prevent the deletion of an Account if there are related Opportunity records




trigger PreventDeletionOfAccount on Account (before delete) 
{
    Set<Id> AccIds = Trigger.oldMap.keyset();
    List<opportunity> OppList = [SELECT Id, AccountId FROM Opportunity WHERE AccountId IN :AccIds];
    set<id> accIdstoprevent = new set<Id>();
            System.debug('JR Opportunity : '+oppList);
            if(!oppList.isEmpty())
            {
                for(opportunity oppx: oppList)
                {
                    accIdstoprevent.add(oppx.accountId);
                }
            }
    for(Account acc: trigger.old)
    {
        If (accIdstoprevent.contains(acc.Id))
            {
                acc.addError('Cannot delete account with related Opportunity');
            }
    }
}
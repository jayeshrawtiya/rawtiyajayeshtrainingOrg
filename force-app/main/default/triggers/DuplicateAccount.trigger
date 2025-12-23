trigger DuplicateAccount on Account (before insert, before update) 
{
    For(Account acc: Trigger.new)
    {
        List<Account> AccList = [SELECT Id FROM Account WHERE Name=:acc.Name];
        if(!accList.isEmpty())
            {
                acc.name.addError('Can not create duplicate Account');
                //acc.addError('cannot create duplicate account');  here it will not specify on which field its error
            }
    }

}
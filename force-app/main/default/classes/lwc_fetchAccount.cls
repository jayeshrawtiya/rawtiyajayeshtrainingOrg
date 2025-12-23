public class lwc_fetchAccount 
{
    @AuraEnabled
    public static List<Account> getAccounts()
    {
        List<Account> AccList = [SELECT Id, Name FROM Account];
        return AccList;
    }   
}
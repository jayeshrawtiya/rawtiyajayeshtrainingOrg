public class lwc_foreachdemo 
{
    @AuraEnabled(cacheable=true)
    public static list<contact> getcontacts()
    {
        List<contact> conList = [SELECT Id, Name FROM contact];
        return conList;
    }

}
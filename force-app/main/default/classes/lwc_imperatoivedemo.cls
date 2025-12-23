public class lwc_imperatoivedemo 
{
    @AuraEnabled
    public static List<contact> getcontacts()
    {
        List<contact> conList = [SELECT Id, Name From Contact];
        return conList;
    }
 
}
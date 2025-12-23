public class lwc_wiredemoclass 
{
    @AuraEnabled(cacheable=true)
    public static List<contact> getData()
    {
        List<contact> conList= [SELECT Name, Phone FROM Contact];
        return conList;
        
    }
}
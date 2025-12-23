public class HandlerDemoTriggerHandler 
{
    public static void beforeInsert(list<account> AccountListx)
    {
        System.debug('beforeInsert Called');
    }
    
    public static void beforeUpdate(list<account> accountListx)
    {
        System.debug('beforeUpdate Called');
    }
    
    public static void beforeDelete(list<account> accountListX)
    {
        System.debug('beforedelete Called');
    }
    
    public static void beforeUndelete(list<account> accountListX)
    {
        System.debug('beforeUndelete Called');
    }
//////////////////////////////////////////////////////////////////////////////////////
	public static void afterInsert(list<account> accountListx)
    {
        System.debug('afterInsert Called');
    }
    
    public static void afterUpdate(list<account> accountListx)
    {
        System.debug('afterUpdate Called');
    }
    
    public static void afterDelete(list<account> accountListx)
    {
        System.debug('afterDelete Called');
    }
    
    public static void afterUndelete(list<account> accountListx)
    {
        System.debug('afterUndelete Called');
    }
}
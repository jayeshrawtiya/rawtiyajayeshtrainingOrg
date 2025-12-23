trigger HandlerDemo on Account (before insert) 
{
    For(Account Acc: Trigger.new)
    {
        //Before Triggers 
        if(Trigger.isBefore && Trigger.isInsert)
        {
            HandlerDemoTriggerHandler.beforeinsert(Trigger.new);
        }
        
        if(Trigger.isBefore && Trigger.isUpdate)
        {
            HandlerDemoTriggerHandler.beforeUpdate(Trigger.new);
        }
        
        if(trigger.isBefore && Trigger.isDelete)
        {
            HandlerDemoTriggerHandler.beforeDelete(Trigger.old);
        }
        
        //After Trigger
        if(trigger.isAfter && Trigger.isInsert)
        {
            HandlerDemoTriggerHandler.afterInsert(Trigger.new);
        }
        
        if(trigger.isAfter && trigger.isUpdate)
        {
            HandlerDemoTriggerHandler.afterUpdate(Trigger.new);
        }
        
        if(trigger.isAfter && trigger.isDelete)
        {
            HandlerDemoTriggerHandler.afterDelete(Trigger.old);
        }
        
        if(trigger.isAfter && trigger.isUndelete)
        {
            HandlerDemoTriggerHandler.afterUndelete(Trigger.new);
        }
    }
}
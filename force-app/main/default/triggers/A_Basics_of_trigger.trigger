trigger A_Basics_of_trigger on Account (before insert) 
{
    for(Account acc :Trigger.new)
    {
        acc.Description ='Test Description';
        System.debug(Trigger.new);
        //here we are not writing any Dml statement bcoz this is a before trigger 
        //whatever changes we make in records in automatically updated in trigger.new list
        //So once all task is done insertion will be performed by trigger itself.
    }
}
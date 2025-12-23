trigger B_CallApexMethodThroughTriigger on Account (before insert) 
{
    //Best practice says Doon't implement the code in trigger itself.
    //Create a seperate class for it and call that method in the trigger.
    //that Apex Class will be known as trigger handler.
    
    AccountTriiggerHandler.DemoMethod(Trigger.new);
}
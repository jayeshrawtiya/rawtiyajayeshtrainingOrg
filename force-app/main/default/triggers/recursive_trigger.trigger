trigger recursive_trigger on Account ( before insert,after insert) 
{
    static integer i =1;
     public  static Boolean first = false;
    if(trigger.isBefore && trigger.isInsert)
    {
        
        if(first != false)
        {
             for(Account a : Trigger.new)
            {
                a.name = 'Suraj '+ i;
                i+=1;   
            }
        }
        first = true;
    }
    
 
    if(trigger.isAfter && trigger.isInsert)
    {
        Account a = new Account(Name ='Jayesh');
        insert a;
    }

}
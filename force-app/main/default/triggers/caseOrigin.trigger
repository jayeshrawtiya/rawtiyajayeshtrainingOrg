//Trigger Scenario 1 :
//When ever a case is created with origin as email then set status as new and Priority as Medium.

trigger caseOrigin on Case (before insert) 
{
    for(case c : trigger.new)
    {
        if(c.Origin=='email')
        {
            c.Status='New';
            c.Priority='Medium';
        }
    }
   
}
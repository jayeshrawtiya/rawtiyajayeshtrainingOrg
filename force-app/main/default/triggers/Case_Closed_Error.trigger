//2. Write a trigger to throw the validation error if someone tries to create the case in "Closed" status.

trigger Case_Closed_Error on Case (before insert) 
{
    For(Case cas: Trigger.new)
    {
        if(cas.Status=='Closed')
        {
            Cas.status.addError('you cannot create case with Closed Status');
        }
    }
}
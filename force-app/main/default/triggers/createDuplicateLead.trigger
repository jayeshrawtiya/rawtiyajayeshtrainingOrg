trigger createDuplicateLead on Lead (before insert) 
{
    List<Lead> duplicateLead = new List<Lead>();
    for(Lead newLead : Trigger.new)
    {
        lead templead = new lead();
        templead.FirstName = newLead.FirstName;
        templead.LastName= newLead.LastName;
        templead.Email= newLead.Email;
        duplicateLead.add(templead);
    }
    insert duplicateLead;
}
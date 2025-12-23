//Creates the number of contacts which are equal to the number which we will enter in the Number of Locations field on the Account Object.

trigger createrelectedcontact on Account (after insert) 
{
    list<Account> accList = new List<Account>();
    for(Account acc:Trigger.new)
    {
        If(Trigger.isInsert)
        {
            accList.add(acc);
        }
        If(Trigger.isUpdate && acc.NumberofLocations__c != trigger.oldmap.get(acc.Id).NumberofLocations__c)
        {
            accList.add(acc);
        }
    }
    
    list<contact> conlist = new list<contact>();
    for(Account acc:accList)
    {
        decimal noofcontact = acc.NumberofLocations__c;
        for(integer i=1; i<=noofcontact; i++)
        {
            contact con = new contact();
            con.LastName = acc.Name+i;
            con.AccountId = acc.Id;
            conlist.add(con);
        } 
    }
    insert conlist; 
}
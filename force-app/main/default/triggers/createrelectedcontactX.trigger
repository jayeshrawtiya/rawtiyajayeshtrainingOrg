//When ever the Account is created with Industry as Banking then create a contact for account, 
//Contact Lastname as Account name and contact phone as account phone.

trigger createrelectedcontactX on Account (after insert) 
{
    list<account> acclist = new list<account>();
    for(account acc:Trigger.new)
    {
        System.debug('inside for loop');
        if(acc.Industry == 'Banking')
        {
            acclist.add(acc);
        }
    }
    
    list<contact> conlist = new list<contact>();
    for(account acc : acclist)
    {
        contact con = new contact();
        con.LastName=acc.Name;
        con.Phone=acc.Phone;
        con.AccountId=acc.Id;
        conlist.add(con);
    }
    System.debug(conList);
    insert conlist;
    
    

}
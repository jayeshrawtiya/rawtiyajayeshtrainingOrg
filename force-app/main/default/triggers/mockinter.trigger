//Whenever billing city of account is changed then it should be copied to all of it's contact's mailing city.

trigger mockinter on Account (after update) 
{
    List<contact> conlist= new List<contact>();
    for(Account acc:Trigger.new)
    {
        conlist = [SELECT Id, MailingCity FROM Contact WHERE Accountid=:acc.id];
        
        for(contact con:conlist)
        {
            con.mailingCity = acc.billingCity;
        }
        
    }
    update conlist;
}
//1. Create an Apex Trigger to insert 5 contacts on insert of an Account 
//with Contact Name = AccountName + seq. number. Bulkify the code.

trigger Assign_insert_records on Account (before insert) 
{
    List<contact> conlist = new List<contact>();
    For(Account acc : trigger.new)
    {
        for(integer i=1; i<=5; i++)
        {
            contact con = new contact(LastName = acc.Name+i, AccountId =acc.Id);        
            conlist.add(con);
        }
        insert conlist;
    }
    
}
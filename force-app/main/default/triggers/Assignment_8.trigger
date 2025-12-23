//1. Create an Apex Trigger to insert 5 contacts on insert of an Account 
//with Contact Name = AccountName + seq. number. Bulkify the code.
//2. Write a logic to update Contact Name of all related Contacts 
//on Update of Account Name’s update

trigger Assignment_8 on Account (after insert, before update) 
{
    List<contact> conlist= new List<contact>();
    
    if(trigger.isInsert)
    {
        for(Account acc: trigger.new)
        {
            for(integer i=1; i<=5; i++)
            {
                contact con =new contact(FirstName=acc.Name, LastName=' '+i, AccountId=acc.Id);
                conlist.add(con);
            }
            insert conlist;
        }
    }
    
    
    
    if(trigger.isUpdate)
    {
        for(account acc : trigger.new)
        {
            Account Oacc = trigger.oldMap.get(acc.Id);
            if(Oacc.Name != acc.Name)
            {
                List<contact> conlista = [SELECT  FirstName, LastName, Id from contact WHERE AccountId=:acc.Id];
                System.debug('conlista => '+conlista);
                for(contact con : conlista)
                {
                    System.debug('con.FirstName => '+con.FirstName+ ' acc.name => '+acc.name);
                    con.FirstName = acc.Name;
                }
                update conlista;
            }
        }
    }
}
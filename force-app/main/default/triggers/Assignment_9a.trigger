//Assingment 1 :Write a trigger to update the created by user's department as "xyz" 
//& the notes field on contacts for that account as "abc", whenever an account is updated.

trigger Assignment_9a on Account (after update)
{
    
    set<Id> accIds = new set <Id>();
	set<id> UserIds = new set <id>();
    for(Account acc: Trigger.new)
    {
        If(Trigger.isUpdate)
        {
			System.debug('inside If condition');
            accIds.add(acc.Id);
			UserIds.add(acc.CreatedById);
        }
    }
    
    //Updating  field on Related contacts
	List<contact> conList =[SELECT Id, Notes__c FROM contact WHERE AccountId IN:accIds];
	for(contact con : conList)
    {
        con.Notes__c='Future_Notes_dd';
    }
	System.debug(conList);
	update conList;
    
    Assignment_9a_department.Departmentupdate(UserIds);
    
}












/*
trigger Assignment_9a on Account (before update)
{
    //Checking any field of account is updated.
    List<Id> updatedaccIds = new List<Id>();
    for(Account updatedAcc : Trigger.new)
    { 
            updatedaccIds.add(updatedacc.Id);
    }
 
    
    
    
    //Update contact
    List<contact> conList = new List<Contact>(); //for adding contacts which needs to be updated
    for(Account acc: Trigger.new)
    {
        If(updatedaccIds.contains(acc.Id))
        {
            conlist.add([SELECT Id, notes__c FROM Contact WHERE AccountId=:acc.Id LIMIT 1]);
            //now all contacts which needs to be updates are in conlist
        }
    }
    If(!conlist.isEmpty()){
        for(contact con : conlist){
            con.notes__c = 'abc';
        }
        update conlist; 
    }
    
    //Update Department
    Assignment_9a_department.Departmentupdate(updatedaccIds);
    
    
}

*/
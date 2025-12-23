//Create an Apex trigger that updates the Total Number of Contacts field on the Account object whenever a new Contact is inserted or deleted.

trigger TotalNumberOfContacts on Contact (after insert, after delete) {
    set<Id> AccountIds = new set<id>();
    
    If(trigger.isInsert) {
        for(contact con : trigger.new){
            AccountIds.add(con.AccountId);
        }
    }
    
    If(trigger.isDelete) {
        for(contact con : trigger.old){
            AccountIds.add(con.AccountId);
        }
    }
    
    List<Account> Accountx = [SELECT Id, (select Id from contacts), Number_of_contacts__c FROM Account WHERE Id IN :AccountIds];
    for(account acc:Accountx)
    {
        acc.Number_of_contacts__c = acc.contacts.size();
    }
    Update Accountx;
	    
}
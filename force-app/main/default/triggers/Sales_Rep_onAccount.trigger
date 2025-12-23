/*
Create a field on Account Named as "Sales Rep" (Data type: Text).
Write a Trigger to update this field: "Sales Rep" with trigger owner on Account creation 
also make sure this field should be updated if someone tries to update the owner of the record. Bulkify the code.
*/

trigger Sales_Rep_onAccount on Account (before insert, before update)
{
    set<Id> OwnerIds = new set<Id>( );
    for(Account acc: Trigger.new)
    {
        If (Trigger.isUpdate && acc.OwnerId != Trigger.oldMap.get(acc.Id).OwnerId)
        {
            OwnerIds.add(acc.OwnerId);
        }
        else If (Trigger.isInsert)
        {
            OwnerIds.add(acc.OwnerId);
        }
    }
    
    Map<Id, User> AccMap = new Map <Id, User>([SELECT Name FROM User WHERE Id IN : OwnerIds]);
    for(Account acc : Trigger.new)
    {
        User usr  = accMap.get(acc.OwnerId);
        acc.Sales_Rep__c = usr.Name;
    }

}
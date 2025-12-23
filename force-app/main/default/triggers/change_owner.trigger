/*
When we modify the contact relationship owner, then the owner name is systematically inhabited in the contact relationship; 
after that owner, the name is systematically inhabited in the Name field of the contact relationship.
*/
trigger change_owner on Contact_Relationship__c (After UPDATE) 
{
    set<Id> relationList = new set<Id>();
     List<contact> contactList = new List<contact>();
    for(Contact_Relationship__c conr: Trigger.new)
    {
        system.debug('first');
        string recordname  = conr.owner.name;
        string namekk = Trigger.oldmap.get(conr.Id).owner.name;
        system.debug('record name:'+ recordname);
        system.debug('record old name:'+ namekk);
        if(conr.OwnerId != Trigger.oldmap.get(conr.Id).OwnerId)  
        {
            system.debug('new');
            relationList.add(conr.Id);    
            contactList = [SELECT Id, name, OwnerId,email FROM contact WHERE id =: conr.contact__c  ];
            for(contact c : contactList){
                c.OwnerId = conr.OwnerId;
            }
            
        }
       update contactList;
        system.debug('first');
        
    }
    
   
  //  contactList = [SELECT Id, name, owner.name, (SELECT Id, name, Owner.name FROM Contact_Relationship) FROM contact WHERE name In ];

}
/*
Create the field called "Contact Relationship" checkbox on the Contact Object and Create the related object called "Contact Relationship" 
which is related list to the Contacts.(Look Up Relationship). 
Now logic is when we create contact by checking Contact Relationship checkbox, 
then Contact Relationship will be created automatically for that contact.
*/

trigger contact_relationship on Contact (after insert) 
{
    List<contact> conList = new List<contact>();
    for(contact con : Trigger.new)
    {
        if(trigger.isInsert && con.contact_relationship__c==true)
        {
            conList.add(con);
        }
    }
    
    
    List<Contact_Relationship__c> conrList = new List<Contact_Relationship__c>();
    for(contact con : conList)
    {
            Contact_Relationship__c conr = new Contact_Relationship__c();
            conr.contact__c = con.Id;
            conr.Name = con.lastName;
            conrList.add(conr);
     }
    insert conrList;
    
}
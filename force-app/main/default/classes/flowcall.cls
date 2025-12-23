public class flowcall 
{
    @InvocableMethod
    public static list<list<contact>> createRelatedContact(List<Id> ids)
    {
        list<list<Contact>> dumList = new list<list<Contact>>();
        
        Contact con = new contact();
        con.lastName='abc';
        con.AccountId=ids[0];
        insert con;
        Contact con2 = new contact();
        con2.lastName='xyz';
        con2.AccountId=ids[0];
        insert con2;
        
        list<contact> conlist = [SELECT ID, LastName FROM contact WHERE AccountId =: ids[0]];
        dumList.add(conlist);
        return dumList;
    }
    
    
    public class dummyWrapper
    {   
        @InvocableVariable
        public String str;
        
        @InvocableVariable
        public Decimal num;
    }
}
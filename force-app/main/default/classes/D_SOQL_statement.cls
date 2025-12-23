public class D_SOQL_statement
{
    public void demoSOQL()
    {
        List<Account> accList = new List<Account>();
        String AccName = 'Tech School';
        Integer c,d;
        c=[SELECT count() FROM Account WHERE Name =: AccName];
        d=[SELECT count() FROM Account WHERE Name = 'Tech School'];
        System.debug('c='+c+' d='+d);
     }
    
    Public void QueryChildFromParent()
    {
        //Querying Child record from parent record.
        List<Account> accList = new List<Account>();
        accList=[SELECT Id, Name, (SELECT Id, Name FROM contacts) FROM Account WHERE Name='TestAssignmentTrigger2'];
        System.debug('accList => '+accList);
        
        If(!accList.isEmpty())
        {
            for(Account acc : accList)
            {
                System.debug('Acc Contacts => '+acc.contacts);
            }
        }
    }
    
    
    public void QueryParentFromChild()
    {
        List<Cart__c> cartList = new List<Cart__c>();
        cartList=[SELECT Id, Name, product__r.Name,  Product__r.price__c FROM Cart__c];
        System.debug('Cart list => '+cartlist);
        //cartId, cartName and ProductId will be printed.
        
        for(Cart__c car: CartList)
        {
            System.debug(car.Product__r.Name+ ' | '+car.Product__r.price__c);
        }
    }
    
    
    public void InsertRelatedRecords()
    {
        Account acc = new Account(Name='SOQL Test', Phone ='1234567');
        insert acc;
        //after insertion on account account id will be automatically stored in acc.
        //which we are going to use in insertion of related field(contact)
        contact con =  new contact (AccountId = acc.Id,FirstName='Khush', LastName='Rawtiya', Phone='654321');
        insert con;
    }
    

    
    Public void UpdateRelatedRecords()
    {
        contact con =[SELECT Id, Name, Phone, Account.Phone, Account.Name FROM contact WHERE AccountId !=Null AND Account.Name='Tech School3'];
        System.debug(con);
        
        con.Phone = '111111';
        con.Account.Phone = '2222222';
        update con;
        update con.account;
        
    }
}
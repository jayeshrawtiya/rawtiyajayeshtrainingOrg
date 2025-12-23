public class B_sobjects_cObjects 
{
    public void demosObject()
    {
        //standard objcect
        Account Acc = new Account();
        acc.Name  = 'test';
        acc.Phone = '123456';
        System.debug('1_ '+acc);

        //custom object
		Product__c pd =  new Product__c();
        pd.Name = 'Hello';
        pd.numbers__c = '3';
        System.debug('2_ '+pd);
        insert pd;
        
        //Genric object
        sObject objj;
        objj = new Account(Name='Jay', Phone='65432');
        Account Acct = (Account)Objj;
        System.debug('3_ '+Acct);
        
        
        objj = new Product__c(Name ='Rawt',numbers__c = '5');  //using same objj for custom objcet 
        //objj.Name ='Rawt';
        //objj.numbers__c = '5';
        Product__c prd = (product__c)objj;
        System.debug('4_ '+prd);
        
    }
    
    
    Public void LoopList()
    {
        //extracting Id from a loop and saving it tho set.
        List<Account> accList = new List<Account>();
		Set<Id> accIds = new Set<Id>();        
        accList = [SELECT Id,Name FROM Account LIMIT 2];
        if(!accList.isEmpty())
        {
            for(Account acc:accList)
   			{
            	accIds.add(acc.Id);
        	}
        }
        System.debug('1_ accIds => '+accIds);
        accIds.clear();
        System.debug('2_ accIds => '+accIds);
        //Here we extracted query and saved in list so before apllying any loop on list the best practice is to check that list is empty or not.
        //another way to do this is dirctly using soql and not storing in sepertare list
        for(Account acc:[SELECT Id, Name FROM Account LIMIT 2])
        {
            accIds.add(acc.Id);
        }
        System.debug('3_ acc => '+accIds);
        
        
        
        //Loops on Set
        If(!accIds.isEmpty())
        {
            for(Id i :accIds)
			System.debug('4_ Ids '+i);
        }
        
        
        
        Map<Id, Account> IdToAccountMAp = new Map<Id, Account>([SELECT Id, Name FROM Account LIMIT 2]);
        if(!accIds.isEmpty())
        {
            for(Id i: accIds)
                If(idToAccountMap.containskey(i))
                {
                    System.debug('5_ Map values => '+idToAccountMap.get(i));
                }
        }
        
    }
    
    

}
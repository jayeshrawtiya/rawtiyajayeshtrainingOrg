public class C_DML_statements 
{
    public void InsertDml()
    {
        Account acc = new Account(Name = 'Tech School', Phone ='123456');
        insert acc;
        		
        //adding with a list
        Account acc1 = new Account(Name= 'Tech School2', phone='34567');
        Account acc2 = new Account(Name = 'TechSchool3', Phone ='682567');
        List<Account> accList = new List<Account>();
        accList.add(acc1);
        accList.add(acc2);
        insert accList;
        
        //Insert Related records, First Insert Account then Contact.
        Account acc3 = new Account(Name = 'Tech School4', Phone ='123456');
        insert acc3;
        Contact con = new Contact(FirstName = 'Jay', LastName='Raw', AccountId=acc3.Id);
        insert con;
    }
    
    
    Public void UpdateDml()
    {
        //List<Account> accList = new List<Account>();
        //accList.add([SELECT Id, Name FROM Account LIMIT 2]);
        Account acc = [select Id,Name, Phone From Account WHERE Name='tech School'LIMIT 1];  
        System.debug('1_ '+acc);
        acc.Phone = '6263016';
        update acc;
        Account updateacc = [select Id,Name, Phone From Account WHERE Name='tech School'LIMIT 1];
        System.debug('1_ '+updateacc);
        
        
        //syntax :  System.assert(expected, actual, msg to display
        System.assertEquals(Updateacc.Phone, acc.Phone,'this msg will be display if both are not equal');
         
    }
    
    public void upsertdml()
    {
        //upsert = updat and insert in one single dml operation
        List<Account> accList = new List<Account>();
        Account acc1 = new Account(Name='Tech School5', Phone='123456');
        Account acc2 = [SELECT Id,Name FROM Account WHERE Name='Tech School4'];
        acc2.Phone = '121212';
        accList.add(acc1);
        accList.add(acc2);
        upsert accList;
    }
    
    
    
    Public void MergeDml()
    {
        //Tech school4 have one related account
        //Tech school3 havve no related account
        //we are merging techschool4 to techschool3
        //so related account of Techschool4 will be visible in TEchSchool3
        //TechSchool4 will be deleted
       
        Account MasterAcc = [SELECT Id, Name, Phone FROM Account WHERE Name='Tech School3'];
        Account MergeAcc = [SELECT Id, Name, Phone FROM Account WHERE NAme='Tech School4'];
        
        Merge MasterAcc MergeAcc;
    }
    
    
    Public void DeleteDMl()
    {
        //if you want to delete more than one account make a List
       	Account acc = [SELECT Id, Name, Phone FROM Account WHERE Name='Tech School5'];
        System.debug(acc);
        Delete acc;    
    }                 
    
    
    Public void undeleteDml()
    {
        //When we write "ALL ROWS" it shows deleted as well as undeleted records 
        List <Account> deletedAcc = [SELECT Id, Name, Phone FROM Account WHERE NAme='Tech School5' ALL ROWS];
        System.debug(deletedAcc);
        undelete deletedacc;
    }
	
    public void Exception_handling(){
        try
        {
            Account acc = new Account();
        	insert acc; //trying to insert account without any detail.
        }
        catch(DMLException e)
        {
            System.debug('Error => '+e.getMessage());
        } 
    }
}
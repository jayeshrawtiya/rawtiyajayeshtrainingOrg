public class A_Method_constructor_DataType 
{
    boolean b;   //primitive variable 
    
    public A_Method_constructor_DataType()
    {	System.debug('Constructor called'); }
    
    
    public void DemoMethod()
    {	b=True;
        System.debug('Demo Method called   b='+b);}
    
    
    public void sObjectXX()
    {   //sObject as a datatype her Account is sObject
        Account acc = new Account();
        acc.Name = 'Test';
        acc.Phone= '123456';
        System.debug('Account = '+acc);
    }
    
    
    public void GenricsObject()
    {   //without having specific datatype you cannot access field so whenever we use genric sObject we need to type cast it to specific object to access fields
        sObject obj = new Account(Name = 'Test'); 
        Account acc = (Account) obj;
        System.debug('AccountX = '+acc);
        //One of the benefit of casting is to be able to access fields using dot notation, which is not available on the geneeric sObjects
		//We can use generic sobject to refer more than one specific object.(after typecasting previous one we can use it again)
		obj = new Contact(Email = 'Abc@gmail.com');
        Contact con = (contact)obj;
        System.debug('ContactX ='+con);
    }
    
    
    public void DemoList()
    {	List<string> ListXX = new List<string>();
        ListXX.add('A');
        ListXX.add('B');
        ListXX.add('C');
        System.debug('1_List contains : '+ListXX);
        System.debug('2_0th element = '+ListXX[0]);
        System.debug('3_0th element = '+ListXX.get(0));
        ListXX.add(2,'G');  //C will be shifted to index 3
        System.debug('4_List contains : '+ListXX);
        System.debug('5 '+ListXX.size()); //no of elements
        ListXX.set(2,'J');
        System.debug('6_List contains : '+ListXX);
        ListXX.remove(1);
        System.debug('7_List contains : '+ListXX);
     	
        //Adding all elements one list to another
     	List<String> List2 = new List<string>();
     	List2.add('india');
     	List2.addall(ListXX);
     	System.debug('8_List 2 = '+List2);
     
     	//Adding all elements of set to list
     	Set<String> demset = new Set<string>();
     	demset.add('Banana');
     	demset.add('Apple');
     	List2.addall(demset);
     	System.debug('9_List 2 = '+List2);
     	
     	//Clonning list
     	List<string> list3 = new List<string>();
     	List3= list2.clone();
     	system.debug('10_clonned list List3 = '+list3);
     	
     	//clearing List
     	List2.clear();
     	System.debug('11_List 2 = '+List2);
     	
     	//Checking list contains value or not
     	boolean result;
     	result = list3.contains('india');
     	System.debug('12_ '+result);
     	result =list3.contains('china');
     	system.debug('13_ '+result);
     
     	//comparing number of elements in two list
     	result = list3.equals(list2);
     	System.debug('14_ '+result);
     
     	//get object type of sObjects
     	sObject obj = [select Id, Name from Account Limit 1];
     	system.debug('15_Object Type => '+obj.getsObjectType());
     
     	//get index of any value (case sensitive)
     	//will search for first occurence of value
     	System.debug('16_ '+list3.indexof('J'));
     	System.debug('16_ '+list3.indexof('j'));//return -1 bcoz not available
     
     	//to check if list is empty : return true or false
     	System.debug('17_ '+List2.isEmpty());
      	System.debug('17_ '+List3.isEmpty());
     	
     	//to check size of the list
     	System.debug('18_ '+List3.size());
     
     	//sorting list- ascending order
     	list3.sort();
     	system.debug('19_ '+list3);
    }
    
    
    public void DemoSet()
    {
        Set<String> set1= new Set<String>();
        Set1.add('India');
        Set1.add('India');
        Set1.add('india');
        System.debug('1_ '+set1); //India, india
        
        //clonning
        set<string> set2 = new set<string>();
        set2=set1.clone();
        System.debug('2_ '+set2);
	}
    
    
    
    Public void DemoMap()
    {	Map<Integer, String> Map1 = new Map<Integer, String>();
     	Map1.put(1, 'First');
     	Map1.put(5, 'five');
     	Map1.put(2, 'Two');
		System.debug('1_ '+Map1);
	    System.debug('1_ '+Map1.get(1));
     	System.debug('1_values '+Map1.values());
     	System.debug('1_keys '+Map1.keyset());
     	
        //Adding one map to another
     	Map<Integer, String> Map2 = new Map<Integer, String>();
     	Map2.put(3, 'Three');
     	Map2.putAll(Map1);
     	System.debug('2_ '+Map2);
     	Map2.remove(5);
     	System.debug('3_ '+Map2);
     	System.debug('4_ '+Map2.size());
     
     	//adding all values to a list
     	List<String> valueList = new List<string>();
     	valueList.AddAll(Map1.values());
     	System.debug('5_List : '+valuelist);
     
     	//adding all keys to set
     	Set<Integer> keysSet = new Set<integer>();
     	keysset = Map1.keyset();
     	System.debug('6_set : '+keysset);
     	
     	//clearing map
     	Map2.clear();
     	System.debug('7_ '+Map2);
     
     	//clonning Map
     	Map<Integer, String> Map3 = new Map<Integer, String>();
     	Map3 = Map1.clone();
     	System.debug('8_ '+Map3);
     
     	//check particular key is available or not; returns true or false
     	System.debug('9_ '+Map3.containskey(5));
     	
     
     	//Map on sObjects
     	Map<Id, Account> accIdMap = new Map<Id,Account>([select Id, Name from Account Limit 2]);
     	System.debug('10_ '+accIdMap);
    }
        
}
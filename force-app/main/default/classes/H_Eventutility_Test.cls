@isTest
public class H_Eventutility_Test 
{
	@isTest
    Private static void method1()
    {
        string res=H_Eventutility.eventPriority('IND');
        System.assertEquals(null, res);
    }
    
    @isTest
    Private Static void method2()
    {
        String res = H_Eventutility.eventPriority('CA');
        System.assertEquals('High', res);
    }
    
    @isTest
    Private static void method3()
    {
        String res = H_Eventutility.eventpriority('B');
        system.assertEquals('Medium', res);
    }
    
}
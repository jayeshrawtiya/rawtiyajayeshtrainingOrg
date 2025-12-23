@isTest
public class G_Temperature_Test 
{
    
    @isTest
    private static void warmTempTest()
    {
        Decimal res = G_Temperature.FtoC(70);
        System.assertEquals(21.11, res,'printed');
    }
    
    
    @isTest
    private static void coldTempTest()
    {
        Decimal res = G_Temperature.FtoC(30);
        System.assertEquals(0, res, 'will be printed on mismatch');
        //System.assertEquals(expected, actual, message_for_mismatch)
    }
 
}
@isTest

public class oppo_deal_amount_test 
{
    @isTest
    static void aggoppoamount()
    {
        Opportunity opt = new Opportunity();
        opt.Amount=100;
        opt.CloseDate=System.Today();
        opt.StageName='open';
        opt.Name='Test';
            
        insert opt;
        Test.startTest();
    	Oppo_deal_amount.totalAmount();
    	Test.stopTest();
}
}
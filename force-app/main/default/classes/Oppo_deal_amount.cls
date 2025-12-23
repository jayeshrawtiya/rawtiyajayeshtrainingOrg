public class Oppo_deal_amount 
{
    public static void totalAmount()
    {
        List<AggregateResult>aggresult = [select OwnerId, SUM(Amount) totalAmount FROM Opportunity GROUP BY OwnerId];
        
        List<total_oppo_amount__c> record = new List<total_oppo_amount__c>();
        
        for(AggregateResult result : aggresult)
        {
            Id OwnerId=(Id)result.get('OwnerId');
            Decimal totalAmount = (Decimal)result.get('totalAmount');
            
            total_oppo_amount__c customRecord = new total_oppo_amount__c(
            Oppo_owner__c= OwnerId, total_amount__c=totalAmount);
            
            record.add(customRecord);
		}
        
        if(!record.isEmpty()){
            insert record;
        }
    }
}
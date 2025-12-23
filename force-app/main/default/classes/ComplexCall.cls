public class ComplexCall 
{
    @InvocableMethod
    public static list<list<Id>> ConOppo (List<Id> Ids)
    {
        List<Id> IdList = new list<Id>();
        
        List<contact> conList = new List<Contact>();
        For(Integer i=0; i<2; i++)
        {
            Contact con=new Contact();
            con.LastName='abc'+i;
            con.AccountId=Ids[0];
            conList.add(con);
        }
        insert conList;
        
        
        List<Opportunity> OppoList = new List<Opportunity>();
        For(Integer i=0; i<2; i++)
        {
            Opportunity Oppo=new Opportunity();
            Oppo.CloseDate= Date.newinstance(2024,3,1);
            Oppo.Name='Opportu'+i;
            oppo.StageName='Prospecting';
            Oppo.AccountId=Ids[0];
            OppoList.add(Oppo);
        }
        insert OppoList;
        
        
        List<contact> ConlistX = [SELECT Id From Contact WHERE ACcountID=:Ids[0]];
        List<Opportunity> OpportunityX = [SELECT Id FROM Opportunity WHERE AccountId=:Ids[0]];
        
        for(Integer i=0; i<2; i++)
        {
            IdList.add(ConlistX[i].Id);
            IdList.add(OpportunityX[i].Id);
        }
        list<list<id>> dummyList = new List<List<Id>>();
        dummyList.add(IdList);
        return dummyList;
        
        
    }
}
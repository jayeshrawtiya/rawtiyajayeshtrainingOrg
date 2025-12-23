//Assingment 2 : write a batch apex  which should count  the number of leads 
//created each day and update the comment field as "to be followed up weekly once"
//and mail the daily count to the admin(Take your email id as Admin in this scenario).

Global class Assignment_9b_BatchApex implements Database.Batchable<sObject>, Database.AllowsCallouts, schedulable
{
    Global Database.QueryLocator start(Database.BatchableContext BC)
    {
        Date today = Date.today(); 
        Return Database.getQueryLocator([SELECT Id FROM Lead WHERE CreatedDate = TODAY]); 
    }
    
    
 Global void execute(Database.BatchableContext BC, List<Lead> leadList) { 
     
        Integer leadCount = leadList.size(); 
        For (Lead lead : leadList) { 
            Lead.Comment__c = 'To be followed up weekly once'; 
        } 
        Update leadList; 
     
     
        String adminEmail = 'rawtiyajayesh2205@gmail.com';
        String subject = 'Daily Lead Count'; 
        String body = 'Number of leads created today: ' + leadCount; 
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
        Mail.setToAddresses(new String[]{adminEmail}); 
        Mail.setSubject(subject); 
        Mail.setPlainTextBody(body);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail}); 
    } 
    
    
    Global void execute (schedulableContext SC)
    {
        Assignment_9b_BatchApex batchJob = new Assignment_9b_BatchApex(); 
		Database.executeBatch(batchJob);
	}
    
    
    
    Global void Finish(Database.batchableContext BC)
    {
        //jnaskjna
    }
}
public with sharing class LeadToAccount 
{
    
    
    public class AccountResult {
        @AuraEnabled public Id accountId;
        @AuraEnabled public Boolean isDuplicate;
    }
    
    @AuraEnabled
    public static AccountResult createAccount(String name, String industry, String phone, String website) {
        
        // Check for existing account
        List<Account> existingAccounts = [SELECT Id FROM Account WHERE Name =:name AND Website=:Website LIMIT 1];
    
        AccountResult result = new AccountResult();
        
        if (!existingAccounts.isEmpty()) {
            result.accountId = existingAccounts[0].Id;
            result.isDuplicate = true;
            return result;
        }
        
        
        Account acc = new Account(
            Name = name,
            Industry = industry,
            Phone = phone,
            Website = website
        );
        insert acc;
        
        result.accountId = acc.Id;
        result.isDuplicate = false;
        return result;

    }
    
    @AuraEnabled(cacheable=true)
    public static Lead getLead(Id leadId) {
        return [SELECT Id, FirstName, LastName, Status, Website FROM Lead WHERE Id = :leadId LIMIT 1];
    }
}
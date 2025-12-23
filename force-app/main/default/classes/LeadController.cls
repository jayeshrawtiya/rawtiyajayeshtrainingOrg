public with sharing class LeadController {
    
    @AuraEnabled(cacheable=true)
    public static Lead getLead(Id leadId) {
        return [SELECT Id, FirstName, LastName, Status, Website FROM Lead WHERE Id = :leadId LIMIT 1];
    }

    @AuraEnabled
    public static void createAccountFromLead(Map<String, Object> input) {
        String name = (String)input.get('name');
        String industry = (String)input.get('industry');
        String phone = (String)input.get('phone');
        String website = (String)input.get('website');
        Id leadId = (Id)input.get('leadId');

        if (leadId == null) {
            throw new AuraHandledException('Lead Id is missing.');
        }

        Lead lead;
        try {
            lead = [SELECT FirstName, Website FROM Lead WHERE Id = :leadId LIMIT 1];
        } catch (Exception e) {
            throw new AuraHandledException('Lead not found: ' + e.getMessage());
        }

        if (lead == null) {
            throw new AuraHandledException('No lead found for the provided Id.');
        }

        List<Account> existingAccounts = [
            SELECT Id, Name, Website 
            FROM Account 
            WHERE Name = :lead.FirstName AND Website = :lead.Website
        ];

        if (!existingAccounts.isEmpty()) {
            throw new AuraHandledException('Account already exists with matching First Name and Website.');
        }

        Account acc = new Account(
            Name = name,
            Industry = industry,
            Phone = phone,
            Website = website
        );
        insert acc;
    }
}
public with sharing class ProductSelectorController {
    
    @AuraEnabled(cacheable=true)
    public static List<Product__c> searchProducts(String searchKey) {
        return [
            SELECT Id, Name, Image_Url__c 
            FROM Product__c 
            WHERE Name LIKE :('%' + searchKey + '%') 
            LIMIT 100
        ];				
    }

    @AuraEnabled
    public static void createOrderLinks(Id orderId, List<Id> productIds) {
        List<ProductOrderLink__c> links = new List<ProductOrderLink__c>();
        for (Id productId : productIds) {
            System.debug('orders : '+orderId+'  productId : '+productId);
            links.add(new ProductOrderLink__c( Orders__c = orderId, Product1__c = productId ));
        }
        insert links;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<product__c> fetchRelatedProduct(Id orderId)
    {
        List<ProductOrderLink__c> ProductOrder = [SELECT Id, Product1__r.Name, Product1__r.Id, Product1__r.Category__c FROM ProductOrderLink__c WHERE Orders__c=:orderId]; 
    	List<Product__c> products = New List<Product__c>();
        for(ProductOrderLink__c POL : ProductOrder)
        {
            products.add(POL.product1__r);
        }
        return products;
    }
    
    @AuraEnabled(cacheable=true)
    public static allRecordsWrapper fetchAllRecordsRelatedToEmail (string email)
    {
        
        //checking if email is not entered
        System.debug('Email :'+email);
        If(String.isBlank(email))
        {
            return null;
        }
        
        //Fetching Contact records and putting in Map.
        List<Contact> conList = [SELECT Id, Name, Email FROM Contact WHERE Email=:email LIMIT 1];
        system.debug('conList : '+conList);
        If(conList.size()==0){
            return null;
        }
   
        
        //Fetching Orders__c records
        List<Orders__c> orderList = [SELECT Id, Name, Contact__c FROM Orders__c WHERE Contact__c=:conList[0].Id];
     	system.debug('orderList : '+orderList);
            
        //Fetching Case records
        List<Case> caseList = [SELECT CaseNumber, Status, ContactId FROM Case WHERE ContactId=:conList[0].Id];
        system.debug('caseList : '+caseList);
        
        
        allRecordsWrapper Wrapper = new allRecordsWrapper();
        Wrapper.contact = conList;
        Wrapper.orders = orderList;
        Wrapper.cases = caseList;
        return Wrapper;
        
    }
    
    //Wrapper Class for "fetchAllRecordsRelatedToEmail"method
    public class allRecordsWrapper{
        @AuraEnabled Public List<Contact> contact;
        @AuraEnabled Public List<Orders__c> orders;
        @AuraEnabled Public List<case> cases;
    }
    	
}
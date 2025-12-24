public with sharing class NewsApiWrapper {
    @AuraEnabled
    public string status;
    @AuraEnabled
    public Integer totalResults;
    @AuraEnabled
    public List<articles> articles;

    @AuraEnabled
    public class articles{
        @auraEnabled
        public source source;
        @AuraEnabled
        public string author;
        @AuraEnabled
        public string title;
        @AuraEnabled
        public string description;
        @AuraEnabled 
        public string url;
        @AuraEnabled
        public string urlToImage;
        @AuraEnabled
        public string publishedAt;
        @AuraEnabled
        public string content;
    }

    @AuraEnabled
    public class source{
        @AuraEnabled
        public string id;
        @AuraEnabled
        public string name;
    }
}
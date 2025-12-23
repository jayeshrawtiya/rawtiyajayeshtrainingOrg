public with sharing class CurrencyProxyController {
    @AuraEnabled(cacheable=true)
    public static String getConvertedCurrency() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.exchangerate.host/convert?from=USD&to=EUR');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        return response.getBody();
    }
}
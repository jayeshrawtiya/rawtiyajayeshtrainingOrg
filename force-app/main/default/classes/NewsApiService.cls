public with sharing class NewsApiService {
    public String myApiKey = System.label.NEWS_API_KEY;
    private static final String NAMED_CREDENTIAL = 'callout:NewsAPI';
    private static final String API_KEY = myApiKey;

    public static String getNews(String keyword, Date fromDate) {

        String formattedDate =
            String.valueOf(fromDate.year()) + '-' +
            String.valueOf(fromDate.month()).leftPad(2, '0') + '-' +
            String.valueOf(fromDate.day()).leftPad(2, '0');

        String endpoint =
            NAMED_CREDENTIAL +
            '/v2/everything' +
            '?q=' + EncodingUtil.urlEncode(keyword, 'UTF-8') +
            '&from=' + formattedDate +
            '&sortBy=popularity' +
            '&apiKey=' + API_KEY;

        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 200) {
            return res.getBody();
        } else {
            throw new CalloutException(res.getBody());
        }

        NewsApiWrapper newsApiWrapper = NewsApiWrapper();
        newsApiWrapper = (JSON.deserialize(res.getBody(), NewsApiWrapper.class));
        return newsApiWrapper;
      }
}

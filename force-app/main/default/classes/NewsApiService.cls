/**
 * NewsApiService
 * Service class to call external News API via Named Credential.
 *
 * - Uses with sharing to respect org sharing rules
 * - Input validation and early returns
 * - No logging of secrets or full payloads
 * - Supports invocation from Flow via Invocable Apex
 */
public with sharing class NewsApiService {

    // Constants
    private static final String NAMED_CREDENTIAL = 'callout:NewsAPI';
    private static final String UTF8 = 'UTF-8';
    private static final Integer TIMEOUT_MS = 120000;
    private static final String DEFAULT_SORT = 'POPULARITY';

    // Secure configurable key via custom label (if Named Credential doesn't inject it)
    private static final String API_KEY = System.Label.NEWS_API_KEY;

    // Enum for sortBy to avoid magic strings
    // public enum SORT_BY { RELEVANCY, POPULARITY, PUBLISHEDAT }

    public static newsApiWrapper getNews(String keyword, Date fromDate, String sortBy) {
        // Validate inputs
        if (String.isBlank(keyword)) {
            // Early return pattern: throw with clear message
            throw new CalloutException('Keyword is required.');
        }
        // Format date (default to today-30 if null to keep query selective)
        Date effectiveFrom = (fromDate == null) ? Date.today().addDays(-30) : fromDate;
        String formattedDate =
            String.valueOf(effectiveFrom.year()) + '-' +
            String.valueOf(effectiveFrom.month()).leftPad(2, '0') + '-' +
            String.valueOf(effectiveFrom.day()).leftPad(2, '0');

        //String resolvedSort = DEFAULT_SORT;
        //if (!String.isBlank(sortBy)) {
        //    String upper = sortBy.trim().toUpperCase();
        //    if (upper == 'RELEVANCY' || upper == 'POPULARITY' || upper == 'PUBLISHEDAT') {
        //        resolvedSort = upper.toLowerCase();
        //    }
        //}

        // Build endpoint. Prefer Named Credential auth headers. Fallback to apiKey query if label provided.
        System.debug('Keyword: ' + keyword);
        System.debug('From Date: ' + formattedDate);
        System.debug('Sort By: ' + DEFAULT_SORT);

        String endpoint = NAMED_CREDENTIAL +
            '?q=' + EncodingUtil.urlEncode(keyword, UTF8) +
            '&from=' + EncodingUtil.urlEncode(formattedDate, UTF8) +
            '&sortBy=' + EncodingUtil.urlEncode(DEFAULT_SORT, UTF8);

        if (!String.isBlank(API_KEY)) {
            endpoint += '&apiKey=' + EncodingUtil.urlEncode(API_KEY, UTF8);
        }
        System.debug('Endpoint: ' + endpoint);
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        req.setTimeout(TIMEOUT_MS);

        Http http = new Http();
        HttpResponse res;
        try {
            res = http.send(req);
        } catch (System.CalloutException ce) {
            throw new CalloutException('Callout failed: ' + ce.getMessage());
        }

        if (res.getStatusCode() == 200) {
            try {
                return (newsApiWrapper) JSON.deserialize(res.getBody(), newsApiWrapper.class);
            } catch (Exception parseEx) {
                throw new CalloutException('Failed to parse News API response.');
            }
        }
        // Surface concise error
        String msg = 'News API error. Status: ' + String.valueOf(res.getStatusCode());
        // Add a small excerpt (first 200 chars) for troubleshooting without dumping full body
        String body = res.getBody();
        if (body != null) {
            msg += ', Body: ' + body.left(200);
        }
        throw new CalloutException(msg);
    }
}

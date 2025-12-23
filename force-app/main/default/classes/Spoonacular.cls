public class Spoonacular 
{
    private static final String spoonacular_Api = 'https://api.spoonacular.com';
    private static final String spoonacular_Api_Key = 'dba134d9eab24c4a92258334e0f69831';    
    
    @auraenabled
    public static String getRandomReceipe()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(spoonacular_Api + '/recipes/random?apiKey=' + spoonacular_Api_Key);
        request.setMethod('GET');
        
        HttpResponse response = http.send(Request);
        
        // Parse the JSON response
        if(response.getStatusCode() == 200) 
        {
            return response.getBody();
        	}
        return '';
    }
    @auraenabled
    public static String getRecipe(String receipeId)
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(spoonacular_Api + '/recipes/'+receipeId+'/information?apiKey=' + spoonacular_Api_Key);
        request.setMethod('GET');
        
        HttpResponse response = http.send(Request);
        
        // Parse the JSON response
        System.debug('Response Code : ' + response.getStatusCode());
        if(response.getStatusCode()==200) 
        {
        	return response.getBody();   
        }
        return '';
    }
    
	@auraenabled
    public static String getReceipeByIngredient(String ingredients)
   	{
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(spoonacular_Api + '/recipes/findByIngredients?apiKey=' + spoonacular_Api_Key +'&ingredients='+ingredients );
        request.setMethod('GET');
        
        HttpResponse response = http.send(Request);
        
        // Parse the JSON response
        System.debug('Response Code : ' + response.getStatusCode());
        if(response.getStatusCode()==200) 
        {
        	return response.getBody();   
        }
        return '';
    }

}
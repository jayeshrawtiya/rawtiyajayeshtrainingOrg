global with sharing class googleplaces 
{
  @TestVisible
  global class AutocompleteResponse{  //When the Places service returns JSON results from a search, it places them within a predictions array. Even if the service returns no results (such as if the location is remote) it still returns an empty predictions array. XML responses consist of zero or more <prediction> elements.
    @AuraEnabled
    global AutocompletePredictions[] predictions;
    @AuraEnabled
    global String status;
  }
  
  @TestVisible
  global class AutocompletePredictions{
    @AuraEnabled
    global String description;  //description contains the human-readable name for the returned result. For establishment results, this is usually the business name.
    @AuraEnabled
    global String id; 
    @AuraEnabled
    global String place_id;  //place_id is a textual identifier that uniquely identifies a place. To retrieve information about the place, pass this identifier in the placeId field of a Google Places API Web Service request. For more information about place IDs, see the place ID overview (https://developers.google.com/places/web-service/place-id).
    @AuraEnabled
    global String reference;
	@AuraEnabled
    global String[] types;  //types contains an array of types that apply to this place. For example: [ "political", "locality" ] or [ "establishment", "geocode" ].
  }
}
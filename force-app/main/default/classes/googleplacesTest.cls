@isTest
private class googleplacesTest {

    @isTest
    static void testAutocompleteResponseAndPredictions() {
        // Create an instance of AutocompletePredictions
        googleplaces.AutocompletePredictions prediction = new googleplaces.AutocompletePredictions();
        prediction.description = 'Empire State Building';
        prediction.id = 'testId123';
        prediction.place_id = 'placeIdABC';
        prediction.reference = 'referenceXYZ';
        prediction.types = new List<String>{'establishment', 'point_of_interest'};

        // Create AutocompleteResponse and assign prediction
        googleplaces.AutocompleteResponse response = new googleplaces.AutocompleteResponse();
        response.predictions = new List<googleplaces.AutocompletePredictions>{ prediction };
        response.status = 'OK';

        // Assertions to validate structure
        System.assertNotEquals(null, response, 'Response should not be null');
        System.assertEquals('OK', response.status, 'Status should be OK');
        System.assertEquals(1, response.predictions.size(), 'There should be one prediction');
        
        // Validate prediction values
        googleplaces.AutocompletePredictions resultPrediction = response.predictions[0];
        System.assertEquals('Empire State Building', resultPrediction.description);
        System.assertEquals('testId123', resultPrediction.id);
        System.assertEquals('placeIdABC', resultPrediction.place_id);
        System.assertEquals('referenceXYZ', resultPrediction.reference);
        System.assertEquals(2, resultPrediction.types.size(), 'Prediction should have 2 types');
        System.assertEquals('establishment', resultPrediction.types[0]);
    }
}
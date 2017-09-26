@isTest
private class WeatherTest {
    @isTest static void testCallout () {
        // Set mock callout class
        Test.setMock(HttpCalloutMock.class, new WeatherMockHttpResponse());

        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock.
        HttpResponse res = new CalloutClass().getInfoFromExternalService();

        // Verify response received contains fake values
        String actualValue = res.getBody();
        String expectedValue = '{"coord":"Wind", "clouds":"cloud"}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, res.getStatusCode());
    }

    public class CalloutClass {
        public HttpResponse getInfoFromExternalService() {
            Candidate__c c = new Candidate__c( City__c = 'Sai Gon' );
            String format        = 'https://api.openweathermap.org/data/2.5/weather?q={0}&appid={1}';
            List< String > filters = new String[]{
                c.City__c,
                'ea77eec72392d5163c6c06be812dff37'
            };
            String restUrl  = String.format( format, filters );
            HttpRequest req = new HttpRequest();
            req.setEndpoint(restUrl);
            req.setMethod('GET');
            Http h = new Http();
            HttpResponse res = h.send(req);
            return res;
        }
    }
}
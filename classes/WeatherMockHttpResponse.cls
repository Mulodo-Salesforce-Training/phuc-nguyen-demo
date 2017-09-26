@isTest
global class WeatherMockHttpResponse implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond( HTTPRequest req ) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        System.assertEquals( 'https://api.openweathermap.org/data/2.5/weather?q=Sai Gon&appid=ea77eec72392d5163c6c06be812dff37', req.getEndpoint() );
        System.assertEquals( 'GET', req.getMethod() );

        // Create a fake response
        HttpResponse res = new HttpResponse();

        res.setBody( '{"coord":"Wind", "clouds":"cloud"}' );
        res.setStatusCode( 200 );
        return res;
    }
}
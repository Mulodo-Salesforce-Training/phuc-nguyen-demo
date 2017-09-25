@isTest
global class MockHttpResponse implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond( HTTPRequest req ) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        System.assertEquals( 'https://ap5.salesforce.com/services/data/v40.0/query/?q=SELECT+Name+from+Account+Limit+10', req.getEndpoint() );
        System.assertEquals( 'GET', req.getMethod() );

        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader( 'Content-Type', 'application/json' );
        res.setHeader( 'Authorization', 'Bearer ' + userInfo.getSessionId() );
        res.setBody( '{"records":[{"Name": "Phuc Nguyen"}]}' );
        res.setStatusCode( 200 );
        return res;
    }
}
@isTest
private class CalloutMultiStaticClassTest {
    @isTest static void testCalloutWithMultipleStaticResources() {
        // Use MultiStaticResourceCalloutMock to
        // specify fake response for a certain endpoint and 
        // include response body in a static resource.    
        MultiStaticResourceCalloutMock multimock = new MultiStaticResourceCalloutMock();
        multimock.setStaticResource(
            'http://api.salesforce.com/foo/bar', 'mockResponse');
        multimock.setStaticResource(
            'http://api.salesforce.com/foo/sfdc', 'mockResponse2');
        multimock.setStatusCode(200);
        multimock.setHeader('Content-Type', 'application/json');
        
        // Set the mock callout mode
        Test.setMock(HttpCalloutMock.class, multimock);
        
        // Call the method for the first endpoint
        HTTPResponse res = CalloutMultiStaticClass.getInfoFromExternalService(
            'http://api.salesforce.com/foo/bar');
        // Verify response received 
        System.assertEquals('{"hah":"fooled you"}', res.getBody());
        
        // Call the method for the second endpoint
        HTTPResponse res2 = CalloutMultiStaticClass.getInfoFromExternalService(
            'http://api.salesforce.com/foo/sfdc');
        // Verify response received 
        System.assertEquals('{"hah":"fooled you twice"}', res2.getBody());
    }
}
@isTest
private class JwtTest {
     
    // No API for createing a certificate so must be manually pre-created
    // using Setup -> Security Controls -> Certificate and Key Management
    private static final String PRE_CREATED_CERTIFICATE_NAME = 'JWT';
    private static final String FAKE_TOKEN = 'fakeToken';
     
    private class Mock implements HttpCalloutMock {
 
        public HTTPResponse respond(HTTPRequest req) {
             
            HTTPResponse res = new HTTPResponse();
            System.assertEquals('POST', req.getMethod());
            System.assert(req.getBody().contains('grant_type'), req.getBody());
            System.assert(req.getBody().contains('assertion'), req.getBody());
             
            res.setStatusCode(200);
            res.setBody('{"scope":"api","access_token":"' + FAKE_TOKEN + '"}');
 
            return res;
        }
    }
 
    @isTest
    static void test() {
         
        Jwt.Configuration config = new Jwt.Configuration();
        config.jwtUsername = 'meatloaf1111jp@gmail.com';
        config.jwtSigningCertificateName = PRE_CREATED_CERTIFICATE_NAME;
        config.jwtHostname = 'login.salesforce.com';
        config.jwtConnectedAppConsumerKey = '3MVG9ZL0ppGP5UrDoBpD5tRcr5XGywdZ0z9g3Zgap.r899kJknTrquR_8ZODH1HI5Q8RtrURN6m5mhCo34Ss_';
         
        Test.setMock(HttpCalloutMock.class, new Mock());
        Test.startTest();
        String accessToken = new Jwt(config).requestAccessToken();
        Test.stopTest();
        System.assertEquals(FAKE_TOKEN, accessToken);
    }
}
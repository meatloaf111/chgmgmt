//Generated by wsdl2apex

public class AsyncWSEchoManager {
    public class echoResponse_elementFuture extends System.WebServiceCalloutFuture {
        public String getValue() {
            WSEchoManager.echoResponse_element response = (WSEchoManager.echoResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class AsyncEchoManager {
        public String endpoint_x = 'https://ap2.salesforce.com/services/Soap/class/EchoManager';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        public WSEchoManager.AllowFieldTruncationHeader_element AllowFieldTruncationHeader;
        public WSEchoManager.SessionHeader_element SessionHeader;
        public WSEchoManager.DebuggingInfo_element DebuggingInfo;
        public WSEchoManager.CallOptions_element CallOptions;
        public WSEchoManager.DebuggingHeader_element DebuggingHeader;
        private String AllowFieldTruncationHeader_hns = 'AllowFieldTruncationHeader=http://soap.sforce.com/schemas/class/EchoManager';
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/schemas/class/EchoManager';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/schemas/class/EchoManager';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/schemas/class/EchoManager';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/schemas/class/EchoManager';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/schemas/class/EchoManager', 'WSEchoManager'};
        public AsyncWSEchoManager.echoResponse_elementFuture beginEcho(System.Continuation continuation,String text) {
            WSEchoManager.echo_element request_x = new WSEchoManager.echo_element();
            request_x.text = text;
            return (AsyncWSEchoManager.echoResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncWSEchoManager.echoResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/EchoManager',
              'echo',
              'http://soap.sforce.com/schemas/class/EchoManager',
              'echoResponse',
              'WSEchoManager.echoResponse_element'}
            );
        }
    }
}
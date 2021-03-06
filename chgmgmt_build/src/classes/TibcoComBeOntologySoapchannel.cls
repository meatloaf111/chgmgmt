//Generated by wsdl2apex

public class TibcoComBeOntologySoapchannel {
    public class HTTPConnection {
        public String endpoint_x = 'http://localhost:9696/Channels/HTTP';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'www.tibco.com/be/ontology/SOAPChannel', 'TibcoComBeOntologySoapchannel', 'http://www.tibco.com/TNT/webservices/', 'TibcoComTntWebservices'};
        public Double Divide(Double a,Double b) {
            TibcoComTntWebservices.Divide_element request_x = new TibcoComTntWebservices.Divide_element();
            request_x.a = a;
            request_x.b = b;
            TibcoComTntWebservices.DivideResponse_element response_x;
            Map<String, TibcoComTntWebservices.DivideResponse_element> response_map_x = new Map<String, TibcoComTntWebservices.DivideResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'DivideDestination',
              'http://www.tibco.com/TNT/webservices/',
              'Divide',
              'http://www.tibco.com/TNT/webservices/',
              'DivideResponse',
              'TibcoComTntWebservices.DivideResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.DivideResult;
        }
        public Double Add(Double a,Double b) {
            TibcoComTntWebservices.Add_element request_x = new TibcoComTntWebservices.Add_element();
            request_x.a = a;
            request_x.b = b;
            TibcoComTntWebservices.AddResponse_element response_x;
            Map<String, TibcoComTntWebservices.AddResponse_element> response_map_x = new Map<String, TibcoComTntWebservices.AddResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'AddDestination',
              'http://www.tibco.com/TNT/webservices/',
              'Add',
              'http://www.tibco.com/TNT/webservices/',
              'AddResponse',
              'TibcoComTntWebservices.AddResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.AddResult;
        }
        public Double Multiply(Double a,Double b) {
            TibcoComTntWebservices.Multiply_element request_x = new TibcoComTntWebservices.Multiply_element();
            request_x.a = a;
            request_x.b = b;
            TibcoComTntWebservices.MultiplyResponse_element response_x;
            Map<String, TibcoComTntWebservices.MultiplyResponse_element> response_map_x = new Map<String, TibcoComTntWebservices.MultiplyResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'MultiplyDestination',
              'http://www.tibco.com/TNT/webservices/',
              'Multiply',
              'http://www.tibco.com/TNT/webservices/',
              'MultiplyResponse',
              'TibcoComTntWebservices.MultiplyResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.MultiplyResult;
        }
        public Double Subtract(Double a,Double b) {
            TibcoComTntWebservices.Subtract_element request_x = new TibcoComTntWebservices.Subtract_element();
            request_x.a = a;
            request_x.b = b;
            TibcoComTntWebservices.SubtractResponse_element response_x;
            Map<String, TibcoComTntWebservices.SubtractResponse_element> response_map_x = new Map<String, TibcoComTntWebservices.SubtractResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'SubtractDestination',
              'http://www.tibco.com/TNT/webservices/',
              'Subtract',
              'http://www.tibco.com/TNT/webservices/',
              'SubtractResponse',
              'TibcoComTntWebservices.SubtractResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.SubtractResult;
        }
    }
}
public class EvaluateCandidateREST {
    public class Candidate{
		public ID id;
        public String Candidate_Id;
        public String Name;
        public String Evaluation;
        public Integer Point;
    }
    	
    public class EvCandidate{
        public ID id;
		public String Candidate_Id {get;set;} 
		public String Name {get;set;} 
		public String Evaluation {get;set;} 
		public Integer Point {get;set;} 

    }
    
    public Set<Integer> EvaluateCandidateREST(List<EvaluateCandidateREST.Candidate> candidate){
		//Map<String, Map<String,String>> concept = null;
       // List<ResultID> listIds = null;
        //List<EvCandidate> output = null;
        
        Map<String,Object> jsonmap = new Map<String,Object>();
		Map<String,Object> jsonmap_parent = new Map<String,Object>();
		String typestring ='www.tibco.com/be/ontology/Concepts/EvCandidate';
        for(EvaluateCandidateREST.Candidate cand:candidate){
            jsonmap.put('Candidate_Id',cand.Candidate_Id);
            jsonmap.put('Evaluation',cand.Evaluation);
            jsonmap.put('Name',cand.Name);
            jsonmap.put('type',typestring);
            jsonmap.put('ExtId',cand.Id);
        }
        jsonmap_parent.put('EvCandidate',jsonmap);
        
        
        Set<Integer> ids = new Set<Integer>();
        HTTP http = new HTTP();
        String endpoint = 'http://52.42.18.206:9200/setInfo';
        HTTPRequest req = new HTTPRequest();
        req.setEndpoint(endpoint);
        req.setMethod('POST');
        req.setHeader('Accept', 'application/json');
        req.setHeader('Content-Type','application/json');
        req.setBody(JSON.serialize(jsonmap_parent));
        System.debug('Request: '+req.getBody());
        HTTPResponse resp = http.send(req);
        
        if(resp.getStatusCode()==200){
            System.debug('Response: ' + resp.getBody());
            //concept = (Map<String, Map<String,String>>)JSON.deserialize(resp.getBody(),Map<String,Map<String,String>>.class);
            //System.debug(concept);
            //output = (List<EvCandidate>) json.deserialize(resp.getBody(),List<EvCandidate>.class);  
            //listIds = (List<ResultID>)concept.get('Id');
            Map<String,Object> results = (Map<String,Object>)JSON.deserializeUntyped(resp.getBody());
    			for(Object obj:results.values()){
			        Map<String,Object> mapobj =(Map<String,Object>)obj;
			        Map<String,Object> attributes = (Map<String,Object>)mapobj.get('attributes');
			        System.debug(attributes);
			        Integer id = (Integer)attributes.get('Id');
			        system.debug(id);
                    ids.add(id);
			    }
        }else{
            Error_Log__c log = new Error_log__c();
            log.trace__c = '';
            log.trace__c += 'Error: ' + resp.getStatusCode() + 'while connecting to:' + endpoint + '\r\n';
            log.trace__c += resp.getStatus() + '\r\n';
            log.trace__c += resp.getBody() + '\r\n';
            insert log;
        }
        //return output;
        //return listIds;
        return ids;

            
    }
    
    public List<EvCandidate> GetCandidateInfo( Set<Integer> ids){
        Map<String,Object> jsonmap = new Map<String,Object>();
		Map<String,Object> jsonmap_parent = new Map<String,Object>();
		String typestring ='www.tibco.com/be/ontology/Concepts/EvCandidate';
        for(Integer id:ids){
            jsonmap.put('Id',id);
            jsonmap.put('type',typestring);
        }
        jsonmap_parent.put('EvCandidate',jsonmap);
        
        
        List<EvCandidate> output = new List<EvCandidate>();
         HTTP http = new HTTP();
        String endpoint = 'http://52.42.18.206:9200/getInfo';
        HTTPRequest req = new HTTPRequest();
        req.setEndpoint(endpoint);
        req.setMethod('POST');
        req.setHeader('Accept', 'application/json');
        req.setHeader('Content-Type','application/json');
        req.setBody(json.serialize(jsonmap_parent));
        System.debug('Request: '+req.getBody());
        HTTPResponse resp = http.send(req);
        
        if(resp.getStatusCode()==200){
            System.debug('Response: ' + resp.getBody());
            Map<String,Object> results = (Map<String,Object>)JSON.deserializeUntyped(resp.getBody());
            EvCandidate resEv = new EvCandidate();
    		for(Object obj:results.values()){
			        Map<String,Object> mapobj =(Map<String,Object>)obj;
			        String Candidate_Id = (String)mapobj.get('ExtId');
                	Integer point = (Integer)mapobj.get('Point');
                	resEv.Id = (ID)Candidate_Id;
                	resEv.Point = point;
                	output.add(resEv);
            }
        }else{
            Error_Log__c log = new Error_log__c();
            log.trace__c = '';
            log.trace__c += 'Error: ' + resp.getStatusCode() + 'while connecting to:' + endpoint + '\r\n';
            log.trace__c += resp.getStatus() + '\r\n';
            log.trace__c += resp.getBody() + '\r\n';
            insert log;
        }
        return output;
    }

}
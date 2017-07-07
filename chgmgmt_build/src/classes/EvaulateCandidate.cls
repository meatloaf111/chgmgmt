public class EvaulateCandidate {
    
    @future(callout=true)
    public static void EvaluateCandidateREST(Set<ID> ids){
        try{
        Map<ID, Candidate__c> mapCands = findCandidates(ids);
        List<EvaluateCandidateREST.Candidate> listCandidate = new List<EvaluateCandidateREST.Candidate>();
        for (Candidate__c cand : mapCands.values()){
            EvaluateCandidateREST.Candidate can = new EvaluateCandidateREST.Candidate();
            can.Candidate_Id = cand.Name;
            can.Name = cand.Name__c;
            can.Evaluation = cand.Evaluation__c;
            can.Point = (Integer)cand.point__c;
            can.Id = cand.Id;
            listCandidate.add(can);
        }
        
        EvaluateCandidateREST restPort = new EvaluateCandidateREST();
        Set<Integer> IdResult = restPort.EvaluateCandidateREST(listCandidate);
        System.debug(IdResult);
                 
         List<EvaluateCandidateREST.EvCandidate> listResult = restPort.GetCandidateInfo(IdResult);   
        
        for(EvaluateCandidateREST.EvCandidate result : listResult){
            Candidate__c cand = mapCands.get(result.Id);
            cand.point__c = (Decimal)result.Point;

        }
        
        update mapCands.values();
        }catch(Exception ex){
            System.debug('ERROR:' +ex);
            Error_Log__c log = new Error_Log__c();
            log.trace__c = ex.getCause() + '\n' + ex.getMessage();
            insert log;
        }
    }
    
    
    private static Map<ID, Candidate__c> findCandidates(Set<ID> ids){
        	Map<ID, Candidate__c> output;
        output = new Map<ID, Candidate__c>([SELECT ID,Name,Name__c,Evaluation__c,point__c from candidate__c where id in :ids]);
        return output;
    }
    


}
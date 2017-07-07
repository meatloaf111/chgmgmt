@isTest
public class CandidateEvaluationTest {
    public static void testEvaluateCandidate(){
		Candidate__c cand = new Candidate__c(Name__c='John',Evaluation__c='D',Point__c=0);
        Set<Id> ids = new Set<Id>();
        ids.add(cand.id);
        EvaulateCandidate.EvaluateCandidateREST(ids);
        
		        
    }

}
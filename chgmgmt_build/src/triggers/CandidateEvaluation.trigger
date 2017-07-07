trigger CandidateEvaluation on Candidate__c (after insert) {
    Set<ID> ids = new Set<ID>();
    for (Candidate__c newCand: trigger.new){
        if(trigger.isInsert){
			ids.add(newCand.id);
        }
    }
    
         if((trigger.isAfter) && (ids.size() >0)){
            EvaulateCandidate.EvaluateCandidateREST(ids);
        }

}
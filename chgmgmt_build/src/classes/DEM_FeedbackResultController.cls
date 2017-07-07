public class DEM_FeedbackResultController {
    public PDS__c pds{get;set;}
    public Boolean showError{get;set;}
    public DEM_FeedbackResultController(ApexPages.StandardController controller){
        showError = false;
        pds = (PDS__c)controller.getRecord();
        List<feedback360__c> feedbacks = [Select Q1__c, Q2__c, Q3__c From feedback360__c Where PDS__c = :pds.Id];
        for(feedback360__c fb : feedbacks){
            if(fb.Q1__c == null && fb.Q2__c == null && fb.Q3__c == null){
                showError = true;
            }
        }
    }
}
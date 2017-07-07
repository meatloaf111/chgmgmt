global class BatchUpdateCommissions implements Database.Batchable<sObject>, Database.AllowsCallouts{

    global final String AsOfTime;
    
    global BatchUpdateCommissions(String AsOf){
        this.AsOfTime = AsOf;
    }
    
    global BatchUpdateCommissions(){
        this.AsOfTime = null;
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT Id, Account.AccountNumber, Opportunity_Number__c, StageName, Commisions_Amount__c FROM Opportunity where IsClosed =True';
            if(AsOfTime != null){
                	query += ' AND CreatedDate ' + AsOfTime;
            }
        	System.debug(query);
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
        System.debug(scope);
        List<Opportunity> opplist = new List<Opportunity>();
        onboarding.GetCommisionsPort cs = new onboarding.GetCommisionsPort();
        
        for(Sobject s : scope){
            Opportunity o = (Opportunity)s;
            if(o.StageName == 'Closed Won'){
                Double value = cs.getCommissions(o.Opportunity_Number__c,o.Account.AccountNumber);
                o.Commisions_Amount__c = value;
                opplist.add(o);
            }
        }
        	update opplist;
            }
        

    
    global void finish(Database.BatchableContext BC){
        System.debug(BC);
    }
    
    


}
trigger CreateOpportunity on Account (after insert) {

    If(Trigger.isAfter && Trigger.isInsert){
    Opportunity opp = new Opportunity();
    List<Opportunity> opps = new List<Opportunity>();
        
     Drivers__c drv = new Drivers__c();
     List<Drivers__c> drvs = new List<Drivers__c>();

    for(Account ac: trigger.new){
         opp.AccountId = ac.Id;
        opp.Name='Opp';
        opp.CloseDate=Date.today();
        opp.StageName='Closed Won';
        //opp.MyExtID__c='AAAA';
		opps.add(opp);
    }
    insert opps;
    
        for(Opportunity opp_parent:opps){
            drv.Opportunity__c = opp_parent.Id;
            drv.Name='Drv';
            drvs.add(drv);
        }
        insert drvs;
        
        
    }
    

}
public class OpportunityManualShare {

    @InvocableMethod(label='Share Opportunities' description='Share Opportunities')	
    public static void manualShareRead(){
    
    List<Opportunity> opplist = [Select Id,Name from opportunity where amount > 100000000];
  
    List<OpportunityShare> oppShareList = new List<OpportunityShare>();

	//User usr = [Select Id, name from user limit 1];//i will be querying the user involved in real code

for(Opportunity opp : oppList) {
    System.debug('opp id:' + opp.Id);
    OpportunityShare oppShare = new OpportunityShare();

    oppShare.OpportunityAccessLevel = 'Read';
    oppShare.OpportunityId = opp.Id;
    oppShare.UserOrGroupId = '00G6F000003LddAUAS';
    
    System.debug('OppShare value are set');
    
    oppShareList.add(oppShare);

    System.debug('Opportunity shared');
}

insert oppShareList;
    }
}
@isTest
public class CreateOpportunityTriggerTest {
    @isTest
    public static void CreateOpportunityLogicTest(){
        Account ac = new Account(Name='Test Account',SLA__c='Gold',SLASerialNumber__c='AAA');
        insert ac;
        
        List<Account> acc = [select Id from Account where Name='Test Account'];
        system.debug(acc);
        
        Opportunity op = [select Id,Name from Opportunity where AccountId = :Acc[0].Id];
        If(op != null){
            system.debug(op.Name);
        }
        
        Drivers__c drv = [select Id,Name from Drivers__c where Opportunity__c =:op.Id];
        if(drv != null){
            	system.debug(drv.Name);
        }
        
    }
}
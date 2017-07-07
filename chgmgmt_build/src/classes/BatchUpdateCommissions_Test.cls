@isTest
public with sharing class BatchUpdateCommissions_Test {
    @isTest public static void testbatch(){
        BatchUpdateCommissions buc = new BatchUpdateCommissions();

         createOpty();
        //Test.setMock(WebServiceMock.class, new MockCommissionsCall());
        
        Test.startTest();
        onboarding.mock = new MockCommissionsCall();

        //Commissionservice.mock = new MockCommissionsCall();

        
        Database.executeBatch(buc,1);
        
        List<Opportunity> olist = [select Id, Name, Commisions_Amount__c from opportunity];
        System.assertEquals(olist[0].Commisions_Amount__c,null);
        Test.stopTest();
        
        olist = [SELECT Id,Name,Commisions_Amount__c FROM Opportunity];
        
        System.assertEquals(olist[0].Commisions_Amount__c, 3245.4455);
        
    }
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
    @isTest  public static void createOpty(){
        Account a = new Account(Name='Test Acct',AccountNumber='3456');
        insert a;
        Opportunity o = new Opportunity(Name='Test opty1',StageName='Closed Won',AccountId=a.Id,CloseDate=Date.today());
        insert o;
    }

    @isTest public static void test(){
        createOpty();
        
        ExecuteCommissionsBatch ex = new ExecuteCommissionsBatch();
        Test.startTest();
        Test.setMock(WebServiceMock.class, new MockCommissionsCall());
        
        String jobId = System.schedule('ScheduleApexClassTest',CRON_EXP,ex);
        
            // Get the information from the CronTrigger API object
      CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered,
         NextFireTime
         FROM CronTrigger WHERE id = :jobId];

      // Verify the expressions are the same
      System.assertEquals(CRON_EXP,
         ct.CronExpression);

      // Verify the job has not run
      System.assertEquals(0, ct.TimesTriggered);

      // Verify the next time the job will run
      System.assertEquals('2022-03-15 00:00:00',
         String.valueOf(ct.NextFireTime));
      // Verify the scheduled job hasn't run yet.
      Opportunity[] olist = [SELECT Id,  Commisions_Amount__c  FROM Opportunity WHERE  Commisions_Amount__c  = NULL];
      System.assertEquals(olist.size(),1);
      Test.stopTest();

      // Now that the scheduled job has executed after Test.stopTest(),
      //   fetch the new updates (which won't happen since the schedule won't run the batch process).
      olist = [SELECT Id,  Commisions_Amount__c  FROM Opportunity WHERE  Commisions_Amount__c  = NULL];
      System.assertEquals(olist.size(), 1);

    }
    
}
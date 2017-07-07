@isTest
public class TestRestrictContactByName {
    @isTest
    static void TestRestrictContractByInvalidName(){
        
    Contact ctact = new Contact(LastName='INVALIDNAME');
    insert ctact;
  
     
    Test.startTest();
    Database.SaveResult result = Database.insert(ctact,false);
    Test.stopTest();
     
     System.assert(!result.issuccess());
     System.assert(result.getErrors().size() > 0);
      System.assertEquals('The Last Name INVALIDNAME is not allowed for DML',
                    result.getErrors()[0].getMessage());
        
        
    }
}
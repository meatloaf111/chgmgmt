@isTest
public class PrinterUserTrigger_Test {
    
    private static testMethod void testPrinterUserTrigger(){
       

    		
            List<User> ulist = new List<User>();
      	
            for(Integer i = 0 ; i<100; i++){
                ulist.add(new User(UserName='WaveTestuser'+i+'@user.com', LastName='user'+i,Alias='user'+i,isActive=True,Email='user'+i+'@user.com'
                                  ,CommunityNickName='user'+i,TimeZoneSidKey='Asia/Tokyo', LocaleSidKey='ja_JP', EmailEncodingKey='ISO-2022-JP',
                                   ProfileId='00e28000001k2WKAAY', LanguageLocaleKey='ja',Department='Printers'));
            }
  
			Test.startTest();
            insert ulist;
        	Test.stopTest();

    }

}
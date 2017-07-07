@isTest
private class TestVerifyDate{
    @isTest static void VerifyDateWithin30Days(){
        Date date1 = date.newInstance(2016,9,30);
        Date date2 = date.newInstance(2016,10,1);
        
        Date resDate = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(date2, resDate);
    }
    
        @isTest static void VerifyDateBeyond30Days(){
        Date date1 = date.newInstance(2016,9,30);
        Date date2 = date.newInstance(2016,12,1);
        
        Date resDate = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(date1, resDate);
            
    }
        
}
public class Invoice{
    private final Invoice__c inv;
    public Invoice(){
    
    inv = [select id,name from Invoice__c where id = :ApexPages.currentPage().getParameters().get('Id')];
    
    
    }
    
    public Invoice__c getInvoice(){
        return inv;
     }
     
  

}
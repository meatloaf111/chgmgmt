public class InvoiceExtension {
    private final Invoice__c inv;
    
    public string StreetName1{get;set;}
    public string StreetName2{get;set;}
    public string City{get;set;}
    public string State{get;set;}
    public string Zipcode{get;set;}
    
    public InvoiceExtension(Apexpages.StandardController stdController){
        this.inv = (Invoice__c)stdController.getRecord();
        Opportunity opp = [select id,Account.Name,Account.BillingAddress from opportunity where id=:this.inv.Opportunity__c];
        //OpprotunityProduct opp = [select id,productcode from OpportunityProduct where opportunity = :inv.Opportunity];
    }
    
    

}
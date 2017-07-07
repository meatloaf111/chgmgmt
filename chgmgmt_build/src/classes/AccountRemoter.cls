global with sharing class  AccountRemoter{

    public String accountname{get; set;}
    public static Account account{get; set;}
    public AccountRemoter(){}
    
    @RemoteAction
    global static Account getAccount(String accountName){
        account = [select Id, Name, Phone, Type, NumberOfEmployees
                        FROM Account where Name = :accountName];
        return account;
        }


}
public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(String Name){
        List<List< SObject>> searchList = [FIND :Name IN ALL FIELDS 
                                          RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        Contact[] cts = (Contact[])searchList[0];
        Lead[] lds = (Lead[])searchList[1];
        
        return searchList;
    }
}
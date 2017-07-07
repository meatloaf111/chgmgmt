public class ContactSearch {
    public static List<Contact> searchForContacts(String LastName, String ZipCode){
  		Contact[] cts = [SELECT ID,Name from Contact where LastName=:LastName and MailingPostalCode=:ZipCode];
        return cts;
    }
}
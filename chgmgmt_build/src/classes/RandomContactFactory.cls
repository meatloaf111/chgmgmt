public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer NumContacts, String Name){
        List<Contact> contacts = new list<Contact>();
        
          for(Integer i=0;i<numContacts;i++) {
            Contact a = new Contact(FirstName='Test ' + i);
            contacts.add(a);
        }
        
        return contacts;
    }
}
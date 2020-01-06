public class AddPrimaryContact implements Queueable {

    private Contact contact;
    private String stateAbbreviation;

    public AddPrimaryContact(Contact record, String state) {
        this.contact = record;
        this.stateAbbreviation = state;
    }

    public void execute(QueueableContext context) {
        List<Account> accts = [SELECT Name, BillingState FROM Account WHERE BillingState = :stateAbbreviation];
        List<Contact> newContacts = new List<Contact>();
        for (Account acct : accts) {
            Contact cont = contact.clone(false,false,false,false);
            cont.AccountId = acct.id;
            newContacts.add(cont);
        }
        insert newContacts;
    }
}

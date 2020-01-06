@isTest
public class AddPrimaryContactTest {
    @TestSetup
    static void setup(){
        List<Account> accts = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            accts.add(new Account(Name='Account ' + i, BillingState='NY'));
            accts.add(new Account(Name='Account ' + i, BillingState='CA'));
        }
        insert accts;
    }

    static testmethod void testQueuable() {
        Contact cont = new Contact(LastName='Test');
        insert cont;
        AddPrimaryContact apc = new AddPrimaryContact(cont, 'CA');
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();
    }
}

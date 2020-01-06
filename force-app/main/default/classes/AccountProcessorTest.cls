@isTest
public class AccountProcessorTest {
    @isTest
    public static void AccountProcessorTest() {
        System.debug('Run Test');
        Account[] accts = TestDataFactory.createAccountsWithOpps(1,1);
        System.debug(accts);
        System.debug(new Map<Id, Account>(accts));
        Test.startTest();
        AccountProcessor.countContacts(new List<Id> (new Map<Id, Account>(accts).keySet()));
        Test.stopTest();
    }
}

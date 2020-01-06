public class AccountProcessor {
    @future
    public static void countContacts(List<Id> recordIds) {
        System.debug(recordIds);
        List<Account> accts = [SELECT Name, Number_of_Contacts__c, (SELECT FirstName,LastName FROM Contacts) FROM Account WHERE Id IN :recordIds];
        System.debug('countContacts are called');
        for (Account a : accts) {
            System.debug(a.Number_of_Contacts__c);
            System.debug(a.Contacts.size());
            a.Number_of_Contacts__c = a.Contacts.size();
            System.debug('a.Number_of_Contacts__c ' + a.Number_of_Contacts__c);
        }
        update accts;
    }
}
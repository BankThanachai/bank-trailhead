@isTest
private class LeadProcessorTest {
    @TestSetup
    static void setup(){
        List<Lead> leads = new List<Lead>();
        for (integer i=0; i<200; i++) {
            leads.add(new Lead(
                Company='American Banking Corp.',
                LastName='Wongya ' + i,
                Status='Working - Contacted'));
        }
        insert leads;
    }

    static testmethod void test() {        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
    }
}

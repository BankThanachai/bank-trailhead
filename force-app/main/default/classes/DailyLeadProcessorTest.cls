@isTest
private class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 * * ? *';
    static testmethod void testScheduledJob() {
        
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(
                Company='Dickenson plc',
                LastName='Wongya',
                Status='Working - Contacted'
            ));
        }
        insert leads;

        Test.startTest();

        String jobId = System.schedule('DailyLeadProcessorTest',
            CRON_EXP, 
            new DailyLeadProcessor());         
        // Verify the scheduled job has not run yet.
        // xxx
        
        Test.stopTest();
        
    }
}

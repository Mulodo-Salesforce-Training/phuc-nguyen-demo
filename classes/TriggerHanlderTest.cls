@isTest
private class TriggerHanlderTest {
	@isTest static void testTriggerHandler() {
		// Implement test code
        TriggerHandler th = new TriggerHandler( true, true, true, true, true, false, true, null, null, null, null, null );
        th = new TriggerHandler( true, true, true, true, false, true, true, null, null, null, null, null );
        th = new TriggerHandler( false, true, true, true, true, false, true, null, null, null, null, null );
        th = new TriggerHandler( false, false, true, true, true, false, true, null, null, null, null, null );
    }
}
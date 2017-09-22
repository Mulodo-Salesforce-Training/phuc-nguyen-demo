@isTest
private class AccountRestClientTest {
	@isTest static void testListAccount () {
        AccountRestClient acc = new AccountRestClient();

        Test.setMock( HttpCalloutMock.class, new MockHttpResponse() );
        System.assertNotEquals( null, acc.listAccount );
        System.assertNotEquals( null, acc.listAccount.records );
        System.assertEquals( 'Phuc Nguyen', acc.listAccount.records[0].Name );
	}

}
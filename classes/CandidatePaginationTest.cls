@isTest
private class CandidatePaginationTest {
    @isTest static void testCanPag () {
        // Implement test code
        CandidatePagination cp = new CandidatePagination();
        System.assertEquals( null, cp.toBeginning() );
        System.assertEquals( null, cp.toEnd() );
        System.assertEquals( null, cp.toPrevious() );
        System.assertEquals( null, cp.toNext() );
        System.assertEquals( true, cp.getDisablePrevious() );
        System.assertEquals( true, cp.getDisableNext() );
        System.assertEquals( 0, cp.getCurrentPage() );

        CandidatePagination cp1 = new CandidatePagination();
        System.assertEquals( null, cp1.toBeginning() );
        System.assertEquals( null, cp1.toNext() );
        System.assertEquals( null, cp1.toPrevious() );
        System.assertEquals( null, cp1.toEnd() );
        System.assertEquals( true, cp1.getDisablePrevious() );
        System.assertEquals( true, cp1.getDisableNext() );
        System.assertEquals( 0, cp1.getCurrentPage() );

        CandidatePagination cp2 = new CandidatePagination();
        System.assertEquals( null, cp2.toBeginning() );
        System.assertEquals( null, cp2.toPrevious() );
        System.assertEquals( true, cp2.getDisablePrevious() );
        System.assertEquals( null, cp2.toNext() );
        System.assertEquals( null, cp2.toEnd() );
        System.assertEquals( true, cp2.getDisableNext() );
        System.assertEquals( 0, cp2.getCurrentPage() );
    }
}
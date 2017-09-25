@isTest
private class CandidatePaginationTest {
	@isTest static void testCanPag () {
		// Implement test code
        CandidatePagination cp = new CandidatePagination();
        cp.toBeginning();
        cp.toPrevious();
        cp.toNext();
        cp.toEnd();
        cp.getDisablePrevious();
        cp.getDisableNext();
        cp.getCurrentPage();
	}
}
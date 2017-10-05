@isTest
private class CandidateRegisterTest {
    @isTest static void testCandidateRegister() {
            String firstName     = 'phuc';
            String lastName      = 'nguyen';
            String email         = 'v@g.com';
            String phone         = '0123456789';
            String street        = 'dd';
            String city          = 'mt';
            String stateProvince = 'tg';
            // Implement test code
            String name          = CandidateRegister.toRegister( firstName, lastName, email, phone, street, city, stateProvince );
            System.assertEquals( 'phuc', name );
            name                 = CandidateRegister.toRegister( null, lastName, email, phone, street, city, stateProvince );
            System.assertNotEquals( 'phuc', name );
    }
}
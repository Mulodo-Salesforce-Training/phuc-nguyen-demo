public with sharing class CandidateRegister {
    @RemoteAction
    public static String toRegister ( Candidate__c candidate ) {
        try {
            insert candidate;
        } catch ( DmlException ex ) {
        	System.debug( ex.getMessage() );
            return ex.getMessage();
        }
        return candidate.Id;
    }
}
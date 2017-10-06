public with sharing class CandidateRegister {
    @RemoteAction
    public static String toRegister ( Candidate__c candidate ) {
        try {
            insert candidate;
        } catch ( DmlException ex ) {
            return ex.getMessage();
        }
        return candidate.Id;
    }
}
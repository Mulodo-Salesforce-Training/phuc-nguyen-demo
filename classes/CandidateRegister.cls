public with sharing class CandidateRegister {
    String firstName { set; get; }

    public CandidateRegister ( ApexPages.StandardController stdController ) {}

    @RemoteAction
    public static String toRegister ( String firstName,
                                      String lastName,
                                      String email,
                                      String phone,
                                      String street,
                                      String city,
                                      String stateProvince ) {
        Candidate__c candidate      = new Candidate__c();

        candidate.First_Name__c     = firstName;
        candidate.Last_Name__c      = lastName;
        candidate.Email__c          = email;
        candidate.Phone__c          = phone;
        candidate.Street__c         = street;
        candidate.City__c           = city;
        candidate.State_Province__c = stateProvince;

        try {
            insert candidate;
        } catch ( Exception ex ) {
            return ex.getMessage();
        }

        return firstName;
    }
}
public class CustomCandidateController {
	@RemoteAction
	public static List<Candidate__c> getListCandidates ( String searchText ) {
		String searchString              = '%' + searchText + '%';
		List<Candidate__c> listCandidate = [SELECT Id, City__c, First_Name__c, Last_Name__c FROM Candidate__c WHERE First_Name__c LIKE :searchString];
		return listCandidate;
	}

	@RemoteAction
	public static List<Candidate__c> removeCandidate ( Id id, String searchText ) {
		Candidate__c c = [SELECT First_Name__c FROM Candidate__c WHERE Id =: id];
		delete c;
		return getListCandidates( searchText );
	}
}
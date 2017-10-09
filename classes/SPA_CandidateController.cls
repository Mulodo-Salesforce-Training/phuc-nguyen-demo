public class SPA_CandidateController {
	public String ip { get; set; }
	public SPA_CandidateController() {
		ip = ApexPages.currentPage().getHeaders().get('X-Salesforce-SIP');
	}
	@RemoteAction
	public static Integer getCount () {
		Integer countTotal = [SELECT count() FROM Candidate__c];
		return countTotal;
	}
	@RemoteAction
	public static String getCurrentCountry ( String ip ) {
		Utils utils            = new Utils();

		String format          = 'http://ip-api.com/json/{0}';
		List< String > filters = new String[]{ ip };

		String weatherApiUrl   = String.format(format, filters);
		System.debug( weatherApiUrl );
		String method          = 'GET';
		String author, body    = '';
		String res             = utils.execRestApi( weatherApiUrl, method, author, body );
		return weatherApiUrl;
	}

	@RemoteAction
	public static Json getWeather () {


		return null;
	}
}
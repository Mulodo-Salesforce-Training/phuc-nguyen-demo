public class SPA_CandidateController {
	public String ip { get; set; }
	public SPA_CandidateController() {
		ip = ApexPages.currentPage().getHeaders().get('X-Salesforce-SIP');
	}

	@RemoteAction
	public static Boolean remove ( Id id ) {
		Candidate__c c = [SELECT Id, First_Name__c, Last_Name__c, Phone__c, Email__c FROM Candidate__c WHERE Id =: id];
		try {
			delete c;
			return true;
		}
		catch ( DmlException e ) {
			return false;
		}
	}

	@RemoteAction
	public static Candidate__c getById ( Id id ) {
		Candidate__c c = [SELECT Id, First_Name__c, Last_Name__c, Phone__c, Email__c FROM Candidate__c WHERE Id =: id];
		return c;
	}

	@RemoteAction
	public static List< Candidate__c > getList () {
		List< Candidate__c > lc = [SELECT Id, First_Name__c, Last_Name__c, Phone__c, Email__c FROM Candidate__c];
		return lc;
	}

	@RemoteAction
	public static Integer getCount () {
		Integer countTotal = [SELECT count() FROM Candidate__c];
		return countTotal;
	}

	@RemoteAction
	public static String getWeather ( String ip ) {
		Utils utils            = new Utils();
		// get location
		String format          = 'http://ip-api.com/json/{0}';
		List< String > filters = new String[]{ ip };

		String weatherApiUrl   = String.format(format, filters);
		String method          = 'GET';
		String author, body    = '';
		String res             = utils.execRestApi( weatherApiUrl, method, author, body );
		Location location      = ( Location ) JSON.deserialize( res, SPA_CandidateController.Location.class );
		// get weather
		String appId           = 'ea77eec72392d5163c6c06be812dff37';
		format                 = 'https://api.openweathermap.org/data/2.5/weather?' + 'q={0}&' + 'appid={1}';
        filters                = new String[]{ location.regionName, appId };
        String restUrl         = String.format( format, filters );
        // Deserialize obtained json res
        res                    = utils.execRestApi( restUrl, method, author, body );
        //WeatherInfoDao info = ( WeatherInfoDao ) JSON.deserialize( res, SPA_CandidateController.WeatherInfoDao.class );
        return res;
	}

	public class Location {
		public String regionName  { get; set; }
		public String countryCode { get; set; }
	}
}
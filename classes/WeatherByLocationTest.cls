@isTest
private class WeatherByLocationTest {
	@isTest static void weatherMethod() {

		// Set mock callout class
        Test.setMock( HttpCalloutMock.class, new WeatherMockHttpResponse() );

        		// Create & Insert a new Candidate to get Id & City(Location)
		Candidate__c can = new Candidate__c( City__c = 'Sai Gon' );

		insert can;

		// Put Id to page
		ApexPages.currentPage().getParameters().put( 'id', can.Id );

		// Define new instance for testing
		CandidateWeatherByLocation cwbl = new CandidateWeatherByLocation();

		CandidateWeatherByLocation.WeatherInfoDao wid = cwbl.weatherInfo;

		System.assertEquals( 10, wid.Coord.lon );
		System.assertEquals( 20, wid.Coord.lat );
		System.assertEquals( 'Sai Gon', can.City__c );

	}
}
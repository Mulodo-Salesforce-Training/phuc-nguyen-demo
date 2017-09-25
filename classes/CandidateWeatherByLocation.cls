public with sharing class CandidateWeatherByLocation {
    String location;
    public WeatherInfoDao weatherInfo {
        get {
            Utils utils          = new Utils();

            String format        = 'https://api.openweathermap.org/data/2.5/weather?q={0}&appid={1}';
            List<String> filters = new String[]{
                location,
                'ea77eec72392d5163c6c06be812dff37'
            };
            String restUrl = String.format( format, filters );
            System.debug(restUrl);
            String method   = 'GET';
            // Deserialize obtained json res
            String res      = utils.getRestfulWSNoAuthor( restUrl, method );
            return ( WeatherInfoDao ) JSON.deserialize( res, WeatherInfoDao.class );
        }
    }

    public CandidateWeatherByLocation () {
        ID id    = ApexPages.currentPage().getParameters().get( 'id' );
        location = [SELECT City__c FROM Candidate__c WHERE id = : id].City__c;
    }

    // Define object for weather repsone
    class WeatherInfoDao {
        public Coord coord          { get; }
        public Weather[] weather    { get; }
        public String base          { get; }
        public Main main            { get; }
        public Integer visibility   { get; }
        public Wind wind            { get; }
        public Clouds clouds        { get; }
        public Integer dt           { get; }
        public Sys sys              { get; }
        public Integer id           { get; }
        public String name          { get; }
        public Integer cod          { get; }
    }

    class Coord {
        public Double lon           { get; }
        public Double lat           { get; }
    }

    class Weather {
        public Integer id           { get; }
        public String main          { get; }
        public String description   { get; }
        public String icon          { get; }
    }

    class Main {
        public Double temp {
            get {
                return ( Integer ) this.temp / 10;
            }
            set;
        } //279.15
        public Integer pressure { get; }
        public Integer humidity { get; }
        public Double temp_min  { get; }
        public Double temp_max  { get; }
    }

    class Wind {
        public Double speed { get; }
        public Integer deg  { get; }
    }

    class Clouds {
        public Integer all { get; }
    }

    class Sys {
        public Integer type     { get; }
        public Integer id       { get; }
        public Double message   { get; }
        public String country   { get; }
        public Integer sunrise  { get; }
        public Integer sunset   { get; }
    }
}
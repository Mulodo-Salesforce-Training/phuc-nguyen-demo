public class CandidateWeatherByLocation {
    private String location;
    public WeatherInfoDao weatherInfo {
        get {
            Utils utils            = new Utils();

            String appId           = 'ea77eec72392d5163c6c06be812dff37';
            String format          = 'https://api.openweathermap.org/data/2.5/weather?'
                                   + 'q={0}&'
                                   + 'appid={1}';
            List< String > filters = new String[]{
                this.location,
                appId
            };

            String restUrl         = String.format( format, filters );
            String method          = 'GET';
            // Using get method and no need to use author so define as null
            String author, body    = null;
            // Deserialize obtained json res
            String res             = utils.execRestApi( restUrl, method, author, body );
            return ( WeatherInfoDao ) JSON.deserialize( res, WeatherInfoDao.class );
        }
    }

    public CandidateWeatherByLocation () {
        ID id         = ApexPages.currentPage().getParameters().get( 'id' );
        this.location = [SELECT City__c FROM Candidate__c WHERE id = : id].City__c;
    }

    // Define object for weather repsone
    public class WeatherInfoDao {
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

    public class Coord {
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
                return ( Integer ) temp / 10;
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
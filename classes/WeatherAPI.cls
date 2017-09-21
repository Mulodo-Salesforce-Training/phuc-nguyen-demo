public with sharing class WeatherAPI {
    public String location { get; set; }
    public WeatherInfoDao weatherInfo {
        get {
            RestApi rest     = new RestApi();
            String appId     = 'ea77eec72392d5163c6c06be812dff37';
            rest.url         = 'https://api.openweathermap.org/data/2.5/weather?q=' + this.location + '&appid=' + appId;
            rest.method      = 'GET';
            // Deserialize obtained json res
            String res       = rest.getResponse();
            this.weatherInfo = (WeatherInfoDao) JSON.deserialize(res, WeatherInfoDao.class);
            return this.weatherInfo;
        }
        set;
    }

    public WeatherAPI () {
        ID id         = ApexPages.currentPage().getParameters().get('id');
        this.location = [SELECT City__c FROM Candidate__c WHERE id = : id].City__c;
    }

    // Define object for weather repsone
    public class WeatherInfoDao {
        public Coord coord { get; set; }
        public Weather[] weather { get; set; }
        public String base { get; set; }
        public Main main { get; set; }
        public Integer visibility { get; set; }
        public Wind wind { get; set; }
        public Clouds clouds { get; set; }
        public Integer dt { get; set; }
        public Sys sys { get; set; }
        public Integer id { get; set; }
        public String name { get; set; }
        public Integer cod { get; set; }
    }
    class Coord {
        public Double lon { get; set; }
        public Double lat { get; set; }
    }
    class Weather {
        public Integer id { get; set; }
        public String main { get; set; }
        public String description { get; set; }
        public String icon { get; set; }
    }
    class Main {
        public Double temp {
            get {
                return (Integer) this.temp / 10;
            }
            set;
        } //279.15
        public Integer pressure { get; set; }
        public Integer humidity { get; set; }
        public Double temp_min { get; set; }
        public Double temp_max { get; set; }
    }
    class Wind {
        public Double speed { get; set; }
        public Integer deg { get; set; }
    }
    class Clouds {
        public Integer all { get; set; }
    }
    class Sys {
        public Integer type { get; set; }
        public Integer id { get; set; }
        public Double message { get; set; }
        public String country { get; set; }
        public Integer sunrise { get; set; }
        public Integer sunset { get; set; }
    }
}
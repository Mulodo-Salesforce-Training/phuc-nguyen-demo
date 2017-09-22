public class Utils {
    /*
        RestfulWS tools to connect and response json with author required
    */
    public String getRestfulWSWithAuthor ( String url, String method, String author ) {
        // Init Http Request ready to send to server API
        HttpRequest req = new HttpRequest();

        if ( url == null || url == '' ) {
            return '';
        }

        if ( method == null  || method == '' ) {
            return '';
        }

        if ( author == null  || author == '' ) {
            return '';
        }

        req.setEndpoint( url) ;
        req.setMethod( method );
        req.setHeader( 'Authorization', author );

        Http http = new Http();
        // Send req to server and get response
        HttpResponse res = http.send( req );
        // return json response
        return res.getBody();
    }

    /*
        RestfulWS tools to connect and response json without author required
    */
    public String getRestfulWSNoAuthor ( String url, String method ) {
        // Init Http Request ready to send to server API
        HttpRequest req = new HttpRequest();

        if ( url == null || url == '' ) {
            return '';
        }

        if ( method == null  || method == '' ) {
            return '';
        }

        req.setEndpoint( url) ;
        req.setMethod( method );

        Http http = new Http();
        // Send req to server and get response
        HttpResponse res = http.send( req );
        // return json response
        return res.getBody();
    }
}
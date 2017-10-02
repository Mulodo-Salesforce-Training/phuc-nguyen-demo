public class Utils {
    /*
        RestfulWS tools to connect and response json with author required
    */
    public String getRestfulWS ( String url, String method, String author, String body ) {
        // Init Http Request ready to send to server API
        HttpRequest req = new HttpRequest();

        if ( String.isBlank( url ) ) {
            return '';
        }

        if ( String.isBlank( method ) || ( method == 'POST' && String.isBlank( body ) ) ) {
            return '';
        }

        req.setEndpoint( url) ;
        req.setMethod( method );

        if ( String.isNotBlank( author ) ) {
            req.setHeader( 'Authorization', author );
        }

        req.setBody( body );

        Http http        = new Http();
        // Send req to server and get response
        HttpResponse res = http.send( req );
        // return json response
        return res.getBody();
    }
}
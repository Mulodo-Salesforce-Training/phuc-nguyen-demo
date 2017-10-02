public class Utils {
    /*
        # restfulWS help function to connect and response json
        # all method
        # with author support
    */
    public String execRestApi ( String url, String method, String author, String body ) {
        // init Http Request ready to send to server API
        HttpRequest req = new HttpRequest();

        // the url is blank
        if ( String.isBlank( url ) ) {
            return '';
        }

        // the method is blank or no body with put, post, delete, update
        if ( String.isBlank( method ) || ( method != 'GET' && String.isBlank( body ) ) ) {
            return '';
        }

        // the author is blank
        if ( String.isNotBlank( author ) ) {
            req.setHeader( 'Authorization', author );
        }

        // set reference for req
        req.setEndpoint( url) ;
        req.setMethod( method );
        req.setBody( body );

        Http http        = new Http();

        // send req to server and get response
        HttpResponse res = http.send( req );
        // return json response
        return res.getBody();
    }
}
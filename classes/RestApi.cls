public class RestApi {
    public String url {get; set;}
    public String method {get; set;}
    public String author {get; set;}

    public String getResponse () {
        // Init Http Request ready to send to server API
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod(method);

        if (author != null) {
            req.setHeader('Authorization', author);
        }

        Http http = new Http();
        // Send req to server and get response
        HttpResponse res = http.send(req);
        // return json response
        return res.getBody();
    }
}
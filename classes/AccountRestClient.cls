public with sharing class AccountRestClient {
    public AccountRest listAccount {
        get {
            Utils utils     = new Utils();

            String restUrl  = 'https://' + URL.getSalesforceBaseUrl().getHost() + '/services/data/v40.0/query/?q=SELECT+name+from+Account+limit+10';
            String method   = 'GET';
            // set authorization
            String author   = 'Bearer ' + userInfo.getSessionId();
            // Deserialize obtained json res
            String res   	= utils.getRestfulWSWithAuthor( restUrl, method, author );
            return ( AccountRest ) JSON.deserialize( res, AccountRest.class );
        }
    }

    // Inner class to parse Account json info

    public class AccountRest {
        public AccountRecords[] records { get; }
    }

    public class AccountRecords {
        public String Name { get; }
    }
}
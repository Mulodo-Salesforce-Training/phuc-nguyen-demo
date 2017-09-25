public with sharing class AccountRestClient {
    public AccountRest listAccount {
        get {
            Utils utils     = new Utils();
            String format   = 'https://{0}/services/data/v40.0/query/?q={1}';
            List<String> filters = new String[] {
                Url.getCurrentRequestUrl().getHost(),   // Get host
                'SELECT+Name+from+Account+Limit+10'     // Query
            };
            String restUrl = String.format( format, filters );
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
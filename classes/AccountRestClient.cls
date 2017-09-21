public with sharing class AccountRestClient {
    public AccountRest accountLst {
        get {
            RestApi rest    = new RestApi();
            rest.url        = 'https://' + URL.getSalesforceBaseUrl().getHost() + '/services/data/v40.0/query/' + '?q=SELECT+name+from+Account+limit+10';
            rest.method     = 'GET';
            // set authorization
            rest.author     = 'Bearer ' + userInfo.getSessionId();
            // Deserialize obtained json res
            String res   	= rest.getResponse();
            this.accountLst = (AccountRest) JSON.deserialize(res, AccountRest.class);
            return this.accountLst;
        }
        set;
    }

    // Inner class to parse Account json info
    public class AccountRest {
        public AccountRecords[] records {get; set;}
    }
    class AccountRecords {
        public String Name {get; set;}
    }
}
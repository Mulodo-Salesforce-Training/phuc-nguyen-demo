public class JobProcess {
	@InvocableMethod
    public static void JobDelete(List<Id> JobId)
    {
        List<Job_Application__c> jobApps = [SELECT Id
        								    FROM Job_Application__c
                          				    WHERE Job_Application__c.Id
                          				    IN :JobId];
        delete jobApps;
   }
}
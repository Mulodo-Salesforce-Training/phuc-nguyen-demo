@isTest
private class PositionTriggerTest {
	@isTest static void testCheckDoubleName() {
		// Implement test code
        ID recType = Schema.SObjectType.Position__c.getRecordTypeInfosByName().get('IT positions').getRecordTypeId();
        Position__c pos = new Position__c(Name='LTV', RecordTypeId=recType);
        Position__c pos1 = new Position__c(Name='Lập Trình Viên', RecordTypeId=recType);
        Test.startTest();
        insert pos;
        pos.Name='asd';
        update pos;
        insert pos1;
        pos1.Name='asd';
        update pos1;
        Test.stopTest();
    }
}
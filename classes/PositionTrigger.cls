public with sharing class PositionTrigger extends TriggerHandler {
    public PositionTrigger ( Boolean isExecuting,
                             Boolean isInsert,
                             Boolean isUpdate,
                             Boolean isDelete,
                             Boolean isBefore,
                             Boolean isAfter,
                             Boolean isUndelete,
                             List<SObject> newList,
                             Map<ID, SObject> newMap,
                             List<SObject> oldList,
                             Map<ID, SObject> oldMap,
                             Integer sizeTrigger ) {
        super( isExecuting, isInsert, isUpdate, isDelete, isBefore, isAfter, isUndelete, newList, newMap, oldList, oldMap, sizeTrigger );
    }

    public override void execBeforeInsert ( List<SObject> newList ) {
        checkDoubleName( newList );
    }

    public override void execBeforeUpdate ( List<SObject> newList, List<SObject> oldList ) {
        checkDoubleName( newList );
    }

    public void checkDoubleName( List<SObject> newList ) {
        Integer count = 0;

        for ( Position__c pos : ( List<Position__c> ) newList) {
            count = [SELECT count() FROM Position__c WHERE Name = : pos.Name AND Id != : pos.id];

            if ( count != 0 ) {
                pos.addError( 'Position name: ' + pos.Name + ' is already existed !' );
            }

        }

    }
}
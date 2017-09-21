trigger PositionTrigger on Position__c ( before insert, before update, before delete, after insert, after update, after delete, after undelete ) {
    TriggerHandler t = new PositionTrigger( Trigger.isExecuting,
                                            Trigger.isInsert,
                                            Trigger.isUpdate,
                                            Trigger.isDelete,
                                            Trigger.isBefore,
                                            Trigger.isAfter,
                                            Trigger.isUndelete,
                                            Trigger.New,
                                            Trigger.NewMap,
                                            Trigger.Old,
                                            Trigger.OldMap,
                                            Trigger.size );
}
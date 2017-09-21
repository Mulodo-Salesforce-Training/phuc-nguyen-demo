public virtual class TriggerHandler {
    private Boolean isExecuting { private set; private get; }
    private Boolean isInsert { private set; private get; }
    private Boolean isUpdate { private set; private get; }
    private Boolean isDelete { private set; private get; }
    private Boolean isBefore { private set; private get; }
    private Boolean isAfter { private set; private get; }
    private Boolean isUndelete { private set; private get; }
    private List<SObject> newList { private set; private get; }
    private Map<ID, SObject> newMap { private set; private get; }
    private List<SObject> oldList { private set; private get; }
    private Map<ID, SObject> oldMap { private set; private get; }
    private Integer sizeTrigger { private set; private get; }

    public TriggerHandler ( Boolean isExecuting,
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
        this.isExecuting = isExecuting;
        this.isInsert    = isInsert;
        this.isUpdate    = isUpdate;
        this.isDelete    = isDelete;
        this.isBefore    = isBefore;
        this.isUndelete  = isUndelete;
        this.isAfter     = isAfter;
        this.newList     = newList;
        this.newMap      = newMap;
        this.oldList     = oldList;
        this.oldMap      = oldMap;
        this.sizeTrigger = sizeTrigger;
        stateMachine();
    }

    private void stateMachine () {
        if ( !this.isExecuting ) {
            return;
        }

        if ( this.isBefore ) {
            if ( this.isInsert ) {
                execBeforeInsert( this.newList );
            } else if ( this.isUpdate ) {
                execBeforeUpdate(this.newList, this.oldList );
            } else if ( this.isDelete ) {
                execBeforeDelete( this.newList, this.oldList );
            } else if ( this.isUndelete ) {
                execBeforeUndelete( this.newList, this.oldList );
            }
        } else if ( this.isAfter ) {
            if ( this.isInsert ) {
                execAfterInsert( this.newList );
            } else if ( this.isUpdate ) {
                execAfterUpdate(this.newList, this.oldList );
            } else if ( this.isDelete ) {
                execAfterDelete( this.newList, this.oldList );
            } else if (this.isUndelete) {
                execAfterUndelete( this.newList, this.oldList );
            }
        }
    }

    public virtual void execBeforeInsert ( List<SObject> newList ) {}

    public virtual void execBeforeUpdate ( List<SObject> newList, List<SObject> oldList ) {}

    public virtual void execBeforeDelete ( List<SObject> newList, List<SObject> oldList ) {}

    public virtual void execBeforeUndelete ( List<SObject> newList, List<SObject> oldList ) {}

    public virtual void execAfterInsert ( List<SObject> newList ) {}

    public virtual void execAfterUpdate ( List<SObject> newList, List<SObject> oldList ) {}

    public virtual void execAfterDelete ( List<SObject> newList, List<SObject> oldList ) {}

    public virtual void execAfterUndelete ( List<SObject> newList, List<SObject> oldList ) {}

}
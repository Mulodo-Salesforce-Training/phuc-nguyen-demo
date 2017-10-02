trigger PositionTrigger on Position__c ( before insert, before update ) {
    checkDoubleName();

    public void checkDoubleName () {
        Integer count           = 0;
        List< String > listName = new List< String >();

        for ( Position__c pos : ( List< Position__c> ) Trigger.New ) {
            listName.add( pos.Name );
        }

        List< Position__c > listPos = [SELECT Id, Name FROM Position__c WHERE Name IN :listName];

        for ( Position__c pos : listPos ) {

            for ( Position__c posNew : ( List< Position__c> ) Trigger.New ) {

                /*
                    # Check double name
                    # Go to next loop if different name
                */
                if ( posNew.Name != pos.Name ) {
                    continue;
                }

                /*
                    # Addition condition for update case
                    # Go to next loop if different id in update case
                */
                if ( posNew.Id != null && ( posNew.Id == pos.Id ) ) {
                    continue;
                }

                // # Add error message
                posNew.addError( 'Position name: ' + pos.Name + ' is already existed !' );

            }

        }

    }
}
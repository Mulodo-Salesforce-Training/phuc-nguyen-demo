trigger PositionTrigger on Position__c ( before insert, before update ) {
    checkDoubleName();

    public void checkDoubleName () {
        Integer count = 0;
        List< String > listName = new List< String >();

        for ( Position__c pos : ( List< Position__c> ) Trigger.New ) {
            listName.add( pos.Name );
        }

        List< Position__c > listPos = [SELECT Id, Name FROM Position__c WHERE Name IN :listName];

        for ( Position__c pos : listPos ) {

            for ( Position__c posNew : ( List< Position__c> ) Trigger.New ) {

                // Update check id
                if ( posNew.Name == pos.Name && posNew.Id != pos.Id ) {
                    posNew.addError( 'Position name: ' + pos.Name + ' is already existed !' );
                }

            }

        }

    }
}
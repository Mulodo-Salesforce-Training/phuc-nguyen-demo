public with sharing class CandidatePagination {
    Integer counter  = 0;
    Integer listSize = 9;
    public Integer totalSize;

    //set the total size in the constructor
    public CandidatePagination () {
        totalSize = [SELECT count() FROM Candidate__c];
    }

    public Candidate__c[] getCandidates () {
        try {
            Candidate__c[] candidates = [SELECT Name, First_Name__c, Last_Name__c, City__c, State_Province__c, Phone__c
                                         FROM Candidate__c
                                         LIMIT: listSize
                                         OFFSET: counter];
            return candidates;
        } catch ( QueryException e ) {
            ApexPages.addMessages( e );
            return null;
        }
    }

    //user clicked beginning
    public PageReference toBeginning () {
        counter = 0;
        return null;
    }

    //user clicked previous button
    public PageReference toPrevious () {
        counter -= listSize;
        return null;
    }

    //user clicked next button
    public PageReference toNext () {
        counter += listSize;
        return null;
    }

    //user clicked end
    public PageReference toEnd () {
        counter = totalSize - math.mod( totalSize, listSize );
        return null;
    }

    //this will disable the previous and beginning buttons
    public Boolean getDisablePrevious () {
        if ( counter > 0 ) {
            return false;
        } else {
            return true;
        }
    }

    //this will disable the next and end buttons
    public Boolean getDisableNext () {
        if ( counter + listSize < totalSize ) {
            return false;
        } else {
            return true;
        }
    }

    public Integer getCurrentPage () {
        return counter / listSize + 1;
    }

    //public Integer getTotalSize () {
    //    return totalSize;
    //}

    //public Integer getPageNumber () {
    //    return counter / listSize + 1;
    //}

    //public Integer getTotalPages () {
    //    if (math.mod(totalSize, listSize) > 0) {
    //        return totalSize / listSize + 1;
    //    } else {
    //        return (totalSize / listSize);
    //    }
    //}

}
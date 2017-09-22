public with sharing class CandidatePagination {
    final Integer LIST_SIZE = 9;                // the size of list per page
    Integer counter;
    Integer totalSize;
    public Integer customListSize { get; set; } // custom size of list per page will be changed be user

    // set the total size in the constructor
    public CandidatePagination () {
        totalSize           = [SELECT count() FROM Candidate__c];
        counter             = 0;
        customListSize   = LIST_SIZE;
    }

    public Candidate__c[] getCandidates () {
        try {
            Candidate__c[] candidates = [SELECT Name, First_Name__c, Last_Name__c, City__c, State_Province__c, Phone__c
                                         FROM Candidate__c
                                         LIMIT: customListSize
                                         OFFSET: counter];
            return candidates;
        } catch ( QueryException e ) {
            ApexPages.addMessages( e );
            return null;
        }
    }

    // user clicked beginning
    public PageReference toBeginning () {
        counter = 0;
        return null;
    }

    // user clicked previous button
    public PageReference toPrevious () {
        counter -= customListSize;
        return null;
    }

    // user clicked next button
    public PageReference toNext () {
        counter += customListSize;
        return null;
    }

    // user clicked end
    public PageReference toEnd () {
        counter = totalSize - math.mod( totalSize, customListSize );
        return null;
    }

    // this will disable the previous and beginning buttons
    public Boolean getDisablePrevious () {
        if ( counter > 0 ) {
            return false;
        } else {
            return true;
        }
    }

    // this will disable the next and end buttons
    public Boolean getDisableNext () {
        if ( counter + customListSize < totalSize ) {
            return false;
        } else {
            return true;
        }
    }

    public Integer getCurrentPage () {
        return counter / customListSize + 1;
    }

    //public Integer getTotalSize () {
    //    return totalSize;
    //}

    //public Integer getPageNumber () {
    //    return counter / customListSize + 1;
    //}

    //public Integer getTotalPages () {
    //    if (math.mod(totalSize, customListSize) > 0) {
    //        return totalSize / customListSize + 1;
    //    } else {
    //        return (totalSize / customListSize);
    //    }
    //}

}
public with sharing class CandidatePagination {
    final Integer LIST_SIZE = 9;                // the size of list per page
    Integer counter;
    Integer totalSize;
    public Integer customListSize { get; set; } // custom size of list per page will be changed be user
    public List<Candidate__c> candidates {
        get {
            /*
                Correct counter after change size of list
            */
            if ( math.mod( counter, customListSize ) != 0 ) {
                counter -= math.mod( counter, customListSize );
            }
            return [SELECT Name, First_Name__c, Last_Name__c, City__c, State_Province__c, Phone__c
                    FROM Candidate__c
                    LIMIT: customListSize
                    OFFSET: counter];
        }
    }

    // Set the total size in the constructor
    public CandidatePagination () {
        totalSize           = [SELECT count() FROM Candidate__c];
        counter             = 0;
        customListSize      = LIST_SIZE;
    }

    // User clicked beginning
    public PageReference toBeginning () {
        counter = 0;
        return null;
    }

    // User clicked previous button
    public PageReference toPrevious () {
        counter -= customListSize;
        return null;
    }

    // User clicked next button
    public PageReference toNext () {
        counter += customListSize;
        return null;
    }

    // User clicked end
    /*
        Add condition to check if last page list is less than custom size list
    */
    public PageReference toEnd () {
        if ( math.mod( totalSize, customListSize ) == 0 ) {
            counter = totalSize - customListSize;
        } else {
            counter = totalSize - math.mod( totalSize, customListSize );
        }
        return null;
    }

    // This will disable the previous and beginning buttons
    public Boolean getDisablePrevious () {
        if ( counter > 0 ) {
            return false;
        } else {
            return true;
        }
    }

    // This will disable the next and end buttons
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
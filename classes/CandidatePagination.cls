public class CandidatePagination {
    // the size of list per page
    // custom size of list per page will be changed be user
    final Integer LIST_SIZE = 9;
    private Integer counter, totalSize, customListSize;

    public Integer getCustomListSize () {
        return this.customListSize;
    }

    public void setCustomListSize ( Integer customListSize ) {
        this.customListSize = customListSize;

        /*
        Correct this.counter after change size of list
        */
        if ( math.mod( this.counter, this.customListSize ) != 0 ) {
            this.counter -= math.mod( this.counter, this.customListSize );
        }

    }

    public List< Candidate__c > candidates {
        get {
            return [SELECT Name, First_Name__c, Last_Name__c, City__c, State_Province__c, Phone__c
                    FROM Candidate__c
                    LIMIT: this.customListSize
                    OFFSET: this.counter];
        }
    }

    // Set the total size in the constructor
    public CandidatePagination () {
        this.totalSize      = [SELECT count() FROM Candidate__c];
        this.counter        = 0;
        this.customListSize = LIST_SIZE;
    }

    // User clicked beginning
    public PageReference toBeginning () {
        this.counter = 0;
        return null;
    }

    // User clicked previous button
    public PageReference toPrevious () {
        this.counter -= this.customListSize;
        return null;
    }

    // User clicked next button
    public PageReference toNext () {
        this.counter += this.customListSize;
        return null;
    }

    // User clicked end
    /*
        Add condition to check if last page list is less than custom size list
    */
    public PageReference toEnd () {
        Integer mod  = math.mod( this.totalSize, this.customListSize );
        this.counter = mod != 0 ? this.totalSize - mod : this.totalSize - this.customListSize;
        return null;
    }

    // This will disable the previous and beginning buttons
    public Boolean getDisablePrevious () {
        return this.counter > 0 ? false : true;
    }

    // This will disable the next and end buttons
    public Boolean getDisableNext () {
        if ( this.counter + this.customListSize < this.totalSize ) {
            return false;
        } else {
            return true;
        }
    }

    public Integer getCurrentPage () {
        return this.counter / this.customListSize + 1;
    }
}
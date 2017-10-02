function addNewCandidate () {
    let firstName     = document.getElementById('firstName').value;
    let lastName      = document.getElementById('lastName').value;
    let email         = document.getElementById('email').value;
    let phone         = document.getElementById('phone').value;
    let street        = document.getElementById('street').value;
    let city          = document.getElementById('city').value;
    let stateProvince = document.getElementById('stateProvince').value;

    Visualforce.remoting.Manager.invokeAction (
        'CandidateRegister.toRegister',
        firstName, lastName, email, phone, street, city, stateProvince,
        function ( result, event ) {
            if ( event.status ) {
                if ( event.result === firstName ) {
                    success();
                } else {
                    fail();
                }
            }
        }, {
            escape: true
        }
    );

    function success () {
        document.getElementById( "responseResult" ).innerHTML = "Create success Candidates with first name: " + firstName;
    }

    function fail () {
        document.getElementById( "responseResult" ).innerHTML = event.result + "<br/>";
    }
}
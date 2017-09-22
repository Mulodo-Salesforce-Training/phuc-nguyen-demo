function getRemoteAccount () {
    var firstName       = document.getElementById('firstName').value;
    var lastName        = document.getElementById('lastName').value;
    var email           = document.getElementById('email').value;
    var phone           = document.getElementById('phone').value;
    var street          = document.getElementById('street').value;
    var city            = document.getElementById('city').value;
    var stateProvince   = document.getElementById('stateProvince').value;

    Visualforce.remoting.Manager.invokeAction (
        'CandidateRegister.toRegister',
        firstName, lastName, email, phone, street, city, stateProvince,
        function ( result, event ) {
            if ( event.status ) {
                if ( event.result == firstName ) {
                    document.getElementById( "responseResult" ).innerHTML = "Create success Candidates with first name: " + firstName;
                } else {
                    document.getElementById( "responseResult" ).innerHTML = event.result + "<br/>";
                }
            }
        }, {
            escape: true
        }
    );
}
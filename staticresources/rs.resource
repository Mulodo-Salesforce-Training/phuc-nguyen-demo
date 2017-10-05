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

// create an factory to excute
var app = angular.module( 'MyApp', [] );
app.factory( 'VFRemotingFactory', function( $q, $rootScope ) {
    var factory = {};
    factory.getData = function( searchText ) {
        var deferred = $q.defer();
        GetAllAccountsByFilter( searchText, function( result ) {
            $rootScope.$apply( function() {
                deferred.resolve( result );
            });
        } );
        return deferred.promise;
    }
    return factory;
});

// get data from remote action method in controller
function GetAllAccountsByFilter( searchText, callback ) {

    if( searchText == undefined ) {
        searchText = '';
    }

    Visualforce.remoting.Manager.invokeAction(
        'CustomAccountController.GetAllAccountsByFilter', searchText,
            callback,
        { escape: false }
    );
}

// controller process page
app.controller( 'myController', function( $scope, VFRemotingFactory ) {
    $scope.mcm = {};
    $scope.getFilteredData = function( $event ) {

        if ( $scope.mcm.searchText.length > 1 ) {
            var searchText         = $scope.mcm.searchText;
            VFRemotingFactory.getData( searchText ).then( function( result ) {
                $scope.AccountData = result;
            });
        }
        else {
            var searchText         = $scope.mcm.searchText;
            VFRemotingFactory.getData().then( function( result ) {
                $scope.AccountData = result;
            });
        }

    };
    $scope.Prafull         = {};
    VFRemotingFactory.getData().then( function( result ) {
        $scope.AccountData = result;
    });
});
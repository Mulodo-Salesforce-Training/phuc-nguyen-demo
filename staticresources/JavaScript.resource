var app = angular.module( 'MyApp', [] );
app.controller( 'myController', function( $scope ) {
    $scope.mcm             = {};
    var searchText         = '';

    function callback ( result, event ) {

        if ( event.status ) {
            $scope.$apply( function() {
                $scope.AccountData = result;
            });
        }

    }

    $scope.initData = function () {
        Visualforce.remoting.Manager.invokeAction (
            'CustomAccountController.GetAllAccountsByFilter', searchText,
            callback,
            { escape : false }
        );
    }

    $scope.getFilteredData = function( $event ) {
        searchText         = $scope.mcm.searchText;
        Visualforce.remoting.Manager.invokeAction (
            'CustomAccountController.GetAllAccountsByFilter', searchText,
            callback,
            { escape : false }
        );
    };
});

var appCan = angular.module( 'listCandidate', [] );
appCan.controller( 'listCandidateCtrl', function ( $scope, $window ) {
    $scope.mcm             = {};
    var searchText         = '';

    function callback ( result, event ) {

        if ( event.status ) {
            $scope.$apply( function() {
                $scope.CandidateData = result;
            });
        }

    }

    $scope.initData = function () {
        Visualforce.remoting.Manager.invokeAction (
            'CustomCandidateController.getListCandidates', searchText,
            callback,
            { escape : false }
        );
    }

    $scope.getFilteredData = function ( $event ) {
        searchText = $scope.mcm.searchText;
        Visualforce.remoting.Manager.invokeAction (
            'CustomCandidateController.getListCandidates', searchText,
            callback,
            { escape : false }
        );
    };

    $scope.remove = function ( id ) {
        Visualforce.remoting.Manager.invokeAction (
            'CustomCandidateController.removeCandidate', id, searchText,
            callback,
            { escape : false }
        );
    };

    $scope.createNewCandidate = function () {
        $window.location.href = ('Candidate_Lightning_New');
    };
});

var appCan = angular.module( 'CandidateRegister', [] );
appCan.controller( 'CandidateRegisterCtrl', function ( $scope ) {
    function Candidate__c () {
        this.Id            = null;
        this.First_Name__c = null;
        this.Last_Name__c  = null;
        this.Email__c      = null;
        this.City__c       = null;
        this.Phone__c      = null;
    };

    function callback ( result, event )  {
        $scope.$apply( function() {
            $scope.Candidate__c.First_Name__c = '';
            $scope.Candidate__c.Last_Name__c  = '';
            $scope.Candidate__c.Email__c      = '';
            $scope.Candidate__c.City__c       = '';
            $scope.Candidate__c.Phone__c      = '';
            $scope.errorMessage               = result;
        });
    };

    $scope.submit = function () {
        let candidate           = new Candidate__c();

        candidate.First_Name__c = $scope.Candidate__c.First_Name__c;
        candidate.Last_Name__c  = $scope.Candidate__c.Last_Name__c;
        candidate.Email__c      = $scope.Candidate__c.Email__c;
        candidate.City__c       = $scope.Candidate__c.City__c;
        candidate.Phone__c      = $scope.Candidate__c.Phone__c;

        Visualforce.remoting.Manager.invokeAction (
            'CandidateRegister.toRegister', candidate,
            callback,
            { escape : false }
        );
    };
});
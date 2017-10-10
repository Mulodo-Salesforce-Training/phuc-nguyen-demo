'use strict';

(function($){

    $ = jQuery.noConflict();

    $(window).on( 'load', function () {
    	$(".se-pre-con").fadeOut('slow');
        $(".se-pre-con img").fadeOut('slow');
    });

    let client_ip = document.getElementById('ip_address').value;
    let app       = angular.module( 'candidateSPA', ["ngRoute"] );

    app.config( function( $routeProvider ) {
        $routeProvider
        .when("/candidate/:id", {
        	templateUrl : "https://c.ap5.visual.force.com/resource/1507617181000/Detail",
            controller  : "candidateDetail"
        })
        .when("/", {
            templateUrl : "https://c.ap5.visual.force.com/resource/1507617181000/List",
            // controller  : "candidateList as vm"
        })
    });

    app.controller( 'candidateDetail', function( $scope, $routeParams ){
        let canId = $routeParams.id;

        $scope.removeCan = function () {
            let confirm = window.confirm("Are you sure you want to delete ?");
            if ( confirm ) {
                Visualforce.remoting.Manager.invokeAction (
                    'SPA_CandidateController.remove',
                    canId,
                    function ( result, event ) {
                        if ( event.status && result == true ) {
                            alert( 'Da xoa thanh cong ' + $scope.data.First_Name__c );
                            $("#list_button").trigger("click");
                            window.location.href = "apex/CandidateWithSPA#!/";
                        }
                    },
                    { escape : false }
                );
            }
        };

        Visualforce.remoting.Manager.invokeAction (
            'SPA_CandidateController.getById',
            canId,
            function ( result, event ) {
                $scope.$apply( function() {
                    $scope.data = result;
                });
            },
            { escape : false }
        );
    });

    // app.controller( 'candidateList', function( $scope ) {
    //     $scope.vm = this;

    // 	$scope.init = function () {
    // 		Visualforce.remoting.Manager.invokeAction (
    //             'SPA_CandidateController.getList',
    //             function ( result, event ) {
    //             	$scope.$apply( function() {
    // 	            	$scope.data = result;
    //             	});
    //             },
    //             { escape : false }
    //         );
    // 	}
    // });

    app.factory('PagerService', PagerService).controller( 'candidateList', candidateList );

    function candidateList ( PagerService ) {
        var vm = this;
        Visualforce.remoting.Manager.invokeAction (
            'SPA_CandidateController.getList',
            function ( result, event ) {
                vm.dummyItems = result;
                vm.pager      = {};
                vm.setPage    = setPage;

                initController();

                function initController() {
                    // initialize to page 1
                    vm.setPage(1);
                }

                function setPage(page) {

                    if (page < 1 || page > vm.pager.totalPages) {
                        return;
                    }

                    // get pager object from service
                    vm.pager = PagerService.GetPager(vm.dummyItems.length, page);

                    // get current page of items
                    vm.data  = vm.dummyItems.slice(vm.pager.startIndex, vm.pager.endIndex + 1);
                }
            },
                { escape : false }
        );
    }

    function PagerService() {
        // service definition
        var service      = {};

        service.GetPager = GetPager;

        return service;

        // service implementation
        function GetPager(totalItems, currentPage, pageSize) {
            // default to first page
            currentPage    = currentPage || 1;

            // default page size is 10
            pageSize       = pageSize || 10;

            // calculate total pages
            var totalPages = Math.ceil(totalItems / pageSize);

            var startPage, endPage;
            if (totalPages <= 10) {
                // less than 10 total pages so show all
                startPage = 1;
                endPage   = totalPages;
            } else {
                // more than 10 total pages so calculate start and end pages
                if (currentPage <= 6) {
                    startPage = 1;
                    endPage   = 10;
                } else if (currentPage + 4 >= totalPages) {
                    startPage = totalPages - 9;
                    endPage   = totalPages;
                } else {
                    startPage = currentPage - 5;
                    endPage   = currentPage + 4;
                }
            }

            // calculate start and end item indexes
            var startIndex = (currentPage - 1) * pageSize;
            var endIndex   = Math.min(startIndex + pageSize - 1, totalItems - 1);

            // create an array of pages to ng-repeat in the pager control
            let i     = startPage;
            let pages = [];
            for ( ; i < endPage + 1; ++i ) {
                pages.push(i);
            }

            // return object with all pager properties required by the view
            return {
                totalItems  : totalItems,
                currentPage : currentPage,
                pageSize    : pageSize,
                totalPages  : totalPages,
                startPage   : startPage,
                endPage     : endPage,
                startIndex  : startIndex,
                endIndex    : endIndex,
                pages       : pages
            };
        }
    }

    app.controller( 'candidateController', function( $scope, $interval, $http ) {

        function number_format ( number, decimals, dec_point, thousands_sep ) {
            // http://kevin.vanzonneveld.net
            // + original by: Jonas Raoni Soares Silva (http://www.jsfromhell.com)
            // + improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
            // + bugfix by: Michael White (http://crestidg.com)
            // + bugfix by: Benjamin Lupton
            // + bugfix by: Allan Jensen (http://www.winternet.no)
            // + revised by: Jonas Raoni Soares Silva (http://www.jsfromhell.com)
            // * example 1: number_format(1234.5678, 2, '.', '');
            // * returns 1: 1234.57

            var n = number, c = isNaN(decimals = Math.abs(decimals)) ? 2 : decimals;
            var d = dec_point == undefined ? "," : dec_point;
            var t = thousands_sep == undefined ? "." : thousands_sep, s = n < 0 ? "-" : "";
            var i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", j = (j = i.length) > 3 ? j % 3 : 0;

            return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
        }

    	let tick = function() {
    		$scope.date = Date.now();
    	};

    	let weather = function () {
    		$interval(
                Visualforce.remoting.Manager.invokeAction (
                    'SPA_CandidateController.getWeather',
                    client_ip
                    ,
                    function ( result, event ) {
                    	let resultJson      = JSON.parse( result );
                    	$scope.$apply( function() {
        	            	$scope.location = resultJson.name;
        	            	$scope.lon      = resultJson.coord.lon;
        	            	$scope.lat      = resultJson.coord.lat;
        	            	$scope.temp     = number_format( resultJson.main.temp / 10, 0, '.', ' ' );
                    	});
                    },
                    { escape : false }
                ), 1000 );
    	};

        let count = function () {
            Visualforce.remoting.Manager.invokeAction (
                'SPA_CandidateController.getCount',
                function ( result, event ) {
                    $scope.total = 0;
                    if ( event.status ) {
                        $scope.$apply( function() {
                            $scope.total = result;
                        });
                    }
                },
                { escape : false }
            );
        }

    	$scope.init = function () {
            // get weather info
    		weather();
    		// Clock
    		tick();
    		$interval( tick, 1000 );
    		// End clock
    		count();
    	};
    });
})(jQuery);
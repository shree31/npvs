var npp = angular.module('npp', ['ui.router', 'ngAnimate', 'chart.js', 'ngMaterial', 'ngMessages', 'material.svgAssetsCache', 'ui.bootstrap'])
	.config([ '$stateProvider', '$urlRouterProvider', '$mdDateLocaleProvider', function ($stateProvider, $urlRouterProvider, $mdDateLocaleProvider){
		//Date format handling
		 $mdDateLocaleProvider.formatDate = function(date) {
		    return date ? moment(date).format('DD-MMM-YYYY') : '';
		  };
			  
			  $mdDateLocaleProvider.parseDate = function(dateString) {
			    var m = moment(dateString, 'DD-MMM-YYYY', true);
			    return m.isValid() ? m.toDate() : new Date(NaN);
			  };
		$stateProvider.state('login', {
			url : '/landing',
			views :{
				'': {
					templateUrl : 'npp/login/templates/landing.html?v=3',
				    },
				  'header@login': {
		            templateUrl: 'npp/login/templates/landing_header.html?v=3',
		                     },
		        'content@login': {
		            templateUrl: 'npp/login/templates/intro.html?v=3',
		            controller : 'IntroCtrl'
		         	}
			}		
		
		});
		
		$stateProvider.state('login.vendor', {
			url : '/vendor',
			views :{
				'content@login': {
					templateUrl : 'npp/login/templates/vendor.html?v=3',					
				}
				
			}
		});
		$stateProvider.state('login.contact', {
			url : '/contact',
			views :{
				'content@login': {
					templateUrl : 'npp/login/templates/contact.html?v=3',					
				}
				
			}
		});
		$stateProvider.state('login.login', {
			url : '/login',
			views :{
				'content@login': {
					templateUrl : 'npp/login/templates/login.html?v=3',
					controller : 'LoginCtrl'
				}
				
			}
		});
		$stateProvider.state('login.about', {
			url : '/about',
			views :{
				'content@login': {
					templateUrl : 'npp/login/templates/about.html?v=3',					
				}
				
			}
		});
		$stateProvider.state('login.intro', {
			url : '/intro',
			views :{
				'content@login': {
					templateUrl : 'npp/login/templates/intro.html?v=3',
					controller : 'IntroCtrl'
				}
				
			}
		});
		
		$stateProvider.state('login.fgPwd', {
			url : '/fgPwd',
			views :{
				'content@login': {
					templateUrl : 'npp/login/templates/forgot_password.html?v=3',
					controller : 'LoginCtrl'
				}
				
			}
		});
		
		$stateProvider.state('login.fgPwdreset', {
			url : '/fgPwd/:token',
			views :{
				'content@login': {
					templateUrl : 'npp/login/templates/forgot_password_reset.html?v=3',
					controller : 'LoginCtrl'
				}
				
			}
		});
		
		$stateProvider.state('login.register', {
			url : '/register',
			views :{
				'content@login': {
					templateUrl : 'npp/login/templates/register.html?v=3',
					controller : 'LoginCtrl'
				}
				
			}
		});

		
		$stateProvider.state('home', {
			url : '/home',
			views :{
				'': {
					templateUrl : 'npp/home/templates/home.html?v=3',
					controller: 'HomeCtrl'
				},
				'homePanel@home': {
                            templateUrl: 'npp/home/templates/home_panel.html?v=3',
                        },
						'header@home': {
                            templateUrl: 'npp/home/templates/header.html',
                        },
						'pendingBill@home': {
                            templateUrl: 'npp/home/templates/pending_bill.html',
                        	controller: 'PendingBillCtrl'	
                        },
						'chart@home': {
                            templateUrl: 'npp/home/templates/chart.html',
							controller: 'ChartCtrl'
                        },
                        'paper@home': {
                            templateUrl: 'npp/home/templates/my_papers.html',
							controller: 'PaperCtrl'
                        }
				
			}
		});
		
		
		$stateProvider.state('home.resetPass', {
			url : '/resetPass',
			views :{
				'content@home': {
					templateUrl : 'npp/login/templates/reset_pass.html?v=3',
					controller : 'LoginCtrl'
				}
				
			}
		});
		
		$stateProvider.state('home.profile', {
			url : '/profile',
			views :{
				'content@home': {
					templateUrl : 'npp/home/templates/profile.html?v=3',
					controller : 'ProfileCtrl'
				}
				
			}
		});
		
		$urlRouterProvider.otherwise('/landing');
	}
	])
	.factory('httpInterceptorVersion', function () {
        return {
            request: function (config) {

                if ((config.method === "GET") && (config.url.match(/\.\html?$/))) {
                    if (config.url.indexOf("template/") !== 0) {
                    	config.url += '?v=' + 1;
                    }
                }
                return config;
            }
        };
    });
	
	npp.config(['$httpProvider', function($httpProvider) {  
	    $httpProvider.interceptors.push('httpInterceptorVersion');
	}]);

    npp.run(function ($rootScope,$timeout) {
        $rootScope.$on('$viewContentLoaded', function () {
          $timeout( function () {
            componentHandler.upgradeAllRegistered();
          });
        });
      });
    
    npp.directive('buttonSubmit', function () {
		return function (scope, element, attrs) {
			element.bind("keydown keypress", function (event) {
				if(event.which === 13) {
					scope.$apply(function (){
						scope.$eval(attrs.myEnter);
					});

					event.preventDefault();
				}
			});
		};
	});
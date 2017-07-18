angular.module('npp')
	.controller('LoginCtrl', ['$window', '$scope', '$location', 'LoginService', '$stateParams', function($window, $scope, $location, LoginService, $stateParams){
		$scope.login = function () {
			LoginService.authenticate($scope.user, function(response){
				if(response.status == 'SUCCESS') {
					if (response.data == 'N') {
						$location.path('/home');
					}
					else {
						$window.location.href= '/securityChk_Servlet';
					}
						
				} else {
					response.data = {};
					response.data.message = response.message;
					response.data.timeout = 2000;
					$scope.error = response.message;
					//mdlSnack.showSnackbar(response.data); 
				}
			},
			function (response) {
				$scope.error = "Something went wrong try again"; 
			});
		};
		$scope.register = function () {
			LoginService.register($scope.user, function(response){
				if(response.status == 'SUCCESS') {
					$location.path('/');
				} else {
					$scope.error = response.message; 
				}
			},
			function (response) {
				$scope.error = "Something went wrong try again"; 
				$location.path('/');
			});
		};
		$scope.forgotPwd = function () {
			LoginService.forgotPwd($scope.emailid, function(response){
				if(response.status == 'SUCCESS') {
					$location.path('/');
				} else {
					$scope.error = response.message; 
				}
			},
			function (response) {
				$scope.error = "Something went wrong try again"; 
				//$location.path('/');
			});
		};
		$scope.resetPass = function () {
			if($scope.user.newPass != $scope.user.newPassCnf){
				$scope.error = "Confirmation password not matching";
				return;
			}
			LoginService.resetPass($scope.user, function(response){
				if(response.status == 'SUCCESS') {
					$location.path('/home');
				} else {
					$scope.error = response.message; 
				}
			},
			function (response) {
				$scope.error = "Something went wrong try again"; 
				//$location.path('/');
			});
		};
		$scope.resetForgotPass = function () {
			if($scope.newPass != $scope.newPassCnf){
				$scope.error = "Confirmation password not matching";
				return;
			}
			var resetPassData = {};
			resetPassData.token = $stateParams.token;
			resetPassData.pass = $scope.newPass; 
			LoginService.resetForgotPass(resetPassData, function(response){
				if(response.status == 'SUCCESS') {
					$location.path('/login');
				} else {
					$scope.error = response.message; 
				}
			},
			function (response) {
				$scope.error = "Something went wrong try again"; 
			});
		};
	}]);
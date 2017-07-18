angular.module('npp')
	.service('LoginService', ['$http', function($http){

		this.authenticate = function(user, successCallback, errorCallback) {
			return $http.post('/services/customer/login', user)
				.then(function (response) {
					successCallback(response.data);
				}, function (response){
					errorCallback(response.data);
				});
		};

		this.register = function(user, successCallback, errorCallback){
			return $http.post('/services/customer/register', user)
				.then(function (response) {
					successCallback(response.data);
				}, function (response){
					errorCallback(response.data);
				});
		};

		this.forgotPwd = function(loginid, successCallback, errorCallback){
			return $http.post('/services/customer/forgotPwd', loginid)
				.then(function (response) {
					successCallback(response.data);
				}, function (response){
					errorCallback(response.data);
				});
		};
		this.resetPass = function(user, successCallback, errorCallback){
			var postData = JSON.stringify(user);
			return $http.post('/services/customer/resetPass', postData)
				.then(function (response) {
					successCallback(response.data);
				}, function (response){
					errorCallback(response.data);
				});
		};
		
		this.resetForgotPass = function (resetPassData, successCallback, errorCallback){
			return $http.post('/services/customer/resetForgotPass', resetPassData)
			.then(function (response) {
				successCallback(response.data);
			}, function (response){
				errorCallback(response.data);
			});
		};
	}]);
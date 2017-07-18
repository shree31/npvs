angular.module('npp')
	.service('HomeService', ['$http', function($http){
		this.loadUserProfile = function(successCallback, failureCallback){
			return $http.post('/services/customer/loadUserProfile')
				.then(function(response){
					successCallback(response.data);
				}, function(response){
					failureCallback(response.data);
				});
		};
		
		this.updateUserProfile = function(user, successCallback, failureCallback){
			return $http.post('/services/customer/updateUserProfile', user)
				.then(function(response){
					successCallback(response.data);
				}, function(response){
					failureCallback(response.data);
				});
		};
		
		this.getPendingBills = function(user, successCallback, failureCallback){
			return $http.post('/services/customer/pendingBills', user)
				.then(function(response){
					successCallback(response.data);
				}, function(response){
					failureCallback(response.data);
				});
		};
		this.getBillTrend = function(successCallback, failureCallback){
			return $http.post('/services/customer/billTrend')
				.then(function(response){
					successCallback(response.data);
				}, function(response){
					failureCallback(response.data);
				});
		};
		
		this.getBillForDate = function(billDate, successCallback, failureCallback){
			return $http.post('/services/customer/billForDate', billDate)
			.then(function(response){
				successCallback(response.data);
			}, function(response){
				failureCallback(response.data);
			});
		};
		
		this.getMyPapers = function(successCallback, failureCallback){
			return $http.post('/services/customer/myPapers')
			.then(function(response){
				successCallback(response.data);
			}, function(response){
				failureCallback(response.data);
			});
		};
		
		this.stopPaper = function(paper, successCallback, failureCallback) {
			return $http.post('/services/customer/stopPaper', paper)
			.then(function(response){
				successCallback(response.data);
			}, function(response){
				failureCallback(response.data);
			});
		};
		
		this.viewbill = function(successCallback, failureCallback) {
			return $http.post('/services/customer/viewbill')
			.then(function(response){
				successCallback(response.data);
			}, function(response){
				failureCallback(response.data);
			});
		};
		
	}]);
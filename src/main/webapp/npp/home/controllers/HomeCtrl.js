angular.module('npp')
.controller('HomeCtrl', ['$scope', 'HomeService', function($scope, HomeService) {
	HomeService.getPendingBills({'id':1}, function (response) {
		if(response.status == 'SUCCESS') {
			$scope.bill = angular.fromJson(response.data);
		} else {
			$scope.error = response.message; 
		}
	});
	
	HomeService.loadUserProfile(function (response) {
		if(response.status == 'SUCCESS') {
			$scope.user = response.data;
		} else {
			$scope.error = response.message; 
		}
	});
}]);
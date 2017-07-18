angular.module('npp')
.controller('BillCtrl', ['$scope', 'HomeService', function($scope, HomeService) {
	HomeService.getPendingBills({'id':1}, function (response) {
		if(response.status == 'SUCCESS') {
			$scope.bill = angular.fromJson(response.data);
		} else {
			$scope.error = response.message; 
		}
	});
	
}]);
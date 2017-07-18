angular.module('npp')
	.controller('ProfileCtrl', ['$scope', 'HomeService', function ($scope, HomeService) {
		//Loading user information for profile View
		HomeService.loadUserProfile(function (response) {
			if(response.status == 'SUCCESS') {
				$scope.user = response.data;
			} else {
				$scope.error = response.message; 
			}
		});
		
		$scope.save = function () {
			
			HomeService.updateUserProfile($scope.user, function (response) {
				if(response.status == 'SUCCESS') {
					$scope.user = response.data;
				} else {
					$scope.error = response.message; 
				}
			});
		};
		
	}]);
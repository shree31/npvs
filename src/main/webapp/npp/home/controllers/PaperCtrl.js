angular.module('npp')
.controller('PaperCtrl', ['$scope', 'HomeService', function($scope, HomeService) {
		
	$scope.currentDate = new Date();	
	$scope.minDate = new Date(
	$scope.currentDate.getFullYear(),
	$scope.currentDate.getMonth(),
	$scope.currentDate.getDate() + 2);
	
	HomeService.getMyPapers(function (response) {
		if(response.status == 'SUCCESS') {
			var myPapers = angular.fromJson(response.data);
			angular.forEach(myPapers, function(paper, index) {
				if(paper.startDate != null) {
					paper.startDate = new Date(paper.startDate);
					if( paper.startDate < $scope.currentDate) {
						paper.minStartDate = paper.startDate;
						paper.maxStartDate = paper.startDate;
					}
				}
				else {
					paper.minStartDate = $scope.minDate; 
				}
				
				if(paper.endDate != null){
					paper.endDate = new Date(paper.endDate);
				}
				
				paper.minEndDate = $scope.minDate;
				
			});
			$scope.papers = myPapers;
		} else {
			$scope.error = response.message; 
		}
	});
	
	$scope.stopPaper = function(paper) {
		HomeService.stopPaper(paper, function (response) {
			$scope.message = response.data;
		});
	};
}]);
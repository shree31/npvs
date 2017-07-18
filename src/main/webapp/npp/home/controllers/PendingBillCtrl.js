angular.module('npp')
.controller('PendingBillCtrl', ['$scope', 'HomeService', '$window', '$location', function($scope, HomeService, $window, $location) {
	$scope.viewBillDetails = function (){
		HomeService.viewbill(function (response) {
			if(response.status == 'SUCCESS') {
				$window.open($location.protocol() + '://'+ $location.host() +':'+  $location.port()  + '/distAppCommonActionServlet.do?MODE=DOWNLOAD&RPT_NAME='+response.data, '_blank');
			} else {
				$scope.error = response.message; 
			}
		});
	};
	
}]);
angular.module('npp')
.controller('ChartCtrl', ['$scope', 'HomeService', function($scope, HomeService) {
	
	HomeService.getBillTrend(function (response) {
		if(response.status == 'SUCCESS') {
			var chartData = angular.fromJson(response.data);
			var chartLabels = new Array();
			var chartDataVal = new Array();
			var chartDataArr = new Array();
			for (var data in chartData){
				chartLabels.push(chartData[data].label);
				chartDataVal.push(chartData[data].totalAmt);
			}
			chartDataArr.push(chartDataVal);
			$scope.labels = chartLabels;
			$scope.series = ['Month'];
			$scope.data = chartDataArr;
			
			$scope.getChartData = function (points, evt){
				if(points.length > 0) {
					var billDate = {};
					billDate.billMonYear = points[0].label;
					HomeService.getBillForDate(billDate, function (response) {
						if(response.status == 'SUCCESS') {
							$scope.bill = angular.fromJson(response.data);
						} else {
							$scope.error = response.message; 
						}
					});
				}
			};
		} else {
			$scope.error = response.message; 
		}
	});
}]);
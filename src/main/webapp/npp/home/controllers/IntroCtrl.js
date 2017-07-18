angular.module('npp')
.controller('IntroCtrl', ['$scope', function($scope) {
	$scope.customers = 100;
	$scope.save = function() { return angular.isNumber($scope.customers) ? $scope.customers * 17 : 0 ;}; 
	$scope.vendors = function() {  return angular.isNumber($scope.customers) ? $scope.customers *2 : 0 ;};
	$scope.min =  function() {  return angular.isNumber($scope.customers) ? $scope.customers *5 : 0 ;};
	$scope.polution = function() {  return angular.isNumber($scope.customers) ? $scope.customers * 10 : 0 ;}; 
}]);
var myApp = angular.module('myApp', []);

myApp.config([
  "$httpProvider", function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = angular.element('meta[name=csrf-token]').attr('content');
  }
]);

myApp.controller('MyController', ['$scope', '$http', function MyController($scope, $http){

  $scope.getPlaylist = function(user_id){
    $http.get().success(function(data){
      console.log(data);
		});
  }

  $scope.getUser = function(user_id){
    $http.get().success(function(data){
      console.log(data);
    });
  }

}]);

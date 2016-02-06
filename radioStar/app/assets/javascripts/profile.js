var myApp = angular.module('myApp', []);

var dev_prefix = "http://localhost:3000";
var prod_prefix = "/radiostar";
var current_prefix = dev_prefix;

myApp.config([
  "$httpProvider", function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = angular.element('meta[name=csrf-token]').attr('content');
  }
]);

myApp.controller('MyController', ['$scope', '$http', function MyController($scope, $http){

  $scope.getPlaylist = function(){
    $http.get().success(function(data){
      console.log(data);
		});
  }

  $scope.getShows = function(){
    $http.get(current_prefix + '/users/' + current_user  + '/shows.json').success(function(data){
      console.log(data);
    })
  }

  $scope.init = function(){
    $scope.getShows();
  }

    $scope.init();

}]);

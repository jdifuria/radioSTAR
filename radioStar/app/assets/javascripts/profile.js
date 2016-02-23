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

  $scope.getPlaylists = function(show_id){
    $http.get(current_prefix + '/users/' + current_user + '/shows/' + show_id + '/playlists.json').success(function(data){
      console.log(data);
		});
  }

  $scope.getShows = function(){
    $http.get(current_prefix + '/users/' + current_user  + '/shows.json').success(function(data){
      console.log(data);
    })
  }

  $scope.getCharts = function(){
    $http.get(current_prefix + '/charts.json').success(function(data){
      console.log(data);
    })
  }

  $scope.getChartsSongs = function(chart_id){
    $http.get(current_prefix + '/charts/' + chart_id + '/songs.json').success(function(data){
      console.log(data);
    })
  }

  $scope.getPlaylistsSongs = function(show_id, playlist_id){
    $http.get(current_prefix + '/users/' + current_user + '/shows/' + show_id + '/playlists/' + playlist_id + '/songs.json').success(function(data){
      console.log(data);
    })
  }

  $scope.testConnection = function(){
    console.log("attemping to log with username: %s and password: %s", email, password);
    $http.post(current_prefix + '/profile/radioactivity.json', {'email': email, 'password': password}).success(function(data){
      console.log(data);
      if(data.code == 200 && !/No valid user exists/.test(data.body)){
        console.log("login successful");
        $scope.radioactivity_cookie = data.headers.set_cookie[0];
        $scope.radioactivity_cookie = $scope.radioactivity_cookie.split(';')[0];
        console.log("Radioactivity cookie: %s", $scope.radioactivity_cookie);
      }
      else{
        console.log("Can't log in radioactivity.");
        $scope.radioactivity_cookie = -1;
      }
    })
  }

  $scope.init = function(){
    //$scope.getShows();
    $scope.testConnection();
  }

    $scope.init();

}]);

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

  $scope.getPlaylistsSongs = function(station_id, show_id, playlist_id){
    // /stations/:station_id/users/:user_id/shows/:show_id/playlists/:playlist_id/songs(.:format)
    $http.get(current_prefix + "/stations/" + station_id + '/users/' + current_user + '/shows/' + show_id + '/playlists/' + playlist_id + '/songs.json').success(function(data){
      console.log(data);
      $scope.songs = data;
    })
  }

  $scope.addSong = function(playlist_id){
    // :playlist_id, :title, :artist, :album, :label, :genre, :time
    console.log("---");
    console.log($scope.new_title);
    console.log($scope.new_artist);
    console.log($scope.new_album);
    console.log($scope.new_label);
    console.log($scope.new_genre);
    console.log($scope.new_time);
    console.log("---");
    data = {
      playlist_id: playlist_id,
      title: $scope.new_title,
      artist: $scope.new_artist,
      album: $scope.new_album,
      label: $scope.new_label,
      genre: $scope.new_genre,
      time: $scope.new_time
    };

    $http.post(current_prefix + "/stations/" + station_id + '/users/' + current_user + '/shows/' + show_id + '/playlists/' + playlist_id + '/songs.json', data).success(function(data){
      console.log(data);
      $scope.getPlaylistsSongs(station_id, show_id, playlist_id);
    })
  }

  $scope.testConnection = function(){
    console.log("attemping to log with username: %s and password: %s", email, password);
    $http.post(current_prefix + '/profile/radioactivity_login.json', {'email': email, 'password': password}).success(function(data){
      console.log(data);
      if(data.code == 200 && !/No valid user exists/.test(data.body)){
        console.log("login successful");
        $scope.radioactivity_cookie = data.headers.set_cookie[0];
        $scope.radioactivity_cookie = $scope.radioactivity_cookie.split(';')[0];
        console.log("Radioactivity cookie: %s", $scope.radioactivity_cookie);
        $scope.find_songs();
      }
      else{
        console.log("Can't log in radioactivity.");
        $scope.radioactivity_cookie = -1;
      }
    })
  }

  $scope.find_songs = function(){
    console.log("fetching songs...");
    $http.post(current_prefix + '/profile/radioactivity_get_songs.json', {'Cookie': $scope.radioactivity_cookie}).then(function(response){
      console.log(response.status);
      console.log(response.data);
    })
  }

  $scope.init = function(){
    //$scope.getShows();
    $scope.testConnection();
    $scope.getPlaylistsSongs(station_id, show_id, playlist_id);
  }

    $scope.init();

}]);

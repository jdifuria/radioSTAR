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
  console.log("js loaded.");
  $("#users_edit").hide();
  $("#shows_edit").hide();
  $scope.switchTab = function(tab_name){
    console.log("click!");
    if(tab_name == "station"){
      $("#station_edit").show();
      $("#users_edit").hide();
      $("#shows_edit").hide();

      $("#station_tab").addClass("active");
      $("#users_tab").removeClass("active");
      $("#shows_tab").removeClass("active");
    }
    else if(tab_name == "users"){
      $("#station_edit").hide();
      $("#users_edit").show();
      $("#shows_edit").hide();

      $("#station_tab").removeClass("active");
      $("#users_tab").addClass("active");
      $("#shows_tab").removeClass("active");
    }
    else if(tab_name == "shows"){
      $("#station_edit").hide();
      $("#users_edit").hide();
      $("#shows_edit").show();

      $("#station_tab").removeClass("active");
      $("#users_tab").removeClass("active");
      $("#shows_tab").addClass("active");
    }
  }
}]);

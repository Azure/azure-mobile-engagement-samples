/*
 * Copyright (c) 2014,2015 Oliver Goguel - o@goguel.com
 * Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.
 */

var app = angular.module('capptainApp', []);

app.controller('appController', function($scope) {

	$scope.ready  = false;
	$scope.currentActivity=null;

	$scope.onReady = function() {
	
		console.log("device ready");
		$scope.ready = true;
		$scope.cordova = cordova;
		$scope.startActivity("home",{newbie:true});
		Capptain.getStatus(function(_status) {
			$scope.status = _status;
			$scope.$apply();
		});
		$scope.$apply();
		Capptain.onOpenURL(function(_url) {
			$scope.alert = "Got push URL "+_url;
			$scope.$apply();
			console.log(alert);
			$('#capptain-alert').modal();
		});
	};
	
	$scope.onError = function(_error) {
		console.error(_error);
	};


	$scope.startActivity = function(_activityname,_param) {
		console.log('startActivity:'+_activityname);
		$scope.currentActivity = _activityname;
		Capptain.startActivity(_activityname,_param,undefined,$scope.onError );
	};

	$scope.endActivity = function() {
		console.log('endActivity:'+$scope.currentActivity);
		$scope.currentActivity = null;
		Capptain.endActivity(undefined,$scope.onError );
	};

	$scope.sendAppInfo = function(_appInfos) {
		console.log('sendAppInfo:'+JSON.stringify(_appInfos));
		Capptain.sendAppInfo(_appInfos,undefined,$scope.onError);
	};

	$scope.sendEvent = function(_eventName,_extraInfos) {
		console.log('sendEvent:'+_eventName);
		Capptain.sendEvent(_eventName,_extraInfos,undefined,$scope.onError);
	};

	$scope.startJob = function(_jobName,_extraInfos) {
		console.log('startJob:'+_jobName);
		Capptain.startJob(_jobName,_extraInfos,undefined,$scope.onError);
	};

	$scope.endJob = function(_jobName) {
		console.log('endJob:'+_jobName);
		Capptain.endJob(_jobName,undefined,$scope.onError);
	};

	$scope.registerForPushNotification = function() {
		console.log('registerForPushNotification');;
		Capptain.registerForPushNotification(undefined,$scope.onError);
	};

	// DEBUG 
	if (typeof cordova=="undefined")
		$scope.ready=true;
	else
		document.addEventListener('deviceready', $scope.onReady, false);
	
});
/*
 * Copyright (c) Microsoft Corporation.  All rights reserved.
 * Licensed under the MIT license. See License.txt in the project root for license information.
 */

var app = angular.module('sampleApp', []);

app.controller('appController', function($scope) {

    $scope.ready  = false;
    $scope.currentActivity=null;

    $scope.onReady = function() {

        console.log('device ready');
        $scope.ready = true;
        $scope.cordova = cordova;
        $scope.startActivity('home',{newbie:true});
        AzureEngagement.getStatus(function(_status) {
            $scope.status = _status;
            $scope.$apply();
        });
        $scope.$apply();
        AzureEngagement.onOpenURL(function(_url) {
            $scope.alert = 'Got push URL '+_url;
            $scope.$apply();
            console.log($scope.alert);
            $('#sample-alert').modal();
        });
    };

    $scope.onError = function(_error) {
        console.error(_error);
    };

    $scope.startActivity = function(_activityname,_param) {
        console.log('startActivity:'+_activityname);
        $scope.currentActivity = _activityname;
        AzureEngagement.startActivity(_activityname,_param,undefined,$scope.onError );
    };

    $scope.endActivity = function() {
        console.log('endActivity:'+$scope.currentActivity);
        $scope.currentActivity = null;
        AzureEngagement.endActivity(undefined,$scope.onError );
    };

    $scope.sendAppInfo = function(_appInfos) {
        console.log('sendAppInfo:'+JSON.stringify(_appInfos));
        AzureEngagement.sendAppInfo(_appInfos,undefined,$scope.onError);
    };

    $scope.sendEvent = function(_eventName,_extraInfos) {
        console.log('sendEvent:'+_eventName);
        AzureEngagement.sendEvent(_eventName,_extraInfos,undefined,$scope.onError);
    };

    $scope.startJob = function(_jobName,_extraInfos) {
        console.log('startJob:'+_jobName);
        AzureEngagement.startJob(_jobName,_extraInfos,undefined,$scope.onError);
    };

    $scope.endJob = function(_jobName) {
        console.log('endJob:'+_jobName);
        AzureEngagement.endJob(_jobName,undefined,$scope.onError);
    };

    $scope.registerForPushNotification = function() {
        console.log('registerForPushNotification');
        AzureEngagement.registerForPushNotification(undefined,$scope.onError);
    };

    $scope.runTests = function() {
        window.location = 'cdvtests/index.html';
    };

    // DEBUG
    if (typeof cordova=='undefined')
        $scope.ready=true;
    else
        document.addEventListener('deviceready', $scope.onReady, false);

});

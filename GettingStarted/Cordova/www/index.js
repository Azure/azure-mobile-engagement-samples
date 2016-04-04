/*
 * Copyright (c) Microsoft Corporation.  All rights reserved.
 * Licensed under the MIT license. See License.txt in the project root for license information.
 */

var app = angular.module('sampleApp', ['ngSanitize']);

app.controller('appController', function($scope) {

    $scope.ready  = false;
    $scope.currentActivity=null;

    $scope.onOpenURL = function(_url) {
        $scope.alert = 'Got push URL '+_url;
        $scope.$apply();
        $('#sample-alert').modal();
    },

    $scope.onDataPushReceived = function(_category,_body) {
        var str = "<p>Got DataPush: <b>"+_category+"</b></p>";
        if (_category=="png")
            str += '<img src="data:image/png;base64,'+_body+'" width="128" height="128" />';
        else
        {
            str += _body.replace(/\n/, '<br />');
        }
        $scope.alert = str;
        $scope.$apply();
        $('#sample-alert').modal();
    },

    $scope.onReady = function() {

        console.log('device ready');
        $scope.ready = true;
        $scope.cordova = cordova;
        $scope.startActivity('home',{newbie:true});
        Engagement.initializeReach($scope.onOpenURL, $scope.onDataPushReceived);
        Engagement.getStatus(function(_status) {
            $scope.status = _status;
            $scope.$apply();
        });
        $scope.$apply();
    };

    $scope.onError = function(_error) {
        console.error(_error);
    };

    $scope.startActivity = function(_activityname,_param) {
        console.log('startActivity:'+_activityname);
        $scope.currentActivity = _activityname;
        Engagement.startActivity(_activityname,_param,undefined,$scope.onError );
    };

    $scope.endActivity = function() {
        console.log('endActivity:'+$scope.currentActivity);
        $scope.currentActivity = null;
        Engagement.endActivity(undefined,$scope.onError );
    };

    $scope.sendAppInfo = function(_appInfos) {
        console.log('sendAppInfo:'+JSON.stringify(_appInfos));
        Engagement.sendAppInfo(_appInfos,undefined,$scope.onError);
    };

    $scope.sendEvent = function(_eventName,_extraInfos) {
        console.log('sendEvent:'+_eventName);
        Engagement.sendEvent(_eventName,_extraInfos,undefined,$scope.onError);
    };

    $scope.startJob = function(_jobName,_extraInfos) {
        console.log('startJob:'+_jobName);
        Engagement.startJob(_jobName,_extraInfos,undefined,$scope.onError);
    };

    $scope.endJob = function(_jobName) {
        console.log('endJob:'+_jobName);
        Engagement.endJob(_jobName,undefined,$scope.onError);
    };

    $scope.runTests = function() {
        window.location = 'cdvtests/index.html';
    };

    $scope.requestPermissions = function() {
        Engagement.requestPermissions(function(_ret) {
                console.log("permissions = "+JSON.stringify(_ret));
            },$scope.onError);
    }; 

    // DEBUG
    if (typeof cordova=='undefined')
        $scope.ready=true;
    else
        document.addEventListener('deviceready', $scope.onReady, false);



});

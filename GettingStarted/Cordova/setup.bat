@echo off

set APP_NAME=AZMECordova

rem replace with your own IDs

set PACKAGE_NAME=<YOUR PACKAGE NAME>
set AZME_ANDROID_APPID=<YOUR APP ID>
set AZME_ANDROID_GOOGLE_PROJECT_NUMBER=<YOUR GOOGLE PROJECT NUMBER>
set AZME_ANDROID_COLLECTION=<YOUR COLLECTION>
set AZME_ANDROID_SDKKEY=<YOUR SDK KEY>

set AZME_ANDROID_REACH_ICON=icon
set AZME_ENABLE_LOG=true
set AZME_REDIRECT_URL=mytest

set DST_PATH=%USERPROFILE%
set CURDIR=%CD%

cd /D %DST_PATH%
rmdir /S /Q %APP_NAME%
call cordova create %APP_NAME% %PACKAGE_NAME% %APP_NAME%
cd %APP_NAME%

call cordova platform add android
call cordova plugin add cordova-plugin-console
call cordova plugin add cordova-plugin-ms-azme  --variable AZME_ANDROID_APPID=%AZME_ANDROID_APPID% ^
									--variable AZME_ANDROID_GOOGLE_PROJECT_NUMBER=%AZME_ANDROID_GOOGLE_PROJECT_NUMBER% ^
									--variable AZME_ANDROID_SDKKEY=%AZME_ANDROID_SDKKEY% ^
									--variable AZME_ANDROID_COLLECTION=%AZME_ANDROID_COLLECTION% ^
									--variable AZME_ANDROID_REACH_ICON=%AZME_ANDROID_REACH_ICON% ^
									--variable AZME_REDIRECT_URL=%AZME_REDIRECT_URL% ^
									--variable AZME_ENABLE_LOG=%AZME_ENABLE_LOG%
call cordova plugin add http://git-wip-us.apache.org/repos/asf/cordova-plugin-test-framework.git
call cordova plugin add cordova-plugin-ms-azme#:tests								

rmdir /S /Q www
mkdir www
copy   %CURDIR%\www\*.* www

cd /D %CURDIR%
echo ***
echo Sample project successfully created in %DST_PATH%\%APP_NAME%
pause
@echo off

set APP_NAME=AZMECordova

rem replace with your own IDs

set PACKAGE_NAME=<YOUR PACKAGE NAME>
set AZME_ANDROID_CONNECTION_STRING=<ANDROID CONNECTION STRING>
set AZME_ANDROID_GOOGLE_PROJECT_NUMBER=<GOOGLE PROJECT NUMBER>
set AZME_REDIRECT_URL=mytest

set DST_PATH=%USERPROFILE%
set CURDIR=%CD%

cd /D %DST_PATH%
rmdir /S /Q %APP_NAME%
call cordova create %APP_NAME% %PACKAGE_NAME% %APP_NAME%
cd %APP_NAME%

call cordova platform add android
call cordova plugin add cordova-plugin-console
call cordova plugin add $%CURDIR%#:resources
call cordova plugin add cordova-plugin-ms-azure-mobile-engagement  ^
                                    --variable AZME_ANDROID_CONNECTION_STRING=%AZME_ANDROID_CONNECTION_STRING% ^
									--variable AZME_ANDROID_GOOGLE_PROJECT_NUMBER=%AZME_ANDROID_GOOGLE_PROJECT_NUMBER% ^
									--variable AZME_REDIRECT_URL=%AZME_REDIRECT_URL% 
call cordova plugin add http://git-wip-us.apache.org/repos/asf/cordova-plugin-test-framework.git
call cordova plugin add cordova-plugin-ms-azure-mobile-engagement#:tests								

rmdir /S /Q www
mkdir www
copy  %CURDIR%\www\*.* www
copy   %CURDIR%\azure-icon.png .

rm config.xml
copy %CURDIR%\config.xml .

cd /D %CURDIR%
echo ***
echo Sample project successfully created in %DST_PATH%\%APP_NAME%
pause
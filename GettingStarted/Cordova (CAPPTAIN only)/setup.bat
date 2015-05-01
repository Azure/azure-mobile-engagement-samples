@echo off
rem replace with your own IDs

set APP_NAME=CapptainCordova
set PACKAGE_NAME=com.del7a.capptaincordova
set CAPPTAIN_ANDROID_REACH_ICON_ANDROID=icon
set CAPPTAIN_ANDROID_APP_ID=tes000243
set CAPPTAIN_ANDROID_GOOGLE_PROJECT_NUMBER=773547123772
set CAPPTAIN_ENABLE_LOG=true
set CAPPTAIN_REDIRECT_URL=mytest

set DST_PATH=%USERPROFILE%
set CURDIR=%CD%

cd /D %DST_PATH%
rmdir /S /Q %APP_NAME%
call cordova create %APP_NAME% %PACKAGE_NAME% %APP_NAME%
cd %APP_NAME%

call cordova platform add android
call cordova plugin add cordova-plugin-console
call cordova plugin add capptain-cordova  --variable CAPPTAIN_ANDROID_APP_ID=$CAPPTAIN_ANDROID_APP_ID ^
									--variable CAPPTAIN_ANDROID_GOOGLE_PROJECT_NUMBER=$CAPPTAIN_ANDROID_GOOGLE_PROJECT_NUMBER ^
									--variable CAPPTAIN_ANDROID_REACH_ICON=$CAPPTAIN_ANDROID_REACH_ICON ^
									--variable CAPPTAIN_REDIRECT_URL=$CAPPTAIN_REDIRECT_URL ^
									--variable CAPPTAIN_ENABLE_LOG=$CAPPTAIN_ENABLE_LOG
									
rmdir /S /Q www
mkdir www
copy   %CURDIR%\www\*.* www

cd /D %CURDIR%
echo ***
echo Sample project successfully created in %DST_PATH%\%APP_NAME%
pause
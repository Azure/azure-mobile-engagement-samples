
# replace with your own IDs 

# GENERIC
export APP_NAME=AZMECordova
export AZME_REDIRECT_URL=mytest
export AZME_ENABLE_LOG=true

export PACKAGE_NAME=<PACKAGE_NAME>

# IOS
export AZME_IOS_APPID=<AZME_IOS_APPID>
export AZME_IOS_COLLECTION=<AZME_IOS_COLLECTION>
export AZME_IOS_SDKKEY=<AZME_IOS_SDKKEY>
export AZME_IOS_REACH_ICON=icon.png

#ANDROID
export AZME_ANDROID_REACH_ICON=icon
export AZME_ANDROID_APPID=<AZME_ANDROID_APPID>
export AZME_ANDROID_COLLECTION=<AZME_ANDROID_COLLECTION>
export AZME_ANDROID_SDKKEY=<AZME_ANDROID_SDKKEY>
export AZME_ANDROID_GOOGLE_PROJECT_NUMBER=<AZME_ANDROID_GOOGLE_PROJECT_NUMBER>

export DST_PATH=~
export CURDIR=$PWD


rm -rf $DST_PATH/$APP_NAME
cd $DST_PATH
cordova create $APP_NAME $PACKAGE_NAME $APP_NAME
cd $APP_NAME
cordova platform add ios
cordova platform add android
cordova plugin add cordova-plugin-console
cordova plugin add cordova-plugin-ms-azme	--variable AZME_IOS_COLLECTION=$AZME_IOS_COLLECTION \
								--variable AZME_IOS_SDKKEY=$AZME_IOS_SDKKEY \
								--variable AZME_IOS_APPID=$AZME_IOS_APPID \
								--variable AZME_IOS_REACH_ICON=$AZME_IOS_REACH_ICON \
								--variable AZME_ANDROID_GOOGLE_PROJECT_NUMBER=$AZME_ANDROID_GOOGLE_PROJECT_NUMBER \
								--variable AZME_ANDROID_APPID=$AZME_ANDROID_APPID \
								--variable AZME_ANDROID_COLLECTION=$AZME_ANDROID_COLLECTION \
								--variable AZME_ANDROID_SDKKEY=$AZME_ANDROID_SDKKEY \
								--variable AZME_ANDROID_REACH_ICON=$AZME_ANDROID_REACH_ICON \
								--variable AZME_REDIRECT_URL=$AZME_REDIRECT_URL \
								--variable AZME_ENABLE_LOG=$AZME_ENABLE_LOG
cordova plugin add http://git-wip-us.apache.org/repos/asf/cordova-plugin-test-framework.git
cordova plugin add cordova-plugin-ms-azme#:tests

rm -rf www
cp -r  $CURDIR/www .

cd $CURDIR
echo "Sample project successfully created in $DST_PATH/$APP_NAME"
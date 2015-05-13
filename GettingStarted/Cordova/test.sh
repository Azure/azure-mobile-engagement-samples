
# replace with your own IDs 

# GENERIC
export APP_NAME=AZMECordova
export PACKAGE_NAME=com.del7a.azmecordova
export AZME_REDIRECT_URL=myapp
export AZME_ENABLE_LOG=true

# IOS
export AZME_IOS_REACH_ICON=icon.png
export AZME_IOS_COLLECTION=Cordova-AZME-Collection.device.mobileengagement.windows.net
export AZME_IOS_SDKKEY=bb2eecbd133c470aae747912845af1ea
export AZME_IOS_APPID=cor000000



#ANDROID
export AZME_ANDROID_REACH_ICON=icon
export AZME_ANDROID_APPID=cor000001
export AZME_ANDROID_COLLECTION=Cordova-AZME-Collection.device.mobileengagement.windows.net
export AZME_ANDROID_SDKKEY=302f49c62ed2464eb11f6eefa7462700

export AZME_ANDROID_GOOGLE_PROJECT_NUMBER=27571146314

export DST_PATH=~
export CURDIR=$PWD


rm -rf $DST_PATH/$APP_NAME
cd $DST_PATH
cordova create $APP_NAME $PACKAGE_NAME $APP_NAME
cd $APP_NAME
cordova platform add ios
cordova platform add android
cordova plugin add cordova-plugin-console
cordova plugin add $CURDIR/../plugin	--variable AZME_IOS_COLLECTION=$AZME_IOS_COLLECTION \
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
cordova plugin add $CURDIR/../plugin#:tests

rm -rf www
cp -r  $CURDIR/www .

cd $CURDIR
echo "Sample project successfully created in $DST_PATH/$APP_NAME"
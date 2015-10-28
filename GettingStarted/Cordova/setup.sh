
export INIDIR=$PWD
cd AZME/sample

# GENERIC
export APP_NAME=AZMECordova
export PACKAGE_NAME=<...>
export AZME_REDIRECT_URL=myapp
export AZME_ENABLE_LOG=true
export AZME_LOGO=azme

# IOS
export AZME_IOS_CONNECTION_STRING=<...>
#ANDROID
export AZME_ANDROID_GOOGLE_PROJECT_NUMBER=<...>
export AZME_ANDROID_CONNECTION_STRING=<...>

export DST_PATH=~
export CURDIR=$PWD

rm -rf $DST_PATH/$APP_NAME
cd $DST_PATH
cordova create $APP_NAME $PACKAGE_NAME $APP_NAME
cd $APP_NAME

cordova platform add ios
cordova platform add android
cordova plugin add cordova-plugin-console
cordova plugin add $CURDIR/../sample#:resources

cordova plugin add cordova-plugin-ms-azure-mobile-engagement    --variable AZME_IOS_CONNECTION_STRING=$AZME_IOS_CONNECTION_STRING \
                                        --variable AZME_ANDROID_GOOGLE_PROJECT_NUMBER=$AZME_ANDROID_GOOGLE_PROJECT_NUMBER \
                                        --variable AZME_REDIRECT_URL=$AZME_REDIRECT_URL \
                                        --variable AZME_ANDROID_CONNECTION_STRING=$AZME_ANDROID_CONNECTION_STRING \
                                        --variable AZME_ANDROID_REACH_ICON=$AZME_LOGO \
                                        --variable AZME_IOS_REACH_ICON=$AZME_LOGO.png  


cordova plugin add http://git-wip-us.apache.org/repos/asf/cordova-plugin-test-framework.git
cordova plugin add $CURDIR/../plugin#:tests

rm -rf www
cp -r  $CURDIR/www .
cp $CURDIR/azure-icon.png .

rm config.xml
cp $CURDIR/config.xml .

cd $INIDIR
echo "Sample project successfully created in $DST_PATH/$APP_NAME"